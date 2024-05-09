<?php

namespace App\Http\Controllers\Backend;

use Image;
use Session;
use App\Models\User;
use App\Models\Order;
use App\Models\Address;
use App\Models\Setting;
use App\Imports\UsersImport;
use App\Models\OrderPayment;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Maatwebsite\Excel\Facades\Excel;
//use Illuminate\Validation\ValidationException;
use Maatwebsite\Excel\Validators\ValidationException;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if(Auth::guard('admin')->user()->role != '1'){
            abort(404);
        }
        $customers = User::where('role', 3)->where('customer_type',1)->latest()->get();
        $setting=Setting::where('name','premium_membership')->first();
        $member=$setting->value;
    	return view('backend.customer.index',compact('customers','member'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('backend.customer.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request,[
            'name'                  => 'required',
            'username'              => 'required',
            'email'                 => 'required|email|max:191|unique:users',
            'address'               => 'required',
            'phone'                 => ['required','regex:/(\+){0,1}(88){0,1}01(3|4|5|6|7|8|9)(\d){8}/','min:11','max:15','unique:users'],
            'profile_image'         => 'nullable',
            'status'                => 'nullable',
            'division_id'           => 'required',
            'district_id'           => 'required',
            'upazilla_id'           => 'required',
        ]);

        if($request->hasfile('profile_image')){
            $image = $request->file('profile_image');
            $name_gen = hexdec(uniqid()).'.'.$image->getClientOriginalExtension();
            Image::make($image)->resize(160,160)->save('upload/admin_images/'.$name_gen);
            $save_url = 'upload/admin_images/'.$name_gen;
        }else{
            $save_url = '';
        }

        $customer = new User();
        $customer->name = $request->name;
        $customer->username = $request->username;
        $customer->email = $request->email;
        $customer->phone = $request->phone;
        $customer->address = $request->address;
        $customer->password =  Hash::make("12345678");
        $customer->profile_image = $save_url;
        $customer->created_at = Carbon::now();
        $customer->role = 3;
        $customer->status = $request->status;
        $customer->customer_type = 1;
        $customer->save();
        $address= new Address;
        $address->division_id = $request->division_id;
        $address->district_id = $request->district_id;
        $address->upazilla_id = $request->upazilla_id;
        $address->address = $request->address;
        $address->user_id = $customer->id;
        $address->is_default = 0;
        $address->status = 1;
        $address->save();
		Session::flash('success','Customer Create Successfully');
		return redirect()->route('customer.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $customer = User::findOrFail($id);
        $orders = Order::where('user_id', $id)->get();
        $payments = OrderPayment::where('user_id', $id)->get();
    	return view('backend.customer.show',compact('customer','orders','payments'));
    }
    public function onlineUserdetails($id)
    {
        $customer = User::findOrFail($id);
        $orders = Order::where('user_id', $id)->get();
        $payments = OrderPayment::where('user_id', $id)->get();
    	return view('backend.customer.onlineuser_details',compact('customer','orders','payments'));
    }
    public function customerPrint(){
        $customers = User::where('role', 3)->where('customer_type',1)->latest()->get();
        return view('backend.customer.customer_print',compact('customers'));
    }
    public function online_user_Print(){
        $customers = User::where('role', 3)->where('customer_type',0)->latest()->get();
        return view('backend.customer.customer_print',compact('customers'));
    }

    public function customerOrderPrint($id)
    {
        $order = Order::findOrFail($id);
        return view('backend.customer.order_report_print',compact('order'));
    }

    public function customerPaymentPrint($id)
    {
        $payment = OrderPayment::findOrFail($id);
        return view('backend.customer.payment_report_print',compact('payment'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $customer = User::findOrFail($id);
        $address=Address::where('user_id',$customer->id)->first();
    	return view('backend.customer.edit',compact('customer','address'));
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
        $this->validate($request,[
            'name'                  => 'required',
            'address'               => 'nullable',
            'profile_image'         => 'nullable',
            'status'                => 'nullable',
        ]);
        $customer = User::find($id);
        // dd($request->all());
        if($request->hasfile('profile_image')){
            try {
                if(file_exists($customer->profile_image)){
                    unlink($customer->profile_image);
                }
            } catch (Exception $e) {

            }
            $profile_image = $request->profile_image;
            $profile_save = time().$profile_image->getClientOriginalName();
            $profile_image->move('upload/admin_images/',$profile_save);
            $customer->profile_image = 'upload/admin_images/'.$profile_save;
        }else{
            $profile_save = '';
        }

        $customer->name = $request->name;
        $customer->username = $request->username;
        $customer->email = $request->email;
        $customer->phone = $request->phone;
        $customer->address = $request->address;
        $customer->role = 3;
        $customer->status = $request->status;
        $customer->customer_type = 1;
        $customer->membership = $request->membership? 1 : 0;
        $customer->save();
        $address=Address::where('user_id',$customer->id)->first();
        $address->division_id = $request->division_id;
        $address->district_id = $request->district_id;
        $address->upazilla_id = $request->upazilla_id;
        $address->address = $request->address;
        $address->user_id = $customer->id;
        $address->is_default = 0;
        $address->status = 1;
        $address->save();
		Session::flash('success','Customer Update Successfully');
		return redirect()->route('customer.index');
    }

    public function update_pass(Request $request, $id)
    {
        $this->validate($request,[
            'oldpassword'           => 'required',
            'newpassword'           => 'required',
            'confirm_password'      => 'required|same:newpassword',
        ]);
        $customer = User::find($id);
        $hashedPassword = $customer->password;
        //  dd($hashedPassword);
        if (Hash::check($request->oldpassword,$hashedPassword )) {
            $customer->password = bcrypt($request->newpassword);
            $customer->save();

            Session::flash('success','Password Updated Successfully');
            return redirect()->back();
        }else{
            Session::flash('error','Old password is not match');
            return redirect()->back();
        }

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $customer = User::findOrFail($id);
    	try {
            if(file_exists($customer->profile_image)){
                unlink($customer->profile_image);
            }
        } catch (Exception $e) {

        }

    	$customer->delete();

        $notification = array(
            'message' => 'Customer Deleted Successfully.',
            'alert-type' => 'error'
        );
		return redirect()->back()->with($notification);
    }
    public function status($id)
    {
        $customer = User::find($id);
        if($customer->status == 1){
            $customer->status = 0;
        }else{
            $customer->status = 1;
        }
        $customer->save();
        $notification = array(
            'message' => 'Customer Feature Status Changed Successfully.',
            'alert-type' => 'success'
        );
        return redirect()->back()->with($notification);
    }

    public function online_user_list(){
        if(Auth::guard('admin')->user()->role != '1'){
            abort(404);
        }
        $customers = User::where('role', 3)->where('customer_type',0)->orWhereNull('customer_type')->latest()->get();
        $setting=Setting::where('name','premium_membership')->first();
        $member=$setting->value;
    	return view('backend.customer.onlineUser',compact('customers','member'));
    }
    public function import(Request $request)
    {
        $this->validate($request,[
            'file'           => 'required|file',
        ]);
        $file = $request->file('file');
        $mime = $file->getMimeType();

        if ($mime !== 'text/csv') {
            return redirect()->back()->with('error', 'The uploaded file must be in CSV format');
        }
       try {
        Excel::import(new UsersImport, $request->file('file'));
        return redirect()->back()->with('success', 'User Imported Successfully');
        } catch (ValidationException $e) {
            //return redirect()->back()->withErrors($e->errors())->withInput();
            return redirect()->back()->with('error', 'There Are Some Error Please Check');
        } catch (\Exception $e) {
            return redirect()->back()->withErrors($e->getMessage());
        }
    }
}
