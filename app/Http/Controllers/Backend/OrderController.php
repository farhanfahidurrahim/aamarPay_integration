<?php

namespace App\Http\Controllers\Backend;

use PDF;
use Session;

use App\Models\User;
use App\Models\Order;
use App\Models\Vendor;
use App\Models\Address;
use App\Models\Product;
use App\Models\District;
use App\Models\Shipping;
use App\Models\Upazilla;
use App\Models\Attribute;
use App\Models\OrderDetail;
use App\Models\OrderStatus;
use App\Models\ProductStock;
use Illuminate\Http\Request;
use App\Models\AttributeValue;
use Illuminate\Support\Carbon;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $date = $request->date;
        $delivery_status = null;
        $payment_status = null;
        $shipping_type = null;
        $ordersQuery = Order::where('order_by', 0);
        $dateRange = explode(" - ", $date);
        $startDate = date('Y-m-d', strtotime($dateRange[0]));
        if (isset($dateRange[1])) {
            $endDate = date('Y-m-d', strtotime($dateRange[1]));
        } else {
            $endDate = date('Y-m-d');
        }
        if ($request->filled(['delivery_status', 'payment_status', 'date', 'shipping_type'])) {
            if ($startDate === $endDate) {
                $ordersQuery->whereDate('created_at', $startDate)->where('delivery_status', $request->delivery_status)
                ->where('payment_status', $request->payment_status)
                ->where('shipping_type', $request->shipping_type);
            } else {
                $ordersQuery->whereBetween('created_at', [$startDate, $endDate])->where('delivery_status', $request->delivery_status)
                ->where('payment_status', $request->payment_status)
                ->where('shipping_type', $request->shipping_type);
            }
        }elseif ($request->filled(['delivery_status', 'payment_status', 'date']) && $request->shipping_type == null) {
            if ($startDate === $endDate) {
                $ordersQuery->whereDate('created_at', $startDate)->where('delivery_status', $request->delivery_status)
                ->where('payment_status', $request->payment_status);
            } else {
                $ordersQuery->whereBetween('created_at', [$startDate, $endDate])->where('delivery_status', $request->delivery_status)
                ->where('payment_status', $request->payment_status);
            }
        } elseif ($request->filled(['delivery_status', 'date', 'shipping_type']) && $request->payment_status == null) {
            if ($startDate === $endDate) {
                $ordersQuery->whereDate('created_at', $startDate)->where('delivery_status', $request->delivery_status)
                ->where('shipping_type', $request->shipping_type);
            } else {
                $ordersQuery->whereBetween('created_at', [$startDate, $endDate])->where('delivery_status', $request->delivery_status)
                ->where('shipping_type', $request->shipping_type);
            }
        } elseif ($request->filled(['payment_status', 'date', 'shipping_type']) && $request->delivery_status == null) {
            if ($startDate === $endDate) {
                $ordersQuery->whereDate('created_at', $startDate)->where('payment_status', $request->payment_status)
                ->where('shipping_type', $request->shipping_type);
            } else {
                $ordersQuery->whereBetween('created_at', [$startDate, $endDate])->where('payment_status', $request->payment_status)
                ->where('shipping_type', $request->shipping_type);
            }
        } elseif ($request->filled(['delivery_status', 'date']) && $payment_status == null && $shipping_type == null) {
            if ($startDate === $endDate) {
                $ordersQuery->whereDate('created_at', $startDate)->where('delivery_status', $request->delivery_status);
            } else {
                $ordersQuery->whereBetween('created_at', [$startDate, $endDate])->where('delivery_status', $request->delivery_status);
            }
        } elseif ($request->filled(['payment_status', 'date']) && $delivery_status == null && $shipping_type == null) {
            if ($startDate === $endDate) {
                $ordersQuery->whereDate('created_at', $startDate)->where('payment_status', $request->payment_status);
            } else {
                $ordersQuery->whereBetween('created_at', [$startDate, $endDate])->where('payment_status', $request->payment_status);
            }
        } elseif ($request->filled(['shipping_type', 'date']) && $delivery_status == null && $payment_status == null) {
            if ($startDate === $endDate) {
                $ordersQuery->whereDate('created_at', $startDate)->where('shipping_type', $request->shipping_type);
            } else {
                $ordersQuery->whereBetween('created_at', [$startDate, $endDate])->where('shipping_type', $request->shipping_type);
            }
        } elseif ($request->filled(['date']) && $delivery_status == null && $payment_status == null && $shipping_type == null) {
            if ($startDate === $endDate) {
                $ordersQuery->whereDate('created_at', $startDate);
            } else {
                $ordersQuery->whereBetween('created_at', [$startDate, $endDate]);
            }
        }else {
            $ordersQuery->orderBy('id', 'desc');
        }
        $orderIds = OrderDetail::where('vendor_id', '=', 0)->pluck('order_id')->toArray();
        $orders = $ordersQuery->whereIn('id', $orderIds)->orderBy('created_at', 'desc')->paginate(15);

        return view('backend.sales.all_orders.index', compact('orders', 'orderIds', 'delivery_status', 'date', 'payment_status', 'shipping_type'));
    }

    public function indexPos(Request $request)
    {
        $date = $request->date;
        $delivery_status = null;
        $payment_status = null;
        $shipping_type = null;
        $ordersQuery = Order::where('order_by', 1);
        $dateRange = explode(" - ", $date);
        $startDate = date('Y-m-d', strtotime($dateRange[0]));
        if (isset($dateRange[1])) {
            $endDate = date('Y-m-d', strtotime($dateRange[1]));
        } else {
            $endDate = date('Y-m-d');
        }

        if ($request->filled(['delivery_status', 'payment_status', 'date', 'shipping_type'])) {
            if ($startDate === $endDate) {
                $ordersQuery->whereDate('created_at', $startDate)->where('delivery_status', $request->delivery_status)
                ->where('payment_status', $request->payment_status)
                ->where('shipping_type', $request->shipping_type);
            } else {
                $ordersQuery->whereBetween('created_at', [$startDate, $endDate])->where('delivery_status', $request->delivery_status)
                ->where('payment_status', $request->payment_status)
                ->where('shipping_type', $request->shipping_type);
            }
        }elseif ($request->filled(['delivery_status', 'payment_status', 'date']) && $request->shipping_type == null) {
            if ($startDate === $endDate) {
                $ordersQuery->whereDate('created_at', $startDate)->where('delivery_status', $request->delivery_status)
                ->where('payment_status', $request->payment_status);
            } else {
                $ordersQuery->whereBetween('created_at', [$startDate, $endDate])->where('delivery_status', $request->delivery_status)
                ->where('payment_status', $request->payment_status);
            }
        } elseif ($request->filled(['delivery_status', 'date', 'shipping_type']) && $request->payment_status == null) {
            if ($startDate === $endDate) {
                $ordersQuery->whereDate('created_at', $startDate)->where('delivery_status', $request->delivery_status)
                ->where('shipping_type', $request->shipping_type);
            } else {
                $ordersQuery->whereBetween('created_at', [$startDate, $endDate])->where('delivery_status', $request->delivery_status)
                ->where('shipping_type', $request->shipping_type);
            }
        } elseif ($request->filled(['payment_status', 'date', 'shipping_type']) && $request->delivery_status == null) {
            if ($startDate === $endDate) {
                $ordersQuery->whereDate('created_at', $startDate)->where('payment_status', $request->payment_status)
                ->where('shipping_type', $request->shipping_type);
            } else {
                $ordersQuery->whereBetween('created_at', [$startDate, $endDate])->where('payment_status', $request->payment_status)
                ->where('shipping_type', $request->shipping_type);
            }
        } elseif ($request->filled(['delivery_status', 'date']) && $payment_status == null && $shipping_type == null) {
            if ($startDate === $endDate) {
                $ordersQuery->whereDate('created_at', $startDate)->where('delivery_status', $request->delivery_status);
            } else {
                $ordersQuery->whereBetween('created_at', [$startDate, $endDate])->where('delivery_status', $request->delivery_status);
            }
        } elseif ($request->filled(['payment_status', 'date']) && $delivery_status == null && $shipping_type == null) {
            if ($startDate === $endDate) {
                $ordersQuery->whereDate('created_at', $startDate)->where('payment_status', $request->payment_status);
            } else {
                $ordersQuery->whereBetween('created_at', [$startDate, $endDate])->where('payment_status', $request->payment_status);
            }
        } elseif ($request->filled(['shipping_type', 'date']) && $delivery_status == null && $payment_status == null) {
            if ($startDate === $endDate) {
                $ordersQuery->whereDate('created_at', $startDate)->where('shipping_type', $request->shipping_type);
            } else {
                $ordersQuery->whereBetween('created_at', [$startDate, $endDate])->where('shipping_type', $request->shipping_type);
            }
        } elseif ($request->filled(['date']) && $delivery_status == null && $payment_status == null && $shipping_type == null) {
            if ($startDate === $endDate) {
                $ordersQuery->whereDate('created_at', $startDate);
            } else {
                $ordersQuery->whereBetween('created_at', [$startDate, $endDate]);
            }
        }else {
            $ordersQuery->orderBy('id', 'desc');
        }
        $orderIds = OrderDetail::where('vendor_id', '=', 0)->pluck('order_id')->toArray();
        $orders = $ordersQuery->whereIn('id', $orderIds)->orderBy('created_at', 'desc')->paginate(15);
       // return $orders;
       return view('backend.sales.all_orders.posOrder', compact('orders', 'orderIds', 'delivery_status', 'date','payment_status','shipping_type'));
    }
    public function AllvendorSellView(Request $request)
    {
        $date = $request->date;
        $delivery_status = null;
        $payment_status = null;
        $vendor_id = null;
        $ordersQuery = Order::where('order_by', 0);
        $dateRange = explode(" - ", $date);
        $startDate = date('Y-m-d', strtotime($dateRange[0]));
        if (isset($dateRange[1])) {
            $endDate = date('Y-m-d', strtotime($dateRange[1]));
        } else {
            $endDate = date('Y-m-d');
        }
        if ($request->filled(['delivery_status', 'payment_status', 'date'])) {
            if ($startDate === $endDate) {
                $ordersQuery->whereDate('created_at', $startDate)->where('delivery_status', $request->delivery_status)
                ->where('payment_status', $request->payment_status);
            } else {
                $ordersQuery->whereBetween('created_at', [$startDate, $endDate])->where('delivery_status', $request->delivery_status)
                ->where('payment_status', $request->payment_status);
            }
        } elseif ($request->filled(['delivery_status', 'date',]) && $request->payment_status == null) {
            if ($startDate === $endDate) {
                $ordersQuery->whereDate('created_at', $startDate)->where('delivery_status', $request->delivery_status);
            } else {
                $ordersQuery->whereBetween('created_at', [$startDate, $endDate])->where('delivery_status', $request->delivery_status);
            }
        } elseif ($request->filled(['payment_status', 'date']) && $request->delivery_status == null) {
            if ($startDate === $endDate) {
                $ordersQuery->whereDate('created_at', $startDate)->where('payment_status', $request->payment_status);
            } else {
                $ordersQuery->whereBetween('created_at', [$startDate, $endDate])->where('payment_status', $request->payment_status);
            }
        } elseif ($request->filled(['delivery_status', 'date']) && $payment_status == null) {
            if ($startDate === $endDate) {
                $ordersQuery->whereDate('created_at', $startDate)->where('delivery_status', $request->delivery_status);
            } else {
                $ordersQuery->whereBetween('created_at', [$startDate, $endDate])->where('delivery_status', $request->delivery_status);
            }
        } elseif ($request->filled(['payment_status', 'date']) && $delivery_status == null) {
            if ($startDate === $endDate) {
                $ordersQuery->whereDate('created_at', $startDate)->where('payment_status', $request->payment_status);
            } else {
                $ordersQuery->whereBetween('created_at', [$startDate, $endDate])->where('payment_status', $request->payment_status);
            }
        } elseif ($request->filled([ 'date']) && $delivery_status == null && $payment_status == null) {
            if ($startDate === $endDate) {
                $ordersQuery->whereDate('created_at', $startDate);
            } else {
                $ordersQuery->whereBetween('created_at', [$startDate, $endDate]);
            }
        } elseif ($request->filled(['date']) && $delivery_status == null && $payment_status == null) {
            if ($startDate === $endDate) {
                $ordersQuery->whereDate('created_at', $startDate);
            } else {
                $ordersQuery->whereBetween('created_at', [$startDate, $endDate]);
            }
        }else {
            $ordersQuery->orderBy('id', 'desc');
        }
        $vendors = Vendor::pluck('user_id')->toArray();
        $users=User::where('role',2)->latest()->get();
        $orderIds = OrderDetail::whereIn('vendor_id', $vendors)->pluck('order_id');
        $orders = $ordersQuery->whereIn('id', $orderIds)->orderBy('created_at', 'desc')->paginate(15);
        return view('backend.sales.all_orders.all_vendor_sale_index', compact('orders','orderIds','vendors', 'delivery_status', 'date','payment_status','users'));
    }


    public function vendorSellView(Request $request)
    {
        $date = $request->date;
        $delivery_status = null;
        $payment_status = null;
        $vendor_id = null;
        $ordersQuery = Order::where('order_by', 0);
        $dateRange = explode(" - ", $date);
        $startDate = date('Y-m-d', strtotime($dateRange[0]));
        if (isset($dateRange[1])) {
            $endDate = date('Y-m-d', strtotime($dateRange[1]));
        } else {
            $endDate = date('Y-m-d');
        }
        if ($request->filled(['delivery_status', 'payment_status', 'date'])) {
            if ($startDate === $endDate) {
                $ordersQuery->whereDate('created_at', $startDate)->where('delivery_status', $request->delivery_status)
                ->where('payment_status', $request->payment_status);
            } else {
                $ordersQuery->whereBetween('created_at', [$startDate, $endDate])->where('delivery_status', $request->delivery_status)
                ->where('payment_status', $request->payment_status);
            }
        } elseif ($request->filled(['delivery_status', 'date',]) && $request->payment_status == null) {
            if ($startDate === $endDate) {
                $ordersQuery->whereDate('created_at', $startDate)->where('delivery_status', $request->delivery_status);
            } else {
                $ordersQuery->whereBetween('created_at', [$startDate, $endDate])->where('delivery_status', $request->delivery_status);
            }
        } elseif ($request->filled(['payment_status', 'date']) && $request->delivery_status == null) {
            if ($startDate === $endDate) {
                $ordersQuery->whereDate('created_at', $startDate)->where('payment_status', $request->payment_status);
            } else {
                $ordersQuery->whereBetween('created_at', [$startDate, $endDate])->where('payment_status', $request->payment_status);
            }
        } elseif ($request->filled(['delivery_status', 'date']) && $payment_status == null) {
            if ($startDate === $endDate) {
                $ordersQuery->whereDate('created_at', $startDate)->where('delivery_status', $request->delivery_status);
            } else {
                $ordersQuery->whereBetween('created_at', [$startDate, $endDate])->where('delivery_status', $request->delivery_status);
            }
        } elseif ($request->filled(['payment_status', 'date']) && $delivery_status == null) {
            if ($startDate === $endDate) {
                $ordersQuery->whereDate('created_at', $startDate)->where('payment_status', $request->payment_status);
            } else {
                $ordersQuery->whereBetween('created_at', [$startDate, $endDate])->where('payment_status', $request->payment_status);
            }
        } elseif ($request->filled([ 'date']) && $delivery_status == null && $payment_status == null) {
            if ($startDate === $endDate) {
                $ordersQuery->whereDate('created_at', $startDate);
            } else {
                $ordersQuery->whereBetween('created_at', [$startDate, $endDate]);
            }
        } elseif ($request->filled(['date']) && $delivery_status == null && $payment_status == null) {
            if ($startDate === $endDate) {
                $ordersQuery->whereDate('created_at', $startDate);
            } else {
                $ordersQuery->whereBetween('created_at', [$startDate, $endDate]);
            }
        }else {
            $ordersQuery->orderBy('id', 'desc');
        }
        $orderIds = Order::latest()->pluck('id')->toArray();
        if (Auth::guard('admin')->user()->role == '2') {
            $vendor = Vendor::where('user_id', Auth::guard('admin')->user()->id)->first();
            $vendorIds = OrderDetail::where('vendor_id', $vendor->user_id)->pluck('order_id')->toArray();
            //$orders = Order::whereIn('id', $vendorIds)->paginate(15);
            $orders = $ordersQuery->whereIn('id', $vendorIds)->orderBy('created_at', 'desc')->paginate(15);
        }
        else {
            $orders = [];
        }
    	return view('backend.sales.all_orders.vendor_sale_index', compact('orders', 'orderIds','delivery_status', 'date','payment_status'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }


    public function store(Request $request)
    {
        //
    }


    public function show(Request $request , $id)
    {
        $order = Order::findOrFail($id);
        $shippings = Shipping::where('status', 1)->get();
        $products=Product::get();
        $productadd = Product::find($request->product_id);
        return view('backend.sales.all_orders.show', compact('order', 'shippings','products','productadd'));
    }
    public function orderCancle($id)
    {


        $order = Order::findOrFail($id);
        $orderdetails = OrderDetail::where('order_id',$order->id);
        $shippings = Shipping::where('status', 1)->get();

        return view('backend.sales.all_orders.show', compact('order', 'shippings','orderdetails'));
    }


    public function edit($id)
    {
        //
    }



    public function destroy($id)
    {
        $order = Order::findOrFail($id);

        $order->delete();

        $notification = array(
            'message' => 'Order Deleted Successfully.',
            'alert-type' => 'success'
        );
        return redirect()->back()->with($notification);
    }


    /*================= Start update_payment_status Methoed ================*/
    public function update_payment_status(Request $request)
    {
        $order = Order::findOrFail($request->order_id);

        $order->payment_status = $request->status;
        $order->save();

        $order_detail = OrderDetail::where('order_id', $order->id)->get();
        foreach($order_detail as $item){
            $item->payment_status = $request->status;
            $item->save();
        }

        // dd($order);

        $orderstatus = OrderStatus::create([
            'order_id' => $order->id,
            'title' => 'Payment Status: '.$request->status,
            'comments' => '',
            'created_at' => Carbon::now(),
        ]);
        return response()->json(['success'=> 'Payment status has been updated']);

    }

    /*================= Start update_delivery_status Methoed ================*/
    public function update_delivery_status(Request $request)
    {
        $order = Order::findOrFail($request->order_id);

        if ($request->status == 'cancelled') {
            //    return $order->order_details;
                foreach ($order->order_details as $orderDetail) {
                    //for product stock update
                    if( $orderDetail->is_varient){
                        $jsonData = $orderDetail->variation;
                        $data = json_decode($jsonData, true);
                        $attributeValues = [];
                        foreach ($data as $item) {
                            $attributeValues[] = $item['attribute_value'];
                        }
                        $concatenatedValue = implode('-', $attributeValues);
                        $productStockId = ProductStock::where('product_id', $orderDetail->product_id)->get();
                        foreach($productStockId as $productStock){
                            if($productStock->varient==$concatenatedValue){
                                $productStock->qty=$productStock->qty+$orderDetail->qty;
                                $productStock->update();
                            }
                        }
                    }
                    $product = Product::find($orderDetail->product_id);
                    $product->stock_qty = $product->stock_qty + $orderDetail->qty;
                    $orderDetail->delivery_status = $request->status;
                    $orderDetail->update();
                    $product->update();

                }
            }
        $order->delivery_status = $request->status;
        $order->save();

        $order_detail = OrderDetail::where('order_id', $order->id)->get();
        foreach($order_detail as $item){
            $item->delivery_status = $request->status;
            $item->save();
        }
        $orderstatus = OrderStatus::create([
            'order_id' => $order->id,
            'title' => 'Delevery Status: '.$request->status,
            'comments' => '',
            'created_at' => Carbon::now(),
        ]);

        return response()->json(['success'=> 'Delivery status has been updated']);

    }



    /*================= Start admin_user_update Methoed ================*/
    public function admin_user_update(Request $request, $user_id)
    {


        $request->validate([
            'name' => 'required',
            'phone' => ['required', 'regex:/(\+){0,1}(88){0,1}01(3|4|5|6|7|8|9)(\d){8}/', 'digits:11'],
            'email' => ['nullable', 'string', 'email', 'max:255'],
        ]);
         User::where('id',$user_id)->update([
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
        ]);

        Session::flash('success','Customer Information Updated Successfully');
        return redirect()->back();
    }

    /* ============= Start getdivision Method ============== */
    public function getdivision($division_id){
        $division = District::where('division_id', $division_id)->orderBy('district_name_en','ASC')->get();

        return json_encode($division);
    }
    /* ============= End getdivision Method ============== */

    /* ============= Start getupazilla Method ============== */
    public function getupazilla($district_id){
        $upazilla = Upazilla::where('district_id', $district_id)->orderBy('name_en','ASC')->get();

        return json_encode($upazilla);
    }
    /* ============= End getupazilla Method ============== */

    /* ============= Start invoice_download Method ============== */
    // public function invoice_download($id){
    //     $order = Order::findOrFail($id);

    //     $pdf = PDF::loadView('backend.invoices.invoice',compact('order'))->setPaper('a4')->setOptions([
    //             'tempDir' => public_path(),
    //             'chroot' => public_path(),
    //     ]);
    //     return $pdf->download('invoice.pdf');
    // } // end method

    /* ============= Start invoice_download Method ============== */
    public function invoice_download($id){
        $order = Order::findOrFail($id);
        //dd(app('url')->asset('upload/abc.png'));
        $pdf = PDF::loadView('backend.invoices.invoice',compact('order'))->setPaper('a4');
        return $pdf->download('invoice.pdf');
    } // end method
    /* ============= End invoice_download Method ============== */
    public function invoice_print_download($id){
        //dd($id);
        $order = Order::findOrFail($id);
        //dd(app('url')->asset('upload/abc.png'));
        // $pdf = PDF::loadView('backend.invoices.invoice',compact('order'))->setPaper('a4');
        // dd($pdf);
        return view('backend.invoices.invoice_print', compact('order'));
        // return $pdf->loadView('invoice.pdf');
    } // end method
    public function packages_index(Request $request){
        $date = $request->date;
        $delivery_status = null;
        $payment_status = null;
        $shipping_type = null;
        $ordersQuery = Order::where('packaging_status', 1);
        $dateRange = explode(" - ", $date);
        $startDate = date('Y-m-d', strtotime($dateRange[0]));
        if (isset($dateRange[1])) {
            $endDate = date('Y-m-d', strtotime($dateRange[1]));
        } else {
            $endDate = date('Y-m-d');
        }

        if ($request->filled(['delivery_status', 'payment_status', 'date', 'shipping_type'])) {
            if ($startDate === $endDate) {
                $ordersQuery->whereDate('created_at', $startDate)->where('delivery_status', $request->delivery_status)
                ->where('payment_status', $request->payment_status)
                ->where('shipping_type', $request->shipping_type);
            } else {
                $ordersQuery->whereBetween('created_at', [$startDate, $endDate])->where('delivery_status', $request->delivery_status)
                ->where('payment_status', $request->payment_status)
                ->where('shipping_type', $request->shipping_type);
            }
        }elseif ($request->filled(['delivery_status', 'payment_status', 'date']) && $request->shipping_type == null) {
            if ($startDate === $endDate) {
                $ordersQuery->whereDate('created_at', $startDate)->where('delivery_status', $request->delivery_status)
                ->where('payment_status', $request->payment_status);
            } else {
                $ordersQuery->whereBetween('created_at', [$startDate, $endDate])->where('delivery_status', $request->delivery_status)
                ->where('payment_status', $request->payment_status);
            }
        } elseif ($request->filled(['delivery_status', 'date', 'shipping_type']) && $request->payment_status == null) {
            if ($startDate === $endDate) {
                $ordersQuery->whereDate('created_at', $startDate)->where('delivery_status', $request->delivery_status)
                ->where('shipping_type', $request->shipping_type);
            } else {
                $ordersQuery->whereBetween('created_at', [$startDate, $endDate])->where('delivery_status', $request->delivery_status)
                ->where('shipping_type', $request->shipping_type);
            }
        } elseif ($request->filled(['payment_status', 'date', 'shipping_type']) && $request->delivery_status == null) {
            if ($startDate === $endDate) {
                $ordersQuery->whereDate('created_at', $startDate)->where('payment_status', $request->payment_status)
                ->where('shipping_type', $request->shipping_type);
            } else {
                $ordersQuery->whereBetween('created_at', [$startDate, $endDate])->where('payment_status', $request->payment_status)
                ->where('shipping_type', $request->shipping_type);
            }
        } elseif ($request->filled(['delivery_status', 'date']) && $payment_status == null && $shipping_type == null) {
            if ($startDate === $endDate) {
                $ordersQuery->whereDate('created_at', $startDate)->where('delivery_status', $request->delivery_status);
            } else {
                $ordersQuery->whereBetween('created_at', [$startDate, $endDate])->where('delivery_status', $request->delivery_status);
            }
        } elseif ($request->filled(['payment_status', 'date']) && $delivery_status == null && $shipping_type == null) {
            if ($startDate === $endDate) {
                $ordersQuery->whereDate('created_at', $startDate)->where('payment_status', $request->payment_status);
            } else {
                $ordersQuery->whereBetween('created_at', [$startDate, $endDate])->where('payment_status', $request->payment_status);
            }
        } elseif ($request->filled(['shipping_type', 'date']) && $delivery_status == null && $payment_status == null) {
            if ($startDate === $endDate) {
                $ordersQuery->whereDate('created_at', $startDate)->where('shipping_type', $request->shipping_type);
            } else {
                $ordersQuery->whereBetween('created_at', [$startDate, $endDate])->where('shipping_type', $request->shipping_type);
            }
        } elseif ($request->filled(['date']) && $delivery_status == null && $payment_status == null && $shipping_type == null) {
            if ($startDate === $endDate) {
                $ordersQuery->whereDate('created_at', $startDate);
            } else {
                $ordersQuery->whereBetween('created_at', [$startDate, $endDate]);
            }
        }else {
            $ordersQuery->orderBy('id', 'desc');
        }
        $orders = $ordersQuery->orderBy('created_at', 'desc')->get();
       return view('backend.sales.all_orders.packages', compact('orders', 'delivery_status', 'date','payment_status','shipping_type'));
    }
    public function package_status($id){
        $getstatus = Order::select('packaging_status')->where('id', $id)->first();
        if ($getstatus->packaging_status == 0) {
            $status = 1;
        }elseif($getstatus->packaging_status == 1){
            $status = 0;
        }
         else {
            $status = 1;
        }
        Order::where('id', $id)->update(['packaging_status' => $status]);
        return back();
    }

    public function delete_order_product($id){
        $orderdetail = OrderDetail::findOrFail($id);
        $order=Order::find($orderdetail->order_id);
        $product = Product::find($orderdetail->product_id);
        $buyingPrice=$product->purchase_price;
         if(!$orderdetail->is_varient){
            if ($product->discount_type == 1) {
                $price_after_discount = $product->regular_price - $product->discount_price;
            } elseif ($product->discount_type == 2) {
                $price_after_discount = $product->regular_price - ($product->regular_price * $product->discount_price) / 100;
            }
            $Price = ($product->discount_price ? $price_after_discount : $product->regular_price);
         }
        if( $orderdetail->is_varient == 1){
            $jsonData = $orderdetail->variation;
            $data = json_decode($jsonData, true);
            $attributeValues = [];
            foreach ($data as $item) {
                $attributeValues[] = $item['attribute_value'];
            }
            $concatenatedValue = implode('-', $attributeValues);
            $productStockId = ProductStock::where('product_id', $orderdetail->product_id)->get();
            foreach($productStockId as $productStock){
                if($productStock->varient==$concatenatedValue){
                    $productStock->qty=$productStock->qty+$orderdetail->qty;
                    $productStock->update();
                    if ($product->discount_type == 1) {
                        $price_after_discount = $productStock->price - $product->discount_price;
                    } elseif ($product->discount_type == 2) {
                        $price_after_discount = $productStock->price - ($productStock->price * $product->discount_price) / 100;
                    }
                    $Price = ($product->discount_price ? $price_after_discount : $productStock->price);
                }

            }
        }
        $product->stock_qty = $product->stock_qty + $orderdetail->qty;
        $product->update();
        $order->sub_total=($order->sub_total - ($Price * $orderdetail->qty));
        $order->grand_total=($order->grand_total - ($Price * $orderdetail->qty));
        $order->totalbuyingPrice=($order->totalbuyingPrice - ($buyingPrice * $orderdetail->qty));
        $order->update();
        $orderdetail->delete();
        $notification = array(
            'message' => 'Order Item Deleted Successfully',
            'alert-type' => 'success'
        );
        return redirect()->back()->with($notification);
    }

    public function order_quantity_update(Request $request){
        {


            $product_id = $request->input('product_id');
            $stock_id = $request->input('stock_id');
            $type = $request->input('type');
            $qty = $request->input('qty');
            $prod_check = Product::where('id',$product_id)->first();
            $buyingPrice =$prod_check->purchase_price;
            $prod_attr = ProductStock::where('id', $stock_id)->where('product_id',$product_id)->first();
            if($stock_id){
                if ($prod_check->discount_type == 1) {
                    $price_after_discount = $prod_attr->price - $prod_check->discount_price;
                } elseif ($prod_check->discount_type == 2) {
                    $price_after_discount = $prod_attr->price - ($prod_attr->price * $prod_check->discount_price) / 100;
                }
                $Price = ($prod_check->discount_price ? $price_after_discount : $prod_attr->price);
            }else{
                if ($prod_check->discount_type == 1) {
                    $price_after_discount = $prod_check->regular_price - $prod_check->discount_price;
                } elseif ($prod_check->discount_type == 2) {
                    $price_after_discount = $prod_check->regular_price - ($prod_check->regular_price * $prod_check->discount_price) / 100;
                }
                $Price = ($prod_check->discount_price ? $price_after_discount : $prod_check->regular_price);
            }
                if ($type == '+') {
                if($stock_id == 'undefined' && $stock_id == null){
                    if ($prod_check->stock_qty == $qty) {
                        return response()->json(['error'=> 'Product stock limited']);
                    }
                    if ( $qty > $prod_check->stock_qty) {
                        return response()->json(['error'=> 'Product stock limited']);
                    }
                }
                if($stock_id !== 'undefined' && $stock_id !== null){
                    if ($prod_attr->qty == $qty){
                        return response()->json(['error'=> 'Product stock limited']);
                    }
                    if ($prod_attr->qty < $qty){
                        return response()->json(['error'=> 'Product stock limited']);
                    }
                }
                    $newQty= $qty += 1;
                }else{
                    if ($qty == 1) {
                        return response()->json(['error'=> 'Product stock limited']);
                    }
                    $newQty = $qty - 1;
                }
                return response()->json([
                    'status' => 'success',
                    'message' => "Quantity update successfully",
                    'type' => $type,
                    'price' => $Price,
                    'qty' => $newQty ,
                    'buyingPrice' => $buyingPrice ,
                ]);

            }
    }

  public function update(Request $request, $id)
       {
           $this->validate($request,[
               'payment_method' => 'required',
               'division_id' => 'required',
               'district_id' => 'required',
               'upazilla_id' => 'required',
               'address' => 'required',
           ]);
           $order = Order::findOrFail($id);
           $order->division_id = $request->division_id;
           $order->district_id = $request->district_id;
           $order->upazilla_id = $request->upazilla_id;
           $order->address = $request->address;
           $order->payment_method = $request->payment_method;
           if($order->order_details) {
            foreach ($order->order_details as $key => $orderdetail) {
                $requestqty=$request['qty' .$key];
                $product = Product::find($orderdetail->product_id);
                if( $orderdetail->is_varient == 1 ){
                        $jsonData = $orderdetail->variation;
                        $data = json_decode($jsonData, true);
                        $attributeValues = [];
                        foreach ($data as $item) {
                            $attributeValues[] = $item['attribute_value'];
                        }
                        $concatenatedValue = implode('-', $attributeValues);
                    //  dd( $concatenatedValue);
                        $productStockId = ProductStock::where('product_id', $orderdetail->product_id)->get();
                        foreach($productStockId as $productStock){
                            if($productStock->varient==$concatenatedValue){
                                //kom hole
                                if($orderdetail->qty > $requestqty){
                                    $updateqty=$orderdetail->qty - $requestqty;
                                    $productStock->qty=$productStock->qty+$updateqty;
                                    $productStock->update();
                                    $orderdetail->qty=$orderdetail->qty - $updateqty;
                                    $orderdetail->update();
                                    $product->stock_qty = $product->stock_qty + $requestqty;
                                    $product->update();
                                }
                                //besi hole
                                if($orderdetail->qty < $requestqty){
                                    $updateqty= $requestqty- $orderdetail->qty;
                                    $productStock->qty=$productStock->qty-$updateqty;
                                    $productStock->update();
                                    $orderdetail->qty =$orderdetail->qty + $updateqty;
                                    $orderdetail->update();
                                    $product->stock_qty = $product->stock_qty - $updateqty;
                                    $product->update();

                                }
                            }
                        }
                    }
                else{
                    if($orderdetail->qty > $requestqty){
                        $updateqty=$orderdetail->qty - $requestqty;
                        $orderdetail->qty=$orderdetail->qty - $updateqty;
                        $orderdetail->update();
                        $product->stock_qty = $product->stock_qty + $updateqty;
                        $product->update();
                    }
                    if($orderdetail->qty < $requestqty){
                        $updateqty= $requestqty- $orderdetail->qty;
                        $orderdetail->qty =$orderdetail->qty + $updateqty;
                        $orderdetail->update();
                        $product->stock_qty = $product->stock_qty - $updateqty;
                        $product->update();
                    }
                }
            }
        }
        if($request->discount >$order->discount){
            $discountof=$request->discount - $order->discount;
            $grandof=$request->grand_total-$discountof;
           } elseif($request->discount < $order->discount){
            $discountof= $order->discount - $request->discount;
            $grandof=$request->grand_total + $discountof;
           }else{
            $grandof=$request->grand_total - $request->discount;
           }
            $order->grand_total=$grandof;
            $order->sub_total=$request->sub_total;
            $order->totalbuyingPrice=$request->totalbuyingPrice;
            $order->discount=$request->discount;
            $order->update();
            $address=Address::where('user_id',$order->user_id)->first();
            $address->division_id = $request->division_id;
            $address->district_id = $request->district_id;
            $address->upazilla_id = $request->upazilla_id;
            $address->address = $request->address;
            $address->update();
            $user=User::where('id',$order->user_id)->first();
            $user->address = $request->address;
            $user->update();
           Session::flash('success',' Orders Information Updated Successfully');
           return redirect()->back();
  }
  public function order_itemAdd(Request $request ){
    {
        if($request->product_id) {
            $orderold=OrderDetail::where('order_id',$request->order_id)->where('product_id',$request->product_id)->first();
            $orderUpdate=Order::where('id',$request->order_id)->first();
            if($orderold){
                if( $orderold->is_varient == 1 ){
                    $jsonData = $orderold->variation;
                    $data = json_decode($jsonData, true);
                    $attributeValues = [];
                    foreach ($data as $item) {
                        $attributeValues[] = $item['attribute_value'];
                    }
                    $concatenatedValue = implode('-', $attributeValues);
                    $productStockId = ProductStock::where('product_id', $orderold->product_id)->where('varient', $concatenatedValue)->first();
                    if($productStockId->id == $request->stock_id){
                        return response()->json([ 'status' => 'error',  'message' => "Product varient Already Added",]);
                    }
                }else{
                    if($orderold->product_id == $request->product_id){
                        return response()->json([ 'status' => 'error',  'message' => "Product  Already Added",]);
                    }
                }
            }
            $prod_check = Product::where('id',$request->product_id)->first();
            if ($prod_check->stock_qty == 0) {
                return response()->json([ 'status' => 'error',  'message' => "Product Stock Out",]);
            }
            $stock_id = $request->stock_id;
            $prod_attr = ProductStock::where('id', $stock_id)->where('product_id',$request->product_id)->first();
                if($stock_id = null){
                    if ($prod_check->stock_qty == 0) {
                        return response()->json([ 'status' => 'error',  'message' => "Product Stock Out",]);
                    }
                }
                if(isset($stock_id )){
                    if($prod_check->id=$prod_attr->product_id){
                        if ($prod_attr->qty == 0) {
                            return response()->json([ 'status' => 'error',  'message' => "Product Stock Out",]);
                        }
                    }
                }
                $productadd = Product::find($request->product_id);
                $buyprice= $productadd->purchase_price;
                if($productadd->is_varient == 1){
                    if ($productadd->discount_type == 1) {
                        $price_after_discount = $prod_attr->price - $productadd->discount_price;
                    } elseif ($productadd->discount_type == 2) {
                        $price_after_discount = $prod_attr->price - ($prod_attr->price * $productadd->discount_price) / 100;
                    }
                    $Price = ($productadd->discount_price ? $price_after_discount : $prod_attr->price);
                }else{
                    if ($productadd->discount_type == 1) {
                        $price_after_discount = $productadd->regular_price - $productadd->discount_price;
                    } elseif ($productadd->discount_type == 2) {
                        $price_after_discount = $productadd->regular_price - ($productadd->regular_price * $productadd->discount_price) / 100;
                    }
                    $Price = ($productadd->discount_price ? $price_after_discount : $productadd->regular_price);
                }

                if($productadd->vendor == 0){
                    $vendor_comission = 0.00;
                    $vendor = 0;
                }
                else {
                    $vendor = Vendor::where('user_id', $productadd->vendor)->select('vendors.commission','user_id')->first();
                    $vendor_comission = ($productadd->regular_price * $vendor->commission)/100;
                }
                if($productadd->is_varient == 1){
                    $stockproductvarient = $prod_attr->varient;
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
                    OrderDetail::insert([
                        'order_id' => $request->order_id,
                        'product_id' => $productadd->id,
                        'product_name' => $productadd->name_en,
                        'is_varient' => 1,
                        'vendor_id' => $vendor->user_id ?? 0,
                        'v_comission' => $vendor_comission,
                        'variation' => json_encode($variations, JSON_UNESCAPED_UNICODE),
                        'qty' => 1,
                        'price' => $Price,
                        'created_at' => Carbon::now(),
                    ]);
                    if($prod_attr){
                        // dd($stock);
                        $prod_attr->qty = $prod_attr->qty - 1;
                        $prod_attr->save();
                    }
                }else{
                    OrderDetail::insert([
                        'order_id' => $request->order_id,
                        'product_id' => $productadd->id,
                        'product_name' => $productadd->name_en,
                        'is_varient' => 0,
                        'vendor_id' => $vendor->user_id ?? 0,
                        'v_comission' => $vendor_comission,
                        'qty' => 1,
                        'price' => $Price,
                        'created_at' => Carbon::now(),
                    ]);
                }
                $productadd->stock_qty = $productadd->stock_qty - 1;
                $productadd->save();
                $orderUpdate->sub_total=$orderUpdate->sub_total+$Price;
                $orderUpdate->grand_total=$orderUpdate->grand_total+$Price;
                $orderUpdate->totalbuyingPrice=$orderUpdate->totalbuyingPrice+$buyprice;
                $orderUpdate->save();
                return response()->json([ 'status' => 'success',  'message' => "Product added To Order Successfully",]);
        }
    }
  }
  public function order_product_packaged(Request $request)
  {
      $ids=$request->ids;
      $status = 'shipped';
      Order::whereIn('id', $ids)->update(['delivery_status' => $status]);
      return response()->json([
        'status' => 'success',
        'message' => "Products are Packed",
      ]);
  }
   public function order_product_Print(Request $request)
    {
        $ids = $request->ids;
        $status = 1;
        $dalivary_status = 'processing';
        Order::whereIn('id', $ids)->update(['packaging_status' => $status]);
        Order::whereIn('id', $ids)->where('delivery_status','pending')->update(['delivery_status' => $dalivary_status]);
        $orders = Order::whereIn('id', $ids)->get();
        $request->session()->put('orders', $orders);
        return response()->json([
            'status' => 'success',
            'message' => "Products are Printed",
            'orders' => $orders,
            'redirect_url' => route('multiple.orderprint.page', ['orders' => $orders]),
        ]);
    }
    public function multiple_order_print_page(Request $request){
      $orders = $request->session()->get('orders');
      $request->session()->forget('orders');
       if ($orders) {
            return view('backend.invoices.multiple_order_print', compact('orders'));
        } else {
            return redirect()->back()->with('error', 'Order are Printed');
        }
    }
}
