   <!-- login wrapper end -->
    <!-- payments wrapper start -->
    <div class="payments_wrapper float_left">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <div class="sv_heading_wraper half_section_headign">
                        <h4>Payment Methods</h4>
                        <h3>Accepted Payment Method</h3>

                    </div>
                </div>
                <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                    <div class="payment_slider_wrapper">
                        <div class="owl-carousel owl-theme">
                            @if(isset($main_wallets))
                            @foreach($main_wallets as $wallet)
                            <div class="item">
                                <div class="partner_img_wrapper float_left">
                                    <i class="cc {{ strtoupper($wallet['currency_symbol']) }} shadow" style="font-size : 40px"></i>
                                    <h2 class='d-inline text-light'>{{ $wallet['currency'] }}</h2>
                                </div>

                            </div>
                            @endforeach
                            @endif
                            <!--<div class="item">-->

                            <!--    <div class="partner_img_wrapper float_left">-->
                            <!--        <img src="images/dogecoin.jpg" width="100" height="100" class="img-responsive" alt="img">-->
                            <!--    </div>-->

                            <!--</div>-->
                            <!--<div class="item">-->

                            <!--    <div class="partner_img_wrapper float_left">-->
                            <!--        <img src="images/partner3.png" class="img-responsive" alt="img">-->
                            <!--    </div>-->

                            <!--</div>-->
                            <!--<div class="item">-->

                            <!--    <div class="partner_img_wrapper float_left">-->
                            <!--        <img src="images/litecoin.jpg" width="100" height="100" class="img-responsive" alt="img">-->
                            <!--    </div>-->

                            <!--</div>-->
                            <!--<div class="item d-none">-->

                            <!--    <div class="partner_img_wrapper float_left">-->
                            <!--        <img src="images/partner2.png" class="img-responsive" alt="img">-->
                            <!--    </div>-->
                            <!--</div>-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- payments wrapper end -->
    <!-- footer section start-->
    <div class="footer_main_wrapper index2_footer_wrapper float_left">

        <div class="container">

            <div class="row">

                <div class="col-lg-4 col-md-6 col-12 col-sm-12">
                    <div class="wrapper_second_about">
                        <div class="wrapper_first_image">
                            <a href="/">
                                <img src="{{ asset('images/site_logo.jpeg') }}" alt="{{ env('SITE_NAME') }}" style="display: block;width: 200px;height: 50px;padding: 0;margin: 0;display: block;">
                            </a>
                        </div>
                        <p>We are a full service Digital Marketing Agency all the foundational tool you need.</p>
                        <div class="counter-section">
                            <div class="ft_about_icon float_left">
                                <i class="flaticon-user"></i>
                                <div class="ft_abt_text_wrapper">
                                    <p class="timer"> <span>{{ 13000 + round($settings->visit_count/3) }}</span></p>
                                    <p>total member</p>
                                </div>

                            </div>
                            <div class="ft_about_icon float_left">
                                <i class="flaticon-money-bag"></i>
                                <div class="ft_abt_text_wrapper">
                                    <p class="timer"><span>{{ 2000000 + $settings->visit_count }}</span></p>
                                    <p>total deposited</p>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="col-lg-2 col-md-3 col-12 col-sm-4">
                    <div class="wrapper_second_useful">
                        <h4>usefull links </h4>

                        <ul>
                            <li><a href="/about-us"><i class="fa fa-angle-right"></i>About us</a>
                            </li>
                            <li><a href="/terms"><i class="fa fa-angle-right"></i>Terms and Conditions</a>
                            </li>
                            <li><a href="/privacy-policy"><i class="fa fa-angle-right"></i>privacy Policy</a> </li>
                        </ul>

                    </div>
                </div>
                <div class="col-lg-2 col-md-3 col-12 col-sm-4">
                    <div class="wrapper_second_useful wrapper_second_links">

                        <ul>
                            <li><a href="/faqs"><i class="fa fa-angle-right"></i>FAQ </a>
                            </li>
                            <li><a href="/how-it-works"><i class="fa fa-angle-right"></i>How it works </a>
                            </li>
                        </ul>

                    </div>
                </div>

                <div class="col-lg-4 col-md-6 col-12 col-sm-12">
                    <div class="wrapper_second_useful wrapper_second_useful_2">
                        <h4>contact  us</h4>

                        <ul>
                            <li>
                                <h1>+{{ $settings['whatsapp_number'] }}</h1></li>
                            <li><a href="#"><i class="flaticon-mail"></i>admin&#64;{{ request()->getHttpHost() }}</a>
                            </li>
                            <li><a href="#"><i class="flaticon-language"></i>www.{{ request()->getHttpHost() }}</a>
                            </li>

                            <li><a href=""><i class="flaticon-placeholder"></i>{{ env('SITE_ADDRESS') }}</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                    <div class="copyright_wrapper float_left">
                        <div class="copyright">
                            <p>Copyright <i class="far fa-copyright"></i> {{ date('Y') }} <a href="/"> {{ env('SITE_NAME') }}</a>. all right reserved </p>
                        </div>
                        <div class="social_link_foter">

                            <ul>
                                <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                                <!--<li><a href="#"><i class="fab fa-twitter"></i></a></li>-->
                                <!--<li><a href="#"><i class="fab fa-linkedin-in"></i></a></li>-->
                                <li><a href="https://t.me/wisefexven"><i class="fab fa-telegram"></i></a></li>

                            </ul>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <script src="{{ asset('js/jquery-3.3.1.min.js') }}"></script>
    <script src="{{ asset('js/bootstrap.min.js') }}"></script>
    <script src="{{ asset('js/modernizr.js') }}"></script>
    <script src="{{ asset('js/jquery.menu-aim.js') }}"></script>
    <script src="{{ asset('js/plugin.js') }}"></script>
    <script src="{{ asset('js/jquery.countTo.js') }}"></script>
	<script src="{{ asset('js/dropify.min.js') }}"></script>
	<script src="{{ asset('js/datatables.js') }}"></script>
    <script src="{{ asset('js/jquery.nice-select.min.js') }}"></script>
    <script src="{{ asset('js/jquery.inview.min.js') }}"></script>
    <script src="{{ asset('js/jquery.magnific-popup.js') }}"></script>
    <script src="{{ asset('js/owl.carousel.js') }}"></script>
    <script src="{{ asset('js/calculator.js?ref=9') }}"></script>
    <script src="{{ asset('js/custom.js') }}"></script>
    <script src="{{ asset('js/fn.js') }}"></script>
    <script src="{{ asset('js/general.js?ref=9') }}"></script> 