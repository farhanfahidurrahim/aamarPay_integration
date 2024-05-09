@extends('layouts.frontend')
@section('title')
    {{$page->name_en}}
@endsection
@section('content-frontend')
    <main class="main">
        <div class="page-header breadcrumb-wrap">
            <div class="container">
                <div class="breadcrumb">
                    <a href="{{ route('home')}}" rel="nofollow"><i class="fi-rs-home mr-5"></i>Home</a>
                    <span></span> Page
                    <span></span> {{$page->name_en}}
                </div>
            </div>
        </div>
        <div class="container mb-10 mt-20">
            <div class="row">
                <div class="col-lg-11 mb-40 mx-auto">
                    <div class="card py-4 px-3 shadow-sm">
                        <p class="">
                            @if(session()->get('language') == 'bangla')
                                {!! nl2br($page->description_bn) !!}
                            @else 
                                {!! nl2br($page->description_en) !!}
                            @endif
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </main>
@endsection