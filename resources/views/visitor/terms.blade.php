@include('visitor.layouts.header')
    <div class="page_title_section">

        <div class="page_header">
            <div class="container">
                <div class="row">

                    <div class="col-lg-9 col-md-9 col-12 col-sm-8">

                        <h1>Terms And Conditions </h1>
                    </div>
                    <div class="col-lg-3 col-md-3 col-12 col-sm-4">
                        <div class="sub_title_section">
                            <ul class="sub_title">
                                <li> <a href="#"> Home </a>&nbsp; / &nbsp; </li>
                                <li>Terms And Conditions </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- inner header wrapper end -->
    
    <!-- FAQ wrapper start -->
    <div class="inner_faq_wrapper fixed_portion float_left" style="background: #0a161b;">
        <div class="investment_overlay faq_overlay" style="background: #0a161b;"></div>
        <div class="container" >
            <div class="row">
                <div class="col-md-12 col-lg-12 col-sm-12 col-12">
					<div class="sv_heading_wraper heading_wrapper_dark">
						<h4>Terms And Condition Section</h4>
						<h3>Terms And Conditions Of The Company</h3>
					</div>
				</div>
			</div>
			<div id="accordion" role="tablist">
				 <div class="row justify-content-center">
                    <div class="card-body">
                        <div class="card_cntnt">
                            {!! $terms_and_conditions !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
      </div>
    
    <!-- FAQ wrapper end -->
    <!-- answer wrapper start -->
  @include('visitor.layouts.footer')
</body>

</html>