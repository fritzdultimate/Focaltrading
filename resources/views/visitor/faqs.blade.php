@include('visitor.layouts.header')
	<div class="page-title-area">
		<div class="d-table">
			<div class="d-table-cell">
				<div class="container">
					<div class="title-content">
						<h2>FAQ's</h2>
						<ul>
							<li> <a href="index.html">Home</a> </li>
							<li> <span>FAQ's</span> </li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="rules-area ptb-100">
		<div class="container">
			<div class="rules-item">
                <div class="row">
                    <div class="col-12">
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
                </div>
			</div>
		</div>
	</div>
    @include('visitor.layouts.footer')
    <script src="{{ asset('plugins/lobibox/js/lobibox.js') }}"></script>
    <script src="{{ asset('js/login.js') }}"></script>
</body>
</html>
