@include('user.layouts.header')
<div class="app-container">
    <!-- begin app-nabar -->
    @include('user.layouts.sidebar')
    <!-- end app-navbar -->
    <!-- begin app-main -->
    <div class="app-main" id="main">
        <!-- begin container-fluid -->
        <div class="container-fluid">
            <!-- begin row -->
            <div class="row">
                <div class="col-md-12 m-b-30">
                    <!-- begin page title -->
                    <div class="d-block d-sm-flex flex-nowrap align-items-center">
                        <div class="page-title mb-2 mb-sm-0">
                            <h1>Profile</h1>
                        </div>
                        <div class="ml-auto d-flex align-items-center">
                            <nav>
                                <ol class="breadcrumb p-0 m-b-0">
                                    <li class="breadcrumb-item">
                                        <a href="index.html"><i class="ti ti-home"></i></a>
                                    </li>
                                    <li class="breadcrumb-item">
                                        Pages
                                    </li>
                                    <li class="breadcrumb-item active text-primary" aria-current="page">Profile</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <!-- end page title -->
                </div>
            </div>
            <!-- end row -->

            <!--mail-Compose-contant-start-->
            <div class="row account-contant">
                <div class="col-12">
                    <div class="card card-statistics">
                        <div class="card-body p-0">
                            <div class="row no-gutters">
                                <div class="col-md-6 pb-xl-0 pb-5 border-right">
                                    <div class="page-account-profil pt-5">
                                        <div class="profile-img text-center rounded-circle">
                                            <div class="pt-5">
                                                <div class="bg-img m-auto">
                                                    <img src="{{ asset('dashboard/assets/img/avtar/01.jpg') }}" class="img-fluid" alt="users-avatar">
                                                </div>
                                                <div class="profile pt-4">
                                                    <h4 class="mb-1 text-capitalize">{{ $user['firstname'] }} {{ $user['middlename'] }} {{ $user['lastname'] }}</h4>
                                                    <p>{{ $user['email'] }}</p>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="py-5 profile-counter">
                                            <ul class="nav justify-content-center text-center">
                                                <li class="nav-item border-right px-3">
                                                    <div>
                                                        <h4 class="mb-0">${{ $user['currently_invested'] }}</h4>
                                                        <p>Currently Invested</p>
                                                    </div>
                                                </li>

                                                <li class="nav-item border-right px-3">
                                                    <div>
                                                        <h4 class="mb-0">{{ $transactions->count() }}</h4>
                                                        <p>Transactions</p>
                                                    </div>
                                                </li>

                                                <li class="nav-item border-right px-3">
                                                    <div>
                                                        <h4 class="mb-0">{{ $referrals->count() }}</h4>
                                                        <p>Referrals</p>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>

                                        <div class="profile-btn text-center">
                                            @if($user['kyc'] == 'pending')
                                            <div>
                                                <a href="/auth/kyc/verification" class="btn btn-danger text-light mb-2">KYC</a>
                                            </div>
                                            <p class="text-danger">
                                                Please proceed to upload your legal documents for verification
                                            </p>
                                            @endif
                                            @if($user['kyc'] == 'verified')
                                            <div>
                                                <span class="btn btn-success text-light mb-2" style="padding: 2px 7px; border-radius: 20px; font-style: italic; font-size: 15px">Verified</span>
                                            </div>
                                            <p class="text-success">
                                                Your document(s) has been verified successfully.
                                            </p>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                               
                                <div class="col-md-6 border-t col-12">
                                    <div class="page-account-form">
                                        <div class="form-titel border-bottom p-3">
                                            <h5 class="mb-0 py-2">Account Settings</h5>
                                        </div>
                                        <div class="p-4">
                                            <form class="page-form profile-form">
                                                <div class="form-group">
                                                    <label for="firstname">Firstname:</label>
                                                    <input type="text" class="form-control" name="firstname" placeholder="Enter firstname" value="{{ $user['firstname'] }}">
                                                </div>
                                                <div class="form-group">
                                                    <label for="middlename">Middlename:</label>
                                                    <input type="text" class="form-control" name="middlename" placeholder="Enter middlename" value="{{ $user['middlename'] }}">
                                                </div>

                                                <div class="form-group">
                                                    <label for="lastname">LastName:</label>
                                                    <input type="text" class="form-control" name="lastname" placeholder="Enter lastname" value="{{ $user['lastname'] }}">
                                                </div>
                                                <button type="submit" class="btn btn-primary">
                                                    <span class="form-loading d-none px-5">
                                                        <i class="fa fa-sync fa-spin"></i>
                                                    </span>
                                                    <span class='submit-text'>
                                                        Save Settings
                                                    </span>
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--mail-Compose-contant-end-->
        </div>
        <!-- end container-fluid -->
    </div>
    <!-- end app-main -->
</div>
@include('user.layouts.footer')
@include('user.layouts.general-scripts')
    <script src="{{ asset('plugins/lobibox/js/lobibox.js') }}"></script>
    <script src="{{ asset('js/fn.js') }}"></script>
    <script src="{{ asset('js/profile.js') }}"></script>
    <!--main js file end-->
</body>

</html>