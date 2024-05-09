 <header class="main-header navbar">
    <div class="col-search">
        <a class="nav-link d-inline-block" target="_blank" href="{{ route('home') }}"><i class="fas fa-globe me-2"></i>Visit Site</a>

        <a class="btn btn-sm btn-danger nav-link d-inline-block" href="{{ route('cache.clear')}}"><i class="fa-solid fa-shower me-2"></i>Clear Cache</a>
        </a>

        <a class="btn btn-sm btn-success nav-link d-inline-block" href="{{ route('pos.index') }}"><i class="material-icons md-post_add"></i>POS</a></a>
    </div>
    <div class="col-nav">
        <button class="btn btn-icon btn-mobile me-auto" data-trigger="#offcanvas_aside"><i class="material-icons md-apps"></i></button>
        <ul class="nav">
            <li class="nav-item">
                <form method="post" action="{{ route('update.color') }}" enctype="multipart/form-data">
                    @csrf


                    {{-- @if (App\Http\Setting::color == 0) --}}
                        {{-- <input type="hidden" name="color" value="1">
                        <button class="btn btn-dark btn-switcher shadow-sm" type="submit" data-bs-toggle="offcanvas"
                            data-bs-target="#offcanvasScrolling" aria-controls="offcanvasScrolling"><i
                                class="lni lni-night"></i> <br><span>Dark</span> </button> --}}
                    {{-- @else --}}
                        {{-- <input type="hidden" name="color" value="0">
                        <button class="btn btn-light btn-switcher" type="submit" data-bs-toggle="offcanvas"
                            data-bs-target="#offcanvasScrolling" aria-controls="offcanvasScrolling"
                            style="background-color: #f1f1f1;color: black;"><i
                                class="lni lni-sun"></i><br><span>light</span></button> --}}
                    {{-- @endif --}}
                </form>
            </li>
             <li class="nav-item">
                <a class="nav-link btn-icon darkmode" href="#"> <i class="material-icons md-nights_stay"></i> </a>
            </li>
             {{-- <li class="nav-item">
                <a href="#" class="requestfullscreen nav-link btn-icon"><i class="material-icons md-cast"></i></a>
            </li> --}}
            <?php
                use App\Models\User;
                $id = Auth::guard('admin')->user()->id;
                $adminData = User::find($id);
            ?>

            <li class="dropdown nav-item">
                <a class="dropdown-toggle" data-bs-toggle="dropdown" href="#" id="dropdownAccount" aria-expanded="false">
                    <img class="img-xs rounded-circle" src="{{ (!empty($adminData->profile_image))? url('upload/admin_images/'.$adminData->profile_image):url('upload/no_image.jpg') }}" alt="User Avatar"></a>
                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownAccount">
                    <a class="dropdown-item" href="{{ route('admin.profile') }}"><i class="material-icons md-perm_identity"></i>My Profile</a>
                    <a class="dropdown-item" href="#"><i class="material-icons md-settings"></i>Account Settings</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item text-danger" href="{{ route('admin.logout') }}"><i class="material-icons md-exit_to_app"></i>Logout</a>
                </div>
            </li>
        </ul>
    </div>
</header>