<?php

namespace App\Http\Controllers\Backend;

use Image;
use Session;
use App\Models\Order;
use App\Models\Refund;
use App\Models\Product;
use App\Models\Attribute;
use App\Models\OrderDetail;
use App\Models\ProductStock;
use Illuminate\Http\Request;
use App\Models\AttributeValue;
use Illuminate\Support\Carbon;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;

class RefundController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $refunds = Refund::latest()->get();
        return view('backend.refund.index', compact('refunds'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('backend.refund.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //dd($request);
        $this->validate($request, [
            'customer_name' => 'required|max:50',
            'address' => 'required|max:100',
            'email' => 'required|email',
            'phone' => 'required|numeric|digits:11',
            'invoice_no' => 'required|max:100',
            'reasons' => 'required',
            'product_img' => 'required',
            'product_name' => 'required',
            'product_code' => 'required',
            'product_qty' => 'required',
            'description' => 'required|max:200',
        ]);
        $order = Order::where('invoice_no', $request->invoice_no)->first();
        if (!$order) {
            $notification = array(
                'message' => 'Your Refund Invoice No not match.',
                'alert-type' => 'error'
            );
            return redirect()->back()->with($notification);
        }
        $refundidcheck=Refund::where('invoice_no',$request->invoice_no)->first();
        if ($refundidcheck) {
            $notification = array(
                'message' => 'Your Refund Invoice Message Already Done.',
                'alert-type' => 'error'
            );
            return redirect()->back()->with($notification);
        }
        $codes = $request->input('product_code');
        $allCodesMatch = true;
        if (!empty($codes)) {
            foreach ($codes as $code) {
                $product = Product::where('product_code', $code)->first();
                $stockproduct = ProductStock::where('stock_code', $code)->first();
                if (!$product && !$stockproduct) {
                    $allCodesMatch = false;
                    $notification = array(
                        'message' => 'Your Refund Product Code not match.',
                        'alert-type' => 'error'
                    );
                    return redirect()->back()->with($notification);
                }
            }
            if ($allCodesMatch) {
                if ($request->hasFile('product_img')) {
                    $ReturnImages = $request->file('product_img');
                    $fileNames = [];
                    foreach ($ReturnImages as $ReturnImage) {
                        Validator::make(['product_img' => $ReturnImage], [
                            'product_img' => 'required',
                        ]);
                        $fileName = time() . '_' . uniqid() . '.' . $ReturnImage->getClientOriginalExtension();
                        $ReturnImage->move(public_path('/upload/ReturnImages/'), $fileName);
                        $filePath = public_path('/upload/ReturnImages/') . $fileName;
                        Image::make($filePath)->resize(300, 200)->save($filePath);
                        $fileNames[] = "/upload/ReturnImages/" . $fileName;
                    }
                }
                $return = new Refund();
                $return->customer_name = $request->customer_name;
                $return->address = $request->address;
                $return->email = $request->email;
                $return->phone = $request->phone;
                $return->invoice_no = $request->invoice_no;
                $return->product_name = implode(',', $request->input('product_name', []));
                $return->product_code = implode(',', $request->input('product_code', []));
                $return->product_qty = implode(',', $request->input('product_qty', []));
                $return->product_img = implode("|", $fileNames);
                $return->description = $request->description;
                $return->reasons = implode(',', $request->input('reasons', []));
                $return->save();
                Session::flash('success', 'Your Refund Request Submited Successfully');
                return redirect()->route('refund.policy');
            }
        } else {
            $notification = array(
                'message' => 'Invalid product codes',
                'alert-type' => 'error'
            );
            return redirect()->back()->with($notification);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //dd($id);
        $refund = Refund::find($id);
        return response()->json([
            'status' => 200,
            'refund' => $refund
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $refund = Refund::findOrFail($id);
        try {
            if (file_exists($refund->product_img)) {
                unlink($refund->product_img);
            }
        } catch (Exception $e) {
        }

        $refund->delete();

        $notification = array(
            'message' => 'Refund Request Deleted Successfully.',
            'alert-type' => 'error'
        );
        return redirect()->back()->with($notification);
    }

    public function refund_restock_product($id)
    {
        $refund = Refund::findOrFail($id);
        $codes = explode(',', $refund->product_code);
        $Qtys = explode(',', $refund->product_qty);
        $order = Order::where('invoice_no', $refund->invoice_no)->first();
        $orderdetails = OrderDetail::where('order_id', $order->id)->get();
        $totalQty = 0;
        foreach ($orderdetails as $orderdetail) {
            $totalQty += $orderdetail->qty;
        }
        if ($order->discount > 0) {
            $discount = $order->discount / $totalQty;

        } elseif ($order->coupon_discount > 0) {
            $discount = $order->coupon_discount / $totalQty;

        } else {
            $discount = 0;
        }
        foreach ($codes as $key => $code) {
            $product = Product::where('product_code', $code)->where('is_varient', 0)->first();
            $stockproduct = ProductStock::where('stock_code', $code)->first();
            if ($product) {
                $product->stock_qty = $product->stock_qty + $Qtys[$key];
                $product->save();
                $orderdetail = OrderDetail::where('order_id', $order->id)->where('product_id', $product->id)->first();
                if ($orderdetail) {
                    $order->grand_total =  ($order->grand_total - $orderdetail->price )+ $discount;
                    $order->sub_total = $order->sub_total - $orderdetail->price;
                    if($order->paid_amount >0){
                        $order->paid_amount=$order->paid_amount-($orderdetail->price - $discount);
                    }
                    if ($order->discount > 0) {
                        $order->discount = $order->discount - $discount;
                        $order->coupon_discount = 0;
                    } elseif ($order->coupon_discount > 0) {
                        $order->coupon_discount = $order->coupon_discount - $discount;
                        $order->discount = 0;
                    } else {
                        $order->discount = 0;
                        $order->coupon_discount = 0;
                    }
                    $order->save();
                    if($order->due_amount >0){
                        $order->due_amount= $order->grand_total-$order->paid_amount;
                        $order->save();
                    }
                    if ($orderdetail->qty == $Qtys[$key]) {
                        $orderdetail->delete();
                    } else {
                        $orderdetail->qty == $orderdetail->qty - $Qtys[$key];
                        $orderdetail->save();
                    }
                }
            } else if ($stockproduct) {
                $stockproduct->qty = $stockproduct->qty + $Qtys[$key];
                $stockproduct->save();
                $product = Product::where('id', $stockproduct->product_id)->first();
                $product->stock_qty = $product->stock_qty + $Qtys[$key];
                $product->save();

                $stockproductvarient = $stockproduct->varient;
                $varientdivided = explode('-', $stockproductvarient);
                $variations = array();
                foreach ($varientdivided as $onevarient) {
                    $attribute_value = AttributeValue::where('value', $onevarient)->first();
                    if ($attribute_value) {
                        $attribute_id = $attribute_value->attribute_id;
                        $attribute = Attribute::find($attribute_id);
                        if ($attribute) {
                            $item = [
                                'attribute_name' => $attribute->name,
                                'attribute_value' => $attribute_value->value,
                            ];
                            $variations[] = $item;
                        }
                    }
                }
                $variationfind = json_encode($variations, JSON_UNESCAPED_UNICODE);
                $orderdetail = OrderDetail::where('variation', $variationfind)->where('product_id', $product->id)->first();
                if ($orderdetail) {
                    $order->grand_total = ($order->grand_total - $orderdetail->price )+ $discount;
                    $order->sub_total = $order->sub_total - $orderdetail->price;
                    if($order->paid_amount >0){
                        $order->paid_amount=$order->paid_amount-($orderdetail->price - $discount);
                    }
                    if ($order->discount > 0) {
                        $order->discount = $order->discount - $discount;
                        $order->coupon_discount = 0;
                    } elseif ($order->coupon_discount > 0) {
                        $order->coupon_discount = $order->coupon_discount - $discount;
                        $order->discount = 0;
                    } else {
                        $order->discount = 0;
                        $order->coupon_discount = 0;
                    }
                    $order->save();
                    if($order->due_amount >0){
                        $order->due_amount= $order->grand_total-$order->paid_amount;
                        $order->save();
                    }
                    if ($orderdetail->qty == $Qtys[$key]) {
                        $orderdetail->delete();
                    } else {
                        $orderdetail->qty == $orderdetail->qty - $Qtys[$key];
                        $orderdetail->save();
                    }
                }
            } else {
                $notification = array(
                    'message' => 'Product not Match.',
                    'alert-type' => 'error'
                );
                return redirect()->back()->with($notification);
            }
        }
        $refund->approved = 1;
        $refund->save();
        $notification = array(
            'message' => 'Product Refunded in Stock Successfully.',
            'alert-type' => 'success'
        );
        return redirect()->back()->with($notification);
    }
}
