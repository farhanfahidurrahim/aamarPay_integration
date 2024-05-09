@extends('admin.admin_master')
@section('admin')
<section class="content-main">
    <div class="content-header">
        <h3 class="content-title">Refund Product list <span class="badge rounded-pill alert-success"> {{ count($refunds) }} </span></h3>
    </div>
    </div>
    <div class="card mb-4">
        <div class="card-body">
            <div class="table-responsive-sm">
                <table id="example" class="table table-bordered table-striped" width="100%">
                    <thead>
                        <tr>
                            <th scope="col">Sl</th>
                            <th scope="col">Customer Name</th>
                            <th scope="col">Phone</th>
                            <th scope="col">Invoice No</th>
                            <th scope="col">Refund Reason</th>
                            <th scope="col">Is Return</th>
                            <th scope="col" class="text-end">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($refunds as $key => $refund)
                        <tr>
                            <td> {{ $key+1}} </td>
                            <td> {{ $refund->customer_name ?? 'NULL' }} </td>
                            <td> {{ $refund->phone ?? 'NULL' }} </td>
                            <td> {{ $refund->invoice_no ?? 'NULL' }} </td>
                                    @php
                                    $reasonsMap = [
                                        1 => 'Ordered Wrong Product',
                                        2 => 'Received Wrong Product',
                                        3 => 'Product is damaged & defective',
                                    ];
                                    $reasons = explode(',', $refund->reasons);
                                    $reasonTexts = array_map(function ($reasonValue) use ($reasonsMap) {
                                        return $reasonsMap[$reasonValue] ?? 'Others';
                                    }, $reasons);
                                    $reasonsString = implode(', ', $reasonTexts);
                                @endphp
                            <td>
                                    <span style="font-weight: bold">{{ $reasonsString }}</span>
                            </td>
                            <td>
                                @if ($refund->approved ==0)
                                    <a class="btn btn-primary btn-sm"
                                    href="{{ route('refund.restock.product', $refund->id) }}"
                                    id="">Approve It</a>
                                @else
                                    <a class="btn btn-danger btn-sm" disabled
                                    id="">Refund</a>
                                @endif

                            </td>
                            <td class="text-end">
                                <button type="button" value="{{$refund->id}}" class="btn btn-md rounded font-sm" id="refundshBtn" >Detail </button>
                                <div class="dropdown">
                                    <a href="#" data-bs-toggle="dropdown" class="btn btn-light rounded btn-sm font-sm"> <i class="material-icons md-more_horiz"></i> </a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item text-danger" href="{{ route('refund.delete',$refund->id) }}" id="delete">Delete</a>
                                    </div>
                                </div>
                                <!-- dropdown //end -->
                            </td>
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
<!-- show Refund Request Modal -->
<div id="show___refund" class="modal custom-modal fade" role="dialog">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header card-header">
				<h3 class="modal-title">Show Refund Request Product Information</h3>
				<button type="button" class="btn-close bg-white" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
            <div class="modal-body">
                <div class="row ps-4 pe-4">
                    <div class="col-sm-6">
                        <div class="input-group mb-5">
                            <h3 class="col-form-label">Customer Name:&nbsp;&nbsp; </h3>
                            <div class="pt-10">
                                <h5 id="ShName"></h5>
                            </div>

                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="input-group mb-5">
                            <h3 class="col-form-label">Address:&nbsp;&nbsp;</h3>
                            <div class="pt-10">
                                <h5 id="ShAddress"></h5>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <div class="input-group mb-5">
                            <h3 class="col-form-label">Email:&nbsp;&nbsp; </h3>
                            <div class="pt-10">
                                <h5 id="ShEmail"></h5>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <div class="input-group mb-5">
                            <h3 class="col-form-label">Phone:&nbsp;&nbsp;</h3>
                            <div class="pt-10">
                                <h5 id="ShPhone"></h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="input-group mb-5">
                            <h3 class="col-form-label">Invoice Id:&nbsp;&nbsp; </h3>
                            <div class="pt-10">
                                <h5 id="ShInvoiceId"></h5>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row p-4">
                    <h4 class="text-center mb-3">Refund Product List</h4>
                    <table id="productTable" class="table table-bordered table-striped" style="border:1px solid rgb(171, 171, 171)">
                        <thead>
                            <tr>
                                <th>Product Name</th>
                                <th>Product Code</th>
                                <th>Product Qty</th>
                                <th>Product Img</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="pname"></td>
                                <td class="pcode"></td>
                                <td class="pqty"></td>
                                <td class="pimg"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="row ps-4 pe-4">
                    <div class="col-sm-12">
                        <div class="input-group mb-2 mt-2">
                            <h4 class="col-form-label">Short Description:&nbsp;&nbsp;</h4><br>
                            <p class="pt-5" id="ShDescription"></p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-9"></div>
                    <div class="col-3 stockbtn">

                    </div>
                </div>
            </div>
		</div>
	</div>
</div>
<!-- /show Return Request Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
	$(document).ready(function(){
		$(document).on('click','#refundshBtn',function(){
			 //alert("ok");
            var refundsh_id=$(this).val();
            var id=$(this).val();
			$('#show___refund').modal('show');
			/*$.ajax({
				type: "GET",
				url: "/show-refund/"+refundsh_id,
				success:function(response){
					console.log(response);
					$('#cmbrefundeSHId').html(refundsh_id);
					$('#ShName').html(response.refund.customer_name);
					$('#ShAddress').html(response.refund.address);
					$('#ShEmail').html(response.refund.email);
					$('#ShPhone').html(response.refund.phone);
                    $('#ShInvoiceId').html(response.refund.invoice_no);
                    $('#ShDescription').html(response.refund.description);
					$("#ShFilephoto").html(
                        `<img src="${response.refund.product_img}" width="170" height="150" class="img-fluid img-thumbnail">`);

				}
			});*/
            $.ajax({
                    type: "GET",
                    url:  "/show-refund/"+refundsh_id,
                    success: function(response) {
                        $('#productTable tbody').html('');
                        $('.stockbtn').html('');
                        $('#cmbreturneSHId').html(refundsh_id);
                        $('#ShName').html(response.refund.customer_name);
                        $('#ShAddress').html(response.refund.address);
                        $('#ShEmail').html(response.refund.email);
                        $('#ShPhone').html(response.refund.phone);
                        $('#ShInvoiceId').html(response.refund.invoice_no);
                        $('#ShDescription').html(response.refund.description);
                        $('.stockbtn').append(`
                           <a class="btn btn-primary btn-sm" ${response.refund.approved === 0 ? 'href="/admin/restock/product/refund/' + id + '"' : 'disabled'}>ReFund</a>
                        `);
                        var productNames = response.refund.product_name.split(',');
                        var productQtys = response.refund.product_qty.split(',');
                        var productCodes = response.refund.product_code.split(',');
                        var productImages = response.refund.product_img.split('|');
                        for (var i = 0; i < productNames.length; i++) {
                            var productName = productNames[i];
                            var productQty = productQtys[i];
                            var productCode = productCodes[i];
                            var productImg = productImages[i];
                            var $row = $('#productTable tbody').append('<tr>' +
                                '<td class="pname">' + productName + '</td>' +
                                '<td class="pcode">' + productCode + '</td>' +
                                '<td class="pqty">' + productQty + '</td>' +
                                '<td class="pimg"><img src="' + productImg +
                                '" alt="Product Image" width="80"></td>' +
                                '</tr>');
                        }
                    }
                });
		});

	});
</script>
@endsection
