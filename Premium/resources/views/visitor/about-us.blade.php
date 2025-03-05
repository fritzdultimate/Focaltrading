@include('visitor.layouts.header')
	<div class="page-title-area">
		<div class="d-table">
			<div class="d-table-cell">
				<div class="container">
					<div class="title-content">
						<h2>About Us</h2>
						<ul>
							<li> <a href="index.html">Home</a> </li>
							<li> <span>About Us</span> </li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="rules-area ptb-100">
		<div class="container">
			<div class="rules-item">
				{!! $site_about_us !!}
			</div>
		</div>
	</div>
    @include('visitor.layouts.footer')
    <script src="{{ asset('plugins/lobibox/js/lobibox.js') }}"></script>
    <script src="{{ asset('js/login.js') }}"></script>
</body>
</html>
