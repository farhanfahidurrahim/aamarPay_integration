@include('frontend.common.add_to_cart_modal')
<footer class="main footer-dark">
    <section class="newsletter wow animate__animated animate__fadeIn pt-4 pb-4" style="background: #1e2235">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-lg-6">
                    <div class="newsletter-title-footer "> <img src="{{ asset('upload/envelop.png') }}" alt="">
                        SIGN
                        UP FOR NEWSLETTER FOR OFFER AND UPDATES</div>
                </div>
                <div class="col-md-12 col-lg-6">
                    <div class="subscribe__form">
                        <form class="form-subcriber d-flex" method="POST" action="{{ route('subscribers.store') }}">
                            @csrf
                            <input type="email" placeholder="Your emaill address" required="" name="email" />
                            <button class="btn" type="submit">Subscribe</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="footer-mid main-footer-custom" style="background-color: #000 !important;">
        <div class="container pt-15 pb-20">
            <div class="row">
                <div class="col-lg-6 col-sm-12">
                    <div class="footer-link-widget wow animate__animated animate__fadeInUp" data-wow-delay=".1s">
                        <h4 class="widget-title">CORPORATE HEADQUARTER</h4>
                        <ul class="contact-infor">
                            <li><i class="fa-solid fa-location-dot"></i>Address:
                                <span>{{ get_setting('business_address')->value ?? 'null' }}</span>
                            </li>
                            <li><i class="fa fa-phone"></i>Call Us:<a
                                    href="tel:{{ get_setting('phone')->value ?? 'null' }}">{{ get_setting('phone')->value ?? 'null' }}</a>
                            </li>
                            <li><i class="fa-regular fa-envelope"></i>Email: <a
                                    href="mailto:{{ get_setting('email')->value ?? 'null' }}">{{ get_setting('email')->value ?? 'null' }}</a>
                            </li>
                            <li><i class="fa fa-clock"></i>Hours:<span>
                                    {{ get_setting('business_hours')->value ?? 'null' }}</span></li>
                        </ul>

                        <div class="footer__social">
                            <a href="{{ get_setting('facebook_url')->value ?? 'null' }}" target="_blank"
                                title="facebook" class="facebook"><i class="fa-brands fa-facebook-f"></i></a>
                            <a href="{{ get_setting('youtube_url')->value ?? 'null' }}" target="_blank" title="youtube"
                                class="youtube"><i class="fa-brands fa-youtube"></i></a>
                            <a href="{{ get_setting('instagram_url')->value ?? 'null' }}" target="_blank"
                                title="instagram" class="instagram"><i class="fa-brands fa-instagram"></i></a>
                            <a href="#" target="_blank" class="tiktok" title="tiktok"><i
                                    class="fa-brands fa-tiktok"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-sm-4">
                    <div class="footer-link-widget wow animate__animated animate__fadeInUp" data-wow-delay=".2s">
                        <h4 class="widget-title">Account</h4>
                        <ul class="footer-list mb-sm-5 mb-md-0">
                            <li><a href="{{ route('login') }}">Sign In</a></li>
                            <li><a href="{{ route('cart.show') }}">View Cart</a></li>
                            <li>
                                <a href="{{ route('return.policy') }}">
                                    @if (session()->get('language') == 'bangla')
                                        প্রত্যাবর্তন নীতিমালা
                                    @else
                                        Return Policy
                                    @endif
                                </a>
                            </li>
                            <li>
                                <a href="{{ route('refund.policy') }}">
                                    @if (session()->get('language') == 'bangla')
                                        প্রত্যর্পণ নীতি
                                    @else
                                        Refund Policy
                                    @endif
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-2 col-sm-4">
                    <div class="footer-link-widget wow animate__animated animate__fadeInUp" data-wow-delay=".1s">
                        <h4 class="widget-title">Company</h4>
                        <ul class="footer-list mb-sm-5 mb-md-0">
                            @foreach (get_pages_both_footer() as $page)
                                <li>
                                    <a href="{{ route('page.about', $page->slug) }}">
                                        {{ $page->title }}
                                    </a>
                                </li>
                            @endforeach
                        </ul>
                    </div>
                </div>
                <div class="col-lg-2 col-sm-4">
                    <div class="footer-link-widget wow animate__animated animate__fadeInUp" data-wow-delay=".1s">
                        <h4 class="widget-title">Company</h4>
                        <ul class="footer-list mb-sm-5 mb-md-0">
                            @foreach (get_pages_both_footer() as $page)
                                <li>
                                    <a href="{{ route('page.about', $page->slug) }}">
                                        {{ $page->title }}
                                    </a>
                                </li>
                            @endforeach
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="wow animate__animated animate__fadeInUp" data-wow-delay="0" style="background-color: #000 !important;">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-xl-4 col-lg-4 col-md-7 col-12">
                    <div class="copyright__left text-md-center">
                        <ul class="contact-infor">
                            <li class="d-flex align-items-center">
                                <h5 class="widget-title">CHECK OUT OUR APP! </h5>
                                <div class="download-app">
                                    <a href="#" class="hover-up"><img
                                            src="{{ asset('frontend/assets/imgs/theme/google-play.jpg') }}"
                                            alt="" /></a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-4 col-md-5 col-12">
                    <p class="font-sm text-center classicit">
                        Developed by:
                        <a target="_blank" href="https://classicit.com.bd/">Classic IT</a>
                    </p>
                </div>
                {{-- <div class="col-xl-4 col-lg-4 col-md-6 text-end d-none d-md-block"> --}}
                <div class="col-xl-5 col-lg-4 col-md-12 col-12 text-center text-lg-end classicit_year">
                    <a href="#" class="footer__payment__info">
                        <img class="" src="{{ asset('frontend/assets/imgs/theme/payment-method.png') }}"
                            alt="">
                    </a>
                    <p class="font-sm mb-0 copyright">&copy; {{ get_setting('copy_right')->value ?? 'null' }} All
                        rights
                        reserved</p>
                </div>
            </div>
        </div>
    </div>
</footer>

@php
    $prefix = Request::route()->getPrefix();
    $route = Route::current()->getName();
@endphp
<div class="nest-mobile-bottom-nav d-xl-none mobile_fixed_bottom bg-white shadow-lg border-top rounded-top mobile__fixed__none"
    style="box-shadow: 0px -1px 10px rgb(0 0 0 / 15%)!important; ">

    <div class="product__details__footer">
        <div class="footer-widget">
            <a href="{{ route('cart.show') }}" class="text-reset d-block text-center">
                <span class="align-items-center d-flex justify-content-center position-relative">
                    <i class="fa-solid fa-cart-shopping la-2x "></i>
                </span>
                <span class="d-block">
                    Cart
                    (<span class="cart-count cartQty"></span>)
                </span>
            </a>
        </div>
        
        <div class="footer-widget buy__now">
            <a type="submit" class="text-reset d-block text-center buy_now-btn" onclick="buyNow()">Buy Now</a>
        </div>
        <div class="footer-widget add__cart">
            <div class="d-block text-center menu-toggle" style="cursor: pointer">
                <input type="hidden" id="product_id" value="{{ $product->id }}">
                <input type="hidden" id="pname" value="{{ $product->name_en }}">
                <input type="hidden" id="product_price" value="{{ $amount }}">
                <input type="hidden" id="minimum_buy_qty" value="{{ $product->minimum_buy_qty }}">
                <input type="hidden" id="stock_qty" value="{{ $product->stock_qty }}">
                <input type="hidden" id="pvarient" value="">
                <input type="hidden" id="buyNowCheck" value="0">
                @if ($maintenance == 1)
                    <button type="button" class="button button-add-to-cart text-white" data-bs-toggle="modal" data-bs-target="#maintenance"><i
                    class="fi-rs-shoppi ng-cart"></i>Add to cart</button>
                @else
                    <a class="d-block" onclick="addToCart({{ $product->id }})" style="color: #fff;"></i>Add To Cart</a>
                @endif
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
        $('.menu-toggle').click(function() {
            $('.menu-content').css('left', '100%').show().animate({ left: 0 }, 'slow');
        });

        $('.close-btn').click(function() {
            $('.menu-content').animate({ left: '100%' }, 'slow', function() {
                $(this).hide();
            });
        });
    });
</script>
<script>
    $(document).ready(function () {
        // First level collapse toggle
        $('.nav-link-item[data-bs-toggle="collapse"]').click(function (e) {
            e.preventDefault();
            var target = $(this).attr('href');
            $(target).collapse('toggle');
            $('.nav-link-item[data-bs-toggle="collapse"]').not(this).each(function () {
                var otherTarget = $(this).attr('href');
                $(otherTarget).collapse('hide');
                $(this).find('i').removeClass('fa-chevron-down').addClass('fa-chevron-right');
            });
            $(this).find('i').toggleClass('fa-chevron-right fa-chevron-down');
        });

        // Toggle child__nav_menu
        $('.openChild').click(function(e) {
            e.preventDefault();
            var childMenu = $(this).next('.child__nav_menu');
            $('.child__nav_menu').not(childMenu).removeClass('show');
            childMenu.toggleClass('show');
        });
    });
</script>