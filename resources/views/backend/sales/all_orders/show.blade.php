@extends('admin.admin_master')
@section('admin')
    <style type="text/css">
        table,
        tbody,
        tfoot,
        thead,
        tr,
        th,
        td {
            border: 1px solid #dee2e6 !important;
        }

        th {
            font-weight: bolder !important;
        }

        .icontext .icon i {
            position: relative;
            top: 50%;
            transform: translateY(-50%);
        }
        .select2-container--default .select2-selection--single {
            background-color: #f9f9f9;
            border: 2px solid #eee;
            border-radius: 0 !important;
        }
    </style>
<section class="content-main">
    <div class="content-header">
        <div>
            <h2 class="content-title card-title">Order detail</h2>
            {{-- <p>Details for Order ID: {{ $order->invoice_no ?? '' }}</p> --}}
        </div>
    </div>
    <div class="card">
        <header class="card-header">
            <div class="row align-items-center">
                <div class="col-lg-4 col-md-4 mb-lg-0 mb-15">
                    <span class="text-white"> <i class="material-icons md-calendar_today"></i>
                        <b>{{ $order->created_at ?? '' }}</b> </span> <br />
                    <small class="text-white">Order ID: {{ $order->invoice_no ?? '' }}</small>
                </div>
                @php
                    $payment_status = $order->payment_status;
                    $delivery_status = $order->delivery_status;
                @endphp
                <div class="col-lg-8 col-md-8 ms-auto text-md-end">
                    <select class="form-select d-inline-block mb-lg-0 mr-5 mw-200" id="update_payment_status">
                        <option value="">-- select one --</option>
                        <option value="unpaid" @if ($payment_status == 'unpaid') selected @endif>Unpaid</option>
                        <option value="paid" @if ($payment_status == 'paid') selected @endif>Paid</option>
                    </select>
                    @if ($delivery_status != 'delivered' && $delivery_status != 'cancelled')
                        <select class="form-select d-inline-block mb-lg-0 mr-5 mw-200" id="update_delivery_status">
                            <option value="pending" @if ($delivery_status == 'pending') selected @endif>Pending</option>
                            <option value="holding" @if ($delivery_status == 'holding') selected @endif>Holding
                            </option>
                            <option value="processing" @if ($delivery_status == 'processing') selected @endif>Processing
                            </option>
                            <option value="shipped" @if ($delivery_status == 'shipped') selected @endif>Shipped</option>
                            <option value="delivered" @if ($delivery_status == 'delivered') selected @endif>Delivered
                            </option>
                            @if (Auth::guard('admin')->user()->role !== '2' || Auth::guard('admin')->user()->role !== '5' ||
                                in_array('20', json_decode(Auth::guard('admin')->user()->staff->role->permissions)))
                                @if ($order->user_id != 1)
                                    <option value="cancelled" @if ($delivery_status == 'cancelled') selected @endif
                                        style="color:red">Cancelled
                                    </option>
                                @endif
                            @endif
                        </select>
                    @else
                        <input type="text" class="form-control d-inline-block mb-lg-0 mr-5 mw-200"
                            value="{{ $delivery_status }}" disabled>
                    @endif
                </div>
            </div>
        </header>
            <!-- card-header end// -->
        <div class="card-body">
            <div class="row mt-20 order-info-wrap">
                <div class="col-md-4">
                    <article class="icontext align-items-start">
                        <span class="icon icon-sm rounded-circle bg-primary-light">
                            <i class="text-primary material-icons md-person"></i>
                        </span>
                        <div class="text">
                            <h6 class="mb-1">Customer</h6>
                            <p class="mb-1">
                                {{-- {{ $order->name ?? '' }} <br /> --}}
                                Name: {{ $order->user->name ?? '' }} <br />
                                Email: {{ $order->user->email ?? '' }} <br />
                                Phone: {{ $order->user->phone ?? '' }}
                            </p>
                            <a data-bs-toggle="modal" data-bs-target="#staticBackdrop1{{ $order->user_id }}"
                                style="color:blue">Edit Customer</a>
                        </div>
                    </article>
                </div>
                <!-- col// -->
                <div class="col-md-4">
                    <article class="icontext align-items-start">
                        <span class="icon icon-sm rounded-circle bg-primary-light">
                            <i class="text-primary material-icons md-local_shipping"></i>
                        </span>
                        <div class="text">
                            <h6 class="mb-1">Order info</h6>
                            <p class="mb-1">
                                Order Id: {{ $order->invoice_no ?? '' }} </br>
                                {{-- Transection Number: {{ $order->transection_no ?? '0' }} </br> --}}
                                Shipping: {{ $order->shipping_name ?? '' }} <br />
                                Pay method: @if ($order->payment_method == 'cod')
                                    Cash On Delivery
                                @else
                                    {{ $order->payment_method }}
                                @endif <br />
                                Status: @php
                                    $status = $order->delivery_status;
                                    if ($order->delivery_status == 'cancelled') {
                                        $status = 'Received';
                                    }

                                @endphp
                                {!! $status !!}
                            </p>
                            {{-- <a href="#">Download info</a> --}}
                        </div>
                    </article>
                </div>
                <!-- col// -->
                <div class="col-md-4">
                    <article class="icontext align-items-start">
                        <span class="icon icon-sm rounded-circle bg-primary-light">
                            <i class="text-primary material-icons md-place"></i>
                        </span>
                        <div class="text">
                            <h6 class="mb-1">Deliver to</h6>
                            <p class="mb-1">
                                Address: {{ isset($order->address) ? ucwords($order->address . ',') : '' }}
                                {{ isset($order->upazilla->name_en) ? ucwords($order->upazilla->name_en . ',') : '' }}
                                {{ isset($order->district->district_name_en) ? ucwords($order->district->district_name_en . ',') : '' }}
                                {{ isset($order->division->division_name_en) ? ucwords($order->division->division_name_en) : '' }}
                            </p>
                        </div>
                    </article>
                </div>
                <!-- col// -->
                <form action="{{ route('admin.orders.update', $order->id) }}" method="post">
                    @csrf
                    @method('put')
                    <div class="col-md-12 mt-40">
                        <table class="table table-bordered">
                            <tbody>
                                <tr>
                                    <th>Invoice</th>
                                    <td>{{ $order->invoice_no ?? '' }}</td>
                                    <th>Email</th>
                                    <td><input type="" class="form-control" name="email"
                                            value="{{ $order->email ?? 'Null' }}"></td>
                                </tr>
                                <tr>
                                    <th class="col-2">Shipping Address</th>
                                    <td>
                                        <label for="division_id" class="fw-bold text-black"><span
                                                class="text-danger">*</span> Division</label>
                                        <select class="form-control select-active" name="division_id" id="division_id"
                                            required @if ($order->user_id == 1) disabled @endif>
                                            <option value="">Select Division</option>
                                            @foreach (get_divisions($order->division_id) as $division)
                                                <option value="{{ $division->id }}"
                                                    {{ $division->id == $order->division_id ? 'selected' : '' }}>
                                                    {{ ucwords($division->division_name_en) }}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                    <td>
                                        <label for="district_id" class="fw-bold text-black"><span
                                                class="text-danger">*</span> District</label>
                                        <select class="form-control select-active" name="district_id" id="district_id"
                                            required @if ($order->user_id == 1) disabled @endif>
                                            <option selected="" value="">Select District</option>
                                            @foreach (get_district_by_division_id($order->division_id) as $district)
                                                <option value="{{ $district->id }}"
                                                    {{ $district->id == $order->district_id ? 'selected' : '' }}>
                                                    {{ ucwords($district->district_name_en) }}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                    <td>
                                        <label for="upazilla_id" class="fw-bold text-black"><span
                                                class="text-danger">*</span> Zone</label>
                                        <select class="form-control select-active" name="upazilla_id" id="upazilla_id"
                                            required @if ($order->user_id == 1) disabled @endif>
                                            <option selected="" value="">Select Zone</option>
                                            @foreach (get_upazilla_by_district_id($order->district_id) as $upazilla)
                                                <option value="{{ $upazilla->id }}"
                                                    {{ $upazilla->id == $order->upazilla_id ? 'selected' : '' }}>
                                                    {{ ucwords($upazilla->name_en) }}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th><span class="text-danger">*</span> Address</th>
                                    <td>
                                        <input type="text" class="form-control" name="address"
                                            value="{{ $order->address ?? 'Null' }}"
                                            @if ($order->user_id == 1) readonly @endif>
                                    </td>
                                    <th>Payment Method</th>
                                    <td>
                                        <select class="form-control select-active" name="payment_method"
                                            id="payment_method" required
                                            @if ($order->user_id == 1) disabled @endif>
                                            <option selected="" value="">Select Payment Method</option>
                                            <option value="cod" @if ($order->payment_method == 'cod') selected @endif>
                                                Cash</option>
                                            <option value="bkash" @if ($order->payment_method == 'bkash') selected @endif>
                                                Bkash</option>
                                            <option value="nagad" @if ($order->payment_method == 'nagad') selected @endif>
                                                Nagad</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Discount</th>
                                    <td><input type="number" @if ($order->user_id == 1) readonly @endif
                                            class="form-control" name="discount" value="{{ $order->discount }}">
                                    </td>

                                    <th>Payment Status</th>
                                    <td>
                                        @php
                                            $status = $order->delivery_status;
                                            if ($order->delivery_status == 'cancelled') {
                                                $status = 'Received';
                                            }
                                        @endphp
                                        <span
                                            class="badge rounded-pill alert-success text-success">{!! $status !!}</span>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Payment Date</th>
                                    <td>{{ date_format($order->created_at, 'Y/m/d') }}</td>
                                    <th>Vendor Comission</th>
                                    <td>
                                        @php
                                            $sum = 0;
                                            $sum1 = 0;
                                            $sum2 = 0;
                                            $orderDetails = $order->order_details;
                                            foreach ($orderDetails as $key => $orderDetail) {
                                                $sum1 += $orderDetail->v_comission;
                                                $sum2 += $orderDetail->qty;
                                                $sum += $orderDetail->v_comission * $orderDetail->qty;
                                            }

                                        @endphp
                                        {{ $sum ?? '' }}<strong>Tk</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Sub Total</th>
                                    <td>{{ $order->sub_total }} <strong>Tk</strong></td>

                                    <th>Total</th>
                                    <td>{{ $order->grand_total }} <strong>Tk</strong></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- col// -->
            </div>
            <!-- row // -->
            @if (Auth::guard('admin')->user()->role == '1')
                @if ($delivery_status == 'pending' || $delivery_status == 'holding' || $delivery_status == 'processing' || $delivery_status == 'picked_up')
                    <div class="row mb-3 custom__select">
                        <div class="col-7 col-md-6"></div>
                        <div class="col-12 col-sm-12 col-md-6">
                            <select id="siteID" class="form-control selectproduct " style="width:100%">
                                <option> Select Product To Order</option>
                                @foreach ($products->where('stock_qty', '!=', 0) as $product)
                                    @php
                                        if ($product->discount_type == 1) {
                                            $price_after_discount = $product->regular_price - $product->discount_price;
                                        } elseif ($product->discount_type == 2) {
                                            $price_after_discount = $product->regular_price - ($product->regular_price * $product->discount_price) / 100;
                                        }
                                        $Price = $product->discount_price ? $price_after_discount : $product->regular_price;
                                    @endphp
                                @if ($product->is_varient)
                                    @foreach ($product->stocks->where('qty', '!=', 0) as $key => $stock)
                                        @php
                                            if ($product->discount_type == 1) {
                                                $price_after_discount = $stock->price - $product->discount_price;
                                            } elseif ($product->discount_type == 2) {
                                                $price_after_discount = $stock->price - ($stock->price * $product->discount_price) / 100;
                                            }
                                            $Price = $product->discount_price ? $price_after_discount : $stock->price;
                                        @endphp
                                      <option class="addToOrder" data-order_id="{{ $order->id }}" data-id="{{ $stock->id }}" data-product_id="{{ $product->id }}">  {{ $product->name_en }} ({{ $stock->varient }})({{ $stock->qty }}) ={{ $Price }}৳</option>
                                    @endforeach
                                @else
                                <option class="addToOrder" data-order_id="{{ $order->id }}" data-product_id="{{ $product->id }}"> {{ $product->name_en }}({{ $product->stock_qty }})={{ $Price }}৳</option>
                                @endif
                                @endforeach
                            </select>
                        </div>
                    </div>
                @endif
            @endif
            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                   @if (Auth::guard('admin')->user()->role == '1')
                                        @if ($delivery_status == 'pending' ||$delivery_status == 'holding' || $delivery_status == 'processing' ||$delivery_status == 'picked_up' ||$delivery_status == 'shipped')
                                            <th width="5%">
                                                Delete
                                            </th>
                                        @endif
                                   @endif
                                    <th width="30%">Product</th>
                                    <th width="20%" class="text-center">Unit Price</th>
                                    @if (Auth::guard('admin')->user()->role == '1')
                                       <th width="10%" class="text-center">Quantity</th>
                                    @endif
                                    <th width="15%" class="text-center">Vendor Comission</th>
                                    <th width="20%" class="text-end">Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($order->order_details as $key => $orderDetail)
                                <tr>
                                    @if (Auth::guard('admin')->user()->role == '1')
                                        @if ($delivery_status == 'pending' ||$delivery_status == 'holding' || $delivery_status == 'processing' ||$delivery_status == 'picked_up' ||$delivery_status == 'shipped')
                                            <td class="text-center">
                                                @if (count($order->order_details) > 1)
                                                    <a id="delete" href="{{ route('delete.order.product', $orderDetail->id) }}">
                                                        <button type="button" class="btn_main misty-color">
                                                            <i class="fa-solid fa-trash"></i>
                                                        </button>
                                                    </a>
                                                    @else
                                                    <button class="cart_actionBtn btn_main misty-color" disabled>
                                                        <i class="fa-solid fa-trash"></i>
                                                    </button>
                                                @endif
                                            </td>
                                        @endif
                                    @endif
                                    <td>
                                        <a class="itemside">
                                            <div class="left">
                                                <img src="{{ asset($orderDetail->product->product_thumbnail ?? ' ') }}"
                                                    width="40" height="40" class="img-xs" alt="Item" />
                                            </div>
                                            <div class="info">
                                                <span class="text-bold">
                                                    {{ $orderDetail->product->name_en ?? ' ' }}
                                                </span>
                                                    <span>(
                                                        @if ($orderDetail->is_varient && count(json_decode($orderDetail->variation)) > 0)
                                                        @foreach (json_decode($orderDetail->variation) as $varient)
                                                        <span>{{ $varient->attribute_name }} :
                                                            {{ $varient->attribute_value }}</span>
                                                        @endforeach
                                                        @endif)
                                                    </span>
                                                    @php
                                                        if ($orderDetail->is_varient) {
                                                            $jsonString = $orderDetail->variation;
                                                            $combinedString = '';
                                                            $jsonArray = json_decode($jsonString, true);
                                                            foreach ($jsonArray as $attribute) {
                                                                if (isset($attribute['attribute_value'])) {
                                                                    $combinedString .= $attribute['attribute_value'] . '-';}
                                                            }
                                                            $combinedString = rtrim($combinedString, '-');
                                                            $stockId = App\Models\ProductStock::where('varient', $combinedString)->first();
                                                        }
                                                    @endphp
                                            </div>
                                        </a>
                                    </td>
                                    <td class="text-center">{{ $orderDetail->price ?? '0.00' }}</td>
                                    {{-- <td class="text-center">{{ $orderDetail->qty ?? '0' }}</td> --}}
                                    @if (Auth::guard('admin')->user()->role == '1')
                                        <td class="text-center qunatity_change">
                                            <input type="hidden" value="{{ $orderDetail->product_id }}" class="product_id">
                                            <input type="hidden" value="{{ $orderDetail->id }}" class="orderdetail_id">
                                            @if ($orderDetail->is_varient == 1)
                                                <input type="hidden" value="{{ $stockId->id }}" class="stock_id">
                                            @endif
                                            <!-- decress btn -->
                                            <button type="button"
                                                class="input-group-text rounded-0 bg-navy add_btn @if (in_array($delivery_status, ['pending', 'holding', 'processing', 'picked_up','shipped'])) decress_quantity changeQuantity @endif"
                                                data-type="-"><i class="fa-solid fa-minus"></i></button>
                                            <!-- quantity input -->
                                            <input class="form-control text-center quantity_input najmul__product__details"
                                                value="{{ $orderDetail->qty }}" min="1" max="" type="text"
                                                name="qty{{ $key }}" disabled>
                                            <!-- incress btn-->
                                            <button type="button"
                                                class="input-group-text rounded-0 bg-navy add_btn @if (in_array($delivery_status, ['pending', 'holding', 'processing', 'picked_up']))  incress_quantity changeQuantity @endif" data-type="+"  ><i class="fa-solid fa-plus"></i></button>
                                            <input type="hidden" type="text" name="qty{{ $key }}"
                                                value="{{ $orderDetail->qty }}">
                                        </td>
                                    @endif
                                    <td class="text-center">{{ $orderDetail->v_comission * $orderDetail->qty }}</td>
                                    <td class="text-end" id="item_totalPrice_{{ $key }}">{{ $orderDetail->price * $orderDetail->qty }}</td>
                                </tr>
                                @endforeach
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="6">
                                        <article class="float-end">
                                            <dl class="dlist">
                                                <dt>Subtotal:</dt>
                                                <dd id="subtotal">{{ $order->sub_total ?? '0.00' }}</dd>
                                            </dl>
                                            <dl class="dlist">
                                                <dt>Shipping cost:</dt>
                                                <dd>{{ $order->shipping_charge ?? '0.00' }}</dd>
                                            </dl>
                                            <dl class="dlist">
                                                <dt>Discount:</dt>
                                                <dd><b class="">{{ $order->discount }}</b></dd>
                                            </dl>
                                            <dl class="dlist">
                                                <dt>Others:</dt>
                                                <dd><b class="">{{ $order->others }}</b></dd>
                                            </dl>
                                            <dl class="dlist">
                                                <dt>Grand total:</dt>
                                                <dd id="grandtotal"><b class="h5">{{ $order->grand_total }}</b>
                                                <dd id="buyingprice" style="display: none"><b class="h5">{{ $order->totalbuyingPrice }}</b>
                                                </dd>
                                            </dl>
                                            <dl class="dlist">
                                                <dt class="text-muted">Status:</dt>
                                                <dd>
                                                    @php
                                                        $status = $order->delivery_status;
                                                        if ($order->delivery_status == 'cancelled') {$status = 'Received';}
                                                    @endphp
                                                    <span class="badge rounded-pill alert-success text-success">{!! $status !!}</span>
                                                </dd>
                                            </dl>
                                        </article>
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                     <!-- table-responsive// -->
                </div>
                <!-- col// -->
                <div class="col-lg-1"></div>
                <div>
                    <input type="hidden" name="sub_total" class="subtotalof" value="{{ $order->sub_total }}">
                    <input type="hidden" name="grand_total" class="grandtotalof" value="{{ $order->grand_total }}">
                    <input type="hidden" name="totalbuyingPrice" class="totalbuyingPriceof"
                        value="{{ $order->totalbuyingPrice }}">
                </div>
                    @if (in_array($delivery_status, ['pending', 'holding', 'processing', 'picked_up','shipped']))
                        <div class="d-flex justify-content-end">
                            <button type="submit" class="btn btn-primary">Update Order</button>
                        </div>
                    @else
                        <div class="d-flex justify-content-end">
                            <button type="button" disabled class="btn btn-primary">Update Order</button>
                        </div>
                    @endif
                <!-- col// -->
                </form>
            </div>
        </div>
        <!-- card-body end// -->
    </div>
    <!-- card end// -->
</section>
@endsection
@push('footer-script')
    <script type="text/javascript">
        $(document).ready(function() {
            $('select[name="shipping_id"]').on('change', function() {
                var shipping_cost = $(this).val();
                if (shipping_cost) {
                    $.ajax({
                        url: "{{ url('/checkout/shipping/ajax') }}/" + shipping_cost,
                        type: "GET",
                        dataType: "json",
                        success: function(data) {
                            //console.log(data);
                            $('#ship_amount').text(data.shipping_charge);

                            let shipping_price = parseInt(data.shipping_charge);
                            let grand_total_price = parseInt($('#cartSubTotalShi').val());
                            grand_total_price += shipping_price;
                            $('#grand_total_set').html(grand_total_price);
                            $('#total_amount').val(grand_total_price);
                        },
                    });
                } else {
                    alert('danger');
                }
            });
        });

        /* ============ Update Payment Status =========== */
        $('#update_payment_status').on('change', function() {
            var order_id = {{ $order->id }};
            var status = $('#update_payment_status').val();
            $.post('{{ route('orders.update_payment_status') }}', {
                _token: '{{ @csrf_token() }}',
                order_id: order_id,
                status: status
            }, function(data) {
                // console.log(data);
                // Start Message
                const Toast = Swal.mixin({
                    toast: true,
                    position: 'top-end',

                    showConfirmButton: false,
                    timer: 1000
                })
                if ($.isEmptyObject(data.error)) {
                    Toast.fire({
                        type: 'success',
                        icon: 'success',
                        title: data.success
                    })
                } else {
                    Toast.fire({
                        type: 'error',
                        icon: 'error',
                        title: data.error
                    })
                }
                // End Message
            });
        });

        /* ============ Update Delivery Status =========== */
        $('#update_delivery_status').on('change', function() {
            var order_id = {{ $order->id }};
            var status = $('#update_delivery_status').val();
            $.post('{{ route('orders.update_delivery_status') }}', {
                _token: '{{ @csrf_token() }}',
                order_id: order_id,
                status: status
            }, function(data) {
                // console.log(data);
                // Start Message
                const Toast = Swal.mixin({
                    toast: true,
                    position: 'top-end',

                    showConfirmButton: false,
                    timer: 1000
                })
                if ($.isEmptyObject(data.error)) {
                    Toast.fire({
                        type: 'success',
                        icon: 'success',
                        title: data.success
                    })
                } else {
                    Toast.fire({
                        type: 'error',
                        icon: 'error',
                        title: data.error
                    })
                }
                // End Message
                location.reload();
            });
        });
    </script>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

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
                                // console.log(value);
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
                                $('select[name="upazilla_id"]').append(
                                    '<option  class="d-none" value="' + value.id +
                                    '">' + value.name_en + '</option>');
                            });
                        },
                    });
                } else {
                    alert('danger');
                }
            });
        });
    </script>

    <!-- Customer Edit Modal -->
    <div class="modal fade" id="staticBackdrop1{{ $order->user_id }}" data-bs-backdrop="static" data-bs-keyboard="false"
        tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">Edit Customer</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form method="post" action="{{ route('admin.user.update', $order->user_id) }}">
                    @csrf
                    <div class="modal-body">
                        <div class="row">
                            <div class="form-group col-lg-6">
                                <label for="division_id" class="fw-bold text-black col-form-label"><span
                                        class="text-danger">*</span> Name</label>
                                <input type="text" class="form-control" name="name" placeholder="Enter the name"
                                    value="{{ $order->user->name ?? 'Null' }}">
                            </div>
                            <div class="form-group col-lg-6">
                                <label for="division_id" class="fw-bold text-black col-form-label"><span
                                        class="text-danger">*</span> Email</label>
                                <input type="text" class="form-control" name="email" placeholder="Enter the email"
                                    value="{{ $order->user->email ?? 'Null' }}">
                            </div>
                            <div class="form-group col-lg-12">
                                <label for="division_id" class="fw-bold text-black col-form-label"><span
                                        class="text-danger">*</span> Phone</label>
                                <input type="number" class="form-control" name="phone" placeholder="Enter the phone"
                                    value="{{ $order->user->phone ?? 'Null' }}">
                            </div>
                            <!-- <div class="form-group col-lg-6">
                                                            <label for="division_id" class="fw-bold text-black col-form-label"><span class="text-danger">*</span> Password</label>
                                                            <input type="password" class="form-control">
                                                        </div> -->
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <script>
        //remove

        $(document).on('click', '.changeQuantity', function() {
            var product_id = $(this).closest('.qunatity_change').find('.product_id').val();
            var stock_id = $(this).closest('.qunatity_change').find('.stock_id').val();
            var orderdetail_id = $(this).closest('.qunatity_change').find('.orderdetail_id').val();
            var qtyInput = $(this).closest('.qunatity_change').find('.quantity_input');
            var type = $(this).data('type');
            var key = $(this).closest('tr').index();
            var data = {
                'product_id': product_id,
                'stock_id': stock_id,
                'orderdetail_id': orderdetail_id,
                'type': type,
                'qty': qtyInput.val(),
            }

            $.ajax({
                method: "get",
                url: '{{ route('order.quantity.update') }}',
                data: data,
                success: function(response) {
                    if (response.status == 'success') {
                        toastr.success(response.message, 'message');
                        var currentPrice = parseFloat($('#subtotal').text());
                        var currentgrandPrice = parseFloat($('#grandtotal').text());
                        var currentbuyingprice = parseFloat($('#buyingprice').text());
                        if (response.type == '+') {
                            currentPrice += parseFloat(response.price);
                            currentgrandPrice += parseFloat(response.price);
                            currentbuyingprice += parseFloat(response.buyingPrice);
                            qtyInput.val(parseInt(qtyInput.val()) + 1);
                        } else {
                            currentPrice -= parseFloat(response.price);
                            currentgrandPrice -= parseFloat(response.price);
                            currentbuyingprice -= parseFloat(response.buyingPrice);
                            qtyInput.val(parseInt(qtyInput.val()) - 1);
                        }
                        var itemTotalPrice = parseFloat(response.price * qtyInput.val());
                        $('#item_totalPrice_' + key).text(itemTotalPrice.toFixed(2));
                        $('#subtotal').text(currentPrice);
                        $('#grandtotal').text(currentgrandPrice);
                        $('#buyingprice').text(currentbuyingprice);
                        $('.subtotalof').val(currentPrice);
                        $('.grandtotalof').val(currentgrandPrice);
                        $('.totalbuyingPriceof').val(currentbuyingprice);

                        var Quantity = response.qty;
                        var product_price = response.price;
                        var productnewprice = product_price * Quantity;
                        $('.price_qty').text(productnewprice);
                        var updatedQty = parseInt(qtyInput.val());
                        //console.log(updatedQty)
                        $('input[name="qty' + key + '"]').val(updatedQty);
                        // $('input[name="qty' + key + '"]').prop('disabled', false).val(updatedQty).prop('disabled', true);
                    } else {
                        toastr.error(response.error, 'Error');
                    }
                }
            });
        });

        /* add to cart */

        /* add to cart */

        $(document).on('change', '.selectproduct', function() {
            var selectedOption = $(this).find(':selected');
            var productId = selectedOption.data('product_id');
            var stockId = selectedOption.data('id');
            var orderId = selectedOption.data('order_id');
            var data = {
                product_id: productId,
                stock_id: stockId,
                order_id: orderId
            }
            $.ajax({
                url: '{{ route('order.itemAdd') }}',
                method: "Post",
                data: data,
                headers: {
                    "X-CSRF-TOKEN": "{{ csrf_token() }}"
                },
                success: function(response) {
                    console.log(response)
                    if (response.status == 'success') {
                        setTimeout(function() {
                            location.reload();
                        }, 1000);
                        toastr.success(response.message, 'message');
                    } else {
                        toastr.error(response.error, 'Error');
                    }
                }
            });
        });
                                        //$('.apeandField').append('<tr><td>' + response.product_id + '</td></tr>');
    </script>
    {{-- this link for option search --}}
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/js/select2.full.min.js"></script>
    <script>
        $(function() {
            $(".selectproduct").select2();
        });
    </script>
@endpush()