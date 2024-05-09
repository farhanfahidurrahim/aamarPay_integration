@extends('layouts.frontend')
@push('css')
    <style>
        /*Address select design*/
        .address_select_custom .custom_select .select2-container {
            width: 95% !important;
            max-width: 95%;
        }

        .address_select_custom .custom_select .select2-container--default .select2-selection--single {
            line-height: 46px;
        }

        .address_select_custom .custom_select .select2-container--default .select2-selection--single .select2-selection__arrow {
            top: 8px !important;
        }

        .address_select_custom .custom_select .select2-container--default .select2-selection--single .select2-selection__rendered {
            line-height: 46px;
        }

        /*Model select design*/
        .custom_address_modal.custom_select .select2-container {
            width: 95% !important;
            max-width: 95%;
        }

        .custom_address_modal.custom_select .select2-container--default .select2-selection--single {
            height: 46px;
        }

        .custom_address_modal.custom_select .select2-container--default .select2-selection--single .select2-selection__arrow {
            top: 16px;
        }

        .custom_address_modal.custom_select .select2-container--default .select2-selection--single .select2-selection__rendered {
            line-height: 40px;
        }
        .billing__info .col-form-label {
            line-height: 1;
        }
        #closeModalAddress {
            padding: 15px !important;
        }
    </style>
@endpush
@section('content-frontend')
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <main class="main">
        <div class="page-header breadcrumb-wrap">
            <div class="container">
                <div class="breadcrumb">
                    <a href="{{ route('home') }}" rel="nofollow"><i class="fi-rs-home mr-5"></i>Home</a>
                    <span></span> Shop
                    <span></span> Checkout
                </div>
            </div>
        </div>
        <div class="container mb-50 mt-20">
            <div class="row">
                <div class="col-lg-8 mb-20">
                    <h1 class="heading-2 mb-10 fs-1">Checkout</h1>
                    <div class="d-flex align-items-center gap-4">
                        <h6 class="text-body">There are <span class="text-brand" id="total_cart_qty"></span> products in
                            your cart!</h6>
                        @php
                            $couponCode = getCoupon();
                        @endphp
                        @if ($couponCode)
                            <h4 class="text-body">Coupon code is <span class="text-brand"
                                    id="">{{ $couponCode }}</span></h4>
                        @endif
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-7 ">
                    <div class="row">
                        <div class="col-lg-6 mb-sm-15 mb-lg-0 mb-md-3">

                            @if (!auth()->check())
                                <div class="toggle_info">
                                    <span><i class="fi-rs-user mr-10"></i><span class="text-muted font-lg">Already have an
                                            account?</span> <a href="{{ route('login') }}">Click here to login</a></span>
                                </div>
                            @endif

                            <div class="panel-collapse collapse login_form" id="loginform">
                                <div class="panel-body">
                                    <p class="mb-30 font-sm">If you have shopped with us before, please enter your details
                                        below. If you are a new customer, please proceed to the Billing &amp; Shipping
                                        section.</p>
                                    <form method="post" style="">
                                        <div class="form-group">
                                            <input type="text" name="email" placeholder="Username Or Email">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="password" placeholder="Password">
                                        </div>
                                        <div class="login_footer form-group">
                                            <div class="chek-form">
                                                <div class="custome-checkbox">
                                                    <input class="form-check-input" type="checkbox" name="checkbox"
                                                        id="remember" value="">
                                                    <label class="form-check-label" for="remember"><span>Remember
                                                            me</span></label>
                                                </div>
                                            </div>
                                            <a href="#">Forgot password?</a>
                                        </div>
                                        <div class="form-group">
                                            <button class="btn btn-md" name="login">Log in</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        {{-- <div class="col-lg-6">
                            <form method="post" class="apply-coupon">
                                <input type="text" placeholder="Enter Coupon Code...">
                                <button class="btn  btn-md" name="login">Apply Coupon</button>
                            </form>
                        </div> --}}
                    </div>
                    <form action="{{ route('checkout.payment') }}" method="post" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;" class="card p-3">
                        @csrf
                        <div class="row billing__info">
                            <div class="d-flex">
                                <h4 class="mb-30 col-9">Billing Details</h4>
                            </div>

                            <div class="row">
                                <div class="form-group col-lg-6">
                                    <label for="name" class="fw-bold text-black"><span class="text-danger">*</span> Name
                                    </label>
                                    <input type="text" required="" id="name" name="name"
                                        placeholder="Full Name" value="{{ Auth::user()->name ?? old('name') }}">
                                    @error('name')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                                <div class="form-group col-lg-6">
                                    <label for="phone" class="fw-bold text-black"><span
                                            class="required text-danger">*</span> Phone </label>
                                    <input required="" type="number" name="phone" placeholder="Phone" id="phone"
                                        value="{{ Auth::user()->phone ?? old('phone') }}">
                                    @error('phone')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>

                                <div class="form-group col-lg-6">
                                    <label for="email" class="fw-bold text-black">Email</label>
                                    <input id="email" type="email" name="email" placeholder="Email address *"
                                        value="{{ Auth::user()->email ?? old('email') }}">
                                </div>

                                @if (auth()->check())
                                    @php
                                        $id = Auth::user()->id;
                                        $addresses = App\Models\Address::where('user_id', $id)
                                            ->latest()
                                            ->get();
                                    @endphp

                                    <div class="form-group col-lg-6">
                                        <label for="address_id" class="fw-bold text-black col-form-label"><span
                                                class="text-danger">*</span>Address (Please select address)</label>
                                        <div class="form-row">
                                            <div class="col-10 float-start address_select_custom">
                                                <div class="custom_select custom_address_modal">
                                                    <select class="form-select select-active select-nice"
                                                        aria-label="Default select example" name="address_id"
                                                        id="address_id" required>
                                                        <option value="">Select Address</option>
                                                        @foreach ($addresses as $address)
                                                            <option value="{{ $address->id }}">
                                                                {{ ucwords($address->address) }}</option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>
                                            <a class="btn btn-small col-1 float-start" data-bs-toggle="modal"
                                                id="closeModalAddress" data-bs-target="#staticBackdrop"><i
                                                    class="fas fa-plus"></i></a>
                                        </div>
                                    </div>
                                @endif
                            </div>

                            @if (!auth()->check())
                                <div class="row shipping_calculator">
                                    <div class="form-group col-lg-6 address_select_custom">
                                        <div class="custom_select custom_address_modal">
                                            <label for="division_id" class="fw-bold text-black"><span
                                                    class="text-danger">*</span> Division</label>
                                            <select class="form-control select-active" name="division_id"
                                                id="division_id" required>
                                                <option value="">Select Division</option>

                                                @foreach (get_divisions() as $division)
                                                    <option value="{{ $division->id }}">
                                                        {{ ucwords($division->division_name_en) }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-lg-6 address_select_custom">
                                        <div class="custom_select custom_address_modal">
                                            <label for="district_id" class="fw-bold text-black"><span
                                                    class="text-danger">*</span> District</label>
                                            <select class="form-control select-active" name="district_id"
                                                id="district_id" required>
                                                <option selected="" value="">Select District</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-lg-6 address_select_custom">
                                        <div class="custom_select custom_address_modal">
                                            <label for="upazilla_id" class="fw-bold text-black"><span
                                                    class="text-danger">*</span> Zone</label>
                                            <select class="form-control select-active" name="upazilla_id"
                                                id="upazilla_id" required>
                                                <option selected="" value="">Select Zone</option>

                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-lg-6">
                                        <label for="address" class="fw-bold text-black"><span
                                                class="text-danger">*</span> House/Road/Area</label>
                                        <textarea name="address" id="address" class="form-control" placeholder="Address" required>{{ old('address') }}</textarea>
                                        @error('address')
                                            <p class="text-danger">{{ $message }}</p>
                                        @enderror
                                    </div>
                                </div>
                            @else
                                <div class="d-none selected_address">
                                    <div class="card-header bg-main">
                                        Selected Address
                                    </div>
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <p>Division: <span class="ms-1" id="dynamic_division"> </span></p>
                                                <input type="hidden" id="dynamic_division_input" name="division_id">
                                            </div>
                                            <div class="col-sm-4">
                                                <p>District: <span class="ms-1" id="dynamic_district"> </span></p>
                                                <input type="hidden" id="dynamic_district_input" name="district_id">
                                            </div>
                                            <div class="col-sm-4">
                                                <p>Zone: <span class="ms-1" id="dynamic_upazilla"> </span></p>
                                                <input type="hidden" id="dynamic_upazilla_input" name="upazilla_id">
                                            </div>
                                            <div class="col-sm-12 mt-2">
                                                <p>House/Road/Area: <span class="ms-1" id="dynamic_address"> </span></p>
                                                <input type="hidden" id="dynamic_address_input" name="address" required>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @endif
                            <div class="form-group col-lg-6 address_select_custom">
                                <div class="custom_select">
                                    <label for="shipping_id" class="fw-bold text-black col-12"><span
                                            class="text-danger">*</span> Shipping</label>
                                    <select class="form-control select-active col-12" name="shipping_id" id="shipping_id" required>
                                        <option value="">--Select--</option>
                                            @foreach ($shippings as $key => $shipping)
                                                <option value="{{ $shipping->id }}">
                                                    @if ($shipping->type == 1)
                                                        Inside Dhaka
                                                    @elseif($shipping->type == 2)
                                                        Outside Dhaka
                                                    @elseif($shipping->type == 3)
                                                        Outside Dhaka City
                                                    @endif
                                                    ({{ $shipping->name }})
                                                </option>
                                            @endforeach
                                    </select>
                                    @error('shipping_id')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group col-lg-6">
                                <label for="comment" class="fw-bold text-black">Comments</label>
                                <textarea name="comment" id="comment" class="form-control" placeholder="Additional information"></textarea>
                            </div>
                        </div>
                </div>
                <div class="col-lg-5">
                    <div class="border cart-totals mb-50" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;background:#fff;padding:15px">
                        <div class="d-flex align-items-end justify-content-between mb-30">
                            <h4>Your Order</h4>
                            <h6 class="text-muted">Subtotal</h6>
                        </div>
                        <div class="divider-2 mb-30"></div>

                        <div class="order_table checkout">
                            <table class="table no-border">
                                <tbody id="">
                                    @foreach ($carts as $cart)
                                        <tr>
                                            <td class="image product-thumbnail"><img src="/{{ $cart->options->image }}"
                                                    alt="#"></td>
                                            <td>
                                                <h6 class="mb-5"><a
                                                        href="{{ route('product.details', $cart->options->slug) }}"
                                                        class="text-heading">{{ $cart->name }}</a></h6></span>
                                                @if ($cart->options->attribute_names)
                                                    @for ($i = 0; $i < sizeof($cart->options->attribute_names); $i++)
                                                        <span>{{ $cart->options->attribute_names[$i] }}:
                                                            {{ $cart->options->attribute_values[$i] }}</span><br />
                                                    @endfor
                                                @endif
                                            </td>
                                            <td>
                                                <h6 class="text-muted pl-20 pr-20">x {{ $cart->qty }}</h6>
                                            </td>
                                            <td>
                                                <h4 class="text-brand">৳{{ $cart->subtotal }}</h4>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                            <tfoot>
                                <tr>
                                    <td>
                                        <h6 class="mb-2">Have Coupon ? </h6>
                                    </td>
                                    <td>
                                        <div class="coupon_apply">
                                            <input type="text" placeholder="Coupon Code" id="coupon">
                                            <button class="btn btn-success btn-lg" type="button" id="apply"
                                                onclick="applyCoupon()">Apply</button>
                                        </div>
                                    </td>
                                    <input type="hidden" name="coupon_id" id="coupon_id">
                                    <td>
                                        <h6 class="d-flex justify-content-between mb-2">Subtotal : <span
                                                class="text-brand text-end">৳<span
                                                    id="cartSubTotal">{{ $cartTotal }}</span></span></h6>
                                    </td>
                                    <td>
                                        <h6 class="d-flex justify-content-between mb-2">Shipping : <span
                                                class="text-brand text-end">৳<span id="ship_amount">0.00</span></span>
                                            <h6>
                                    </td>
                                    <td>
                                        <div class="coupon_times">
                                            <div onclick="removeCoupon()" disabled id="remove" style="display: none">
                                                <h6> <span>Coupon Discount : <i class="fa fa-times"
                                                            aria-hidden="true"></i></span>
                                                    <span class="text-brand text-end">৳<span
                                                            id="coupon_discount">0.00</span></span>
                                                </h6>
                                            </div>

                                            <input type="hidden" value="" name="coupon_discount"
                                                class="discount" />
                                        </div>
                                    </td>
                                    <input type="hidden" value="" name="shipping_charge" class="ship_amount" />
                                    <input type="hidden" value="" name="shipping_type" class="shipping_type" />
                                    <input type="hidden" value="" name="shipping_name" class="shipping_name" />
                                    <input type="hidden" value="{{ $cartTotal }}" name="sub_total"
                                        id="cartSubTotalShi" />

                                    <input type="hidden" value="{{ $cartTotal }}" name="grand_total"
                                        id="grand_total" />
                                    <td>
                                        <h4 class="d-flex justify-content-between">Total : <span
                                                class="text-brand text-end">৳<span
                                                    id="grand_total_set">{{ $cartTotal }}</span></span>
                                            <h4>
                                    </td>
                                </tr>
                            </tfoot>
                        </div>

                    </div>
                    <div class="payment card p-3" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;">
                        <h4 class="mb-30">Payment</h4>
                        <!-- <div class="custome-radio"> -->
                        <div class="row gutters-5">
                            <h6 class="payment__info"></h6>
                            <div class="col-4 col-sm-3">
                                <lavel class="cit-megabox d-block mb-3 cash_on_delivery">
                                    <input class="form-check-input" required="" type="radio" name="payment_option"
                                        id="cash_on_delivery" checked="" value="cod">
                                    <span class="d-block cit-megabox-elem p-3">
                                        <img src="{{ asset('frontend') }}/assets/imgs/theme/cod.png" alt=""
                                            class="img-fluid mb-2">
                                        <span class="d-block text-center">
                                            <span class="d-block fw-600 fs-15">Cash On Delivery</span>
                                        </span>
                                    </span>
                                </lavel>
                            </div>

                            <div class="col-4 col-sm-3">
                                <lavel class="cit-megabox d-block mb-3">
                                    <input class="form-check-input" required="" type="radio" name="payment_option"
                                        id="bkash" value="bkash">
                                    <span class="d-block cit-megabox-elem p-3">
                                        <img src="{{ asset('frontend') }}/assets/imgs/theme/bkash.png" alt=""
                                            class="img-fluid mb-2">
                                        <span class="d-block text-center">
                                            <span class="d-block fw-600 fs-15">bKash</span>
                                        </span>
                                    </span>
                                </lavel>
                            </div>

                            <div class="col-4 col-sm-3">
                                <lavel class="cit-megabox d-block mb-3">
                                    <input class="form-check-input" required="" type="radio" name="payment_option"
                                        id="nagad" value="nagad">
                                    <span class="d-block cit-megabox-elem p-3">
                                        <img src="{{ asset('frontend') }}/assets/imgs/theme/nagad.png" alt=""
                                            class="img-fluid mb-2">
                                        <span class="d-block text-center">
                                            <span class="d-block fw-600 fs-15">Nagad</span>
                                        </span>
                                    </span>
                                </lavel>
                            </div>

                            <div class="col-4 col-sm-3">
                                <lavel class="cit-megabox d-block mb-3">
                                    <input class="form-check-input" required="" type="radio" name="payment_option"
                                        id="aamarpay" value="aamarpay">
                                    <span class="d-block cit-megabox-elem p-3">
                                        <img src="{{ asset('frontend') }}/assets/imgs/theme/aamarpay.png" alt=""
                                            class="img-fluid mb-2">
                                        <span class="d-block text-center">
                                            <span class="d-block fw-600 fs-15">Aamarpay</span>
                                        </span>
                                    </span>
                                </lavel>
                            </div>

                            <div class="col-4 col-sm-3">
                                <lavel class="cit-megabox d-block mb-3">
                                    <input class="form-check-input" required="" type="radio" name="payment_option"
                                        id="sslcommerz" value="sslcommerz">
                                    <span class="d-block cit-megabox-elem p-3">
                                        <img src="{{ asset('frontend') }}/assets/imgs/theme/sslcommerz.png"
                                            alt="" class="img-fluid mb-2">
                                        <span class="d-block text-center">
                                            <span class="d-block fw-600 fs-15">sslcommerz</span>
                                        </span>
                                    </span>
                                </lavel>
                            </div>

                        </div>
                        <!-- </div> -->


                        <!-- <div class="payment_option">
                                <div class="custome-radio">
                                    <input class="form-check-input" required="" type="radio" name="payment_option" id="exampleRadios3" checked="" value="bikash">
                                    <label class="form-check-label" for="exampleRadios3" data-bs-toggle="collapse" data-target="#bankTranfer" aria-controls="bankTranfer">bKash</label>
                                </div>
                                <div class="custome-radio">
                                    <input class="form-check-input" required="" type="radio" name="payment_option" id="exampleRadios4" checked="" value="nagad">
                                    <label class="form-check-label" for="exampleRadios4" data-bs-toggle="collapse" data-target="#checkPayment" aria-controls="checkPayment">Nagad</label>
                                </div>
                                <div class="custome-radio">
                                    <input class="form-check-input" required="" type="radio" name="payment_option" id="exampleRadios5" checked="" value="cash">
                                    <label class="form-check-label" for="exampleRadios5" data-bs-toggle="collapse" data-target="#paypal" aria-controls="paypal">Cash on delivery</label>
                                </div>
                            </div> -->
                        <button type="submit" class="btn btn-fill-out btn-block mt-30">Place an Order<i
                                class="fi-rs-sign-out ml-15"></i></button>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </main>
    <!-- Modal -->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
        aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">Create New Address</h5>
                    <button type="button" class="btn-close" id="Close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <input type="hidden" name="_token" id="csrf" value="{{ Session::token() }}">
                        <div class="form-group col-lg-6">
                            <div class="row">
                                <div class="col-12">
                                    <label for="division_id" class="fw-bold text-black col-form-label"><span
                                            class="text-danger">*</span> Division</label>
                                </div>
                                <div class="col-12">
                                    <div class="custom_address_modal custom_select">
                                        <select class="form-control select-new" aria-label="Default select example"
                                            name="division_id" id="division_id" required>
                                            <option selected>Select Division</option>
                                            @foreach (get_divisions() as $division)
                                                <option value="{{ $division->id }}">
                                                    {{ ucwords($division->division_name_en) }}</option>
                                            @endforeach
                                        </select>
                                        @error('division_id')
                                            <span>{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group col-lg-6">
                            <div class="row">
                                <div class="col-12">
                                    <label for="district_id" class="fw-bold text-black col-form-label"><span
                                            class="text-danger">*</span> District</label>
                                </div>
                                <div class="col-12">
                                    <div class="custom_address_modal custom_select">
                                        <select class="form-control select-new" aria-label="Default select example"
                                            name="district_id" id="district_id" required>
                                            <option selected="" value="">Select District</option>
                                        </select>
                                        @error('district_id')
                                            <span>{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group col-lg-6">
                            <div class="row">
                                <div class="col-12">
                                    <label for="upazilla_id" class="fw-bold text-black col-form-label"><span
                                            class="text-danger">*</span> Zone</label>
                                </div>
                                <div class="col-12">
                                    <div class="custom_address_modal custom_select">
                                        <select class="form-control select-new" aria-label="Default select example"
                                            name="upazilla_id" id="upazilla_id" required>
                                            <option selected>Select Zone</option>
                                        </select>
                                        @error('upazilla_id')
                                            <span>{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group col-lg-6">
                            <label for="address" class="fw-bold text-black col-form-label"><span
                                    class="text-danger">*</span>House/Road/Area:</label>
                            <textarea class="form-control" name="address" id="address" required placeholder="Address"></textarea>
                            @error('address')
                                <span>{{ $message }}</span>
                            @enderror
                        </div>
                        <div class="form-group">
                            <div class="checkbox">
                                <div class="custome-checkbox">
                                    <input class="form-check-input" type="checkbox" name="is_default" id="is_default"
                                        value="0">
                                    <label class="form-check-label label_info" for="is_default"><span>Is
                                            Default</span></label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="checkbox">
                                <div class="custome-checkbox">
                                    <input class="form-check-input" type="checkbox" name="checkbox" id="status"
                                        checked value="1">
                                    <label class="form-check-label label_info" for="status"><span>Status</span></label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" id="addressStore" class="btn btn-primary">Submit</button>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('footer-script')
    <script>
        $(document).ready(function() {
            $('select[name="shipping_id"]').on('change', function() {
                var shipping_cost = $(this).val();
                if (shipping_cost) {
                    $.ajax({
                        url: "{{ url('/checkout/shipping/ajax') }}/" + shipping_cost,
                        type: "GET",
                        dataType: "json",
                        success: function(data) {
                            // Calculate subtotal and shipping cost
                            var subtotal = parseInt('{{ $cartTotal }}');
                            var shipping_charge = parseInt(data.shipping_charge);
                            var coupon_discount = parseFloat($('#coupon_discount').text());
                            console.log(coupon_discount)
                            // Check if subtotal is greater than or equal to 2000
                            if (subtotal >= 2000) {
                                shipping_charge = 0; // Free delivery
                            }

                            // Update shipping charge and other fields
                            $('#ship_amount').text(shipping_charge);
                            $('.ship_amount').val(shipping_charge);
                            $('.shipping_name').val(data.name);
                            $('.shipping_type').val(data.type);

                            // Update the grand total
                            var grand_total_price = ((subtotal + shipping_charge) -
                                coupon_discount);
                            $('#grand_total_set').html(grand_total_price);
                            $('#grand_total').val(grand_total_price);

                            // Show/hide outside_city based on shipping type
                            if (data.type === 3) {
                                $('#outside_city').removeClass(
                                'd-none'); // Show the "outside_city" select
                                $('.cash_on_delivery').parent().addClass(
                                'd-none'); // Hide the "Cash On Delivery" option
                            } else {
                                $('#outside_city').addClass(
                                'd-none'); // Hide the "outside_city" select
                                $('.cash_on_delivery').parent().removeClass(
                                'd-none'); // Show the "Cash On Delivery" option
                            }

                            // Show/hide outside_city based on shipping type
                            if (data.type === 2 || data.type === 3) {
                                $('.cash_on_delivery').parent().addClass(
                                'd-none'); // Hide the "Cash On Delivery" option
                                $('input[name="payment_option"]').first().prop('checked', true);
                            } else {
                                $('.cash_on_delivery').parent().removeClass(
                                'd-none'); // Show the "Cash On Delivery" option
                            }

                            // Show appropriate message based on data.type
                            var paymentMessage = '';
                            if (data.type === 1) {
                                paymentMessage = ` Cash on delivery/ Full advanced payment`;
                            } else if (data.type === 2) {
                                paymentMessage = "Full payment including delivery charge";
                            } else if (data.type === 3) {
                                paymentMessage = "Delivery charge only";
                            }
                            $('.payment__info').text(paymentMessage);
                        }
                    });
                } else {
                    alert('Please Select any Shipping Address!');
                }
            });
        });
    </script>

    <!--  Division To District Show Ajax -->
    <script type="text/javascript">
        $(document).ready(function() {
            $('select[name="division_id"]').on('change', function() {
                var division_id = $(this).val();
                if (division_id) {
                    $.ajax({
                        url: "{{ url('/division-district/ajax') }}/" + division_id,
                        type: "GET",
                        dataType: "json",
                        success: function(data) {
                            $('select[name="district_id"]').html(
                                '<option value="" selected="" disabled="">Select District</option>'
                                );
                            $.each(data, function(key, value) {
                                $('select[name="district_id"]').append(
                                    '<option value="' + value.id + '">' +
                                    capitalizeFirstLetter(value.district_name_en) +
                                    '</option>');
                            });
                            $('select[name="upazilla_id"]').html(
                                '<option value="" selected="" disabled="">Select District</option>'
                                );
                        },
                    });
                } else {
                    alert('danger');
                }
            });

            function capitalizeFirstLetter(string) {
                return string.charAt(0).toUpperCase() + string.slice(1);
            }

            // Address Realtionship Division/District/Upazilla Show Data Ajax //
            $('select[name="address_id"]').on('change', function() {
                var address_id = $(this).val();
                $('.selected_address').removeClass('d-none');
                if (address_id) {
                    $.ajax({
                        url: "{{ url('/address/ajax') }}/" + address_id,
                        type: "GET",
                        dataType: "json",
                        success: function(data) {
                            $('#dynamic_division').text(capitalizeFirstLetter(data
                                .division_name_en));
                            $('#dynamic_division_input').val(data.division_id);
                            $("#dynamic_district").text(capitalizeFirstLetter(data
                                .district_name_en));
                            $('#dynamic_district_input').val(data.district_id);
                            $("#dynamic_upazilla").text(capitalizeFirstLetter(data
                                .upazilla_name_en));
                            $('#dynamic_upazilla_input').val(data.upazilla_id);
                            $("#dynamic_address").text(data.address);
                            $('#dynamic_address_input').val(data.address);

                            var inputValue = $('#dynamic_district_input').val();
                            //console.log(inputValue);
                            var selectShipping = $('#shipping_id');
                            selectShipping.find('option').remove();
                            selectShipping.append('<option value="">--Select--</option>');
                            @foreach ($shippings as $key => $shipping)
                                if ({{ $shipping->type }} == 1 && inputValue == 52) {
                                    selectShipping.append(`<option value="{{ $shipping->id }}">Inside Dhaka ({{ $shipping->name }})</option>`);
                                } else if ({{ $shipping->type }} == 2 && inputValue != 52) {
                                    selectShipping.append(`<option value="{{ $shipping->id }}">Outside Dhaka ({{ $shipping->name }})</option>`);
                                } else if ({{ $shipping->type }} == 3 && inputValue != 52) {
                                    selectShipping.append(`<option value="{{ $shipping->id }}">Outside Dhaka City ({{ $shipping->name }})</option>`);
                                }
                            @endforeach
                        },
                    });
                } else {
                    alert('danger');
                }
            });
        });
    </script>

    <!--  District To Upazilla Show Ajax -->
    <script type="text/javascript">
        $(document).ready(function() {
            $('select[name="district_id"]').on('change', function() {
                var district_id = $(this).val();
                if (district_id) {
                    $.ajax({
                        url: "{{ url('/district-upazilla/ajax') }}/" + district_id,
                        type: "GET",
                        dataType: "json",
                        success: function(data) {
                            var d = $('select[name="upazilla_id"]').empty();
                            $.each(data, function(key, value) {
                                $('select[name="upazilla_id"]').append(
                                    '<option value="' + value.id + '">' + value
                                    .name_en + '</option>');
                            });
                        },
                    });
                } else {
                    alert('danger');
                }
            });
        });
    </script>

    <!-- create address ajax -->
    <script type="text/javascript">
        $(document).ready(function() {
            $('#addressStore').on('click', function() {
                var division_id = $('#division_id').val();
                var district_id = $('#district_id').val();
                var upazilla_id = $('#upazilla_id').val();
                var address = $('#address').val();
                var is_default = $('#is_default').val();
                var status = $('#status').val();

                $.ajax({
                    url: '{{ route('address.ajax.store') }}',
                    type: "POST",
                    data: {
                        _token: $("#csrf").val(),
                        division_id: division_id,
                        district_id: district_id,
                        upazilla_id: upazilla_id,
                        address: address,
                        is_default: is_default,
                        status: status,
                    },
                    dataType: 'json',
                    success: function(data) {
                        // console.log(data);
                        $('#address').val(null);

                        $('select[name="address_id"]').html(
                            '<option value="" selected="" disabled="">Select Address</option>'
                            );
                        $.each(data, function(key, value) {
                            $('select[name="address_id"]').append('<option value="' +
                                value.id + '">' + value.address + '</option>');
                        });
                        $('select[name="division_id"]').html(
                            '<option value="" selected="" disabled="">Select Division</option>'
                            );
                        $('select[name="district_id"]').html(
                            '<option value="" selected="" disabled="">Select District</option>'
                            );
                        $('select[name="upazilla_id"]').html(
                            '<option value="" selected="" disabled="">Select Upazilla</option>'
                            );

                        // Start Message
                        const Toast = Swal.mixin({
                            toast: true,
                            position: 'top-end',
                            icon: 'success',
                            showConfirmButton: false,
                            timer: 2000
                        })
                        if ($.isEmptyObject(data.error)) {
                            Toast.fire({
                                type: 'success',
                                title: data.success
                            })
                        } else {
                            Swal.fire({
                                type: 'error',
                                title: data.error
                            })
                        }

                        // End Message
                        $('#Close').click();
                    }
                });
            });
        });
    </script>
    <script>
        function applyCoupon() {
            var coupon = $('#coupon').val();
            var url = '{{ route('coupon.get') }}';
            $.ajax({
                headers: {
                    "X-CSRF-TOKEN": "{{ csrf_token() }}"
                },
                url: url,
                method: "GET",
                data: {
                    'coupon': coupon
                },
                success: function(response) {
                    if ((response.success)) {
                        $('#remove').prop('disabled', false);
                        $('#remove').show();
                        var coupon = response.coupon;
                        var discount = response.discount;
                        //console.log(discount);
                        var currentPrice = parseFloat($('#cartSubTotal').text());
                        var grandPrice = parseFloat($('#grand_total_set').text());
                        var amountOfDiscount = 0;
                        if (!discount) {
                            if (coupon.discount_type == 0) {
                                var discount_amount = currentPrice * coupon.discount / 100;
                                amountOfDiscount = grandPrice - discount_amount;
                            } else {
                                var discount_amount = Math.min(coupon.discount, currentPrice);
                                amountOfDiscount = grandPrice - discount_amount;
                            }
                            $('#grand_total_set').text(amountOfDiscount);
                            $('#coupon_discount').text(discount_amount);
                            $('#grand_total').val(amountOfDiscount);
                            $('#coupon_id').val(coupon.id);
                            $('.discount').val(discount_amount);
                            $('#apply').prop('disabled', true);
                            $('#coupon').prop('disabled', true);
                            const Toast = Swal.mixin({
                                toast: true,
                                position: 'top-end',
                                icon: 'success',
                                showConfirmButton: false,
                                timer: 1200
                            })
                            Toast.fire({
                                type: 'success',
                                title: response.success
                            })
                        } else {
                            $('#coupon_id').val(coupon.id);
                            $('.discount').val(discount);
                            $('#coupon_discount').text(discount);
                            amountOfDiscount = grandPrice - discount;
                            $('#grand_total_set').text(amountOfDiscount);
                            $('#grand_total').val(amountOfDiscount);
                            $('#apply').prop('disabled', true);
                            $('#coupon').prop('disabled', true);
                            const Toast = Swal.mixin({
                                toast: true,
                                position: 'top-end',
                                icon: 'success',
                                showConfirmButton: false,
                                timer: 1200
                            })
                            Toast.fire({
                                type: 'success',
                                title: response.success
                            })
                        }
                    } else {
                        //console.log("Coupon not found.");
                        const Toast = Swal.mixin({
                            toast: true,
                            position: 'top-end',
                            icon: 'error',
                            showConfirmButton: false,
                            timer: 1200
                        })
                        Toast.fire({
                            type: 'error',
                            title: response.error
                        })
                    }
                },
                error: function(xhr, status, error) {
                    console.log("AJAX request failed: " + error);
                }
            });
        }
    </script>
    <script>
        function removeCoupon() {
            var couponamount = parseFloat($('#coupon_discount').text());
            $('#apply').prop('disabled', false);
            $('#coupon').prop('disabled', false);
            var grandvalue = parseFloat($('#grand_total_set').text());
            var grandamount = grandvalue + couponamount;
            if (couponamount > 0) {
                $('.discount').val('');
                $('#coupon').val('');
                $('#coupon_discount').text('0');
                $('#grand_total_set').text(grandamount);
                $('#grand_total').val(grandamount);
                $('#coupon_id').val('');
                $('#remove').prop('disabled', true);
                $('#remove').hide();
            }
        }
    </script>
    <script>
        $('.select-new').select2({
            width: '100%',
            dropdownParent: $("#staticBackdrop")
        })
    </script>
@endpush