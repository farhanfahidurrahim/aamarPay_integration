<?php

use Illuminate\Support\Facades\Route;
//======= Use A Frontend Controller =======*/
use App\Http\Middleware\UserMiddleware;
use App\Http\Controllers\Frontend\CartController;
use App\Http\Controllers\Frontend\UserController;
use App\Http\Controllers\Backend\RefundController;
use App\Http\Controllers\Frontend\BkashController;
use App\Http\Controllers\Frontend\NagadController;
use App\Http\Controllers\Backend\CompareController;
use App\Http\Controllers\Backend\ReturnsController;
use App\Http\Controllers\Frontend\ReviewController;
use App\Http\Controllers\Frontend\ProductController;
use App\Http\Controllers\Frontend\AamarpayController;
use App\Http\Controllers\Frontend\CategoryController;
use App\Http\Controllers\Frontend\CheckoutController;
use App\Http\Controllers\Frontend\FrontendController;
use App\Http\Controllers\Frontend\LanguageController;
use App\Http\Controllers\Backend\SubscriberController;
use App\Http\Controllers\Frontend\AttributeController;
use App\Http\Controllers\Frontend\PublicSslCommerzPaymentController;


/*================== Frontend All Route ==============*/
Route::get('/', [FrontendController::class, 'index'])->name('home');
Route::get('/home2', [FrontendController::class, 'index2'])->name('home2');

Route::middleware([UserMiddleware::class])->group(function () {
    Route::get('/dashboard',[UserController::class, 'index'])->name('dashboard');
});

Route::get('/refresh-csrf', function() {
    return csrf_token();
});

/* ==================== Start User dashboard Route ================== */
// Route::get('/dashboard',[UserController::class, 'index'])->name('dashboard')->middleware('web');

/* ====================  User Order Route ================== */
Route::get('/user/orders/{invoice_no}',[UserController::class, 'orderView'])->name('order.view');
/* ==================== End User dashboard Route ================== */


/*================== Multi Language All Routes ==============*/
Route::get('/language/bangla', [LanguageController::class, 'Bangla'])->name('bangla.language');

Route::get('/language/english', [LanguageController::class, 'English'])->name('english.language');

// All Category List start
Route::get('/categories',[CategoryController::class, 'index'])->name('category_list.index');
// All Category List end


/* =============== Product Search  ============= */
Route::post('/product/search', [FrontendController::class, 'productSearch'])->name('product.search');
/* =============== Advance Search ============= */
Route::post('search-product', [FrontendController::class, 'advanceProduct']);

/* =============== Hot Deals  ============= */
Route::get('/hot-deals', [FrontendController::class, 'hotDeals'])->name('hot_deals.all');

/* =============== Campaign  ============= */
Route::get('/campaign', [FrontendController::class, 'Campaign'])->name('campaign.all');

// category wise product show
Route::get('/category/{categoryId}', [FrontendController::class,'showProductsByCategory'])->name('category.products');


/* ===============  Category Wise Product Show  ============= */
Route::get('/category-product/{slug}',[FrontendController::class, 'CatWiseProduct'])->name('product.category');

/* ===============  Vendor Wise Product Show  ============= */
Route::get('/vendor-product/{slug}',[FrontendController::class, 'VendorWiseProduct'])->name('vendor.product');

/* ===============  Tag Wise Product Show  ============= */
Route::get('/tag-product/{id}/{slug}',[FrontendController::class, 'TagWiseProduct'])->name('product.tag');
/* =============== Product Details Show ============= */
Route::get('product-details/{slug}',[FrontendController::class, 'productDetails'])->name('product.details');

/* ===============  AllFeatured Product Show  ============= */
Route::get('/all-featured-product',[FrontendController::class, 'AllFeaturedProduct'])->name('featured.product');

/* ===============  TopSelling Product Show  ============= */
Route::get('/top-selling-product',[FrontendController::class, 'TopSellingProduct'])->name('topselling.product');

/* ===============  NewArrival Product Show  ============= */
Route::get('/new-arrival-product',[FrontendController::class, 'NewArrivalProduct'])->name('newarrival.product');

// Page Setting
Route::get('/page/{slug}',[FrontendController::class, 'pageAbout'])->name('page.about');
Route::get('/order-tracking',[FrontendController::class, 'orderTracking'])->name('order.tracking');
Route::Post('/order-track',[FrontendController::class, 'orderTrack'])->name('order.track');
Route::get('/return-policy',[FrontendController::class, 'returnPolicy'])->name('return.policy');
Route::get('/refund-policy',[FrontendController::class, 'refundPolicy'])->name('refund.policy');

/* =============== Start Product View Modal With Ajax ============== */
Route::get('/product/view/modal/{id}',[FrontendController::class,'ProductViewAjax']);
/* ============ Start Add To Cart Store Data Withn Ajax  ============= */
Route::post('/cart/data/store/{id}',[CartController::class, 'AddToCart'])->name('cart.add');
/* ============ Start Mini Cart With Ajax  ============= */
Route::get('/product/mini/cart',[CartController::class,'AddMiniCart'])->name('minicart.add');
Route::get('/minicart/product-remove/{rowId}',[CartController::class,'RemoveMiniCart'])->name('minicart.remove');


/* ============ Cart Show   ============= */
Route::get('/cart',[CartController::class,'index'])->name('cart.show');
/* ============ Cart Coupon Get   ============= */
Route::get('/coupon/get',[CheckoutController::class,'coupon_get'])->name('coupon.get');
/* ============ Cart Get Product   ============= */
Route::get('/get-cart-product', [CartController::class, 'getCartProduct'])->name('getcart.product');
/* ============  Cart Increment  ============= */
Route::get('/cart-increment/{rowId}', [CartController::class, 'cartIncrement'])->name('cart.decrement');
/* ============  Cart Decrement  ============= */
Route::get('/cart-decrement/{rowId}', [CartController::class, 'cartDecrement'])->name('cart.decrement');
/* ============ Cart Remove   ============= */
Route::get('/cart-remove/{rowId}', [CartController::class, 'removeCartProduct'])->name('cart.remove');
/* ============ All Cart Remove   ============= */
Route::get('/cart/all-delete',[CartController::class,'destroy'])->name('cart.remove.all');
/* ============  Cart Checkout   ============= */
Route::get('/checkout',[CheckoutController::class,'index'])->name('checkout');
Route::post('/checkout/payment',[CheckoutController::class,'payment'])->name('checkout.payment');
/* ============ Cart Checkout Product   ============= */
Route::get('/checkout-product', [CheckoutController::class, 'getCheckoutProduct'])->name('checktout.product');
/* ============  Checkout Store   ============= */
Route::post('/checkout/store',[CheckoutController::class,'store'])->name('checkout.store');
Route::get('/checkout/success/{id}',[CheckoutController::class,'show'])->name('checkout.success');

Route::get('/checkout/shipping/ajax/{shipping_cost}',[CheckoutController::class,'shippingAjax'])->name('checkout.shippingAjax');

/*================  Ajax  ==================*/
Route::get('/division-district/ajax/{division_id}',[CheckoutController::class,'getdivision'])->name('division.ajax');
Route::get('/district-upazilla/ajax/{district_id}',[CheckoutController::class,'getupazilla'])->name('upazilla.ajax');
/*================  Ajax  ==================*/

/* ============  All Product Show   ============= */
Route::get('/product/shop',[ProductController::class,'index'])->name('product.show');
/* =============== sort_by  ============= */
Route::get('/search', [ProductController::class, 'sort_by'])->name('sort_by.search');
// Attribute Data fetch
Route::get('/attribute-data',[AttributeController::class,'index'])->name('attribute.index');

//============ User Set Default Start ============//
Route::resource('/user', UserController::class);
Route::post('/user/profile/update', [UserController::class, 'userProfileUpdate'])->name('user.profile.update');
// User Dashboard
Route::post('/user/password/update', [UserController::class, 'UserPasswordUpdate'])->name('user-passwordupdate');
//=========== User Addresses all Route Start ============//
Route::post('/user/address/store', [UserController::class, 'store'])->name('user.address.store');
/*================  Ajax Brand Store ==================*/
Route::post('/address/store',[UserController::class,'getAddressStore'])->name('address.ajax.store');

Route::get('user/addresses/delete/{id}', [UserController::class, 'address_destroy'])->name('user.addresses.destroy');
// Set_Default Show //
Route::get('/addresses/set_default/{id}', [UserController::class, 'set_default'])->name('addresses.set_default');
// Address Realtionship Division/District/Upazilla Show Data Ajax //
Route::get('/address/ajax/{address_id}',[UserController::class,'getAddress'])->name('address.ajax');
//=========== User Addresses all Route End ============//

Route::get('/varient-price/{id}/{varient}',[ProductController::class, 'getVarient'])->name('varient.price');

//============ User Set Default Start ============//

// Route::get('/dashboard', function () {
//     return view('dashboard');
// })->middleware(['auth'])->name('dashboard');

//Nagad
Route::get('/nagad/callback', [NagadController::class, 'verify'])->name('nagad.callback');

// bKash
Route::post('/bkash/create', [BkashController::class, 'checkout'])->name('bkash.checkout');
Route::get('/bkash/callback', [BkashController::class, 'callback'])->name('bkash.callback');
Route::get('/bkash/success', [BkashController::class, 'success'])->name('bkash.success');
Route::get('/payment/error', [BkashController::class, 'error'])->name('bkash.error');

// sslcommerz
Route::get('/sslcommerz/pay', [PublicSslCommerzPaymentController::class, 'index']);
Route::POST('/sslcommerz/success', [PublicSslCommerzPaymentController::class, 'success']);
Route::POST('/sslcommerz/fail', [PublicSslCommerzPaymentController::class, 'fail']);
Route::POST('/sslcommerz/cancel', [PublicSslCommerzPaymentController::class, 'cancel']);
Route::POST('/sslcommerz/ipn', [PublicSslCommerzPaymentController::class, 'ipn']);

//aamarpay
Route::post('/aamarpay/success', [AamarpayController::class, 'success'])->name('aamarpay.success');
Route::post('/aamarpay/fail', [AamarpayController::class, 'fail'])->name('aamarpay.fail');

//Subscribers
Route::POST('/subscribers/store', [SubscriberController::class, 'store'])->name('subscribers.store');

// Compare
Route::get('/compare', 'CompareController@index')->name('compare');
Route::get('/compare/reset', 'CompareController@reset')->name('compare.reset');
Route::post('/compare/addToCompare', 'CompareController@addToCompare')->name('compare.addToCompare');


require __DIR__.'/auth.php';

//contact
Route::get('/contact',[FrontendController::class,'contact'])->name('contact.page');
Route::post('/contact/store',[FrontendController::class,'store'])->name('contact.store');

//blog
Route::get('blog-details/{slug}',[FrontendController::class,'blogDetails'])->name('blog.details');
Route::post('/review/store',[ReviewController::class,'store'])->name('review.store');

// hot deals
// Route::get('hot-deals',[FrontendController::class, 'hot_deals'])->name('hot.deals');


//Return Product
Route::POST('/return/store', [ReturnsController::class, 'store'])->name('return.store');
Route::get('show-return/{id}',[ReturnsController::class,'show' ])->name('return.show');
Route::get('/delete-return/{id}', [ReturnsController::class, 'destroy'])->name('return.delete');



//Return Product
Route::POST('/refund/store', [RefundController::class, 'store'])->name('refund.store');
Route::get('show-refund/{id}',[RefundController::class,'show' ])->name('refund.show');
Route::get('/delete/{id}', [RefundController::class, 'destroy'])->name('refund.delete');