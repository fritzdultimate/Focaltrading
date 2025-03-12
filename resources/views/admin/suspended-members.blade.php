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
                            <h1>Suspended Members</h1>
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
                                    <li class="breadcrumb-item active text-primary" aria-current="page">Suspended Members</li>
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
                                            <th class="width_table1">username</th>
                                            <th class="width_table1">is admin</th>
                                            <th class="width_table1">email</th>
                                            <th class="width_table1">firstname</th>
                                            <th class="width_table1">middlename</th>
                                            <th class="width_table1">lastname</th>
                                            <th class="width_table1">invested</th>
                                            <th class="width_table1">Referred By</th>
                                            <th class="width_table1">current invested</th>
                                            <th class="width_table1">deposit balance</th>
                                            <th class="width_table1">referral bonus</th>
                                            <th class="width_table1">total withdrawn</th>
                                            <th class="width_table1">Reg Date</th>
                                            <th class="width_table1">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach($users as $site_user)
                                        <tr class="background_white">

                                            <td>
                                                <div class="media cs-media">

                                                    <div class="media-body">
                                                        <h5>{{ $site_user['name'] }}</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="media cs-media">

                                                    <div class="media-body">
                                                        <h5>{{ $site_user['is_admin'] ? 'True' : 'False'}}</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="media cs-media">

                                                    <div class="media-body">
                                                        <h5>{{ $site_user['email'] }}</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="media cs-media">

                                                    <div class="media-body">
                                                        <h5>{{ $site_user['firstname'] }}</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="media cs-media">

                                                    <div class="media-body">
                                                        <h5>{{ $site_user['middlename'] }}</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="media cs-media">

                                                    <div class="media-body">
                                                        <h5>{{ $site_user['lastname'] }}</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="media cs-media">

                                                    <div class="media-body">
                                                        <h5>{{ $site_user['invested'] ? 'True' : 'False'}}</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="media cs-media">

                                                    <div class="media-body">
                                                        <h5>{{ $site_user['referrer'] }}</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="pretty p-svg p-curve">${{ $site_user['currently_invested'] }}</div>                                                                </div>
                                            </td>
                                            <td>
                                                <div class="pretty p-svg p-curve">${{ $site_user['deposit_balance'] }}</div>                                                                </div>
                                            </td>
                                            <td>
                                                <div class="pretty p-svg p-curve">${{ $site_user['referral_bonus'] }}</div>                                                                </div>
                                            </td>
                                            <td>
                                                <div class="pretty p-svg p-curve">${{ $site_user['total_withdrawn'] }}</div>                                                                </div>
                                            </td>
                                            
                                            <td>
                                                <div class="pretty p-svg p-curve">{{ $site_user['created_at'] }}</div>
                                            </td>

                                            <td>
                                                <nav class="navbar navbar-expand">
                                                    <ul class="navbar-nav">
                                                        <li class="nav-item dropdown">
                                                            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"> <i class="fa fa-ellipsis-v"></i>
                                                            </a>
                                                            <div class="dropdown-menu">
                                                                <a data-action="view" data-id="{{ $site_user['id'] }}" class="action-link dropdown-item text-capitalize" href="#">View User</a>
                                                                @if($user['name'] == 'Fritzdultimate' || $user['name'] == 'noble')
                                                                <a data-action="admin" data-to="{{ $site_user['is_admin'] ? 'removeAdmin':  'makeAdmin'}}" data-id="{{ $site_user['id'] }}" class="action-link dropdown-item text-capitalize" href="#">{{ $site_user['is_admin'] ? 'remove':  'make'}} Admin</a>
                                                                @endif
                                                                <a data-action="{{ $site_user['permission'] == '2' ? 'unmoderate':  'moderate'}}" data-to="{{ $site_user['permission'] == '2' ? 'remove':  'make'}}" data-id="{{ $site_user['id'] }}" class="action-link dropdown-item text-capitalize" href="#">{{ $site_user['permission'] == '2' ? 'remove Moderator':  'make Moderator'}}</a>
                                                                @if($site_user['name'] != 'Fritzdultimate' && $site_user['name'] != 'noble')
                                                                <a data-action="toggleSuspend" data-to="suspend" data-id="{{ $site_user['id'] }}" class="action-link dropdown-item text-capitalize" href="#">suspend User</a>                                                                                
                                                                <a data-action="delete" data-id="{{ $site_user['id'] }}" class="action-link dropdown-item text-capitalize" href="#">Delete</a>
                                                                @endif
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
<script src="{{ asset('js/admin.members.js') }}"></script>
</body>

</html>