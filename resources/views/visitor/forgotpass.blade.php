@include('visitor.layouts.header')
    <div class="page_title_section">

        <div class="page_header">
            <div class="container">
                <div class="row">

                    <div class="col-lg-9 col-md-9 col-12 col-sm-8">

                        <h5 class="text-white">Forgot Password</h5>
                    </div>
                    <div class="col-lg-3 col-md-3 col-12 col-sm-4">
                        <div class="sub_title_section">
                            <ul class="sub_title">
                                <li> <a href="#"> Home </a>&nbsp; / &nbsp; </li>
                                <li>Forgot Password</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="login_wrapper fixed_portion float_left">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <div class="login_top_box d-flex justify-content-center align-items-center">
                        
                        <div class="login_form_wrapper">
                            <div class="sv_heading_wraper heading_wrapper_dark dark_heading hwd">

                                <h3> Forgot Password </h3>

                            </div>
                            <p>Enter Your Email Address</p>
                            <form class="page-form pass-form">
                                <div class="form-group icon_form comments_form">

                                    <input required type="email" class="form-control require" name="email" placeholder="Email Address">
                                
                                </div>
                                <div>
                                    <button class="btn btn-warning w-100 input-rounded" type="submit">
                                        <span class="form-loading d-none px-5">
                                            <i class="fa fa-sync fa-spin"></i>
                                        </span>
                                        <span class='submit-text'>
                                            Submit
                                        </span>
                                    </button>
                                </div>
                            </form>
                            <div class="dont_have_account float_left">
                                <p>back to login? <a href="/login">Login</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
   
   @include('visitor.layouts.footer')

   <script src="{{ asset('plugins/lobibox/js/lobibox.js') }}"></script>
    <script src="{{ asset('js/forgotpass.js') }}"></script>

    <!-- custom js-->

</body>

</html>