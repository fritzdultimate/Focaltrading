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
                            <h1>Parent Plan</h1>
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
                                    <li class="breadcrumb-item active text-primary" aria-current="page">Parent Plan</li>
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
                            <div align="right">
                                <button class="btn add-plan btn-primary btn-rounded rounded pill input-rounded">
                                    Add Parent Plan
                                </button>
                            </div>
                            <div class="datatable-wrapper table-responsive">
                                <table id="datatable" class="display compact table table-striped table-bordered">
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
            <!--mail-Compose-contant-end-->
        </div>
        <!-- end container-fluid -->
    </div>
    <!-- end app-main -->
</div>
@include('admin.layouts.footer')
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
@include('admin.layouts.general-scripts')
<script src="{{ asset('plugins/lobibox/js/lobibox.js') }}"></script>
<script src="{{ asset('plugins/blockUi/jquery.blockUi.js') }}"></script>
<script src="{{ asset('js/fn.js') }}"></script>
<script src="{{ asset('js/admin.parent-plan.js') }}"></script>
</body>

</html>