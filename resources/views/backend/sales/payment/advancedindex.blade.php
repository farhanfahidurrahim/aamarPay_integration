@extends('admin.admin_master')
@section('admin')
<section class="content-main">
    <div class="content-header">
        <h3 class="content-title">Advance Payment list </h3>
        <div class="row">
            <div class="col-12">
                {{-- <a href="{{ route('advanced.create') }}" class="btn btn-primary"><i class="material-icons md-plus"></i>Advance Payment Advanced</a> --}}
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    <i class="material-icons md-plus"></i> Create
                  </button>

            </div>
        </div>
    </div>
    <div class="card mb-4">

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
                            @if(Auth::guard('admin')->user()->role != '2')
                                <th scope="col" class="text-end">Action</th>
                            @endif
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($advance as $key => $item)
                        <tr>
                            <td> {{ $key+1}} </td>
                            <td> {{ $item->transaction_no}} </td>
                            <td> {{ $item->advance_amount}} TK </td>
                            <td> {{ \Carbon\Carbon::parse($item->date)->format('d-m-Y')}} </td>
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
                                      <a class="btn btn-md rounded font-sm" href="{{ route('advanced.payment.edit',$item->id)}}">Edit</a>
                                      <a class="btn btn-md rounded font-sm bg-danger" href="{{ route('advanced.payment.destroy',$item->id)}}" id="delete">Delete</a>
                                </td>
                            @endif
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            <!-- table-responsive //end -->
        </div>
        <!-- card-body end// -->
    </div>
</section>

  <!-- Modal -->
  <div class="modal fade" id="exampleModal"  data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Advance Payment Add</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <form action="{{ route('advanced.payment.store') }}" method="post">
                @csrf
                <input type="hidden" name="user_id" value="{{ Auth::guard('admin')->user()->id }}">
            <div class="row p-3">
                <div class="col-md-6 form-group mb-4">
                    <label for="amount" class="col-form-label" style="font-weight: bold;"> Transaction Number:</label>
                    <input class="form-control" id="" type="number" required name="transaction_no" value="{{old('transaction_no')}}">
                    @error('transaction_no')
                        <span class="text-danger">{{ $message }}</span>
                    @enderror
                </div>
                <div class="col-md-6 form-group mb-4">
                    <label for="amount" class="col-form-label" style="font-weight: bold;"> Received Amount:</label>
                    <input class="form-control" id="advance_amount" type="text" required name="advance_amount" value="{{old('advance_amount')}}" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
                    @error('advance_amount')
                        <span class="text-danger">{{ $message }}</span>
                    @enderror
                    <input class="form-control" id="received" type="hidden" required name="received" value="{{old('received')}}">
                </div>
                <div class="form-group col-md-6 mb-4">
                    <label for="payment_date" class="col-form-label" style="font-weight: bold;">Date:</label>
                    <?php $date = date('Y-m-d'); ?>
                    <input type="date" name="date" id="date" value="<?= $date ?>" class="form-control">
                    @error('date')
                        <span class="text-danger">{{ $message }}</span>
                    @enderror
                </div>
                <div class="form-group col-md-6 mb-4 mt-2">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="agent_number" value="0153414032" id="flexRadioDefault1">
                        <label class="form-check-label" for="flexRadioDefault1">
                          0153414032 (Telitalk)
                        </label>
                      </div>
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="agent_number" value="01875523815" id="flexRadioDefault2" >
                        <label class="form-check-label" for="flexRadioDefault2">
                            01875523815 (Robi)
                        </label>
                      </div>
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="agent_number" value="01775782602" id="flexRadioDefault3" >
                        <label class="form-check-label" for="flexRadioDefault3">
                            01775782602 (GP)marchant
                        </label>
                      </div>
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="agent_number" value="01329657140" id="flexRadioDefault4" >
                        <label class="form-check-label" for="flexRadioDefault4">
                            01329657140 (GP)marchant online
                        </label>
                      </div>
                    @error('agent_number')
                        <span class="text-danger">{{ $message }}</span>
                    @enderror
                </div>

            </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary">Save</button>
        </div>
    </form>
      </div>
    </div>
  </div>
@endsection
@push('footer-script')
<script>
    $(document).on('keyup', "#advance_amount", function(){
        console.log('he')
        var advance_amount = $(this).val();
        $('#received').val(advance_amount);
    });
</script>



@endpush