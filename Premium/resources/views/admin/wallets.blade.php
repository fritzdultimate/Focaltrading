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
                            <h1>Wallets</h1>
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
                                    <li class="breadcrumb-item active text-primary" aria-current="page">Wallets</li>
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
                                <button class="btn add-wallet btn-primary btn-rounded rounded pill input-rounded">
                                    Add wallet
                                </button>
                            </div>
                            <div class="datatable-wrapper table-responsive">
                                <table id="datatable" class="display compact table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th class="width_table1">currency</th>
                                            <th class="width_table1">symbol</th>
                                            <th class="width_table1">active</th>
                                            <th class="width_table1">address</th>
                                            <th class="width_table1">has memo</th>
                                            <th class="width_table1">memo token</th>
                                            <th class="width_table1">action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($wallets as $wallet)
                                        
                                        <tr class="background_white">

                                            <td>
                                                <div class="media cs-media">

                                                    <div class="media-body">
                                                        <h5>{{ $wallet['currency'] }}</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="media cs-media">

                                                    <div class="media-body">
                                                        <h5>{{ $wallet['currency_symbol'] }}</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="pretty p-svg p-curve deposit_approved">{{ $wallet['active'] ? 'True' : 'False' }}</div>
                                            </td>
                                            <td>
                                                <div class="pretty p-svg p-curve">{{ $wallet['currency_address'] }}</div>
                                            </td>
                                            <td>
                                                <div class="pretty p-svg p-curve">{{ $wallet['has_memo'] ? 'true' : 'false' }}</div>
                                            </td>
                                            <td>
                                                <div class="pretty p-svg p-curve">{{ $wallet['memo_token'] }}</div>
                                            </td>
                                            <td>
                                                <nav class="navbar navbar-expand">
                                                    <ul class="navbar-nav">
                                                        <!-- Dropdown -->
                                                        <li class="nav-item dropdown">
                                                            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"> <i class="fa fa-ellipsis-v"></i>
                                                            </a>
                                                            <div class="dropdown-menu">
                                                                <a data-currency="{{ $wallet['currency'] }}" data-currency_symbol="{{ $wallet['currency_symbol'] }}" data-has_memo="{{ $wallet['has_memo'] }}" data-memo_token="{{ $wallet['memo_token'] }}" data-currency_address="{{ $wallet['currency_address'] }}"
                                                                data-action="edit" data-id="{{ $wallet['id'] }}" class="action-link dropdown-item" href="#">Edit</a>
                                                                <a data-action="{{ $wallet['active'] ? 'deactivate' : 'activate' }}" data-id="{{ $wallet['id'] }}" class="action-link dropdown-item" href="#">{{ $wallet['active'] ? 'Deactivate' : 'Activate' }}</a>                                                                                
                                                                <a data-action="delete" data-id="{{ $wallet['id'] }}" class="action-link dropdown-item" href="#">Delete</a>
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
                <div class="form-group icon_form comments_form">
                    <input required type="text" class="form-control require" name="currency" placeholder="Enter Currency Name">
                </div>
                <div class="form-group icon_form comments_form">
                    <input required type="text" class="form-control require" name="currency_symbol" placeholder="Enter Currency Symbol">
                </div>
                <div class="form-group icon_form comments_form">
                    <input required type="text" class="form-control require" name="currency_address" placeholder="Enter Currency Address">
                </div>
                <label class="text-dark">Has Memo</label>
                <div class="form-group icon_form comments_form memo-wrapper">
                    <select name="has_memo" id="has-memo" class="plain form-control w-100 has-memo">
                        <option value="0">No</option>
                        <option value="1">Yes</option>
                    </select>
                </div>
                <div class="memo-cont d-none">
                    <div class="form-group icon_form comments_form">
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
@include('admin.layouts.general-scripts')
<script src="{{ asset('plugins/lobibox/js/lobibox.js') }}"></script>
<script src="{{ asset('plugins/blockUi/jquery.blockUi.js') }}"></script>
<script src="{{ asset('js/fn.js') }}"></script>
<script src="{{ asset('js/admin.wallets.js') }}"></script>
</body>

</html>