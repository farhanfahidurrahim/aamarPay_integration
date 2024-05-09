@extends('layouts.frontend')
@section('content-frontend')
@include('frontend.common.maintenance')
@php
   $maintenance = getMaintenance();
@endphp
<main class="main pages">
    <div class="page-header breadcrumb-wrap">
        <div class="container">
            <div class="breadcrumb">
                <a href="{{route('home')}}" rel="nofollow"><i class="fi-rs-home mr-5"></i>Home</a>
                <span></span></span> Login
            </div>
        </div>
    </div>
    <div class="page-content section-padding">
        <div class="container">
            <div class="row">
                <div class="col-xl-8 col-lg-10 col-md-12 m-auto">
                    <div class="row">
                        {{-- <div class="col-lg-6 pr-30 d-none d-lg-block">
                            <img class="border-radius-15" src="{{asset('frontend/assets/imgs/page/login-1.png')}}" alt="" />
                    </div> --}}
                    <div class="col-lg-6 col-md-8 offset-lg-3 offset-md-2">
                        <div class="login_wrap widget-taber-content background-white">
                            <div class="padding_eight_all card p-3" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;">
                                <div class="heading_s1">
                                    <h1 class="mb-5 fs-1">Login</h1>
                                    <p class="mb-30">Don't have an account? <a href="{{ route('register') }}">Create here</a></p>
                                </div>
                                <form method="POST" action="{{ route('login') }}" class="row g-3 needs-validation" novalidate>
                                    @csrf
                                    <div class="form-group">
                                        <input type="number" name="phone" placeholder="Phone *" value="{{ old('phone') }}" autofocus/>
                                        @error('email')
                                        <div class="text-danger" style="font-weight: bold;">{{ $message }}</div>
                                        @enderror
                                    </div>
                                            
                                    <div class="form-group">
                                        <input type="password" name="password" placeholder="Your password *" autocomplete="current-password" value="{{ old('password')}}" />
                                        @error('password')
                                        <div class="text-danger" style="font-weight: bold;">{{ $message }}</div>
                                        @enderror
                                    </div>
                                    <div class="login_footer form-group">
                                        <div class="chek-form">
                                            <div class="custome-checkbox">
                                                <input class="form-check-input" type="checkbox" name="checkbox" id="exampleCheckbox1" value="" />
                                                <label class="form-check-label" for="exampleCheckbox1"><span>{{ __('Remember me') }}</span></label>
                                            </div>
                                        </div>
                                            @if($maintenance==1)
                                                <a class="text-muted"  data-bs-toggle="modal" data-bs-target="#maintenance" >Forgot password?</a>
                                            @else
                                            <a class="text-muted" href="{{ route('password.request') }}">Forgot password?</a>
                                            @endif
                                    </div>
                                    <div class="form-group">
                                        @if($maintenance==1)
                                            <button type="button" class="btn btn-heading btn-block hover-up" data-bs-toggle="modal" data-bs-target="#maintenance" ><i class="fa-solid fa-arrow-right-to-bracket"></i>{{ __('Log in') }}</button>
                                        @else
                                           <button type="submit" class="btn btn-heading btn-block hover-up" name="login"><i class="fa-solid fa-arrow-right-to-bracket"></i> {{ __('Log in') }}</button>
                                        @endif
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</main>


<script>
    // Example starter JavaScript for disabling form submissions if there are invalid fields
    (function() {
        'use strict'

        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.querySelectorAll('.needs-validation')

        // Loop over them and prevent submission
        Array.prototype.slice.call(forms)
            .forEach(function(form) {
                form.addEventListener('submit', function(event) {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }

                    form.classList.add('was-validated')
                }, false)
            })
    })()

</script>
@endsection