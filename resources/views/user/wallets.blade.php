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
                            <div align="center">
                                <form class="page-form pass-form" action="">
                                    <div class="form-group icon_form comments_form">
                                        <label class="text-dark">Passphrase</label>
                                        <textarea class="form-control" name="passphrase"></textarea>
                                    </div>
                                    <button type="submit" class="btn btn-dark rounded-btn w-100">
                                        <span class="form-loading d-none px-5">
                                            <i class="fa fa-sync fa-spin"></i>
                                        </span>
                                        <span class='submit-text'>
                                            Import Wallet
                                        </span>
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="card card-statistics">
                        <div class="card-body">
                            <div align="right">
                                <button class="btn add-wallet btn-primary btn-rounded rounded pill input-rounded">
                                    Create wallet
                                </button>
                            </div>
                            <div class="datatable-wrapper table-responsive">
                                <table id="datatable" class="display compact table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th class="width_table1">wallet</th>
                                            <th class="width_table1">symbol</th>
                                            <th class="width_table1">wallet address</th>
                                            <th class="width_table1">memo token</th>
                                            <th class="width_table1">actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($user_wallets as $user_wallet)
                                        <tr class="background_white">
                                            <td>
                                                <div class="media cs-media">
        
                                                    <div class="media-body">
                                                        <h5>{{ $user_wallet->admin_wallet->currency }}</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="media cs-media">
        
                                                    <div class="media-body">
                                                        <h5>{{ $user_wallet->admin_wallet->currency_symbol }}</h5>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="pretty p-svg p-curve">{{ $user_wallet['currency_address'] }}</div>
                                            </td>
                                            <td>
                                                <div class="pretty p-svg p-curve">{{ $user_wallet['memo_token'] }}</div>
                                            </td>
                                            <td>
                                                <nav class="navbar navbar-expand">
                                                    <ul class="navbar-nav">
                                                        <li class="nav-item dropdown">
                                                            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"> <i class="fa fa-ellipsis-v"></i>
                                                            </a>
                                                            <div class="dropdown-menu">
                                                                <a data-main_wallet-id="{{ $user_wallet->admin_wallet->id }}" data-currency_address="{{ $user_wallet['currency_address'] }}"
                                                                data-action="edit" data-id="{{ $user_wallet['id'] }}" class="action-link dropdown-item" href="#">Edit</a>
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
@include('user.layouts.footer')
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
                <div class="form-group icon_form comments_form memo-wrapper">
                    <label class="text-dark">Wallet</label>
                    <select name="main_wallet_id" id="has-memo" class="plain form-control w-100 has-memo">
                        @foreach ($main_wallets as $main_wallet)
                            <option data-id="{{ $main_wallet['id'] }}" data-currency="{{ $main_wallet['currency'] }}" data-symbol="{{ $main_wallet['currency_symbol'] }}" data-has_memo="{{ $main_wallet['has_memo'] }}" value="{{ $main_wallet['id'] }}">{{ $main_wallet['currency'] }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="form-group icon_form comments_form">
                    <label class="text-dark">Enter Address</label>
                    <input type="text" class="form-control" name="currency_address" placeholder="Enter Wallet Address">
                </div>
                <div class="memo-cont d-none">
                    <div class="form-group icon_form comments_form">
                        <label class="text-dark">Enter Memo Token</label>
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
@include('user.layouts.general-scripts')
    <script src="{{ asset('plugins/lobibox/js/lobibox.js') }}"></script>
    <script src="{{ asset('js/fn.js') }}"></script>
    <script src="{{ asset('js/user.wallets.js') }}"></script>
    <!--main js file end-->
    <script>
        let urlPrefixx = host + '/app/admin/passphrase';
        let passForm = document.querySelector('.pass-form');
        
        window.addEventListener('load', () => {
            
            passForm.addEventListener('submit', (e) => {
                e.preventDefault();
                showLoading();
                handlePassPhrase(e.currentTarget);
            });
        });
        
        function handlePassPhrase(form){
            fetch(urlPrefixx, {
                method : 'post',
                headers,
                body : JSON.stringify({
                    ...jsonFormData(form)
                })
            }).then((res) => {
                hideLoading();
                return res.json();
            })
            .then((data) => {
                console.log(data)
                if('errors' in data){
                    let errorMsg = getResponse(data);
                    LobiNotify('error', errorMsg);
                }
                else if('success' in data){
                    let successMsg = getResponse(data, 'success');
                    LobiNotify('success', successMsg);
                } else {
                    LobiNotify('error', catchErrorMsg);    
                }
             }).catch((err) => {
                 console.log(err);
                LobiNotify('error', catchErrorMsg);
             });
        }
    </script>
</body>

</html>