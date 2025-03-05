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
                            <h1>Invest</h1>
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
                                    <li class="breadcrumb-item active text-primary" aria-current="page">Invest</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <!-- end page title -->
                </div>
            </div>
            <!-- end row -->

            <!--mail-Compose-contant-start-->
            <div class="row row-content" data-wallet="{{ $wallets->count() }}" data-kyc="{{ $user->kyc }}">
                @if($plans->count())
                <div class="col-12">
                    <h4>Investment Plan Details</h4>
                </div>
                @foreach ($plans as $plan)
                    <div class="col-xl-4">
                        <div class="card card-statistics text-center pricing-highlight py-5">
                            <div class="card-body pricing-content">
                                <div class="pricing-content-card">
                                    <h5>{{ $plan['name'] }} plan</h5>
                                    <h2 class="text-primary pt-3">${{ $plan['minimum_amount'] }}</h2>
                                    <p class="text-primary pb-3 text-uppercase">minimum amount</p>
                                    <h2 class="text-primary pt-3">${{ $plan['maximum_amount'] }}</h2>
                                    <p class="text-primary  text-uppercase">maximum amount</p>
                                    <ul class="pb-2">
                                        <li>
                                            <p><br> Up to {{ $plan['interest_rate'] }}% daily for {{ $plan['duration'] }} days
                                            <br> Principal Return
                                            <br> Compound Available</p></li>
                                    </ul>
                                    <div class="pt-2">
                                        <a data-return="{{ $plan['interest_rate'] }}" 
                                        data-child_plan_id="{{ $plan['id'] }}" data-plan="{{ $plan['id'] }}" 
                                        data-min="{{ $plan['minimum_amount'] }}" data-max="{{ $plan['maximum_amount'] }}" href="#" class="deposit-btn btn btn-warning btn-round btn-">Invest</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
                @else
                <div class="card-body button-list">
                    <div class="alert border-0 alert-primary bg-gradient alert-dismissible fade show border-radius-none" role="alert">
                        <strong>Notice! :</strong> Investment Plans Not Available.
                    </div>
                </div>
                @endif
            </div>
            <!--mail-Compose-contant-end-->
        </div>
        <!-- end container-fluid -->
    </div>
    <!-- end app-main -->
</div>
<div class="modal fade" id="deposit-modal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Deposit To Plan</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <div class="modal-body">
            <form class="page-form deposit-form" action="">
                <div class="form-group icon_form comments_form">
                    <div class="payment_gateway_wrapper w-100 plan-wrapper">
                        <select required class="plain form-control select-plan w-100" name="child_plan_id" id="select-plan">
                            <option data-display="Select Plan">Select Plan</option>
                            @foreach ($plans as $plan)
                            <option data-return="{{ $plan['interest_rate'] }}" 
                            data-child_plan_id="{{ $plan['id'] }}" data-plan="{{ $plan['id'] }}" 
                            data-min="{{ $plan['minimum_amount'] }}" data-max="{{ $plan['maximum_amount'] }}" value="{{ $plan['id'] }}">{{ $plan['name'] }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="form-group icon_form comments_form">
                    <input required type="number" class="form-control require" name="amount" placeholder="Enter Amount">
                </div>
                <div class="form-group icon_form comments_form">
                    <div class="payment_gateway_wrapper w-100">
                        <select required class="plain form-control w-100" name="user_wallet_id">
                            <option data-display="Select Currency">Select Currency</option>
                            @foreach ($wallets as $wallet)
                            <option value="{{ $wallet['id'] }}" data-symbol="{{ $wallet->admin_wallet->currency_symbol }}">{{ $wallet->admin_wallet->currency }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div>
                    <button type="submit" class="btn btn-dark rounded-btn w-100">
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
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
</div>

<div class="modal fade" id="success-modal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title text-uppercase"><b class="text-uppercase deposit-wallet"></b> DEPOSIT</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body font-weight-bold">
                <div align="center"> Deposit exactly <b class="text-warning deposit-amount">$0.9999</b> <b class="text-uppercase deposit-wallet"></b></div>
                <div align="center" class="py-2">
                    Please contact Our Live Support For Our Correct Wallet Address.
                </div>
                <div align="center" style="display:none">
                    <div class="d-inline-flex p-1 border wallet-qrcode"></div>
                </div>
                <div align="center" class="py-2" style="display:none">
                    or copy From Input
                </div>
                <div class="input-group mb-3" style="display:none">
                    <!--<input type="text" id="clip-input" class="clip-input form-control" value="wallet address">-->
                    <input type="text" id="clip-input" class="clip-input form-control" value="wallet address">
                    <div class="input-group-append">
                        <button data-clipboard-target="#clip-input" class="clipboard-btn btn btn-dark" type="submit">
                            <i class="fa fa-clipboard"></i>
                        </button>
                    </div>
                </div>
                <div class='memo-cont' style="display:none">
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
@include('user.layouts.footer')
@include('user.layouts.general-scripts')
<script src="{{ asset('plugins/lobibox/js/lobibox.js') }}"></script>
    <script src="{{ asset('plugins/qrcode/qrcode.min.js') }}"></script>
    <script src="{{ asset('plugins/clipboard/clipboard.min.js') }}"></script>
    <script src="{{ asset('js/fn.js') }}"></script>
    <script src="{{ asset('js/deposit.js?ref=5') }}"></script>
</body>

</html>