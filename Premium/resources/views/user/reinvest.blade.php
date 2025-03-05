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
                            <h1>ReInvestment</h1>
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
                                    <li class="breadcrumb-item active text-primary" aria-current="page">ReInvestment</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <!-- end page title -->
                </div>
            </div>
            <!-- end row -->

            <!--mail-Compose-contant-start-->
            <div class="row account-contant" data-wallet="{{ $wallets->count() }}">
                <div class="col-12">
                    <div class="card card-statistics">
                        <div class="card-body p-0">
                            <div class="row no-gutters">
                                <div class="border-t col-12">
                                    <div class="page-account-form">
                                        <div class="form-titel border-bottom p-3">
                                            <h5 class="mb-0 py-2">Reinvest Earnings</h5>
                                        </div>
                                        <div class="p-4">
                                            <form class="page-form reinvest-form">
                                                <div class="form-group icon_form comments_form">
                                                    <div class="payment_gateway_wrapper w-100 plan-wrapper">
                                                        <select required class="form-control select-plan plain w-100" name="child_plan_id">
                                                            <option disabled data-display="Select Plan">Select Plan</option>
                                                            @foreach ($plans as $plan)
                                                            <option data-return="{{ $plan['interest_rate'] }}" 
                                                            data-child_plan_id="{{ $plan['id'] }}" data-plan="{{ $plan['id'] }}" 
                                                            data-min="{{ $plan['minimum_amount'] }}" data-max="{{ $plan['maximum_amount'] }}" value="{{ $plan['id'] }}">{{ $plan['name'] }}</option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group icon_form comments_form">
                                                    <input required type="number" class=" form-control require input-rounded" name="amount" placeholder="Enter Amount">
                                                </div>
                                                <div class="form-group icon_form comments_form">
                                                    <div class="payment_gateway_wrapper w-100">
                                                        <select required class="w-100 plain form-control" name="user_wallet_id" id="select-plan">
                                                            <option data-display="Select Currency">Select Currency</option>
                                                            @foreach ($wallets as $wallet)
                                                            <option value="{{ $wallet['id'] }}" data-symbol="{{ $wallet->admin_wallet->currency_symbol }}">{{ $wallet->admin_wallet->currency }}</option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                </div>
                                                <div>
                                                    <button type="submit" class="btn btn-primary rounded-btn">
                                                        <span class="form-loading d-none px-5">
                                                            <i class="fa fa-sync fa-spin"></i>
                                                        </span>
                                                        <span class='submit-text'>
                                                            Make Reinvestment
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
@include('user.layouts.footer')
<div class="modal fade" id="success-modal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-uppercase"><b class="text-uppercase reinvest-wallet"></b> REINVESTMENT</h5>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body font-weight-bold">
                <div align="center"> Deposit exactly <b class="text-warning reinvest-amount">$0.9999</b> <b class="text-uppercase reinvest-wallet"></b></div>
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
@include('user.layouts.general-scripts')
    <script src="{{ asset('plugins/lobibox/js/lobibox.js') }}"></script>
    <script src="{{ asset('plugins/qrcode/qrcode.min.js') }}"></script>
    <script src="{{ asset('plugins/clipboard/clipboard.min.js') }}"></script>
    <script src="{{ asset('js/fn.js') }}"></script>
    <script src="{{ asset('js/user.reinvest.js?ref=1') }}"></script>
    <!--main js file end-->
</body>

</html>