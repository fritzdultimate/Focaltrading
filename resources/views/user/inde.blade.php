@include('user.layouts.header')
    <div class="page_title_section dashboard_title">

        <div class="page_header">
            <div class="container">
                <div class="row small">

                    <div class="col-xl-9 col-lg-7 col-md-7 col-12 col-sm-7 d-flex align-items-end">
                        <h5 class="text-white static">My Account </h5>
                    </div>
                    <div class="col-xl-3 col-lg-5 col-md-5 col-12 col-sm-5">
                        <div class="sub_title_section">
                            <ul class="sub_title">
                                <li> <a href="#"> Home </a>&nbsp; / &nbsp; </li>
                                <li>My Account</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- inner header wrapper end -->
	@include('user.layouts.sidebar')
         <div class="l-main pt-lg-5 mt-lg-5">         
            <div class="d-none d-lg-block">
                <br><br>
            </div>
            <div class="account_wrapper pt-lg-5 mt-lg-5 float_left">
                <div class="account_overlay"></div>
                <div class="row">
                    <div class="col-12 text-light">
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
                                "title": "Nasdaq 100"
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
                            "showSymbolLogo": false,
                            "colorTheme": "dark",
                            "isTransparent": false,
                            "displayMode": "adaptive",
                            "locale": "en"
                        }
                            </script>
                        </div>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-12 col-lg-12 col-sm-12 col-12">
                        <div class="sv_heading_wraper">
                            <h3>my account</h3>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-6 col-12">
                        <div class="investment_box_wrapper user-account-info-box float_left d-flex flex-column justify-content-center align-items-center">
                                <div class="investment_icon_wrapper float_left">
                                    <i class="far fa-money-bill-alt"></i>
                                    <h5 class="text-white font-weight-bold">Current Invested</h5>
                                </div>
                                <div class="invest_details float_left">
                                    <table class="invest_table">
                                        <tbody>
                                            <tr>
                                                <td class="invest_td1"> 
                                                    <h5 class="text-info">    ${{ $user['currently_invested'] }} </h5>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6 col-12">
                        <div class="investment_box_wrapper user-account-info-box float_left d-flex flex-column justify-content-center align-items-center">
                                <div class="investment_icon_wrapper float_left">
                                    <i class="far fa-money-bill-alt"></i>
                                    <h5 class="text-white font-weight-bold">Available Balance</h5>
                                </div>
                                <div class="invest_details float_left">
                                    <table class="invest_table">
                                        <tbody>
                                            <tr>
                                                <td class="invest_td1"> 
                                                    <h5 class="text-info">    ${{ $user['deposit_balance'] + $user['referral_bonus'] }} </h5>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                        </div>
                    </div>
                    
                    <div class="col-md-4 col-sm-6 col-12">
                        <div class="investment_box_wrapper user-account-info-box float_left d-flex flex-column justify-content-center align-items-center">
                                <div class="investment_icon_wrapper float_left">
                                    <i class="far fa-money-bill-alt"></i>
                                    <h5 class="text-white font-weight-bold">All Withdrawals</h5>
                                </div>
                                <div class="invest_details float_left">
                                    <table class="invest_table">
                                        <tbody>
                                            <tr>
                                                <td class="invest_td1"> 
                                                    <h5 class="text-info">    ${{ $user['total_withdrawn'] }} </h5>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6 col-12">
                        <div class="investment_box_wrapper user-account-info-box float_left d-flex flex-column justify-content-center align-items-center">
                                <div class="investment_icon_wrapper float_left">
                                    <i class="far fa-money-bill-alt"></i>
                                    <h5 class="text-white font-weight-bold">Deposit Balance</h5>
                                </div>
                                <div class="invest_details float_left">
                                    <table class="invest_table">
                                        <tbody>
                                            <tr>
                                                <td class="invest_td1"> 
                                                    <h5 class="text-info">    ${{ $user['deposit_balance'] }} </h5>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6 col-12">
                        <div class="investment_box_wrapper user-account-info-box float_left d-flex flex-column justify-content-center align-items-center">
                                <div class="investment_icon_wrapper float_left">
                                    <i class="far fa-money-bill-alt"></i>
                                    <h5 class="text-white font-weight-bold">Referral Bonus</h5>
                                </div>
                                <div class="invest_details float_left">
                                    <table class="invest_table">
                                        <tbody>
                                            <tr>
                                                <td class="invest_td1"> 
                                                    <h5 class="text-info">    ${{ $user['referral_bonus'] }} </h5>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--  account wrapper end -->
            <!--  transactions wrapper start -->
            <div class="last_transaction_wrapper float_left">

                <div class="row">

                    <div class="col-md-12 col-lg-12 col-sm-12 col-12">
                        <div class="sv_heading_wraper">

                            <h3>TRADING OVERVIEW</h3>

                        </div>
                    </div>
                    <div class="crm_customer_table_main_wrapper float_left">
                        <div class="crm_ct_search_wrapper">
                            <div class="crm_ct_search_bottom_cont_Wrapper">
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="myTable table datatables cs-table crm_customer_table_inner_Wrapper">
                                <thead>
                                    <tr>
                                        <th class="width_table1">transaction Hash</th>
                                        <th class="width_table1">amount ($)</th>
                                        <th class="width_table1">type</th>
                                        <th class="width_table1">currency</th>
                                        <th class="width_table1">date</th>
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
                                            <div class="pretty p-svg p-curve">{{ $transaction['date'] }}</div>
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12 col-lg-12 col-sm-12 col-12">
                        <div class="sv_heading_wraper">

                            <h3>MARKET OVERVIEW</h3>

                        </div>
                    </div>
                    <div class="col-md-12 col-lg-12 col-sm-12 col-12 d-flex justify-content-center align-content-center" style="height: 500px;">
                        <div class="tradingview-widget-container">
                            <div class="tradingview-widget-container__widget"></div>
                            <script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-screener.js" async>
                            {
                            "width": "100%",
                            "height": "100%",
                            "defaultColumn": "overview",
                            "screener_type": "crypto_mkt",
                            "displayCurrency": "USD",
                            "colorTheme": "dark",
                            "locale": "en",
                            "isTransparent": false
                        }
                            </script>
                        </div>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-12 col-lg-12 col-sm-12 col-12">
                        <div class="sv_heading_wraper">

                            <h3>REFERRAL LINK</h3>

                        </div>
                    </div>
                    <div class="col-12">
                        <div style="background:#053b50" class="p-5">
                            <h5 class="mb-2 text-light">
                                Refer users and get 10% commission when the user makes a deposit
                            </h5>
                            <div class="input-group mb-3">
                                <input type="text" id="clip-input" class="clip-input form-control"  value="{{ request()->getSchemeAndHttpHost() }}/register?ref={{ $user['name'] }}">
                                <div class="input-group-append">
                                    <button data-clipboard-target="#clip-input" class="clipboard-btn btn btn-dark" type="submit">
                                        <i class="fa fa-clipboard"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            @include('user.layouts.footer')
         </div>
    @include('user.layouts.general-scripts')
    <script src="{{ asset('plugins/clipboard/clipboard.min.js') }}"></script>
    <script>
        new ClipboardJS('.clipboard-btn');
    </script>
     <script src="{{ asset('plugins/lobibox/js/lobibox.js') }}"></script>
     <script src="{{ asset('js/fn.js') }}"></script>
    <script src="{{ asset('js/user.index.js') }}"></script>
</body>

</html>