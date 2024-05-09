@extends('layouts.frontend')
@section('content-frontend')
    <!--<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
    <style>
        .card {
            padding: 30px 40px;
            margin-top: 30px;
            margin-bottom: 60px;
            border: none !important;
            box-shadow: 0 6px 12px 0 rgba(0, 0, 0, 0.2)
        }

        .blue-text {
            color: #00BCD4
        }

        .form-control-label {
            margin-bottom: 0
        }

        .form-group input {
            height: 50px !important;
            font-size: 14px !important;
        }

        input:focus,
        textarea:focus {
            -moz-box-shadow: none !important;
            -webkit-box-shadow: none !important;
            box-shadow: none !important;
            border: 1px solid #00BCD4;
            outline-width: 0;
            font-weight: 400
        }

        .form-control-label {
            text-align: left;
            font-size: 16px;
            margin-left: -15px;
        }

        .chek-form {
            text-align: left;
            font-size: 16px;
        }
    </style>
    <main class="main">
        <div class="page-header breadcrumb-wrap">
            <div class="container">
                <div class="breadcrumb" style="color: #fff;">
                    <a href="{{ route('home') }}" rel="nofollow" style="color: #fff;"><i class="fi-rs-home mr-5"></i>Home</a>
                    <span style="color: #fff;"></span> Page
                    <span style="color: #fff;"></span> Return-Policy
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row d-flex justify-content-center refund__policy">
                <div class="col-12 text-center return__card">
                    <h3 class="fs-3">Return Request From</h3>
                    <p class="blue-text">Return request must be raised within 14 days for own items <br> or
                        within 7 days for vendor items from the date of delivery.</p>
                    <div class="card">
                        <h5 class="text-center mb-4">Product Return From</h5>
                        <form class="form-card" method="post" action="{{ route('return.store') }}"
                            enctype="multipart/form-data" id="form-data">
                            @csrf
                            <div class="row justify-content-between text-left">
                                <div class="form-group col-sm-6 flex-column d-flex">
                                    <label class="form-control-label px-3">Full name<span class="text-danger"> *</span>
                                        <input class="form-control" id="customer_name" type="text" name="customer_name"
                                            placeholder="Enter your name" value="{{ old('customer_name') }}" required>
                                        @error('customer_name')
                                            <p class="text-danger">{{ $message }}</p>
                                        @enderror
                                </div>
                                <div class="form-group col-sm-6 flex-column d-flex">
                                    <label class="form-control-label px-3">Address<span class="text-danger">
                                            *</span>
                                        <input class="form-control" id="address" type="text" name="address"
                                            placeholder="" value="{{ old('address') }}" required>
                                        @error('address')
                                            <p class="text-danger">{{ $message }}</p>
                                        @enderror
                                </div>
                            </div>
                            <div class="row justify-content-between text-left">
                                <div class="form-group col-sm-6 flex-column d-flex">
                                    <label class="form-control-label px-3">Email<span class="text-danger">
                                            *</span>
                                        <input class="form-control" id="email" type="email" name="email"
                                            placeholder="Enter your name" value="{{ old('email') }}" required>
                                        @error('email')
                                            <p class="text-danger">{{ $message }}</p>
                                        @enderror
                                </div>
                                <div class="form-group col-sm-6 flex-column d-flex">
                                    <label class="form-control-label px-3">Phone number<span class="text-danger"> *</span>
                                        <input class="form-control" id="phone" type="text" name="phone"
                                            placeholder="" value="{{ old('phone') }}" required
                                            oninput="this.value = this.value.replace(/[^0-9]/g, '')">
                                        @error('phone')
                                            <p class="text-danger">{{ $message }}</p>
                                        @enderror
                                </div>
                            </div>
                            <div class="row justify-content-between text-left">
                                <div class="form-group col-sm-12 flex-column d-flex">
                                    <label class="form-control-label px-3">Invoice No<span class="text-danger"> *</span>
                                        <input class="form-control" id="invoice_no" type="text" name="invoice_no"
                                            placeholder="" value="{{ old('invoice_no') }}" required
                                            oninput="this.value = this.value.replace(/[^0-9]/g, '')">
                                        @error('invoice_no')
                                            <p class="text-danger">{{ $message }}</p>
                                        @enderror
                                </div>
                            </div>
                            <div class="row justify-content-between text-left">
                                <div class="form-group col-12 flex-column d-flex">
                                    <div class="chek-form" required>
                                        <h2><label class="form-control-label px-3 pb-2">Reasons for
                                                Returning<span class="text-danger"> *</span></label></h2>
                                        <div class="custome-checkbox">
                                            <input class="form-check-input reasonCheck" type="checkbox" name="reasons[]"
                                                id="exampleCheckbox1" value="1" />
                                            <label class="form-check-label" for="exampleCheckbox1"><span>Ordered Wrong
                                                    Product.</span></label>
                                        </div>

                                        <div class="custome-checkbox">
                                            <input class="form-check-input reasonCheck" type="checkbox" name="reasons[]"
                                                id="exampleCheckbox2" value="2" />
                                            <label class="form-check-label" for="exampleCheckbox2"><span>Received Wrong
                                                    Product.</span></label>
                                        </div>

                                        <div class="custome-checkbox">
                                            <input class="form-check-input reasonCheck" type="checkbox" name="reasons[]"
                                                id="exampleCheckbox3" value="3" />
                                            <label class="form-check-label" for="exampleCheckbox3"><span>Product is
                                                    damaged &
                                                    defective.</span></label>
                                        </div>

                                        <div class="custome-checkbox">
                                            <input class="form-check-input reasonCheck" type="checkbox" name="reasons[]"
                                                id="exampleCheckbox4" value="4" />
                                            <label class="form-check-label"
                                                for="exampleCheckbox4"><span>Others.</span></label>
                                        </div>
                                        @error('reasons')
                                            <p class="text-danger">{{ $message }}</p>
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            <div class="apeandField">
                                <div class="row justify-content-between text-left mb-4 append-coloum">
                                    <div class="form-group col-xl-4 col-6 flex-column d-flex">
                                        <label class="form-control-label px-3">Product name<span class="text-danger">
                                                *</span>
                                            <input class="form-control" id="customer_name" type="text"
                                                name="product_name[]" placeholder="Enter Product name" required
                                                value="{{ old('product_name[]') }}">
                                            @error('product_name')
                                                <p class="text-danger">{{ $message }}</p>
                                            @enderror
                                    </div>
                                    <div class="form-group col-xl-2 col-md-6 col-12 flex-column d-flex">
                                        <label class="form-control-label px-3">Product Code<span class="text-danger">
                                                *</span>
                                            <input class="form-control" id="product_code" type="text"
                                                name="product_code[]" placeholder="Enter Product Code" required
                                                value="{{ old('product_code[]') }}"
                                                oninput="this.value = this.value.replace(/[^0-9]/g, '')">
                                            @error('product_code')
                                                <p class="text-danger">{{ $message }}</p>
                                            @enderror
                                    </div>
                                    <div class="form-group col-xl-2 col-md-6 col-12 flex-column d-flex">
                                        <label class="form-control-label px-3">Product Quantity<span class="text-danger">
                                                *</span>
                                            <input class="form-control" id="product_qty" type="text" required
                                                name="product_qty[]" placeholder="quantity"
                                                value="{{ old('product_qty[]') }}"
                                                oninput="this.value = this.value.replace(/[^0-9]/g, '')">
                                            @error('product_qty')
                                                <p class="text-danger">{{ $message }}</p>
                                            @enderror
                                    </div>
                                    <div class="form-group col-xl-3 co-mdl- col-12 flex-column d-flex">
                                        <label class="form-control-label px-3">Product Image<span class="text-danger">
                                                *</span>
                                            <input name="product_img[]" class="form-control" type="file" required>
                                            @error('product_img')
                                                <p class="text-danger">{{ $message }}</p>
                                            @enderror
                                    </div>
                                    <div class="col-xl-1 col-md-6 col-12 text-start">
                                        <button type="button" class="btn btn-primary btn-sm plus-btn"
                                            style="margin-top: 20px;" onclick="plus()">+</button>
                                    </div>
                                </div>
                            </div>
                            <div class="row justify-content-between text-left">
                                <label class="form-control-label px-3" style="font-size:16px; font-weight: bold;">Short
                                    description for
                                    return..<span class="text-danger"> *</span></label>
                                <textarea rows="4" cols="50" name="description" required oninput="checkInputLength(this)">{{ old('description') }}</textarea>
                                <p id="charCountMessage" style="color:red;text-align:left"></p>
                            </div>
                            <div class="row">
                                <div class="form-group col-sm-12" style="padding: 9px 40px !important;">
                                    <button type="submit" class="btn-block btn-primary refund__policy">Send
                                        Request</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </main>
    <script>
        function previewThumnailImage(event) {
            var reader = new FileReader();
            reader.onload = function() {
                var output = document.getElementById('preview-img');
                output.src = reader.result;
            }
            reader.readAsDataURL(event.target.files[0]);
        };
    </script>
    <script>
        function checkInputLength(textarea) {
            var maxLength = 200;
            var currentLength = textarea.value.length;
            var charCountMessage = document.getElementById("charCountMessage");
            if (currentLength > maxLength) {
                textarea.value = textarea.value.substring(0, maxLength);
                charCountMessage.textContent = "Maximum 200 characters allowed.";
            } else {
                charCountMessage.textContent = "";
            }
        }
    </script>
    <script>
        $(document).ready(function() {
            $('input[type="checkbox"]').on('change', function() {
                var checkedCheckboxes = $('input[type="checkbox"]:checked');
                if (checkedCheckboxes.length > 2) {
                    $(this).prop('checked', false);
                }
            });
        });
    </script>
@endsection
@push('footer-script')
    <script>
        function plus() {
            $(".apeandField").append(` <div class="row justify-content-between text-left mb-4 append-coloum">
                    <div class="form-group col-xl-2 col-md-6 col-12 flex-column d-flex">
                        <label class="form-control-label px-3">Product name<span class="text-danger"> *</span>
                        <input class="form-control" id="" type="text" name="product_name[]" placeholder="Enter Product name" value="{{ old('product_name[]') }}" required>
                        @error('product_name')
                            <p class="text-danger">{{ $message }}</p>
                        @enderror
                    </div>
                    <div class="form-group col-xl-2 col-md-6 col-12 flex-column d-flex">
                        <label class="form-control-label px-3">Product Code<span class="text-danger"> *</span>
                        <input class="form-control" id="product_code" type="text" name="product_code[]" placeholder="Enter Product Code" value="{{ old('product_code[]') }}" required oninput="this.value = this.value.replace(/[^0-9]/g, '')">
                        @error('product_code')
                            <p class="text-danger">{{ $message }}</p>
                        @enderror
                    </div>
                    <div class="form-group col-xl-2 col-md-6 col-12 flex-column d-flex">
                        <label class="form-control-label px-3">Product Quantity<span class="text-danger"> *</span>
                        <input class="form-control" id="product_qty" type="text" name="product_qty[]" placeholder="quantity" value="{{ old('product_qty[]') }}" required oninput="this.value = this.value.replace(/[^0-9]/g, '')">
                        @error('product_qty')
                            <p class="text-danger">{{ $message }}</p>
                        @enderror
                    </div>
                    <div class="form-group col-xl-2 col-md-6 col-12 flex-column d-flex">
                        <label class="form-control-label px-3">Product Image<span class="text-danger"> *</span>
                        <input name="product_img[]" class="form-control" type="file" required>
                        @error('product_img')
                            <p class="text-danger">{{ $message }}</p>
                        @enderror
                    </div>
                    <div class="col-xl-1 col-md-6 col-12 text-start">
                        <button type="button" class="btn btn-primary btn-sm " style="margin-top: 20px;" onclick="removeElement(this)">-</button>
                    </div>
                </div>
        `);
        }

        function removeElement(button) {
            $(button).closest('.append-coloum').remove();
        }
    </script>
@endpush
