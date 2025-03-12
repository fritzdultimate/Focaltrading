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
                            <h1>Approved Withdrawals</h1>
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
                                    <li class="breadcrumb-item active text-primary" aria-current="page">Approved Withdrawals</li>
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
                                        <tr>
                                            <th class="width_table1">user</th>
                                            <th class="width_table1">wallet</th>
                                            <th class="width_table1">wallet Address</th>
                                            <th class="width_table1">memo Token</th>
                                            <th class="width_table1">amount</th>
                                            <th class="width_table1">status</th>
                                            <th class="width_table1">date</th>
                                            <th class="width_table1">action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach($withdrawals as $withdrawal)
                                        <tr class="background_white">

                                            <td>
                                                <div class="media cs-media">

                                                    <div class="media-body">
                                                        <h5>{{ $withdrawal->user->name }}</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="media cs-media">

                                                    <div class="media-body">
                                                        <h5>{{ $withdrawal->user_wallet->admin_wallet->currency }}</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="pretty p-svg p-curve">{{ $withdrawal->user_wallet->currency_address }} </div>                                                                </div>
                                            </td>
                                            <td>
                                                <div class="media cs-media">
                                                    <div class="media-body">
                                                        <h5>{{ $withdrawal->user_wallet->has_memo ? $withdrawal->user_wallet->memo_token ?? 'Empty' : 'No memo' }}</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="pretty p-svg p-curve">${{ $withdrawal['amount'] }}</div>
                                            </td>
                                            <td>
                                                <div class="pretty p-svg p-curve deposit_pending">{{ $withdrawal['status'] }}</div>
                                            </td>
                                            <td>
                                                <div class="pretty p-svg p-curve">{{ $withdrawal['created_at'] }}</div>
                                            </td>

                                            <td>
                                                <nav class="navbar navbar-expand">
                                                    <ul class="navbar-nav">
                                                        <!-- Dropdown -->
                                                        <li class="nav-item dropdown">
                                                            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"> <i class="fa fa-ellipsis-v"></i>
                                                            </a>
                                                            <div class="dropdown-menu">
                                                                <a data-action="approve" data-id="{{ $withdrawal['id'] }}" class="action-link dropdown-item" href="#">Approve</a>
                                                                <a data-action="deny" data-id="{{ $withdrawal['id'] }}" class="action-link dropdown-item" href="#">Deny</a>                                                                                
                                                                <a data-action="delete" data-id="{{ $withdrawal['id'] }}" class="action-link dropdown-item" href="#">Delete</a>
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
<script src="{{ asset('js/admin.withdrawals.js') }}"></script>
</body>

</html>