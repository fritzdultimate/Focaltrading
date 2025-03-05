@include('visitor.layouts.header')
	<div class="page-title-area">
		<div class="d-table">
			<div class="d-table-cell">
				<div class="container">
					<div class="title-content">
						<h2>Sign In</h2>
						<ul>
							<li> <a href="index.html">Home</a> </li>
							<li> <span>Sign In</span> </li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="user-form-area ptb-100">
		<div class="container">
			<div class="form-item">
				<form class="page-form login-form">
					<h2>Sign In</h2>
					<div class="row">
						<div class="col-lg-12">
							<div class="form-group">
								<input required type="text" name="login" class="form-control" placeholder="Username Or Email"> </div>
						</div>
						<div class="col-lg-12">
							<div class="form-group">
								<input required name="password" type="password" class="form-control" placeholder="Password"> </div>
						</div>
						<div class="col-lg-12">
							<button type="submit" class="btn common-btn"><span class="form-loading d-none px-5">
                                <i class="fa fa-sync fa-spin"></i>
                            </span>
                            <span class='submit-text'>
                                Login
                            </span> <span></span> </button>
						</div>
					</div>
				</form>
				<div class="user-btn">
					<h3>Didn't have an account?<a href="/register">Sign Up</a> | <a href="/forgot-pass">Forgot Password?</a></h3> 
				</div>
			</div>
		</div>
	</div>
    @include('visitor.layouts.footer')
    <script src="{{ asset('plugins/lobibox/js/lobibox.js') }}"></script>
    <script src="{{ asset('js/login.js') }}"></script>
</body>
</html>