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
        <!-- Main section Start -->
         <div class="l-main pt-lg-5 mt-lg-5">         
            <div class="d-none d-lg-block">
                <br><br>
            </div>
            <br>
            <div class="last_transaction_wrapper float_left">

                <div class="row">

                    <div class="col-md-12 col-lg-12 col-sm-12 col-12">
                        <div class="sv_heading_wraper">

                            <h3>Deposit History</h3>

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
                                        <th class="width_table1">status</th>
                                        <th class="width_table1">type</th>
                                        <th class="width_table1">currency</th>
                                        <th class="width_table1">date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($deposits as $deposit)
                                    <tr class="background_white">
                                        <td>
                                            <div class="media cs-media">

                                                <div class="media-body">
                                                    <h5>{{ $deposit['transaction_hash'] }}</h5>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="pretty p-svg p-curve">{{ $deposit['amount'] }}</div>
                                        </td>
                                        <td>
                                            <div class="pretty p-svg p-curve">{{ $deposit['status'] }}</div>
                                        </td>
                                        <td>
                                            <div class="pretty p-svg p-curve">{{ $deposit['type'] }}</div>
                                        </td>
                                        <td>
                                            <div class="pretty p-svg p-curve">{{ $deposit['currency'] }}</div>
                                        </td>
                                        <td class="flag">
                                            <div class="pretty p-svg p-curve">{{ $deposit['date'] }}</div>
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
            <!--  transactions wrapper end -->
            <!--  footer  wrapper start -->
            @include('user.layouts.footer')
         </div>
       <!--  footer  wrapper end -->      
    <!-- main box wrapper End-->
    @include('user.layouts.general-scripts')
    <!--main js file end-->
</body>

</html>