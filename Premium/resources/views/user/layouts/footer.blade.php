<!-- begin footer -->
<footer class="footer">
    <div class="row">
        <div class="col-12 col-sm-6 text-center text-sm-left">
            <p>&copy; Copyright {{ date('y') }}. All rights reserved.</p>
        </div>
        <div class="col  col-sm-6 ml-sm-auto text-center text-sm-right">
            <p>{{ env('SITE_NAME') }}</p>
        </div>
    </div>
</footer>
<!-- end footer -->
</div>
<!-- end app-wrap -->
</div>
<!-- end app -->

<!-- plugins -->
<script src="{{ asset('dashboard/assets/js/vendors.js') }}"></script>

<!-- custom app -->
<script src="{{ asset('dashboard/assets/js/app.js') }}"></script>