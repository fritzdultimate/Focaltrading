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
                            <h1>Investments</h1>
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
                                    <li class="breadcrumb-item active text-primary" aria-current="page">Investments</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <!-- end page title -->
                </div>
            </div>
            <!-- end row -->

            <!--mail-Compose-contant-start-->
            <div class="row">
                <div class="col-lg-12">
                    <div class="card card-statistics">
                        <div class="card-body">
                            <div class="datatable-wrapper table-responsive">
                                <table id="datatable" class="display compact table table-striped table-bordered">
                                    <thead>
                                        <tr class="text-uppercase">
                                            <th class="width_table1">transaction Hash</th>
                                            <th class="width_table1">investment plan</th>
                                            <th class="width_table1">amount ($)</th>
                                            <th class="width_table1">status</th>
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
                                                <div class="media cs-media">
    
                                                    <div class="media-body">
                                                        <h5>{{ $deposit->plan->name }}</h5>
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
                                                <div class="pretty p-svg p-curve">{{ $deposit->user_wallet->admin_wallet->currency }}</div>
                                            </td>
                                            <td class="flag">
                                                <div class="pretty p-svg p-curve">{{ $deposit['created_at'] }}</div>
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