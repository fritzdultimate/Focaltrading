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
                            <h1>Security</h1>
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
                                    <li class="breadcrumb-item active text-primary" aria-current="page">Security</li>
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
                                <div class="border-t col-12">
                                    <div class="page-account-form">
                                        <div class="form-titel border-bottom p-3">
                                            <h5 class="mb-0 py-2">Change Password</h5>
                                        </div>
                                        <div class="p-4">
                                            <form class="page-form profile-form">
                                                <div class="form-group">
                                                    <label for="firstname">Current Password:</label>
                                                    <input type="password" class="form-control" name="firstname" placeholder="Enter Current Password">
                                                </div>
                                                <div class="form-group">
                                                    <label for="middlename">New Password:</label>
                                                    <input type="password" class="form-control" name="middlename" placeholder="Enter New Password">
                                                </div>

                                                <div class="form-group">
                                                    <label for="lastname">Confirm New Password:</label>
                                                    <input type="password" class="form-control" name="lastname" placeholder="Retype New Password">
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
    <script src="{{ asset('js/security.js') }}"></script>
    <!--main js file end-->
</body>

</html>