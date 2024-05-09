@extends('layouts.frontend')
@push('css')
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
    <style>
        .preloader1 {
            background-color: #fff;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            z-index: 999999;
            -webkit-transition: .6s;
            transition: .6s;
            margin: 0 auto;
        }


        .preloader-active1 {
            position: absolute;
            top: 100px;
            width: 100%;
            height: 100%;
            z-index: 100;
        }

        .owl-carousel .owl-dots.disabled,
        .owl-carousel .owl-nav.disabled {
            display: block !important;
        }
        .home__slider i {
            position: absolute;
            z-index: 99;
            top: 50%;
            padding: 10px;
            transform: translateY(-50%);
            left: 0;
            font-size: 18px;
            transition: all .5s ease-in-out;
            color: #000;
        }
        
        .home__slider i.fa-solid.fa-angle-right.slick-arrow {
            right: 0;
            left: auto;
        }
        
        .home__slider i:hover {
            background: #000;
            color: #fff;
            cursor: pointer;
        }
    </style>
@endpush
@section('content-frontend')
    @php
        $maintenance = getMaintenance();
    @endphp
    @include('frontend.common.add_to_cart_modal')
    @include('frontend.common.maintenance')

    <!--only for mobile device-->
    <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <img src="{{ asset('frontend/assets/imgs/under.png') }}" class="w-100" alt="fdf">
                </div>
            </div>
        </div>
    </div>
    <!--only for mobile device-->

    <section class="home-slider position-relative mb-30">
        <div class="container">
            {{-- slider start --}}
            <div class="slider__area">
                <div class="container m-0 p-0">
                    <div class="row align-items-stretch g-2">
                        <div class="col-xl-2 d-xl-block d-none">
                            <div class="sidebar__menu__content">
                                <ul class="sidebar__menu__system">
                                    @foreach (get_categories() as $category)
                                        @if ($category->has_sub_sub > 0)
                                            <li class="show__item__category">
                                                <a href="{{ route('product.category', $category->slug) }}">
                                                    @if (session()->get('language') == 'bangla')
                                                        {{ $category->name_bn }}
                                                    @else
                                                        {{ $category->name_en }}
                                                    @endif
                                                    @if ($category->sub_categories && count($category->sub_categories) > 0)
                                                        <i class="fi-rs-angle-right"></i>
                                                    @endif
                                                </a>
                                                @if ($category->sub_categories && count($category->sub_categories) > 0)
                                                    <ul class="single__submenu__item">
                                                        @foreach ($category->sub_categories as $sub_category)
                                                            <li class="child__category__menu__item">
                                                                <a
                                                                    href="{{ route('product.category', $sub_category->slug) }}">
                                                                    @if (session()->get('language') == 'bangla')
                                                                        {{ $sub_category->name_bn }}
                                                                    @else
                                                                        {{ $sub_category->name_en }}
                                                                    @endif
                                                                </a>
                                                                @if ($sub_category->sub_sub_categories && count($sub_category->sub_sub_categories) > 0)
                                                                    <ul class="chile__menu__system">
                                                                        @foreach ($sub_category->sub_sub_categories as $sub_sub_category)
                                                                            <li><a
                                                                                    href="{{ route('product.category', $sub_sub_category->slug) }}">
                                                                                    @if (session()->get('language') == 'bangla')
                                                                                        {{ $sub_sub_category->name_bn }}
                                                                                    @else
                                                                                        {{ $sub_sub_category->name_en }}
                                                                                    @endif
                                                                                </a>
                                                                            </li>
                                                                        @endforeach

                                                                    </ul>
                                                                @endif
                                                            </li>
                                                        @endforeach
                                                    </ul>
                                                @endif
                                            </li>
                                        @else
                                            <li class="show__item__category">
                                                <a href="{{ route('product.category', $category->slug) }}">
                                                    @if (session()->get('language') == 'bangla')
                                                        {{ $category->name_bn }}
                                                    @else
                                                        {{ $category->name_en }}
                                                    @endif
                                                    @if ($category->sub_categories && count($category->sub_categories) > 0)
                                                        <i class="fi-rs-angle-right"></i>
                                                    @endif
                                                </a>

                                                @if ($category->sub_categories && count($category->sub_categories) > 0)
                                                    <ul class="only__sub__category">
                                                        @foreach ($category->sub_categories as $sub_category)
                                                            <li><a
                                                                    href="{{ route('product.category', $sub_category->slug) }}">{{ $sub_category->name_en }}</a>
                                                            </li>
                                                        @endforeach
                                                    </ul>
                                                @endif
                                            </li>
                                        @endif
                                    @endforeach
                                </ul>
                            </div>
                        </div>
                        <div class="col-xl-10 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="home__slider">
                                @foreach ($sliders as $slider)
                                    <div class="single__slider">
                                        <a class="h-100" href="">
                                            <img class="h-100" src="{{ asset($slider->slider_img) }}" alt="">
                                        </a>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            {{-- slider end --}}
        </div>
    </section>
    <!--End hero slider-->

    @php
        $couponCode = getCoupon();
    @endphp

    <div class="container">
        <div class="row">
            @if ($couponCode)
                <div class="col-12">
                    <div class="maintain-sms shoppers__coupon">
                        <h6 style="color:black">Coupon: {{ $couponCode }}</h6>
                    </div>
                </div>
            @endif
        </div>
    </div>

    {{-- feature start --}}
    <div class="feature__product section-padding">
        <div class="container">
            <div class="section__top bg-black">
                <h6 class="text-white text-capitalize">
                    @if (session()->get('language') == 'bangla')
                        বৈশিষ্ট্যযুক্ত পণ্য
                    @else
                        featured product
                    @endif
                </h6>
                <a href="{{ route('featured.product') }}" class="text-white text-end d-block text-capitalize fs-6" style="font-weight: 600">View
                    all</a>
            </div>

            <div class="feature__active border p-3">
                @foreach ($products as $product)
                    <div class="single__product__item border">
                        @php
                            $couponCode = getCoupon();
                            $coupon = \App\Models\Coupon::where('coupon_code', $couponCode)->first();
                            $showCoupon = false;
                            if ($coupon && $coupon->product_id != null) {
                                $couponProductIds = explode(',', $coupon->product_id);
                                if (in_array($product->id, $couponProductIds)) {
                                    $showCoupon = true;
                                }
                            }
                        @endphp
                        @if ($showCoupon)
                            <span class="coupon_code">Coupon: {{ $couponCode }}</span>
                        @endif
                        <div class="product__image position-relative">
                            <a href="{{ route('product.details', $product->slug) }}" class="product__item__photo">
                                <img src="{{ asset($product->product_thumbnail) }}" alt="">
                            </a>

                            <div class="product__discount__price d-flex">
                                @if ($product->created_at >= Carbon\Carbon::now()->subWeek())
                                    <div class="product__labels">
                                        <div class="product__label new__label">New</div>
                                    </div>
                                @endif

                                @if ($product->discount_price > 0)
                                    <div class="product__labels d-flex">
                                        @if ($product->discount_type == 1)
                                            <div class="product__label sale__label">৳{{ $product->discount_price }} off
                                            </div>
                                        @elseif($product->discount_type == 2)
                                            <div class="product__label sale__label">{{ $product->discount_price }}% off
                                            </div>
                                        @endif
                                    </div>
                                @endif
                            </div>

                            <div class="product__item__action">
                                <a href="#" id="{{ $product->id }}" onclick="productView(this.id)"
                                    data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fa fa-eye"></i></a>
                            </div>
                        </div>
                        <div class="product__details">
                            <div class="product__details__top">
                                <strong class="product__name">
                                    <a href="{{ route('product.details', $product->slug) }}" class="product__link">
                                        @if (session()->get('language') == 'bangla')
                                            {{ Str::limit($product->name_bn, 50) }}
                                        @else
                                            {{ Str::limit($product->name_en, 50) }}
                                        @endif
                                    </a>
                                </strong>
                                <div class="product-category">
                                    <span rel="tag">
                                        {{ $product->brand->name_en ?? 'No Brand' }}
                                    </span>
                                </div>

                                @php
                                    $reviews = \App\Models\Review::where('product_id', $product->id)
                                        ->where('status', 1)
                                        ->get();
                                    $averageRating = $reviews->avg('rating');
                                    $ratingCount = $reviews->count(); // Add this line to get the rating count
                                @endphp

                                <div class="product__rating">
                                    @if ($reviews->isNotEmpty())
                                        @for ($i = 1; $i <= 5; $i++)
                                            @if ($i <= floor($averageRating))
                                                <i class="fa fa-star" style="color: #FFB811;"></i>
                                            @elseif ($i == ceil($averageRating) && $averageRating - floor($averageRating) >= 0.5)
                                                {{-- Display a half-star with gradient --}}
                                                <i class="fa fa-star"
                                                    style="background: linear-gradient(to right, #FFB811 50%, gray 50%); -webkit-background-clip: text; color: transparent;"></i>
                                            @else
                                                <i class="fa fa-star" style="color: #000;"></i>
                                            @endif
                                        @endfor
                                    @else
                                        @for ($i = 1; $i <= 5; $i++)
                                            <i class="fa fa-star" style="color: #000;"></i>
                                        @endfor
                                    @endif
                                    <span class="rating-count">({{ number_format($averageRating, 1) }})</span>
                                </div>

                                @php
                                    if ($product->discount_type == 1) {
                                        $price_after_discount = $product->regular_price - $product->discount_price;
                                    } elseif ($product->discount_type == 2) {
                                        $price_after_discount = $product->regular_price - ($product->regular_price * $product->discount_price) / 100;
                                    }
                                @endphp

                                <div class="product__price d-flex justify-space-between">
                                    @if ($product->discount_price > 0)
                                        <div class="special__price">৳{{ $price_after_discount }}</div>
                                        <div class="old__price">
                                            <del>৳{{ $product->regular_price }}</del>
                                        </div>
                                    @else
                                        <div class="special__price">৳{{ $product->regular_price }}</div>
                                    @endif
                                </div>

                            </div>
                            <div class="product__view__add">
                                <input type="hidden" id="pfrom" value="direct">
                                <input type="hidden" id="product_product_id" value="{{ $product->id }}" min="1">
                                <input type="hidden" id="{{ $product->id }}-product_pname" value="{{ $product->name_en }}">
                                <input type="hidden" id="buyNowCheck" value="0">
                                @if ($product->is_varient == 1)
                                    @if ($maintenance == 1)
                                        <a class="add" data-bs-toggle="modal" data-bs-target="#maintenance"><i
                                            class="fi-rs-shopping-cart mr-5"></i>Add To Cart</a>

                                        <a class="add" data-bs-toggle="modal" data-bs-target="#maintenance"><i
                                                class="fi-rs-shopping-cart mr-5"></i>Buy Now</a>
                                    @else
                                        <a class="add" id="{{ $product->id }}" onclick="productView(this.id)"
                                            data-bs-toggle="modal" data-bs-target="#quickViewModal"><i
                                                class="fi-rs-shopping-cart mr-5"></i>Add To Cart</a>

                                        <a class="add" id="{{ $product->id }}" onclick="productView(this.id)"
                                            data-bs-toggle="modal" data-bs-target="#quickViewModal"><i
                                                class="fi-rs-shopping-cart mr-5"></i>Buy Now</a>
                                    @endif
                                @else
                                    @if ($maintenance == 1)
                                        <a class="add" data-bs-toggle="modal" data-bs-target="#maintenance"><i
                                           class="fi-rs-shopping-cart mr-5"></i>Add To Cart</a>

                                        <a class="add" data-bs-toggle="modal" data-bs-target="#maintenance"><i
                                            class="fi-rs-shopping-cart mr-5"></i>Buy Now</a>
                                    @else
                                        <a class="add" onclick="addToCartDirect({{ $product->id }})"><i
                                                class="fi-rs-shopping-cart mr-5"></i>Add To Cart</a>

                                        <a class="add" onclick="buyNow({{$product->id}})"><i
                                            class="fi-rs-shopping-cart mr-5"></i>Buy Now</a>
                                    @endif
                                @endif
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
    {{-- feature end --}}

    {{-- Top Selling Product start --}}
    <div class="feature__product section-padding">
        <div class="container">
            <div class="section__top bg-black">
                <h6 class="text-white text-capitalize">
                    @if (session()->get('language') == 'bangla')
                        টপ সেলিং পণ্য
                    @else
                        Top Selling Products
                    @endif
                </h6>
                <a href="{{ route('topselling.product') }}" class="text-white text-end d-block text-capitalize fs-6" style="font-weight: 600">View
                    all</a>
            </div>

            <div class="top__product border p-3">
                @foreach ($TopSellingProducts as $product)
                    <div class="single__product__item border">
                        @php
                            $couponCode = getCoupon();
                            $coupon = \App\Models\Coupon::where('coupon_code', $couponCode)->first();
                            $showCoupon = false;
                            if ($coupon && $coupon->product_id != null) {
                                $couponProductIds = explode(',', $coupon->product_id);
                                if (in_array($product->id, $couponProductIds)) {
                                    $showCoupon = true;
                                }
                            }
                        @endphp
                        @if ($showCoupon)
                            <span class="coupon_code">Coupon: {{ $couponCode }}</span>
                        @endif
                        <div class="product__image position-relative">
                            <a href="{{ route('product.details', $product->slug) }}" class="product__item__photo">
                                <img src="{{ asset($product->product_thumbnail) }}" alt="">
                            </a>

                            <div class="product__discount__price d-flex">
                                @if ($product->created_at >= Carbon\Carbon::now()->subWeek())
                                    <div class="product__labels">
                                        <div class="product__label new__label">New</div>
                                    </div>
                                @endif

                                @if ($product->discount_price > 0)
                                    <div class="product__labels d-flex">
                                        @if ($product->discount_type == 1)
                                            <div class="product__label sale__label">৳{{ $product->discount_price }} off
                                            </div>
                                        @elseif($product->discount_type == 2)
                                            <div class="product__label sale__label">{{ $product->discount_price }}% off
                                            </div>
                                        @endif
                                    </div>
                                @endif
                            </div>

                            <div class="product__item__action">
                                <a href="#" id="{{ $product->id }}" onclick="productView(this.id)"
                                    data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fa fa-eye"></i></a>
                            </div>
                        </div>
                        <div class="product__details">
                            <div class="product__details__top">
                                <strong class="product__name">
                                    <a href="{{ route('product.details', $product->slug) }}" class="product__link">
                                        @if (session()->get('language') == 'bangla')
                                            {{ Str::limit($product->name_bn, 50) }}
                                        @else
                                            {{ Str::limit($product->name_en, 50) }}
                                        @endif
                                    </a>
                                </strong>
                                <div class="product-category">
                                    <span rel="tag">
                                        {{ $product->brand->name_en ?? 'No Brand' }}
                                    </span>
                                </div>

                                @php
                                    $reviews = \App\Models\Review::where('product_id', $product->id)
                                        ->where('status', 1)
                                        ->get();
                                    $averageRating = $reviews->avg('rating');
                                    $ratingCount = $reviews->count(); // Add this line to get the rating count
                                @endphp

                                <div class="product__rating">
                                    @if ($reviews->isNotEmpty())
                                        @for ($i = 1; $i <= 5; $i++)
                                            @if ($i <= floor($averageRating))
                                                <i class="fa fa-star" style="color: #FFB811;"></i>
                                            @elseif ($i == ceil($averageRating) && $averageRating - floor($averageRating) >= 0.5)
                                                {{-- Display a half-star with gradient --}}
                                                <i class="fa fa-star"
                                                    style="background: linear-gradient(to right, #FFB811 50%, gray 50%); -webkit-background-clip: text; color: transparent;"></i>
                                            @else
                                                <i class="fa fa-star" style="color: #000;"></i>
                                            @endif
                                        @endfor
                                    @else
                                        @for ($i = 1; $i <= 5; $i++)
                                            <i class="fa fa-star" style="color: #000;"></i>
                                        @endfor
                                    @endif
                                    <span class="rating-count">({{ number_format($averageRating, 1) }})</span>
                                </div>

                                @php
                                    if ($product->discount_type == 1) {
                                        $price_after_discount = $product->regular_price - $product->discount_price;
                                    } elseif ($product->discount_type == 2) {
                                        $price_after_discount = $product->regular_price - ($product->regular_price * $product->discount_price) / 100;
                                    }
                                @endphp

                                <div class="product__price d-flex justify-space-between">
                                    @if ($product->discount_price > 0)
                                        <div class="special__price">৳{{ $price_after_discount }}</div>
                                        <div class="old__price">
                                            <del>৳{{ $product->regular_price }}</del>
                                        </div>
                                    @else
                                        <div class="special__price">৳{{ $product->regular_price }}</div>
                                    @endif
                                </div>

                            </div>
                            <div class="product__view__add">
                                <input type="hidden" id="pfrom" value="direct">
                                <input type="hidden" id="product_product_id" value="{{ $product->id }}" min="1">
                                <input type="hidden" id="{{ $product->id }}-product_pname" value="{{ $product->name_en }}">
                                <input type="hidden" id="buyNowCheck" value="0">
                                @if ($product->is_varient == 1)
                                    @if ($maintenance == 1)
                                        <a class="add" data-bs-toggle="modal" data-bs-target="#maintenance"><i
                                            class="fi-rs-shopping-cart mr-5"></i>Add To Cart</a>

                                        <a class="add" data-bs-toggle="modal" data-bs-target="#maintenance"><i
                                                class="fi-rs-shopping-cart mr-5"></i>Buy Now</a>
                                    @else
                                        <a class="add" id="{{ $product->id }}" onclick="productView(this.id)"
                                            data-bs-toggle="modal" data-bs-target="#quickViewModal"><i
                                                class="fi-rs-shopping-cart mr-5"></i>Add To Cart</a>

                                        <a class="add" id="{{ $product->id }}" onclick="productView(this.id)"
                                            data-bs-toggle="modal" data-bs-target="#quickViewModal"><i
                                                class="fi-rs-shopping-cart mr-5"></i>Buy Now</a>
                                    @endif
                                @else
                                    @if ($maintenance == 1)
                                        <a class="add" data-bs-toggle="modal" data-bs-target="#maintenance"><i
                                           class="fi-rs-shopping-cart mr-5"></i>Add To Cart</a>

                                        <a class="add" data-bs-toggle="modal" data-bs-target="#maintenance"><i
                                            class="fi-rs-shopping-cart mr-5"></i>Buy Now</a>
                                    @else
                                        <a class="add" onclick="addToCartDirect({{ $product->id }})"><i
                                                class="fi-rs-shopping-cart mr-5"></i>Add To Cart</a>

                                        <a class="add" onclick="buyNow({{$product->id}})"><i
                                            class="fi-rs-shopping-cart mr-5"></i>Buy Now</a>
                                    @endif
                                @endif
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
    {{-- Top Selling Product end --}}

    {{-- banner start --}}
    <!--End category slider-->
    <section class="banners mb-25">
        <div class="container">
            <div class="row gy-3">
                @foreach ($home_banners->take(3) as $banner)
                    <div class="col-md-4 col-12">
                        <div class="banner-img wow animate__animated animate__fadeInUp w-100" data-wow-delay="0">
                            <a href="javascript:void(0)">
                                <img src="{{ asset($banner->banner_img) }}" class="img-fluid w-100"
                                    alt="
                        @if (session()->get('language') == 'bangla') {{ $banner->title_bn }}
                        @else
                        {{ $banner->title_en }} @endif
                        ">
                            </a>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </section>
    <!--End banners-->
    {{-- banner end --}}

    {{-- New Arrival Product start --}}
    @if (isset($NewArrivalProducts) && count($NewArrivalProducts) > 0)
        <div class="feature__product section-padding">
            <div class="container">
                <div class="section__top bg-black">
                    <h6 class="text-white text-capitalize">
                        @if (session()->get('language') == 'bangla')
                            নতুন আগমন পণ্য
                        @else
                            New Arrival Product
                        @endif
                    </h6>
                    <a href="{{ route('newarrival.product') }}" class="text-white text-end d-block text-capitalize fs-6"
                        style="font-weight: 600">View
                        all</a>
                </div>

                <div class="arrival__product border p-3">
                    @foreach ($NewArrivalProducts as $product)
                        <div class="single__product__item border">
                            @php
                                $couponCode = getCoupon();
                                $coupon = \App\Models\Coupon::where('coupon_code', $couponCode)->first();
                                $showCoupon = false;
                                if ($coupon && $coupon->product_id != null) {
                                    $couponProductIds = explode(',', $coupon->product_id);
                                    if (in_array($product->id, $couponProductIds)) {
                                        $showCoupon = true;
                                    }
                                }
                            @endphp
                            @if ($showCoupon)
                                <span class="coupon_code">Coupon: {{ $couponCode }}</span>
                            @endif
                            <div class="product__image position-relative">
                                <a href="{{ route('product.details', $product->slug) }}" class="product__item__photo">
                                    <img src="{{ asset($product->product_thumbnail) }}" alt="">
                                </a>

                                <div class="product__discount__price d-flex">
                                    @if ($product->created_at >= Carbon\Carbon::now()->subWeek())
                                        <div class="product__labels">
                                            <div class="product__label new__label">New</div>
                                        </div>
                                    @endif

                                    @if ($product->discount_price > 0)
                                        <div class="product__labels d-flex">
                                            @if ($product->discount_type == 1)
                                                <div class="product__label sale__label">৳{{ $product->discount_price }}
                                                    off
                                                </div>
                                            @elseif($product->discount_type == 2)
                                                <div class="product__label sale__label">{{ $product->discount_price }}%
                                                    off
                                                </div>
                                            @endif
                                        </div>
                                    @endif
                                </div>

                                <div class="product__item__action">
                                    <a href="#" id="{{ $product->id }}" onclick="productView(this.id)"
                                        data-bs-toggle="modal" data-bs-target="#quickViewModal"><i
                                            class="fa fa-eye"></i></a>
                                </div>
                            </div>
                            <div class="product__details">
                                <div class="product__details__top">
                                    <strong class="product__name">
                                        <a href="{{ route('product.details', $product->slug) }}" class="product__link">
                                            @if (session()->get('language') == 'bangla')
                                                {{ Str::limit($product->name_bn, 50) }}
                                            @else
                                                {{ Str::limit($product->name_en, 50) }}
                                            @endif
                                        </a>
                                    </strong>
                                    <div class="product-category">
                                        <span rel="tag">
                                            {{ $product->brand->name_en ?? 'No Brand' }}
                                        </span>
                                    </div>

                                    @php
                                        $reviews = \App\Models\Review::where('product_id', $product->id)
                                            ->where('status', 1)
                                            ->get();
                                        $averageRating = $reviews->avg('rating');
                                        $ratingCount = $reviews->count();
                                    @endphp

                                    <div class="product__rating">
                                        @if ($reviews->isNotEmpty())
                                            @for ($i = 1; $i <= 5; $i++)
                                                @if ($i <= floor($averageRating))
                                                    <i class="fa fa-star" style="color: #FFB811;"></i>
                                                @elseif ($i == ceil($averageRating) && $averageRating - floor($averageRating) >= 0.5)
                                                    {{-- Display a half-star with gradient --}}
                                                    <i class="fa fa-star"
                                                        style="background: linear-gradient(to right, #FFB811 50%, gray 50%); -webkit-background-clip: text; color: transparent;"></i>
                                                @else
                                                    <i class="fa fa-star" style="color: #000;"></i>
                                                @endif
                                            @endfor
                                        @else
                                            @for ($i = 1; $i <= 5; $i++)
                                                <i class="fa fa-star" style="color: #000;"></i>
                                            @endfor
                                        @endif
                                        <span class="rating-count">({{ number_format($averageRating, 1) }})</span>
                                    </div>

                                    @php
                                        if ($product->discount_type == 1) {
                                            $price_after_discount = $product->regular_price - $product->discount_price;
                                        } elseif ($product->discount_type == 2) {
                                            $price_after_discount = $product->regular_price - ($product->regular_price * $product->discount_price) / 100;
                                        }
                                    @endphp

                                    <div class="product__price d-flex justify-space-between">
                                        @if ($product->discount_price > 0)
                                            <div class="special__price">৳{{ $price_after_discount }}</div>
                                            <div class="old__price">
                                                <del>৳{{ $product->regular_price }}</del>
                                            </div>
                                        @else
                                            <div class="special__price">৳{{ $product->regular_price }}</div>
                                        @endif
                                    </div>

                                </div>
                                <div class="product__view__add">
                                    <input type="hidden" id="pfrom" value="direct">
                                    <input type="hidden" id="product_product_id" value="{{ $product->id }}" min="1">
                                    <input type="hidden" id="{{ $product->id }}-product_pname" value="{{ $product->name_en }}">
                                    <input type="hidden" id="buyNowCheck" value="0">
                                    @if ($product->is_varient == 1)
                                        @if ($maintenance == 1)
                                            <a class="add" data-bs-toggle="modal" data-bs-target="#maintenance"><i
                                                class="fi-rs-shopping-cart mr-5"></i>Add To Cart</a>
    
                                            <a class="add" data-bs-toggle="modal" data-bs-target="#maintenance"><i
                                                    class="fi-rs-shopping-cart mr-5"></i>Buy Now</a>
                                        @else
                                            <a class="add" id="{{ $product->id }}" onclick="productView(this.id)"
                                                data-bs-toggle="modal" data-bs-target="#quickViewModal"><i
                                                    class="fi-rs-shopping-cart mr-5"></i>Add To Cart</a>
    
                                            <a class="add" id="{{ $product->id }}" onclick="productView(this.id)"
                                                data-bs-toggle="modal" data-bs-target="#quickViewModal"><i
                                                    class="fi-rs-shopping-cart mr-5"></i>Buy Now</a>
                                        @endif
                                    @else
                                        @if ($maintenance == 1)
                                            <a class="add" data-bs-toggle="modal" data-bs-target="#maintenance"><i
                                               class="fi-rs-shopping-cart mr-5"></i>Add To Cart</a>
    
                                            <a class="add" data-bs-toggle="modal" data-bs-target="#maintenance"><i
                                                class="fi-rs-shopping-cart mr-5"></i>Buy Now</a>
                                        @else
                                            <a class="add" onclick="addToCartDirect({{ $product->id }})"><i
                                                    class="fi-rs-shopping-cart mr-5"></i>Add To Cart</a>
    
                                            <a class="add" onclick="buyNow({{$product->id}})"><i
                                                class="fi-rs-shopping-cart mr-5"></i>Buy Now</a>
                                        @endif
                                    @endif
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    @endif
    {{-- New Arrival Product end --}}

    {{-- popular category start --}}
    <div class="popular__category">
        <div class="container">
            <div class="section__top bg-black">
                <h6 class="text-white text-capitalize">
                    @if (session()->get('language') == 'bangla')
                        জনপ্রিয় বিভাগ
                    @else
                        POPULAR CATEGORIES
                    @endif
                </h6>
                <a href="" class="text-white text-end d-block text-capitalize fs-6"
                    style="font-weight: 600">View
                    all</a>
            </div>

            <div class="position-relative">
                <div class="popular__category__active">
                    @foreach ($categories as $category)
                        <a href="{{ route('product.category', $category->slug) }}" class="single__category__item">
                            @if ($category->image)
                                <img src="{{ asset($category->image) }}" width="100%" alt="">
                            @else
                                <img src="{{ asset('upload/product-default.jpg') }}" width="100%" alt="">
                            @endif
                            <span>
                                @if (session()->get('language') == 'bangla')
                                    {{ Str::limit($category->name_bn, 20) }}
                                @else
                                    {{ Str::limit($category->name_en, 20) }}
                                @endif
                            </span>
                        </a>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
    {{-- popular category end --}}

    {{-- banner start --}}
    <!--End category slider-->
    <section class="banners mb-25 mt-30">
        <div class="container">
            <div class="row gy-3">
                @foreach ($home_banners_1 as $banner)
                    <div class="col-md-4 col-12">
                        <div class="banner-img wow animate__animated animate__fadeInUp w-100" data-wow-delay="0">
                            <a href="javascript:void(0)">
                                <img src="{{ asset($banner->banner_img) }}" class="img-fluid w-100" alt="">
                            </a>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </section>
    <!--End banners-->
    {{-- banner end --}}

    {{-- banner start --}}
    <!--End category slider-->
    <section class="banners mb-25 mt-30">
        <div class="container">
            <div class="row gy-3">
                @foreach ($home_banners_2 as $banner)
                    <div class="col-md-4 col-12">
                        <div class="banner-img wow animate__animated animate__fadeInUp" data-wow-delay="0">
                            <a href="#">
                                <img src="{{ asset($banner->banner_img) }}" class="img-fluid" alt="">
                            </a>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </section>
    <!--End banners-->
    {{-- banner end --}}


    {{-- blog start --}}
    <div class="blog-area section-padding">
        <div class="container">
            <div class="section__top bg-black">
                <h6 class="text-white text-capitalize">
                    @if (session()->get('language') == 'bangla')
                        ব্লগ
                    @else
                        BLOG
                    @endif
                </h6>
                <a href="" class="text-white text-end d-block text-capitalize fs-6" style="font-weight: 600">View
                    all</a>
            </div>
            <div class="blog__active">
                @foreach ($blogs as $blog)
                    <div class="single__blog">
                        <a href="{{ route('blog.details', $blog->slug) }}">
                            <img src="{{ asset($blog->blog_img) }}" width="100%" alt="">
                        </a>

                        <div class="blog__content">
                            <a href="{{ route('blog.details', $blog->slug) }}" class="blog__title">
                                @if (session()->get('language') == 'bangla')
                                    {{ Str::limit($blog->title_bn, 30) }}
                                @else
                                    {{ Str::limit($blog->title_en, 30) }}
                                @endif
                            </a>
                            <a class="blog__btn" href="{{ route('blog.details', $blog->slug) }}">read more</a>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
    {{-- blog end --}}

    {{-- benifit start --}}
    <div class="benifit-area section-padding">
        <div class="container">
            <div class="single__benefit benifit__active">
                <div class="benifi__item">
                    <div class="benefit__icon">
                        <img src="{{ asset('upload/benifit/exchange.png') }}" alt="">
                    </div>
                    <div class="benefit__info">
                        <div class="item-title">EXCHANGE POLICY
                        </div>
                        <div class="item-des">Fast & Hassle Free
                        </div>
                    </div>
                </div>
                <div class="benifi__item">
                    <div class="benefit__icon">
                        <img src="{{ asset('upload/benifit/support.png') }}" alt="">
                    </div>
                    <div class="benefit__info">
                        <div class="item-title">ONLINE SUPPORT
                        </div>
                        <div class="item-des">24/7 Everyday
                        </div>
                    </div>
                </div>
                <div class="benifi__item">
                    <div class="benefit__icon">
                        <img src="{{ asset('upload/benifit/payment.png') }}" alt="">
                    </div>
                    <div class="benefit__info">
                        <div class="item-title">PAYMENT METHOD
                        </div>
                        <div class="item-des">bKash, Credit Card
                        </div>
                    </div>
                </div>
                <div class="benifi__item">
                    <div class="benefit__icon">
                        <img src="{{ asset('upload/benifit/halal.png') }}" alt="">
                    </div>
                    <div class="benefit__info">
                        <div class="item-title">100% Original Products
                        </div>
                    </div>
                </div>
                <div class="benifi__item">
                    <div class="benefit__icon">
                        <img src="{{ asset('upload/benifit/fast.png') }}" alt="">
                    </div>
                    <div class="benefit__info">
                        <div class="item-title">Fast Delivery
                        </div>
                    </div>
                </div>
                <div class="benifi__item">
                    <div class="benefit__icon">
                        <img src="{{ asset('upload/benifit/track.png') }}" alt="">
                    </div>
                    <div class="benefit__info">
                        <div class="item-title">Track Parcel
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    {{-- benifit end --}}

    <script src="{{ asset('frontend/assets/js/vendor/jquery-3.6.0.min.js') }}"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <script>
        $('.category__product__slider').owlCarousel({
            loop: false,
            margin: 10,
            items: 5,
            nav: true,
            navText: ['<i class="fa fa-chevron-left"></i>', '<i class="fa fa-chevron-right"></i>'],
            responsive: {
                0: {
                    items: 1
                },
                480: {
                    items: 2
                },
                600: {
                    items: 2
                },
                1000: {
                    items: 2
                },
                1200: {
                    items: 4
                },
                1400: {
                    items: 5
                }
            }
        });


        $(function(e) {
            "use strict";
            e(".bottom__category__product").slick({
                slidesToShow: 6,
                slidesToScroll: 1,
                arrows: true,
                infinite: false,
                autoplay: true,
                rows: 2,
                dots: false,
                appendArrows: e(".feature__arrow"),
                prevArrow: '<button><i class="fa-solid fa-chevron-left"></i></button>',
                nextArrow: '<button><i class="fa-solid fa-chevron-right"></i></button>',
                responsive: [{
                        breakpoint: 1200,
                        settings: {
                            slidesToShow: 4,
                        }
                    },
                    {
                        breakpoint: 1000,
                        settings: {
                            slidesToShow: 3,
                        }
                    },
                    {
                        breakpoint: 800,
                        settings: {
                            slidesToShow: 2,
                        }
                    },
                    {
                        breakpoint: 480,
                        settings: {
                            slidesToShow: 2
                        }
                    }

                ]
            })
        });
    </script>

    <?php
    $maintenance = getMaintenance(); // Replace this with your actual variable value
    if ($maintenance == 1) {
        echo '<script type="text/javascript">
                $(window).on("load", function() {
                    if ($(window).width() <= 991) {
                        $("#myModal").modal("show");
                    }
                });
            </script>';
    }
    ?>
@endsection