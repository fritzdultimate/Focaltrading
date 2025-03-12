@include('admin.layouts.header')
<div class="app-container">
    <!-- begin app-nabar -->
    @include('admin.layouts.sidebar')
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
                            <h1>Wallet Balance</h1>
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
                                    <li class="breadcrumb-item active text-primary" aria-current="page">Wallet Balance</li>
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
                <div class="col-12 py-3">
                    <div class="card card-statistics h-100 mb-0 widget-income-list">
                        <div class="card-body d-flex align-itemes-center">
                            <div class="media align-items-center w-100">
                                <div class="text-left">
                                    <h3 class="mb-0 user-balance">$0.00</h3>
                                    <span>User wallet Balance</span>
                                </div>
                                <div class="img-icon bg-orange ml-auto">
                                    <i class="ti ti-wallet text-white"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12">
                    <div class="card card-statistics">
                        <div class="card-body p-0">
                            <div class="row no-gutters">
                                <div class="border-t col-12">
                                    <div class="page-account-form">
                                        
                                        <div class="p-4">
                                            <form class="page-form wallet-form">	
                                                <label>User</label>
                                                    <div class="form-group user-wrapper">
                                                    <select id="user-list" class="form-control user-list plain" name="name">
                                                        @foreach($users as $user)
                                                        <option data-balance="{{ $user['deposit_balance'] }}" value="{{ $user['name'] }}">{{ $user['name'] }}</option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                                    <div class="change_field">
                                                        <label>Action</label>
                                                        <select class="w-100 plain form-control" name="action">
                                                            <option value="debit">Debit</option>
                                                            <option value="fund">Fund</option>
                                                        </select>
                                                    </div>
                                                    <div class="change_field">
                                                        <label>Amount</label>
                                                        <input class="form-control" type="text" name="amount" placeholder="Amount">
                                                    </div>
                                                    <br>
                                                    <div>
                                                        <button class="btn btn-primary w-100 input-rounded" type="submit">
                                                            <span class="form-loading d-none px-5">
                                                                <i class="fa fa-sync fa-spin"></i>
                                                            </span>
                                                            <span class='submit-text'>
                                                                submit
                                                            </span>
                                                        </button>
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
            <!--mail-Compose-contant-end-->
        </div>
        <!-- end container-fluid -->
    </div>
    <!-- end app-main -->
</div>
@include('admin.layouts.footer')

@include('admin.layouts.general-scripts')
<script src="{{ asset('plugins/lobibox/js/lobibox.js') }}"></script>
<script src="{{ asset('plugins/blockUi/jquery.blockUi.js') }}"></script>
<script src="{{ asset('js/fn.js') }}"></script>
<script src="{{ asset('js/admin.wallet-balance.js') }}"></script>
</body>

</html>