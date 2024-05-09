<?php

namespace App\Http\Controllers\Backend;

use Session;
use App\Models\Order;
use App\Models\Product;
use App\Models\Returns;
use App\Models\ProductStock;
//use Intervention\Image\Facades\Image;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Validator;
use Intervention\Image\ImageManagerStatic as Image;

class ReturnsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $returns = Returns::latest()->get();
        return view('backend.return.index', compact('returns'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('backend.return.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //dd($request->all());
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
        $order=Order::where('invoice_no',$request->invoice_no)->first();
        if(!$order){
            $notification = array(
                'message' => 'Your Return Invoice No not match.',
                'alert-type' => 'error'
            );
            return redirect()->back()->with($notification);
        }
        $returnidcheck=Returns::where('invoice_no',$request->invoice_no)->first();
        if ($returnidcheck) {
            $notification = array(
                'message' => 'Your Return Invoice Message Already Done.',
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
                        'message' => 'Your Return Product Code not match.',
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
                $return = new Returns();
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
                Session::flash('success', 'Your Return Request Submited Successfully');
                return redirect()->route('return.policy');
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
        $return = Returns::find($id);
        return response()->json([
            'status' => 200,
            'return' => $return
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
        $return = Returns::findOrFail($id);
        try {
            if (file_exists($return->product_img)) {
                unlink($return->product_img);
            }
        } catch (Exception $e) {
        }
        $return->delete();
        $notification = array(
            'message' => 'Return Request Deleted Successfully.',
            'alert-type' => 'error'
        );
        return redirect()->back()->with($notification);
    }
    public function return_restock_product($id)
    {
        $return = Returns::findOrFail($id);
        $codes = explode(',', $return->product_code);
        $Qtys = explode(',', $return->product_qty);
        foreach ($codes as $key => $code) {
            $product = Product::where('product_code', $code)->first();
            $stockproduct = ProductStock::where('stock_code', $code)->first();
            if ($product) {
                $product->stock_qty = $product->stock_qty + $Qtys[$key];
                $product->save();
            } else if ($stockproduct) {
                $stockproduct->qty = $stockproduct->qty + $Qtys[$key];
                $stockproduct->save();
                $product = Product::where('id', $stockproduct->product_id)->first();
                $product->stock_qty = $product->stock_qty + $Qtys[$key];
                $product->save();
            } else {
                $notification = array(
                    'message' => 'Product not Match.',
                    'alert-type' => 'error'
                );
                return redirect()->back()->with($notification);
            }
        }
        $return->approved = 1;
        $return->save();
        $notification = array(
            'message' => 'Product Returned in Stock Successfully.',
            'alert-type' => 'success'
        );
        return redirect()->back()->with($notification);
    }
}
