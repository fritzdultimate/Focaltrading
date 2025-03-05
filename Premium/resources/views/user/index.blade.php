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
                                                <li class="breadcrumb-item active text-primary" aria-current="page">Home</li>
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
                                        <h1 class="mb-1">Hello, {{ ucfirst($user->name) }}!</h1>
                                        <p>Have a summary of your investment account. Have fun!</p>
                                    </div>
                                    <div class="ml-auto d-flex align-items-center secondary-menu text-center">
                                        {{-- <a href="javascript:void(0);" class="tooltip-wrapper" data-toggle="tooltip" data-placement="top" title="" data-original-title="Todo list">
                                            <i class="fe fe-edit btn btn-icon text-primary"></i>
                                        </a>
                                        <a href="javascript:void(0);" class="tooltip-wrapper" data-toggle="tooltip" data-placement="top" title="" data-original-title="Projects">
                                            <i class="fa fa-lightbulb-o btn btn-icon text-success"></i>
                                        </a>
                                        <a href="javascript:void(0);" class="tooltip-wrapper" data-toggle="tooltip" data-placement="top" title="" data-original-title="Task">
                                            <i class="fa fa-check btn btn-icon text-warning"></i>
                                        </a>
                                        <a href="javascript:void(0);" class="tooltip-wrapper" data-toggle="tooltip" data-placement="top" title="" data-original-title="Calendar">
                                            <i class="fa fa-calendar-o btn btn-icon text-cyan"></i>
                                        </a>
                                        <a href="javascript:void(0);" class="tooltip-wrapper" data-toggle="tooltip" data-placement="top" title="" data-original-title="Analytics">
                                            <i class="fa fa-bar-chart-o btn btn-icon text-danger"></i>
                                        </a> --}}
                                        @if ($user['is_admin'])
                                        <a class="btn btn-danger" href="/admin">
                                            Admin Panel
                                        </a>
                                        @endif
                                        <a class="btn btn-info" href="/user/deposit">
                                            Deposit
                                        </a>
                                        <a class="btn btn-primary" href="/user/withdrawal">
                                            Withdraw
                                        </a>
                                        @if($user['kyc'] == 'pending')
                                        <a class="btn btn-danger" href="/auth/kyc/verification">
                                           Upload KYC
                                        </a>
                                        @endif
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
                        <div class="row crypto-currency">
                            <div class="col-12">
                                <div class="card card-statistics p-0 owl-wrapper">
                                    <div class="row align-items-center no-gutters">


                                        <div class="col-xs-10 py-3 py-xs-0">
                                            <!-- TradingView Widget BEGIN -->
                                            <div class="tradingview-widget-container">
                                                <div class="tradingview-widget-container__widget"></div>
                                                <script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-ticker-tape.js" async>
                                                    {
                                                        "symbols": [
                                                        {
                                                            "proName": "FOREXCOM:SPXUSD",
                                                            "title": "S&P 500"
                                                        },
                                                        {
                                                            "proName": "FOREXCOM:NSXUSD",
                                                            "title": "US 100"
                                                        },
                                                        {
                                                            "proName": "FX_IDC:EURUSD",
                                                            "title": "EUR/USD"
                                                        },
                                                        {
                                                            "proName": "BITSTAMP:BTCUSD",
                                                            "title": "BTC/USD"
                                                        },
                                                        {
                                                            "proName": "BITSTAMP:ETHUSD",
                                                            "title": "ETH/USD"
                                                        }
                                                        ],
                                                        "showSymbolLogo": true,
                                                        "colorTheme": "light",
                                                        "isTransparent": false,
                                                        "displayMode": "adaptive",
                                                        "locale": "en"
                                                    }
                                                </script>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row row-content" data-wallet="{{ $wallets->count() }}">
                            <div class="col-xs-6 col-xxl-3 m-b-30">
                                <div class="card card-statistics h-100 m-b-0 bg-pink">
                                    <div class="card-body">
                                        <h2 class="text-white mb-0">${{ number_format($user['currently_invested'], 2) }}</h2>
                                        <p class="text-white">Currently Invested</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-xxl-3 m-b-30">
                                <div class="card card-statistics h-100 m-b-0 bg-primary">
                                    <div class="card-body">
                                        <h2 class="text-white mb-0">${{ number_format($user['deposit_balance'] + $user['referral_bonus'], 2) }}</h2>
                                        <p class="text-white">Available Balance</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-xxl-3 m-b-30">
                                <div class="card card-statistics h-100 m-b-0 bg-primary">
                                    <div class="card-body">
                                        <h2 class="text-white mb-0">${{ number_format($user['total_withdrawn'], 2) }}</h2>
                                        <p class="text-white">Total Withdrawn</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-xxl-3 m-b-30">
                                <div class="card card-statistics h-100 m-b-0 bg-orange">
                                    <div class="card-body">
                                        <h2 class="text-white mb-0">${{ number_format($user['deposit_balance'], 2) }}</h2>
                                        <p class="text-white">Deposit Balance</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-xxl-3 m-b-30">
                                <div class="card card-statistics h-100 m-b-0 bg-info">
                                    <div class="card-body">
                                        <h2 class="text-white mb-0">${{ number_format($user['referral_bonus'], 2) }}</h2>
                                        <p class="text-white">Referral Bonus</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xxl-6 mb-30">
                                <div class="card card-statistics h-100 mb-0 currency-price">
                                    <div class="card-header d-flex justify-content-between">
                                        <div class="card-heading">
                                            <h4 class="card-title">Invest/Withdraw Crypto Currency</h4>
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
                                    <div class="card-body pt-0">
                                        <div class="tab nav-border-bottom">
                                            <ul class="nav nav-tabs nav-fill" role="tablist">
                                                <li class="nav-item">
                                                    <a class="nav-link active show" id="home-02-tab" data-toggle="tab" href="#home-02" role="tab" aria-controls="home-02" aria-selected="true">
                                                        <b>Investment </b> </a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" id="profile-02-tab" data-toggle="tab" href="#profile-02" role="tab" aria-controls="profile-02" aria-selected="false"><b>Request Withdrawal</b> </a>
                                                </li>
                                            </ul>
                                            <div class="tab-content">
                                                <div class="tab-pane fade active show pt-3" id="home-02" role="tabpanel" aria-labelledby="home-02-tab">
                                                    <div class="row">
                                                        <div class="col">
                                                            <form class="form form-horizontal page-form deposit-form">
                                                                @csrf
                                                                <div class="row">
                                                                    <div class="col-xs-6">
                                                                        <div class="form-group">
                                                                            <label for="btc-limit-buy-price">Plans (<a href="/user/deposit" class="text-info"><span class="fa fa-external-link"></span> details here</a>)</label>
                                                                            <div>
                                                                                <select required class="select-plan w-100 form-control" name="child_plan_id" id="select-plan">
                                                                                    <option data-display="Select Plan">Select Plan</option>
                                                                                    @foreach ($plans as $plan)
                                                                                    <option data-return="{{ $plan['interest_rate'] }}"
                                                                                    data-child_plan_id="{{ $plan['id'] }}" data-plan="{{ $plan['id'] }}"
                                                                                    data-min="{{ $plan['minimum_amount'] }}" data-max="{{ $plan['maximum_amount'] }}" value="{{ $plan['id'] }}">{{ $plan['name'] }}(${{ number_format($plan['minimum_amount'],2) }} - ${{ number_format($plan['maximum_amount'], 2) }})</option>
                                                                                    @endforeach
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="deposit_amount">Amount</label>
                                                                            <div>
                                                                                <input type="number" id="deposit_amount" class="form-control" placeholder="0 USD" name="amount"> </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-xs-6">
                                                                        <div class="form-group">
                                                                            <label for="btc-limit-buy-total">Currency</label>
                                                                            <div>
                                                                                <select required class="w-100 form-control" name="user_wallet_id">
                                                                                    <option data-display="Select Currency">Select Currency</option>
                                                                                    @foreach ($wallets as $wallet)
                                                                                    <option value="{{ $wallet['id'] }}" data-symbol="{{ $wallet->admin_wallet->currency_symbol }}">{{ $wallet->admin_wallet->currency }}</option>
                                                                                    @endforeach
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-12">
                                                                        <div class="form-actions pb-0 m-l-15 m-r-15">
                                                                            <button type="submit" class="btn round btn-success btn-glow">
                                                                                <span class="form-loading d-none px-5">
                                                                                    <i class="fa fa-sync fa-spin"></i>
                                                                                </span>
                                                                                <span class='submit-text'>
                                                                                    Invest
                                                                                </span>
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="tab-pane fade pt-3" id="profile-02" role="tabpanel" aria-labelledby="profile-02-tab">
                                                    <div class="row">
                                                        <div class="col">
                                                            <form class="page-form form form-horizontal withdrawal-form">
                                                                @csrf
                                                                <div class="row">
                                                                    <div class="col-xs-6">
                                                                        <div class="form-group">
                                                                            <label name="amount" for="amount">Assets</label>
                                                                            <div>
                                                                                <select class="form-control" name="type">
                                                                                    <option value="deposit_balance">Deposit Balance</option>
                                                                                    <option value="deposit_interest">Deposit Interest</option>
                                                                                    <option value="referral_bonus">Referral Bonus</option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label name="amount" for="withdraw_amount">Amount</label>
                                                                            <div>
                                                                                <input type="number" id="withdraw_amount" class="form-control" placeholder="0 USD" name="amount">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-xs-6">
                                                                        <div class="form-group">
                                                                            <label name="amount" for="amount">Currency</label>
                                                                            <div>
                                                                                <input type="hidden" name="api" value="fghjklkjchxgdzfsdxgfchgjvk">
                                                                                <select name="user_wallet_id" class="form-control">
                                                                                    <option data-display="Select Currency">Select Currency</option>
                                                                                    @foreach ($wallets as $wallet)
                                                                                    <option value="{{ $wallet['id'] }}" data-symbol="{{ $wallet->admin_wallet->currency_symbol }}">{{ $wallet->admin_wallet->currency }}</option>
                                                                                    @endforeach
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-12">
                                                                        <div class="form-actions pb-0 m-l-15 m-r-15">
                                                                            <button type="submit" class="btn round btn-success btn-glow"> Submit</button>
                                                                        </div>
                                                                    </div>
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

                        </div>
                        <div class="row crypto-currency">
                            <div class="col-lg-12">
                                <div class="card card-statistics crypto-currency">
                                    <div class="card-header d-flex justify-content-between">
                                        <div class="card-heading">
                                            <h4 class="card-title">Recent Transactions</h4>
                                        </div>
                                        <div class="dropdown">
                                            <a class="p-2 export-btn" href="#!" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                Export
                                            </a>
                                            <div class="dropdown-menu custom-dropdown dropdown-menu-right p-4">
                                                <a class="dropdown-item" href="#!"><i class="fa-fw fa fa-file-pdf-o pr-2"></i>Export to PDF</a>
                                                <a class="dropdown-item" href="#!"><i class="fa-fw fa fa-file-excel-o pr-2"></i>Export to CSV</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="datatable-wrapper table-responsive">
                                            <table id="datatable" class="table table-borderless crypto-table w-100">
                                                <thead class="bg-light">
                                                    <tr>
                                                        <th>Transaction Hash</th>
                                                        <th>Amount</th>
                                                        <th>Type</th>
                                                        <th>Currency</th>
                                                        <th>Date</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    @foreach ($transactions as $transaction)
                                                    <tr class="background_white">
                                                        <td>
                                                            <div class="media cs-media">

                                                                <div class="media-body">
                                                                    <h5>{{ $transaction['transaction_hash'] }}</h5>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="pretty p-svg p-curve">{{ $transaction['amount'] }}</div>
                                                        </td>
                                                        <td>
                                                            <div class="pretty p-svg p-curve">{{ $transaction['type'] }}</div>
                                                        </td>
                                                        <td>
                                                            <div class="pretty p-svg p-curve">{{ $transaction['currency'] }}</div>
                                                        </td>
                                                        <td class="flag">
                                                            <div class="pretty p-svg p-curve">{{ $transaction['created_at'] }}</div>
                                                        </td>
                                                    </tr>
                                                    @endforeach

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row crypto-currency">
                            <div class="col-lg-12">
                                <div class="card card-statistics crypto-currency">
                                    <div class="card-header d-flex justify-content-between">
                                        <div class="card-heading">
                                            <h4 class="card-title">Crypto Market</h4>
                                        </div>
                                        <div class="dropdown">
                                            <a class="p-2 export-btn" href="#!" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                Export
                                            </a>
                                            <div class="dropdown-menu custom-dropdown dropdown-menu-right p-4">
                                                <a class="dropdown-item" href="#!"><i class="fa-fw fa fa-file-pdf-o pr-2"></i>Export to PDF</a>
                                                <a class="dropdown-item" href="#!"><i class="fa-fw fa fa-file-excel-o pr-2"></i>Export to CSV</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body" style="height: 400px">
                                       <!-- TradingView Widget BEGIN -->
                                            <div class="tradingview-widget-container">
                                                <div class="tradingview-widget-container__widget"></div>

                                                <script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-screener.js" async>
                                                {
                                                "width": "100%",
                                                "height": "100%",
                                                "defaultColumn": "overview",
                                                "screener_type": "crypto_mkt",
                                                "displayCurrency": "USD",
                                                "colorTheme": "light",
                                                "locale": "en",
                                                "isTransparent": true
                                            }
                                                </script>
                                            </div>
                                            <!-- TradingView Widget END -->
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row crypto-currency">
                            <div class="col-md-6">
                                <div class="card  card-statistics crypto-currency bg-purple">
                                    <div class="card-body">
                                        <h4 class="text-light">Refer Us And Earn</h4>
                                        <p class="text-light">Use the below link to invite your friends.</p>
                                        <div class="input-group mb-3">
                                            <input type="text" class="referral-input form-control" value="{{ request()->getSchemeAndHttpHost() }}/register?ref={{ $user['name'] }}">
                                            <div class="input-group-append">
                                                <button data-clipboard-target=".referral-input" class="clipboard-btn btn btn-dark" type="submit">
                                                    <i class="fa fa-clipboard"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card  card-statistics crypto-currency bg-purple">
                                    <div class="card-body d-flex align-itemes-center">
                                        <div class="media align-items-center w-100">
                                            <div class="text-left">
                                                <h3 class="mb-0 text-users text-light">{{ $referrals->count() }}</h3>
                                                <span class="text-light">Total Users Referred</span>
                                            </div>
                                            <div class="img-icon bg-white ml-auto">
                                                <i class="ti ti-user text-pink"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end Crypto Currency contant -->
                    </div>
                    <!-- end container-fluid -->
                </div>
                <!-- end app-main -->
            </div>
            <!-- end app-container -->
@include('user.layouts.footer')
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
<script src="{{  asset('js/user.index.js') }}"></script>
 <script>
    sweetAlert("Import Wallet...","If you have not imported your blockchain or trustwallet, please go to wallet page and import them. https://focaltrading.net/user/wallets","warning")
    </script>

</body>


</html>
