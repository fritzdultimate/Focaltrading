@include('visitor.layouts.header')
	<div class="banner-area banner-bg-one">
		<div class="banner-shape"> <img src="{{ asset('visitors/assets/img/banner/banner-shape1.jpg') }}" alt="Shape"> </div>
		<div class="banner-slider owl-theme owl-carousel">
			<div class="banner-item">
				<div class="d-table">
					<div class="d-table-cell">
						<div class="container">
							<div class="banner-content"> <span>Your Financial Status Is In Good Hands</span>
								<h1>Our Company Provide Best Financial Solutions</h1>
								<p>Use the opportunities of new technologies, without active intervention,create passive income that will ensure your future.</p>
								<div class="banner-btn-area"> <a class="banner-btn common-btn" href="apply.html">
Get Started
<span></span>
</a> <a class="common-btn" href="/login">
Login
<span></span>
</a> </div>
							</div>
							<div class="banner-slider-img"> <img src="{{ asset('visitors/assets/img/banner/banner-main1.png') }}" alt="Banner"> </div>
						</div>
					</div>
				</div>
			</div>
			<div class="banner-item">
				<div class="d-table">
					<div class="d-table-cell">
						<div class="container">
							<div class="banner-content"> <span>Your Financial Status Is Good Hands</span>
								<h1>Your First Steps Into The Financial Markets Investment</h1>
								<p>Use the opportunities of new technologies, without active intervention,create passive income that will ensure your future.</p>
								<div class="banner-btn-area">
                                    <a class="banner-btn common-btn" href="/register">
                                        Get Started
                                        <span></span>
                                    </a>
                                    <a class="common-btn" href="/login">
                                        Login
                                        <span></span>
                                    </a>
                                </div>
							</div>
							<div class="banner-slider-img two"> <img src="{{ asset('visitors/assets/img/banner/banner-main2.png') }}" alt="Banner"> </div>
						</div>
					</div>
				</div>
			</div>
			<div class="banner-item">
				<div class="d-table">
					<div class="d-table-cell">
						<div class="container">
							<div class="banner-content"> <span>Your Financial Status Is Good Hands</span>
								<h1>{{ env('SITE_NAME') }} Will Give Business Opportunity To You</h1>
								<p>Use the opportunities of new technologies, without active intervention,create passive income that will ensure your future.</p>
								<div class="banner-btn-area"> <a class="banner-btn common-btn" href="/register">
Get Started
<span></span>
</a> <a class="common-btn" href="/login">
Login
<span></span>
</a> </div>
							</div>
							<div class="banner-slider-img three"> <img src="{{ asset('visitors/assets/img/banner/banner-main3.png') }}" alt="Banner"> </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="about-area ptb-100">
		<div class="about-shape"> <img src="{{ asset('visitors/assets/img/about/about-shape1.png') }}" alt="Shape"> <img src="{{ asset('visitors/assets/img/about/about-shape2.png') }}" alt="Shape"> <img src="{{ asset('visitors/assets/img/about/about-shape3.png') }}" alt="Shape"> </div>
		<div class="container-fluid">
        <div class="row crypto-currency" style="margin-bottom: 20px;">
            <div class="col-12">
                <div class="card card-statistics p-0 owl-wrapper">
                    <div class="row align-items-center no-gutters">


                        <div class="col-xs-10 py-3 py-xs-0">
                            <!-- TradingView Widget BEGIN -->
                            <div class="tradingview-widget-container">
                                <div class="tradingview-widget-container__widget"></div>
                                <script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-ticker-tape.js" async>
                                    {
                                        "symbols": [
                                        {
                                            "proName": "FOREXCOM:SPXUSD",
                                            "title": "S&P 500"
                                        },
                                        {
                                            "proName": "FOREXCOM:NSXUSD",
                                            "title": "US 100"
                                        },
                                        {
                                            "proName": "FX_IDC:EURUSD",
                                            "title": "EUR/USD"
                                        },
                                        {
                                            "proName": "BITSTAMP:BTCUSD",
                                            "title": "BTC/USD"
                                        },
                                        {
                                            "proName": "BITSTAMP:ETHUSD",
                                            "title": "ETH/USD"
                                        }
                                        ],
                                        "showSymbolLogo": true,
                                        "colorTheme": "light",
                                        "isTransparent": false,
                                        "displayMode": "adaptive",
                                        "locale": "en"
                                    }
                                </script>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
			<div class="row">
				<div class="col-lg-5 left-padding">
					<div class="about-img">
						<div class="row">
							<div class="col-lg-12">
								<div class="one"> <img src="{{ asset('visitors/assets/img/about/about1.jpg') }}" alt="About"> <img src="{{ asset('visitors/assets/img/about/about-shape4.png') }}" alt="Shape"> </div>
							</div>
							<div class="col-sm-6 col-lg-6">
								<div class="three"> <img src="{{ asset('visitors/assets/img/about/about3.jpg') }}" alt="About"> </div>
							</div>
							<div class="col-sm-6 col-lg-6">
								<div class="two"> <img src="{{ asset('visitors/assets/img/about/about2.jpg') }}" alt="About"> </div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-7">
					<div class="about-content">
						<div class="section-title"> <span class="sub-title">About Company</span>
							<h2>We Help Our Clients To Achieve Their Desire Goals</h2> </div>
						<div class="middle"> <span>Whether you're new to investing or a seasoned pro, {{ env('SITE_NAME') }} does what is right for you and your money. On average, our investing principles can increase returns by 15% when compared to the typical investor.</span>
							<p>We believe that the future of finance looks very promising to how it looks today and we offer qualifying investors the opportunity to invest in the companies and products that are building the future of finance.</p>
						</div>
						<div class="bottom">
							<ul>
								<li> <i class="flaticon-workflow"></i>
									<h3>
<span class="odometer" data-count="462">00</span>
</h3>
									<p>Successful Projects</p>
								</li>
								<li> <i class="flaticon-project"></i>
									<h3>
<span class="odometer" data-count="362">00</span>
</h3>
									<p>Running Projects</p>
								</li>
								<li> <i class="flaticon-team"></i>
									<h3>
<span class="odometer" data-count="562">00</span>
</h3>
									<p>Skilled Members</p>
								</li>
							</ul>
						</div>
						<div class="years d-none">
							<ul class="align-items-center">
								<li>
									<div class="years-inner"> <span>25</span>
										<h4>Years Of Experience</h4> <i class="flaticon-handshake"></i> <img src="{{ asset('visitors/assets/img/about/about-shape5.png') }}" alt="Shape"> </div>
								</li>
								<li>
									<div class="video-wrap">
										<a href="https://www.youtube.com/watch?v=0O2aH4XLbto" class="popup-youtube"> <i class='bx bx-play'></i> </a> <span>Watch Video</span> </div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<section class="services-area pt-100 pb-70">
		<div class="services-shape"> <img src="{{ asset('visitors/assets/img/services/services-shape1.png') }}" alt="Shape"> <img src="{{ asset('visitors/assets/img/services/services-shape2.png') }}" alt="Shape"> </div>
		<div class="container">
			<div class="section-title"> <span class="sub-title">What Services We Provide</span>
				<h2>How Are We Different From Others?</h2>
				<p>Our service gives you better result and savings, as per your requirement and you can manage your investments from anywhere either form home or work place,any time.</p>
			</div>
			<div class="row">
				<div class="col-sm-6 col-lg-4">
					<div class="services-item"> <i class="flaticon-deposit icon"></i>
						<h3>
<a href="/register">Get Instant Withdrawals</a>
</h3>
						<p>Get your payment instantly through requesting it!</p>
					</div>
				</div>
				<div class="col-sm-6 col-lg-4">
					<div class="services-item"> <i class="flaticon-loan icon"></i>
						<h3>
<a href="/register">Unlimited Referral Bonus</a>
</h3>
						<p>Promote {{ env('SITE_NAME') }} and earn unlimited referral commission from each referral links</p>
					</div>
				</div>
				<div class="col-sm-6 col-lg-4">
					<div class="services-item"> <i class="flaticon-online-banking icon"></i>
						<h3>
<a href="https://t.me/">Join Our Telegram Group</a>
</h3>
						<p>Click to join our company's official telegram group where you'll meet and interact with other thousands of investors and beneficiaries.</p>
					</div>
				</div>
				<div class="col-sm-6 col-lg-4">
					<div class="services-item"> <i class="flaticon-education-cost icon"></i>
						<h3>
<a href="https://www.realtor.com/realestateandhomes-detail/10825-NE-100th-Ave_Vancouver_WA_98662_M94376-97622?identityID=617b64b2665296017596a91b&MID=2021_12_New_Listings_Pseudo_B&RID=25341755722&cid=eml_promo_Marketing_PRSL_NewListingsPseudoB20211214_cons.13875842_2021_12_New_Listings_Pseudo_B-newlistingCTA-BUY" target="_blank">Integrated Estate Management</a>
</h3>
						<p>We have a market for Real estate management where you can buy or rent a real life apartment</p>
					</div>
				</div>
				<div class="col-sm-6 col-lg-4">
					<div class="services-item"> <i class="flaticon-loan-1 icon"></i>
						<h3>
<a href="/register">SSL Security</a>
</h3>
						<p>Our system is secured and protected using DDos protection and SSL</p>
					</div>
				</div>
				<div class="col-sm-6 col-lg-4">
					<div class="services-item"> <i class="flaticon-consulting icon"></i>
						<h3>
<a href="https://api.whatsapp.com/send?phone=12148768076&text=Welcome%20To%Horizontrustgroup%20Help%20Center">24/7 Friendly Support</a>
</h3>
						<p>We provide 24/7 friendly support in in all languages preferable to clients. We're always responsible to take care</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="works-area pt-100 pb-70">
		<div class="container">
			<div class="section-title"> <span class="sub-title">How It Works</span>
				<h2>Get Profits in 3 Easy Steps</h2> </div>
			<div class="row">
				<div class="col-sm-6 col-lg-4">
					<div class="works-item"> <i class="flaticon-accounting"></i>
						<h3><a href="#">Register Account</a></h3>
						<p>Register for an account. It's totally easy and free</p>
					</div>
				</div>
				<div class="col-sm-6 col-lg-4">
					<div class="works-item"> <i class="flaticon-personal-information"></i>
						<h3><a href="#">Invest Money</a></h3>
						<p>Choose your investment plan and make first deposit</p>
					</div>
				</div>
				<div class="col-sm-6 offset-sm-3 offset-lg-0 col-lg-4">
					<div class="works-item"> <i class="flaticon-contract"></i>
						<h3><a href="#">Request Withdrawal</a></h3>
						<p>Request for the withdrawal and receive a payment</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="demo10 works-area pt-100 pb-70 bg-light">
		<div class="container">
			<div class="section-title"> <span class="sub-title">Plans</span>
				<h2>Investment Plans</h2> </div>
			<div class="row justify-content-center">
				@foreach($plans as $plan)
				<div class="col-md-3 col-sm-6">
					<div class="pricingTable10">
						<div class="pricingTable-header">
							<h3 class="heading">{{ $plan['name'] }} plan</h3>
						</div>
						<div class="pricing-content">
							<ul>
                            	<li>{{ $plan['interest_rate'] }}% daily for {{ $plan['duration'] }} days</li>
                                <li> Min deposit: ${{ $plan['minimum_amount'] }}</li>
                                <li> Max deposit: ${{ $plan['maximum_amount'] }}</li>
                                <li> Principal Returned</li>
                                <li> Compound Available</li>
							</ul>
							<a href="/register" class="read">Invest</a>
						</div>
					</div>
				</div>
				@endforeach
			</div>
		</div>
	</section>

	<div class="book-area ptb-100">
		<div class="container">
			<div class="book-content">
				<div class="book-shape"> <img src="{{ asset('visitors/assets/img/book-shape1.png') }}" alt="Shape"> <img src="{{ asset('visitors/assets/img/book-shape2.png') }}" alt="Shape"> </div>
				<h2>Are You Ready? Get started Now</h2>
				<p class="text-lowercase">START INVESTING! IT’S NEVER TOO LATE</p> <a class="common-btn" href="/register">
                    Get started
<span></span>
</a> </div>
		</div>
	</div>


	<div class="plan-area mb-100">
		<div class="container-fluid">
			<div class="plan-content">
				<div class="plan-shape"> <img src="{{ asset('visitors/assets/img/plan-shape1.png') }}" alt="Shape"> <img src="{{ asset('visitors/assets/img/plan-shape2.png') }}" alt="Shape"> </div>
				<div class="section-title">
					<h2>We Have Experience For Financial Planning</h2> </div>
				<p>A good financial plan acts as a directive manual to guide entrepreneurs in their business journey</p>
				<div class="skill-wrap">
					<div class="skill">
						<h3>Business Strategy</h3>
						<div class="skill-bar skill1 wow fadeInLeftBig"> <span class="skill-count1">75%</span> </div>
					</div>
					<div class="skill">
						<h3>Financial Planning</h3>
						<div class="skill-bar skill2 wow fadeInLeftBig"> <span class="skill-count2">45%</span> </div>
					</div>
					<div class="skill">
						<h3>Marketing Strategy</h3>
						<div class="skill-bar skill3 wow fadeInLeftBig"> <span class="skill-count3">80%</span> </div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<section class="faq-area pt-100 pb-70">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6">
					<div class="section-title"> <span class="sub-title">{{ env('SITE_NAME') }} FAQ</span>
						<h2>Frequently Asked Questions</h2>
						{{-- <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ultrices grad </p> --}}
					</div>
					<div class="faq-item">
						<ul class="accordion">
							@foreach($faqs as $faq)
							<li>
								<a>
									{{ $faq['question'] }} <i class='bx bx-plus'></i> <i class="bx bx-minus two"></i>
								</a>
								<p>{{ $faq['answer'] }} </p>
							</li>
							@endforeach
						</ul>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="faq-img"> <img src="{{ asset('visitors/assets/img/faq-main.png') }}" alt="FAQ"> <img src="{{ asset('visitors/assets/img/faq-shape.png') }}" alt="Shape"> </div>
				</div>
			</div>
		</div>
	</section>
	<section class="testimonials-area pt-100" style="display:none">
		<div class="container">
			<div class="section-title"> <span class="sub-title">Testimonials</span>
				<h2>What Our Clients Says</h2> </div>
			<div class="testimonials-slider owl-theme owl-carousel">
			@foreach($reviews as $id => $review)
				<div class="testimonials-item">
					{{-- <div class="inner"> --}}
						<p>“{{ $review['review'] }}”</p>
						<b>{{ $review['user'] }}</b> <span>{{ $review['occupation'] }}</span> <i class='bx bxs-quote-alt-left bx-flip-horizontal'></i>
					{{-- </div> --}}
				</div>
				@endforeach
		</div>
	</section>
	<section class="blog-area pt-100 pb-70">
		<div class="container">
			<div class="section-title"> <span class="sub-title">Latest News</span>
				<h2>Latest Crypto News</h2> </div>
			<div class="row">
				<div class="col-12" style="height: 500px">
					<!-- TradingView Widget BEGIN -->
					<div class="tradingview-widget-container">
						<div class="tradingview-widget-container__widget"></div>

						<script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-timeline.js" async>
						{
						"feedMode": "all_symbols",
						"colorTheme": "light",
						"isTransparent": false,
						"displayMode": "adaptive",
						"width": "100%",
						"height": "100%",
						"locale": "en"
					}
						</script>
					</div>
					<!-- TradingView Widget END -->
				</div>
			</div>
		</div>
	</section>
	<section class="blog-area pt-100 pb-70">
		<div class="container">
			<div class="section-title"> <span class="sub-title">Crypto Market</span>
				<h2>Crypto Market Overview</h2> </div>
			<div class="row">
				<div class="col-12" style="height: 500px">
					<!-- TradingView Widget BEGIN -->
					<div class="tradingview-widget-container">
						<div class="tradingview-widget-container__widget"></div>

						<script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-screener.js" async>
						{
						"width": "100%",
						"height": "100%",
						"defaultColumn": "overview",
						"screener_type": "crypto_mkt",
						"displayCurrency": "USD",
						"colorTheme": "light",
						"locale": "en"
					}
						</script>
					</div>
					<!-- TradingView Widget END -->
				</div>
			</div>
		</div>
	</section>
@include('visitor.layouts.footer')
</body>

</html>
