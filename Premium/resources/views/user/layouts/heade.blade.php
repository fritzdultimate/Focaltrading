<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>{{ $page_title }}</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta name="description" content="SiteName" />
    <meta name="keywords" content="SiteName" />
    <meta name="author" content="" />
    <meta name="MobileOptimized" content="320" />
    <link rel="stylesheet" type="text/css" href="{{ asset('css/animate.css') }}" />
    <link rel="stylesheet" type="text/css" href="{{ asset('css/bootstrap.min.css') }}" />
    <link rel="stylesheet" type="text/css" href="{{ asset('css/fonts.css') }}" />
    <link rel="stylesheet" type="text/css" href="{{ asset('plugins/lobibox/css/lobibox.min.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('css/flaticon2.css') }}" />
    <link rel="stylesheet" type="text/css" href="{{ asset('css/font-awesome.css') }}" />
    <link rel="stylesheet" type="text/css" href="{{ asset('css/owl.carousel.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('css/owl.theme.default.css') }}">
	<link rel="stylesheet" type="text/css" href="{{ asset('css/nice-select.css') }}" />
    <link rel="stylesheet" type="text/css" href="{{ asset('css/datatables.css') }}" />
	<link rel="stylesheet" type="text/css" href="{{ asset('css/dropify.min.css') }}" />
    <link rel="stylesheet" type="text/css" href="{{ asset('css/reset.css') }}" />
    <link rel="stylesheet" type="text/css" href="{{ asset('css/magnific-popup.css') }}">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="{{ $mode == 'dark' ? asset('css/style.css') : asset('css/light-theme.css') }}" id="app-theme"/>
    <link rel="stylesheet" type="text/css" href="{{ asset('css/responsive.css') }}" />
    <link rel="stylesheet" type="text/css" href="{{ asset('css/custom.css') }}" />
    <link rel="shortcut icon" type="image/png" href="{{ asset('images/favicon.png') }}" />
</head>
<body class="{{ $mode }}">
    @include('preloader.index')
    <a href="javascript:void(0)" id="return-to-top"> <i class="fas fa-angle-double-up"></i></a>
    <div class="container">
        <center>
            <div id="google_translate_element"></div>

            <script type="text/javascript">
                function googleTranslateElementInit() {
                    new google.translate.TranslateElement({pageLanguage: 'en'}, 'google_translate_element');
                }
            </script>

            <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
        </center>
    </div>
	 <div class="cp_navi_main_wrapper inner_header_wrapper dashboard_header_middle float_left">
        <div class="container-fluid">
              <div class="cp_logo_wrapper">
                <a href="/user">
                     <!--<img src="{{ asset('images/site_logo.jpeg') }}" alt="{{ env('SITE_NAME') }}" style="display: block;width: 200px;height: 50px;padding: 0;margin: 0;display: block;"> -->
                    <h4 class="text-white" style="font-weight: 600">WiseFex</h4>
                </a>
            </div>
            <header class="mobail_menu d-block d-sm-block d-md-block ">
                <div class="container-fluid">
                    <div class="row">				
                       <div class="col-lg-12 col-md-12 col-sm-12 col-12 d-flex justify-content-end">
                           <div class="crm_profile_dropbox_wrapper mr-1 d-none">
                            <div class="nice-select" tabindex="0">
                                <span class="current"><img src="/images/avatar.png" alt="img"> 
                                    <span class="d-none d-md-inline-flex"> hi, {{ $user['name'] }} </span><span class="hidden_xs_content"></span></span>
                                <ul class="list">
    
                                    <li><a href="#"><i class="flaticon-profile"></i> Profile</a>
                                    </li>
                                    <li><a href="#"><i class="flaticon-purse"></i> My Balance</a>
                                    </li>
                                   
                                    <li><a href="#"><i class="flaticon-settings"></i> Setting</a>
                                    </li>
                                    
                                    <li><a href="#"><i class="flaticon-turn-off"></i> Logout</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="d-inline-flex justify-content-center align-items-center px-3 mx-2 theme-toggler">
                            <i class="nav-icon far fa-lightbulb text-light"></i>
                        </div>
                        <div data-toggle-fullscreen class="d-inline-flex justify-content-center align-items-center px-3 mx-2 fullscreen-btn">
                            <i class="nav-icon fas fa-expand text-light" data-opp="fas fa-compress"></i>
                        </div>
                            <div class="cd-dropdown-wrapper d-lg-none d-xl-none">
                                <a class="house_toggle inner_toggle" href="#0">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_1" x="0px" y="0px" viewBox="0 0 31.177 31.177" style="enable-background:new 0 0 31.177 31.177;" xml:space="preserve" width="25px" height="25px">
                                        <g>
                                            <g>
                                                <path class="menubar" d="M30.23,1.775H0.946c-0.489,0-0.887-0.398-0.887-0.888S0.457,0,0.946,0H30.23    c0.49,0,0.888,0.398,0.888,0.888S30.72,1.775,30.23,1.775z" fill="#004165" />
                                            </g>
                                            <g>
                                                <path class="menubar" d="M30.23,9.126H12.069c-0.49,0-0.888-0.398-0.888-0.888c0-0.49,0.398-0.888,0.888-0.888H30.23    c0.49,0,0.888,0.397,0.888,0.888C31.118,8.729,30.72,9.126,30.23,9.126z" fill="#004165" />
                                            </g>
                                            <g>
                                                <path class="menubar" d="M30.23,16.477H0.946c-0.489,0-0.887-0.398-0.887-0.888c0-0.49,0.398-0.888,0.887-0.888H30.23    c0.49,0,0.888,0.397,0.888,0.888C31.118,16.079,30.72,16.477,30.23,16.477z" fill="#004165" />
                                            </g>
                                            <g>
                                                <path class="menubar" d="M30.23,23.826H12.069c-0.49,0-0.888-0.396-0.888-0.887c0-0.49,0.398-0.888,0.888-0.888H30.23    c0.49,0,0.888,0.397,0.888,0.888C31.118,23.43,30.72,23.826,30.23,23.826z" fill="#004165" />
                                            </g>
                                            <g>
                                                <path class="menubar" d="M30.23,31.177H0.946c-0.489,0-0.887-0.396-0.887-0.887c0-0.49,0.398-0.888,0.887-0.888H30.23    c0.49,0,0.888,0.398,0.888,0.888C31.118,30.78,30.72,31.177,30.23,31.177z" fill="#004165" />
                                            </g>
                                        </g>
                                    </svg>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
        </div>
    </div>