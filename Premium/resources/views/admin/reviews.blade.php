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
                            <h1>Review</h1>
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
                                    <li class="breadcrumb-item active text-primary" aria-current="page">Review</li>
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
                    <div align="right" class="py-2">
                        <button class="btn add-review btn-primary btn-rounded rounded pill input-rounded">
                            Add Review
                        </button>
                    </div>
                    <div class="card card-statistics">
                        <div class="card-body">
                            
                            <div class="datatable-wrapper table-responsive">
                                <table id="datatable" class="display compact table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th class="width_table1">User</th>
                                            <th class="width_table1">Plan</th>
                                            <th class="width_table1">Occupation</th>
                                            <th class="width_table1">Review</th>
                                            <th class="width_table1">Active</th>
                                            <th class="width_table1">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($reviews as $review)
                                        
                                        <tr class="background_white">
                                            <td>
                                                <div class="media cs-media">

                                                    <div class="media-body">
                                                        <h5>{{ $review['user'] }}</h5>
                                                    </div>
                                                </div>
                                            </td>
                                             <td>
                                                <div class="media cs-media">

                                                    <div class="media-body">
                                                        <h5>{{ $review->child_plan->name }}</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="media cs-media">

                                                    <div class="media-body">
                                                        <h5>{{ $review['occupation'] }}</h5>
                                                    </div>
                                                </div>
                                            </td>
                                             <td>
                                                <div class="media cs-media">

                                                    <div class="media-body">
                                                        <h5>{{ substr($review['review'], 0, 30) }}</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="media cs-media">

                                                    <div class="media-body">
                                                        <h5>{{ $review['active'] }}</h5>
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
                                                                <a data-action="edit" data-user="{{ $review['user'] }}" data-review="{{ $review['review'] }}" data-active="{{ $review['active'] }}" data-occupation="{{ $review['occupation'] }}" data-plan="{{ $review->plan }}" data-id="{{ $review['id'] }}" class="action-link dropdown-item" href="#">Edit</a>
                                                                <a data-action="activate"  data-to="{{ $review['active'] == '1' ? 'activate' : 'deactivate'}}" data-id="{{ $review['id'] }}" class="action-link dropdown-item" href="#">Toggle Activate</a>
                                                                <a data-action="delete" data-id="{{ $review['id'] }}" class="action-link dropdown-item" href="#">Delete</a>
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
<div class="modal fade" id="review-modal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title">
              <span class="review-action">Add New</span> Review
            </h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <div class="modal-body">
            <form class="page-form review-form" action="">
                <div class="form-group icon_form comments_form">
                    <input required type="text" class="form-control require" name="user" placeholder="User">
                </div>
                <div class="form-group icon_form comments_form">
                    <label class="text-dark"> Plan</label>
                    <select class="w-100 plain form-control" name="plan" id="plan_id">
                        @foreach ($plans as $plan)
                            <option value="{{ $plan['id'] }}"> {{ $plan['name'] }} </option>
                        @endforeach
                    </select>
                </div>
                <div class="form-group icon_form comments_form">
                    <input required type="text" class="form-control require" name="occupation" placeholder="Enter users occupation">
                </div>
                <div class="form-group icon_form comments_form">
                    <label class="text-dark"> Is Active </label>
                    <select class="w-100 plain form-control" name="active">
                        <option value="1"> Yes </option>
                        <option value="0"> No </option>
                    </select>
                </div>
                <div class="form-group icon_form comments_form">
                    <textarea class="form-control w-100" rows='3' name="review"></textarea>
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
<script src="{{ asset('js/admin.reviews.js') }}"></script>
</body>

</html>