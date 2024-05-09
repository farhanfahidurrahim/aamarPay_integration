@extends('admin.admin_master')
@section('admin')
<section class="content-main">
    <div class="content-header">
        <h3 class="content-title">Advance Payment Ledger List </h3>
    </div>
    </div>
    <div class="card mb-4">
        @php
            $total =0;
        @endphp
        <form class="" action="" method="GET">
            <div class="form-group row mb-3 mt-4 ms-5">
                <div class="col-md-2 mt-2">
                    <div class="custom_select">
                        @php
                            $uniqueAgent = array_unique($advance->pluck('agent_number')->toArray());
                        @endphp
                       <select class=" select-active select-nice form-select d-inline-block mb-lg-0 mr-5 mw-200" name="agent_number" id="agent_number">
                            <option value="" selected="">Agent Number</option>
                            {{-- @foreach ($uniqueAgent as $agent)
                            <option value="{{ $agent }}">{{ $agent }}</option>
                            @endforeach --}}
                            <option value="0153414032">0153414032 (Telitalk)</option>
                            <option value="01875523815">01875523815 (Robi)</option>
                            <option value="01775782602">01775782602 (GP)marchant</option>
                            <option value="01329657140">01329657140 (GP)marchant online</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-2 mt-2">
                    <div class="custom_select">
                        <input type="text" id="reportrange" class="form-control" name="selectdate" placeholder="Filter by date" data-format="DD-MM-Y" value="Filter by date" data-separator=" - " autocomplete="off">
                    </div>
                </div>
                <div class="col-md-2 mt-2">
                    <button class="btn btn-primary" type="submit">Filter</button>
                </div>
            </div>
        <div class="card-body">
            <div class="table-responsive-sm">
                <table id="example" class="table table-bordered table-striped" width="100%">
                    <thead>
                        <tr>
                            <th scope="col">Sl</th>
                            <th scope="col">Transaction Number</th>
                            <th scope="col">Received</th>
                            <th scope="col">Date</th>
                            <th scope="col">Agent Number</th>
                            <th scope="col">Received By</th>
                            <th scope="col">Action</th>
                            {{-- @if(Auth::guard('admin')->user()->role != '2')
                                <th scope="col" class="text-end">Action</th>
                            @endif --}}
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($advance as $key => $item)
                        <tr>
                            <td> {{ $key+1}} </td>
                            <td> {{ $item->transaction_no}} </td>
                            <td>
                                 {{ $item->received}} TK
                                  @php
                                        $total += $item->received;
                                  @endphp
                            </td>
                            <td> {{ \Carbon\Carbon::parse($item->date)->format('d-m-y')}} </td>
                            <td>
                                {{ $item->agent_number}}
                                @php
                                  $operator = '';
                                    if ($item->agent_number == '0153414032') {
                                        $operator = '(Telitalk)';
                                    } else if ($item->agent_number == '01875523815') {
                                        $operator = '(Robi)';
                                    } else if ($item->agent_number == '01775782602') {
                                        $operator = '(GP)marchant';
                                    } else {
                                        $operator = '(GP)marchant online';
                                    }
                                 @endphp
                                  {{$operator}}
                            </td>
                            <td>  {{ $item->user->name}} </td>
                            @if(Auth::guard('admin')->user()->role != '2')
                                <td class="text-end">
                                      <a class="btn btn-md rounded font-sm bg-danger" href="{{ route('advanced.payment.destroy',$item->id)}}" id="delete">Delete</a>
                                </td>
                            @endif
                        </tr>
                        @endforeach
                    </tbody>
                </table>
                <h4 class="mt-3">Total :{{ $total }} TK</h4>
            </div>
            <!-- table-responsive //end -->
        </div>

    </form>
        <!-- card-body end// -->
    </div>
</section>

@endsection

@push('footer-script')
<script type="text/javascript">
    $(function() {
        var start = moment();
        var end = moment();

        $('input[name="selectdate"]').daterangepicker({
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
                'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
            }
        }, cb);

        cb(start, end);
    });
</script>
@endpush
