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
                                        <h1>Dashboard</h1>
                                    </div>
                                    <div class="ml-auto d-flex align-items-center">
                                        <nav>
                                            <ol class="breadcrumb p-0 m-b-0">
                                                <li class="breadcrumb-item">
                                                    <a href="index.html"><i class="ti ti-home"></i></a>
                                                </li>
                                                <li class="breadcrumb-item">
                                                    Dashboard
                                                </li>
                                                <li class="breadcrumb-item active text-primary" aria-current="page">Admin</li>
                                            </ol>
                                        </nav>
                                    </div>
                                </div>
                                <!-- end page title -->
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 m-b-30">
                                <!-- begin page title -->
                                <div class="user-welcome d-block d-xl-flex flex-nowrap align-items-center">
                                    <div class="bg-img mb-2 mb-xl-0 mr-3">
                                        <img class="img-fluid rounded" src="{{ asset('dashboard/assets/img/avtar/06.jpg') }}" alt="user">
                                    </div>
                                    <div class="page-title mb-2 mb-xl-0">
                                        <h1 class="mb-1">Hello, Admin {{ ucfirst($user->name) }}!</h1>
                                        <p>At a glance summary of your investment website. Have fun!</p>
                                    </div>
                                    <div class="ml-auto d-flex align-items-center secondary-menu text-center">
                                        {{-- <a href="javascript:void(0);" class="tooltip-wrapper" data-toggle="tooltip" data-placement="top" title="" data-original-title="Todo list">
                                            <i class="fe fe-edit btn btn-icon text-primary"></i>
                                        </a>
                                        <a href="javascript:void(0);" class="tooltip-wrapper" data-toggle="tooltip" data-placement="top" title="" data-original-title="Projects">
                                            <i class="fa fa-lightbulb-o btn btn-icon text-success"></i>
                                        </a>
                                        <a href="javascript:void(0);" class="tooltip-wrapper" data-toggle="tooltip" data-placement="top" title="" data-original-title="Task">
                                            <i class="fa fa-check btn btn-icon text-fwarning"></i>
                                        </a>
                                        <a href="javascript:void(0);" class="tooltip-wrapper" data-toggle="tooltip" data-placement="top" title="" data-original-title="Calendar">
                                            <i class="fa fa-calendar-o btn btn-icon text-cyan"></i>
                                        </a>
                                        <a href="javascript:void(0);" class="tooltip-wrapper" data-toggle="tooltip" data-placement="top" title="" data-original-title="Analytics">
                                            <i class="fa fa-bar-chart-o btn btn-icon text-danger"></i>
                                        </a> --}}
                                        <a class="btn btn-info" href="/user/deposit" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Deposit
                                        </a>
                                        <a class="btn btn-primary" href="/user/withdrawal" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Withdraw
                                        </a>
                                        <a class="btn btn-success" href="/user/properties" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                           Properties 
                                        </a>
                                    </div>
                                    {{-- <div class="ml-xl-4 mt-xl-0 ml-0 mt-3 d-flex align-items-center">
                                        <div class="dropdown">
                                            <a class="btn btn-primary" href="#!" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                Add New
                                            </a>
                                            <div class="dropdown-menu custom-dropdown dropdown-menu-right dropdown-menu-left-mobile p-4">
                                                <a class="dropdown-item" href="#"><i class="ti ti-layers-alt"></i>Add Project </a>
                                                <a class="dropdown-item" href="#"><i class="ti ti-files"></i>Add Task </a>
                                                <a class="dropdown-item" href="#"><i class="ti ti-id-badge"></i>Add Team </a>
                                                <a class="dropdown-item" href="#"><i class="ti ti-pencil-alt"></i>Leave App </a>
                                                <a class="dropdown-item" href="#"><i class="ti ti-email"></i>New Message</a>
                                                <a class="dropdown-item" href="#"><i class="ti ti-user"></i>Edit Profile</a>
                                                <a class="dropdown-item" href="#"><i class="ti ti-settings"></i>Settings</a>
                                            </div>
                                        </div> --}}
                                    {{-- </div> --}}
                                </div>
                            </div>
                            <!-- end page title -->
                        </div>
                        <!-- end row -->
                        <!-- start Crypto Currency contant -->
                       
                        <div class="row row-content">
                            <div class="col-xs-6 col-xxl-3 m-b-30">
                                <div class="card card-statistics h-100 m-b-0 bg-pink">
                                    <div class="card-body">
                                        <h2 class="text-white mb-0">{{$total_users}}</h2>
                                        <p class="text-white">Total Members</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-xxl-3 m-b-30">
                                <div class="card card-statistics h-100 m-b-0 bg-primary">
                                    <div class="card-body">
                                        <h2 class="text-white mb-0">${{ number_format($currently_invested, 2) }}</h2>
                                        <p class="text-white">Currently Invested</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-xxl-3 m-b-30">
                                <div class="card card-statistics h-100 m-b-0 bg-primary">
                                    <div class="card-body">
                                        <h2 class="text-white mb-0">${{ number_format($total_deposited, 2) }}</h2>
                                        <p class="text-white">Total Deposted</p>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-xs-6 col-xxl-3 m-b-30">
                                <div class="card card-statistics h-100 m-b-0 bg-primary">
                                    <div class="card-body">
                                        <h2 class="text-white mb-0">${{ number_format($total_withdrawn, 2) }}</h2>
                                        <p class="text-white">Total Withdrawn</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-xxl-3 m-b-30">
                                <div class="card card-statistics h-100 m-b-0 bg-primary">
                                    <div class="card-body">
                                        <h2 class="text-white mb-0">{{ $pending_deposits }}</h2>
                                        <p class="text-white">Pending Deposit</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-xxl-3 m-b-30">
                                <div class="card card-statistics h-100 m-b-0 bg-primary">
                                    <div class="card-body">
                                        <h2 class="text-white mb-0">{{ $pending_withdrawals }}</h2>
                                        <p class="text-white">Pending Withdrawal</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-xxl-3 m-b-30">
                                <div class="card card-statistics h-100 m-b-0 bg-orange">
                                    <div class="card-body">
                                        <h2 class="text-white mb-0">${{ number_format($total_paid, 2) }}</h2>
                                        <p class="text-white">Total Paid</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-xxl-3 m-b-30">
                                <div class="card card-statistics h-100 m-b-0 bg-info">
                                    <div class="card-body">
                                        <h2 class="text-white mb-0">{{ $running_investments }}</h2>
                                        <p class="text-white">Running Investments</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row d-none">
                            <div class="col-xxl-6 mb-30">
                                <div class="card card-statistics h-100 mb-0 currency-price">
                                    <div class="card-header d-flex justify-content-between">
                                        <div class="card-heading">
                                            <h4 class="card-title">NewsLetter</h4>
                                        </div>
                                        <div class="dropdown">
                                            <a class="p-2" href="#!" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <i class="ti ti-more-alt"></i>
                                            </a>
                                            <div class="dropdown-menu custom-dropdown dropdown-menu-right p-4">
                                                <h6 class="mb-1">Action</h6>
                                                <a class="dropdown-item" href="#!"><i class="fa-fw fa fa-file-o pr-2"></i>View reports</a>
                                                <a class="dropdown-item" href="#!"><i class="fa-fw fa fa-edit pr-2"></i>Edit reports</a>
                                                <a class="dropdown-item" href="#!"><i class="fa-fw fa fa-bar-chart-o pr-2"></i>Statistics</a>
                                                <h6 class="mb-1 mt-3">Export</h6>
                                                <a class="dropdown-item" href="#!"><i class="fa-fw fa fa-file-pdf-o pr-2"></i>Export to PDF</a>
                                                <a class="dropdown-item" href="#!"><i class="fa-fw fa fa-file-excel-o pr-2"></i>Export to CSV</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <form class="page-form deposit-form" action="">
                                            <div class="form-group icon_form comments_form">
                                                <div class="payment_gateway_wrapper w-100">
                                                    <select required class="plain form-control select-plan w-100" name="plan">
                                                        <option disabled data-display="Select Plan">Select Plan</option>
                                                        <option value="1">Gold</option>
                                                        <option value="2">Copper</option>
                                                        <option value="3">Bronze</option>
                                                        <option value="4">Silver</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group icon_form comments_form">
                                                <input required type="number" class="form-control require" name="amount" placeholder="Enter Amount">
                                            </div>
                                            <div class="form-group icon_form comments_form">
                                                <div class="payment_gateway_wrapper w-100">
                                                    <select required class="plain form-control w-100" name="currency">
                                                        <option data-display="Select Currency">Select Currency</option>
                                                        <option data-symbol="btc">Bitcoin</option>
                                                        <option data-symbol="eth">Ethereum</option>
                                                        <option data-symbol="doge">Dogecoin</option>
                                                        <option data-symbol="bch">Bitcoin </option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group icon_form comments_form">
                                                <button type="submit" class="btn btn-dark rounded-btn">
                                                    <span class="form-loading d-none px-5">
                                                        <i class="fa fa-sync fa-spin"></i>
                                                    </span>
                                                    <span class='submit-text'>
                                                        Send NewsLetter
                                                    </span>
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    
                    </div>
                    <!-- end container-fluid -->
                </div>
                <!-- end app-main -->
            </div>
            <!-- end app-container -->
@include('admin.layouts.footer')
<div class="modal fade" id="deposit-modal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title text-uppercase"><b class="text-uppercase deposit-wallet"></b> DEPOSIT</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body font-weight-bold">
                <div align="center"> Deposit exactly <b class="text-warning deposit-amount">$0.9999</b> <b class="text-uppercase deposit-wallet"></b></div>
                <div align="center" class="py-2">
                    Scan Wallet Address
                </div>
                <div align="center">
                    <div class="d-inline-flex p-1 border wallet-qrcode"></div>
                </div>
                <div align="center" class="py-2">
                    or copy From Input
                </div>
                <div class="input-group mb-3">
                    <input type="text" id="clip-input" class="clip-input form-control" value="wallet address">
                    <div class="input-group-append">
                        <button data-clipboard-target="#clip-input" class="clipboard-btn btn btn-dark" type="submit">
                            <i class="fa fa-clipboard"></i>
                        </button>
                    </div>
                </div>
                <div class='memo-cont'>
                    <div align="center">
                        Wallet memo
                    </div>
                    <div class="input-group mb-3">
                        <input type="text" id="memo-input" class="memo-input form-control" value="wallet address">
                        <div class="input-group-append">
                            <button data-clipboard-target="#memo-input" class="clipboard-btn btn btn-dark" type="submit">
                                <i class="fa fa-clipboard"></i>
                            </button>
                        </div>
                    </div>
                </div>
                <div align="center" class="text-success small border border-success mx-4 bg-light">
                    NB : Contact support immediately After Your Payment
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
      </div>
    </div>
</div>

<script src="{{ asset('plugins/blockUi/jquery.blockUI.js') }}"></script>
<script src="{{ asset('plugins/sweetalert2/sweetalert.min.js') }}"></script>
<script src="{{ asset('plugins/qrcode/qrcode.min.js') }}"></script>
<script src="{{ asset('plugins/clipboard/clipboard.min.js') }}"></script>
<script src="{{ asset('plugins/lobibox/js/lobibox.js') }}"></script>
<script>
    // new ClipboardJS('.clipboard-btn');
</script>
<script src="{{  asset('js/fn.js') }}"></script>
<script src="{{  asset('js/main.js') }}"></script>
<script src="{{  asset('js/admin.index.js') }}"></script>
            
</body>


</html>