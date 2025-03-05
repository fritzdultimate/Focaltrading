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
                            <h1>KYC Verification</h1>
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
                                    <li class="breadcrumb-item active text-primary" aria-current="page">KYC</li>
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
                    @if ($errors->any())
                        <div class="alert alert-danger">
                                {{ $errors->all()[0] }}
                        </div>
                    @elseif(session('error'))
                        <div class="alert alert-danger">
                            <span class="alert-text">
                                {{ session('error') }}
                            </span>
                        </div>
                    @elseif (session('success'))
                        <div class="alert alert-success">
                            <span class="alert-text">
                                {{ session('success') }}
                            </span>
                        </div>
                    @endif
                    <div class="card card-statistics">
                        <div class="card-body">
                            <div align="right">
                                <button class="btn add-wallet btn-primary btn-rounded rounded pill input-rounded">
                                    Upload Document
                                </button>
                            </div>
                            <div class="datatable-wrapper table-responsive">
                                <table id="datatable" class="display compact table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th class="width_table1">Document</th>
                                            <th class="width_table1">Name</th>
                                            <th class="width_table1">Status</th>
                                            <th class="width_table1">actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($kycs as $kyc)
                                        <tr class="background_white">
                                            <td>
                                                <div class="media cs-media">

                                                    <div class="media-body">
                                                        <a href="{{ asset($kyc->document) }}">
                                                            <img src="{{ asset($kyc->document) }}" style="width: 50px; height: 50px">
                                                        </a>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="media cs-media">

                                                    <div class="media-body">
                                                        <h5>
                                                            <a href="{{ asset($kyc->document) }}">
                                                                {{ $kyc->doc_name }}
                                                            </a>
                                                        </h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="pretty p-svg p-curve">
                                                    <span class="{{ $kyc->status == 'pending' ? 'bg-danger'  : ( $kyc->status == 'rejected' ? 'btn-warning' : 'bg-success') }} text-light" style="padding: 2px 7px; border-radius: 20px; font-style: italic; font-size: 12px">
                                                        {{ $kyc->status }}
                                                    </span>
                                                </div>
                                            </td>
                                            <td>
                                                <a class="text-danger font-bold" href="/kyc/doc/delete/{{$kyc->id}}">Delete</a>
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
<div class="modal fade" id="wallet-modal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title">
              <span class="wallet-action">Upload New</span> Doc
            </h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>

        <div class="modal-body">
            <form class="" action="{{ route('kyc.store') }}" method="post" enctype="multipart/form-data">
                @csrf
                <div class="form-group icon_form comments_form memo-wrapper">
                    <label class="text-dark">Document</label>
                    <input type="file" name="document" required>
                </div>
                <div class="form-group icon_form comments_form">
                    <label class="text-dark">Doc Name</label>
                    <select class="w-100" name="doc_name">
                        <option>Passport</option>
                        <option>Drivers License</option>
                        <option>Others</option>
                    </select>
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
 <!--@include('user.layouts.general-scripts')-->
    <script src="{{ asset('plugins/lobibox/js/lobibox.js') }}"></script>
    <script src="{{ asset('js/fn.js') }}"></script>
    <script src="{{ asset('js/kyc.js?ref=6') }}"></script>
    <!--main js file end-->
</body>

</html>
