@include('visitor.layouts.header')
	<div class="page-title-area">
		<div class="d-table">
			<div class="d-table-cell">
				<div class="container">
					<div class="title-content">
						<h2>Create Account</h2>
						<ul>
							<li> <a href="index.html">Home</a> </li>
							<li> <span>Register</span> </li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="user-form-area ptb-100">
		<div class="container">
			<div class="form-item">
				<form class="page-form register-form">
					<h2>Register</h2>
					<div class="row">
						<div class="col-lg-6">
							<div class="form-group">
								<input required type="text" name="username" class="form-control" placeholder="Enter Username"> </div>
						</div>
						<div class="col-lg-6">
							<div class="form-group">
								<input required name="email" type="email" class="form-control" placeholder="Enter Email"> </div>
						</div>
                        <div class="col-lg-6">
							<div class="form-group">
								<input required type="text" name="firstname" class="form-control" placeholder="Enter Firstname"> </div>
						</div>
						<div class="col-lg-6">
							<div class="form-group">
								<input required name="middlename" type="text" class="form-control" placeholder="Enter Middlename"> </div>
						</div>
                        <div class="col-lg-12">
							<div class="form-group">
								<input required name="lastname" type="text" class="form-control" placeholder="Enter Lastname"> </div>
						</div>
                        <div class="col-lg-6">
							<div class="form-group">
								<input required name="password" type="password" class="form-control" placeholder="Enter Password"> </div>
						</div>
                        <div class="col-lg-6">
							<div class="form-group">
								<input required name="repassword" type="password" class="form-control" placeholder="Repeat Password"> </div>
						</div>
                        <div class="col-lg-6">
                            <label class="control form-group d-flex align-items-center">I agreed to the Terms and Conditions. 
                                <input name="terms" type="checkbox">
                                
                            </label>
                        </div>
						<div class="col-lg-12">
							<button type="submit" class="btn common-btn"><span class="form-loading d-none px-5">
                                <i class="fa fa-sync fa-spin"></i>
                            </span>
                            <span class='submit-text'>
                                Submit
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
    {{-- <script src="{{ asset('js/main.js') }}"></script> --}}
    <script src="{{ asset('js/register.js?a=3') }}"></script>
</body>
</html>