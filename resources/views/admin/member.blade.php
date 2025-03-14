@include('admin.layouts.header')
    <div class="page_title_section dashboard_title">
        <div class="page_header">
            <div class="container">
                <div class="row small">

                    <div class="col-xl-9 col-lg-7 col-md-7 col-12 col-sm-7 d-flex align-items-end">
                        <h5 class="text-white static">Members</h5>
                    </div>
                    <div class="col-xl-3 col-lg-5 col-md-5 col-12 col-sm-5">
                        <div class="sub_title_section">
                            <ul class="sub_title">
                                <li> <a href="#"> Admin </a>&nbsp; / &nbsp; </li>
                                <li>Members</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- inner header wrapper end -->
	@include('admin.layouts.sidebar')
         <div class="l-main pt-lg-5 mt-lg-5">             
            <div class="d-none d-lg-block">
                <br><br><br>
            </div>
            <div class="deposit_list_wrapper float_left">
                <div class="row">
                    <div class="col-md-12 col-lg-12 col-sm-12 col-12">
                        <div class="sv_heading_wraper">
                            <h3>Site Members</h3>
                        </div>
                    </div>
                </div>
                <div class="crm_customer_table_main_wrapper withdrawal_tables float_left">
                    <div class="row">
                        <div class="col-md-12 col-lg-12 col-sm-12 col-12">
                            <div class="tab-content">
                                <div id="home" class="tab-pane active">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-12">
                                            <div class="table-responsive">
                                                <table class="record-table table datatables cs-table crm_customer_table_inner_Wrapper">
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
                        </div>
                    </div>
                </div>
            </div>
            @include('admin.layouts.footer')
         </div>
            @include('user.layouts.general-scripts')
            <script src="{{ asset('plugins/lobibox/js/lobibox.js') }}"></script>
            <script src="{{ asset('plugins/blockUi/jquery.blockUi.js') }}"></script>
            <script src="{{ asset('js/fn.js') }}"></script>
            <script src="{{ asset('js/admin.members.js') }}"></script>
</body>

</html>