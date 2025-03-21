@include('user.layouts.header')
    <div class="page_title_section dashboard_title">

        <div class="page_header">
            <div class="container">
                <div class="row small">

                    <div class="col-xl-9 col-lg-7 col-md-7 col-12 col-sm-7 d-flex align-items-end">
                        <h5 class="text-white static">Wallets </h5>
                    </div>
                    <div class="col-xl-3 col-lg-5 col-md-5 col-12 col-sm-5">
                        <div class="sub_title_section">
                            <ul class="sub_title">
                                <li> <a href="#"> Home </a>&nbsp; / &nbsp; </li>
                                <li>Wallets</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- inner header wrapper end -->
	@include('user.layouts.sidebar')
        <!-- Main section Start -->
         <div class="l-main pt-lg-5 mt-lg-5">         
            <div class="d-none d-lg-block">
                <br><br>
            </div>
            <br>
            <div class="last_transaction_wrapper float_left">

                <div class="row">
                    <div class="col-6">
                        <div class="sv_heading_wraper">
                            <h3>Wallets</h3>
                        </div>
                    </div>
                    <div class="col-6 d-flex justify-content-end">
                        <div class="sv_heading_wraper d-flex justify-content-end">
                            <button class="btn add-wallet btn-primary btn-xs btn-rounded rounded pill input-rounded">
                                Create wallet
                            </button>
                        </div>
                    </div>
                </div>

                <div class="crm_customer_table_main_wrapper float_left">
                    <div class="crm_ct_search_wrapper">
                        <div class="crm_ct_search_bottom_cont_Wrapper">
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="record-table table datatables cs-table crm_customer_table_inner_Wrapper">
                            <thead>
                                <tr>
                                    <th class="width_table1">wallet</th>
                                    <th class="width_table1">symbol</th>
                                    <th class="width_table1">wallet address</th>
                                    <th class="width_table1">memo token</th>
                                    <th class="width_table1">actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($user_wallets as $user_wallet)
                                <tr class="background_white">
                                    <td>
                                        <div class="media cs-media">

                                            <div class="media-body">
                                                <h5>{{ $user_wallet->admin_wallet->currency }}</h5>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="media cs-media">

                                            <div class="media-body">
                                                <h5>{{ $user_wallet->admin_wallet->currency_symbol }}</h5>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="pretty p-svg p-curve">{{ $user_wallet['currency_address'] }}</div>
                                    </td>
                                    <td>
                                        <div class="pretty p-svg p-curve">{{ $user_wallet['memo_token'] }}</div>
                                    </td>
                                    <td>
                                        <nav class="navbar navbar-expand">
                                            <ul class="navbar-nav">
                                                <li class="nav-item dropdown">
                                                    <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"> <i class="fa fa-ellipsis-v"></i>
                                                    </a>
                                                    <div class="dropdown-menu">
                                                        <a data-main_wallet-id="{{ $user_wallet->admin_wallet->id }}" data-currency_address="{{ $user_wallet['currency_address'] }}"
                                                        data-action="edit" data-id="{{ $user_wallet['id'] }}" class="action-link dropdown-item" href="#">Edit</a>
                                                    </div>
                                                </li>
                                            </ul>
                                        </nav>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>

                    </div>
                </div>
                
            </div>
            <!--  transactions wrapper end -->
            <!--  footer  wrapper start -->
            @include('user.layouts.footer')
         </div>
         <div class="modal fade" id="wallet-modal">
            <div class="modal-dialog modal-dialog-centered">
              <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">
                      <span class="wallet-action">Add New</span> Wallet
                    </h4>
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <div class="modal-body">
                    <form class="page-form wallet-form" action="">
                        <div class="form-group icon_form comments_form memo-wrapper">
                            <label class="text-dark">Wallet</label>
                            <select name="main_wallet_id" id="has-memo" class="w-100 has-memo">
                                @foreach ($main_wallets as $main_wallet)
                                    <option data-id="{{ $main_wallet['id'] }}" data-currency="{{ $main_wallet['currency'] }}" data-symbol="{{ $main_wallet['currency_symbol'] }}" data-has_memo="{{ $main_wallet['has_memo'] }}" value="{{ $main_wallet['id'] }}">{{ $main_wallet['currency'] }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group icon_form comments_form">
                            <label class="text-dark">Enter Address</label>
                            <input type="text" class="form-control" name="currency_address" placeholder="Enter Wallet Address">
                        </div>
                        <div class="memo-cont d-none">
                            <div class="form-group icon_form comments_form">
                                <label class="text-dark">Enter Memo Token</label>
                                <input type="text" class="form-control" name="memo_token" placeholder="Enter Currency Memo Token">
                            </div>
                        </div>
                        <div>
                            <button type="submit" class="btn btn-dark rounded-btn w-100">
                                <span class="form-loading d-none px-5">
                                    <i class="fa fa-sync fa-spin"></i>
                                </span>
                                <span class='submit-text'>
                                    Submit
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
       <!--  footer  wrapper end -->      
    <!-- main box wrapper End-->
    @include('user.layouts.general-scripts')
    <script src="{{ asset('plugins/lobibox/js/lobibox.js') }}"></script>
    <script src="{{ asset('js/fn.js') }}"></script>
    <script src="{{ asset('js/user.wallets.js') }}"></script>
    <!--main js file end-->
</body>

</html>