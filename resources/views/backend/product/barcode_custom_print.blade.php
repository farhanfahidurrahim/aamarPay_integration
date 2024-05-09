@extends('admin.admin_master')
@section('admin')
<section class="content-main">
    <div class="content-header">
        <h2 class="content-title">Barcode Print</h2>
    </div>
	<div class="row">
        <div class="col-md-10 mx-auto">
			<form method="post" action="{{ route('barcode.print.qty') }}" enctype="multipart/form-data">
				@csrf
				<div class="card">
					<div class="card-header">
						<h3>Barcode Print</h3>
					</div>
		        	<div class="card-body">
		        		<div class="row">
							<div class="col-md-4 mb-4">
	                           <label for="product_id" class="col-form-label" style="font-weight: bold;">Product:</label>
				                <div class="custom_select">
                                    <select class="form-control select-active w-100 form-select select-nice" name="product_id" id="product_id">
                                    	<option {{old('product_id') ? '' : 'selected'}} value="0">--Select Product--</option>
		                                @foreach ($products as $product)
		                                    <option value="{{ $product->id }}" {{ old('product_id')== $product->id ? 'selected' : '' }}>{{ $product->name_en }}</option>
		                                @endforeach
                                    </select>
                                </div>
	                        </div>

                            <div class="col-md-8 mb-4">
                                <div class="row pv-print">
                                </div>
                            </div>
		        		</div>
		        		<!-- row //-->
		        	</div>
		        	<!-- card body .// -->
			    </div>
			    <!-- card .// -->
			    <div class="row mb-4 justify-content-sm-end">
					<div class="col-lg-2 col-md-4 col-sm-5 col-6">
						<input type="submit" class="btn btn-primary" value="Submit">
					</div>
				</div>
		    </form>
		</div>
		<!-- col-6 //-->
	</div>
</section>
@endsection


@push('footer-script')
<script>
    $(document).ready(function() {
        $('select[name="product_id"]').on('change', function(){
            var product_id = $(this).val();
            if(product_id) {
                $.ajax({
                    url: "{{  url('admin/custome/print/ajax') }}/"+product_id,
                    type:"GET",
                    dataType:"json",
                    success:function(data) {
                        if(data.length > 1 || data.is_varient === 1){
                            $('.pv-print').html('');
                            $.each(data, function(key, value){
                                var html = `
                                            <div class="col-md-4 mb-4">
                                                <label for="product_id" class="col-form-label text-center" style="font-weight: bold;">Varient : ${value.varient} </label>
                                                <input class="form-control" id="" type="text" name="size_qty[${value.varient}][qty]" placeholder="Write Product Size" value="0">
                                            </div>
                                            `;
                                $('.pv-print').append(html);
                            });
                        }else{
                            $('.pv-print').html('');
                            var html = `
                                        <div class="col-md-4 mb-4">
                                            <label for="product_id" class="col-form-label text-center opacity-0" style="font-weight: bold;  opacity:0"> Qty </label>
                                            <input class="form-control" id="" type="text" name="size_qty2" placeholder="Write Product Size" value="0">
                                        </div>
                                        `;
                            $('.pv-print').append(html);
                        }
                    },
                });
            } else {
                alert('danger');
            }
        });
    });
</script>

@endpush
