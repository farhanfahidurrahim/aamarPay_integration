@extends('admin.admin_master')
@section('admin')

<style type="text/css">
    table, tbody, tfoot, thead, tr, th, td{
        border: 1px solid #dee2e6 !important;
    }
    th{
        font-weight: bolder !important;
    }
</style>

<section class="content-main">
    <div class="content-header">
        <div>
            <h2 class="content-title card-title">Package List</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="card mb-4">
                <!-- card-header end// -->
                <div class="card-body">
                    <form class="" action="" method="GET">
                            <div class="form-group row mb-2">
                                <div class="col-md-2">
                                    <label class="col-form-label"><span>All Orders :</span></label>
                                </div>
                                <div class="col-md-2 mt-2">
                                    <div class="custom_select">
                                        <select
                                            class=" select-active select-nice form-select d-inline-block mb-lg-0 mr-5 mw-200"
                                            name="shipping_type" id="shipping_type">
                                            <option value="" selected="">Shipping Type</option>
                                            <option value="1" @if ($shipping_type == '1') selected @endif>Inside
                                                Dhaka (Redex)</option>
                                            <option value="2" @if ($shipping_type == '2') selected @endif>Outside
                                                Dhaka (Sundarban Courier )</option>
                                            <option value="3" @if ($shipping_type == '3') selected @endif>Outside
                                                Dhaka City (Pathao)</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-2 mt-2">
                                    <div class="custom_select">
                                        <select
                                            class="form-select d-inline-block select-active select-nice mb-lg-0 mr-5 mw-200"
                                            name="delivery_status" id="delivery_status">
                                            <option value="" selected="">Delivery Status</option>
                                            <option value="pending" @if ($delivery_status == 'pending') selected @endif>
                                                Pending</option>
                                            <option value="holding" @if ($delivery_status == 'holding') selected @endif>
                                                Holding</option>
                                            <option value="processing" @if ($delivery_status == 'processing') selected @endif>
                                                Processing</option>
                                            <option value="picked_up" @if ($delivery_status == 'picked_up') selected @endif>
                                                Picked Up</option>
                                            <option value="shipped" @if ($delivery_status == 'shipped') selected @endif>
                                                Shipped</option>
                                            <option value="delivered" @if ($delivery_status == 'delivered') selected @endif>
                                                Delivered</option>
                                            <option value="cancelled" @if ($delivery_status == 'cancelled') selected @endif>
                                                Cancel</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-2 mt-2">
                                    <div class="custom_select">
                                        <select
                                            class=" select-active select-nice form-select d-inline-block mb-lg-0 mr-5 mw-200"
                                            name="payment_status" id="payment_status">
                                            <option value="" selected="">Payment Status</option>
                                            <option value="unpaid" @if ($payment_status == 'unpaid') selected @endif>
                                                Unpaid</option>
                                            <option value="paid" @if ($payment_status == 'paid') selected @endif>Paid
                                            </option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-2 mt-2">
                                    <div class="custom_select">
                                        <input type="text" id="reportrange" class="form-control" name="date"
                                            placeholder="Filter by date" data-format="DD-MM-Y" value="Filter by date"
                                            data-separator=" - " autocomplete="off">
                                    </div>
                                </div>
                                <div class="col-md-2 mt-2">
                                    <button class="btn btn-primary" type="submit">Filter</button>
                                </div>
                            </div>
                    <div class="row mb-3 pack_print">
                        <div class="col-sm-3 col-6">
                            <button type="button" class="btn  btn-sm" id="all_package">Shipped</button>
                             <!--{{-- <button type="button" class="btn btn-primary  btn-sm" id="all_print">Package</button> --}}-->
                            <button type="button" class="btn   btn-sm" id="all_print" target="blank">Print</button>
                        </div>
                    </div>
                    <div class="table-responsive-sm">
                        <table class="table table-bordered table-hover" id="example" width="100%">
                            <thead>
                                <tr>
                                    <th><input type="checkbox" id="select_all_ids"></th>
                                    <th>No.</th>
                                    <th>Order Code</th>
                                    <th>Customer name</th>
                                    <th>Customer Phone</th>
                                    <th>Order Description</th>
                                    <th class="text-center">Amount</th>
                                    <th class="text-center">Paid Amount</th>
                                    {{-- <th class="text-center">Due Amount</th> --}}
                                    <th class="text-center">Shipping Type</th>
                                    <th class="text-center">Shipping Address</th>
                                    <th class="text-center">Delivery Status</th>
                                    <th class="text-center">Payment Status</th>
                                    <th class="text-end">Options</th>
                                </tr>
                            </thead>
                            <tbody>
                                @if($orders->count() >0)
                                    @foreach ($orders as $key => $order)
                                    <tr id="order_ids{{$order->id}}">
                                        @if($order->delivery_status == 'cancelled' )
                                            <td><input type="checkbox"  disabled ></td>
                                        @else
                                            <td><input type="checkbox" class="check_ids" name="ids" value="{{$order->id}}"></td>
                                        @endif
                                        <td>{{ $key+1 }}</td>
                                        <td>{{ $order->invoice_no }}</td>
                                        <td><b>@if($order->user->role == 4) Walk-in Customer  @else  {{ $order->user->name ?? 'Walk-in Customer' }} @endif</b></td>
                                        <td>{{ $order->phone }}</td>
                                        <td class="text-center">{{ $order->grand_total }}</td>
                                        <td class="text-center">{{ $order->grand_total }} TK</td>
                                        <td class="text-center">
                                            @if($order->payment_method == 'cod')
                                                {{ $order->grand_total }} TK
                                            @else
                                                {{ $order->paid_amount }} TK
                                            @endif
                                        </td>
                                        {{-- <td class="text-center">{{ $order->due_amount }} TK</td> --}}
                                        <td class="text-center">
                                            @if($order->shipping_type == 1)
                                                Inside Dhaka
                                            @elseif($order->shipping_type == 2)
                                                Outside Dhaka
                                            @else
                                                Outside Dhaka City
                                            @endif
                                        </td>
                                        <td class="text-center">
                                            @php
                                                $address = App\Models\Address::where('user_id', $order->user_id)->first();
                                                if($address){
                                                    $district=App\Models\District::where('id',$address->district_id)->first();
                                                    $upazilla=App\Models\Upazilla::where('id',$address->upazilla_id)->first();
                                                }
                                            @endphp
                                            {{ $order->address }}  ,{{ ucwords($upazilla->name_en ?? '') }},{{ ucwords($district->district_name_en ?? '') }}
                                        </td>
                                        <td class="text-center">
                                            @php
                                                $status = $order->delivery_status;
                                                if($order->delivery_status == 'cancelled') {
                                                    $status = '<span class="badge rounded-pill alert-success">Received</span>';
                                                }

                                            @endphp
                                            {!! $status !!}
                                        </td>
                                        <td class="text-center">
                                            @php
                                                $status = $order->payment_status;
                                                if($order->payment_status == 'unpaid') {
                                                    $status = '<span class="badge rounded-pill alert-danger">Unpaid</span>';
                                                }
                                                elseif($order->payment_status == 'paid') {
                                                    $status = '<span class="badge rounded-pill alert-success">Paid</span>';
                                                }

                                            @endphp
                                            {!! $status !!}
                                        </td>
                                        <td class="text-end">
                                            @if($order->packaging_status == 1)
                                            <a  class="btn btn-primary btn-icon btn-circle btn-sm btn-xs" href="{{route('packages.status',$order->id) }}">
                                                <i class="fa fa-scissors" aria-hidden="true"></i> <i class="fa-solid fa-gift"></i>
                                            </a>
                                            @endif
                                            <a class="btn btn-primary btn-icon btn-circle btn-sm btn-xs" href="{{ route('invoice.download', $order->id) }}">
                                                <i class="fa-solid fa-download"></i>
                                            </a>
                                        </td>
                                    </tr>
                                    @endforeach
                                @else
                                  <tr>
                                    <th colspan="13" class="text-center">Order not Found</th>
                                  </tr>
                                @endif
                            </tbody>
                        </table>
                        <div class="pagination-area mt-25 mb-50">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-end">
                                    {{-- {{ $orders->links() }} --}}
                                </ul>
                            </nav>
                        </div>
                    </div>
                </form>
                    <!-- table-responsive //end -->
                </div>
                <!-- card-body end// -->
            </div>
            <!-- card end// -->
        </div>
    </div>
</section>

@endsection
@push('footer-script')
<script type="text/javascript">
    $(function() {
        var start = moment();
        var end = moment();
        $('input[name="date"]').daterangepicker({
            autoUpdateInput: false,
            locale: {
                cancelLabel: 'Clear'
            }
        });
        function cb(start, end) {
            $('#reportrange').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
        }
        $('#reportrange').daterangepicker({
            startDate: start,
            endDate: end,
            ranges: {
                'Today': [moment(), moment()],
                'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                'This Month': [moment().startOf('month'), moment().endOf('month')],
                'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1,
                    'month').endOf('month')]
            }
        }, cb);

        cb(start, end);
    });
</script>
<script>
    $(function() {
        function updateSelectAll() {
            var allChecked = $('.check_ids:checked').length === $('.check_ids').length;
            $('#select_all_ids').prop('checked', allChecked);
        }
        $('.check_ids').change(function() {
            updateSelectAll();
        });
        $('#select_all_ids').change(function() {
            $('.check_ids').prop('checked', $(this).prop('checked'));
        });
    });
</script>
<script>
    $(function(e) {
        $("#all_package").click(function(e) {
            e.preventDefault();
            var all_ids = [];
            $('input:checkbox[name=ids]:checked').each(function() {
                all_ids.push($(this).val());
            });
            $.ajax({
                url: "{{ route('order.product.packaged') }}",
                type: "GET",
                data: {
                    ids: all_ids,
                    _token: "{{csrf_token()}}"
                },
                success: function(response) {
                    if (response.status == 'success') {
                        toastr.success(response.message, 'message');
                        $.each(all_ids, function(key, val) {
                            $('#order_ids' + val).remove();
                        });
                        window.location.reload(true);
                        }
                    else {
                        toastr.error(response.error, 'Error');
                    }
                }
            });
        });
    });
</script>
<script>
    $(function(e) {
        $("#all_print").click(function(e) {
            e.preventDefault();
            var all_ids = [];
            $('input:checkbox[name=ids]:checked').each(function() {
                all_ids.push($(this).val());
            });
            $.ajax({
                url: "{{ route('order.product.Print') }}",
                type: "GET",
                data: {
                    ids: all_ids,
                    _token: "{{csrf_token()}}"
                },
                success: function(response) {
                    window.location.href = response.redirect_url;
                    $.each(all_ids, function(key, val) {
                            $('#order_ids' + val).remove();
                        });
                }
            });
        });
    });
</script>
@endpush