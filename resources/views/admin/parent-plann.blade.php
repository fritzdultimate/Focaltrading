@include('admin.layouts.header')
    <div class="page_title_section dashboard_title">
        <div class="page_header">
            <div class="container">
                <div class="row small">

                    <div class="col-xl-9 col-lg-7 col-md-7 col-12 col-sm-7 d-flex align-items-end">
                        <h5 class="text-white static">Parent plan</h5>
                    </div>
                    <div class="col-xl-3 col-lg-5 col-md-5 col-12 col-sm-5">
                        <div class="sub_title_section">
                            <ul class="sub_title">
                                <li> <a href="#"> Admin </a>&nbsp; / &nbsp; </li>
                                <li>Parent Plan</li>
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
                    <div class="col-6">
                        <div class="sv_heading_wraper">
                            <h3>Parent Plans</h3>
                        </div>
                    </div>
                    <div class="col-6 d-flex justify-content-end">
                        <div class="sv_heading_wraper d-flex justify-content-end">
                            <button class="btn add-plan btn-primary btn-xs btn-rounded rounded pill input-rounded">
                                Add Parent Plan
                            </button>
                        </div>
                    </div>
                </div>
                <div class="crm_customer_table_main_wrapper deposit_tables float_left">
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
                                                            <th class="width_table1">Name</th>
                                                            <th class="width_table1">action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        @foreach ($plans as $plan)
                                                        
                                                        <tr class="background_white">

                                                            <td>
                                                                <div class="media cs-media">

                                                                    <div class="media-body">
                                                                        <h5>{{ $plan['name'] }}</h5>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <nav class="navbar navbar-expand">
                                                                    <ul class="navbar-nav">
                                                                        <!-- Dropdown -->
                                                                        <li class="nav-item dropdown">
                                                                            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"> <i class="fa fa-ellipsis-v"></i>
                                                                            </a>
                                                                            <div class="dropdown-menu">
                                                                                <a data-action="edit" data-name="{{ $plan['name'] }}" data-id="{{ $plan['id'] }}" class="action-link dropdown-item" href="#">Edit</a>
                                                                                <a data-action="delete" data-id="{{ $plan['id'] }}" class="action-link dropdown-item" href="#">Delete</a>
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
         <div class="modal fade" id="plan-modal">
            <div class="modal-dialog modal-dialog-centered">
              <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">
                      <span class="plan-action">Add New</span> Parent Plan
                    </h4>
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <div class="modal-body">
                    <form class="page-form plan-form" action="">
                        <div class="form-group icon_form comments_form">
                            <input required type="text" class="form-control require" name="name" placeholder="Enter Plan Name">
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
            @include('user.layouts.general-scripts')
            <script src="{{ asset('plugins/lobibox/js/lobibox.js') }}"></script>
            <script src="{{ asset('plugins/blockUi/jquery.blockUi.js') }}"></script>
            <script src="{{ asset('js/fn.js') }}"></script>
            <script src="{{ asset('js/admin.parent-plan.js') }}"></script>
</body>

</html>