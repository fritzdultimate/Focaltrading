<aside class="app-navbar">
    <!-- begin sidebar-nav -->
    <div class="sidebar-nav scrollbar scroll_light">
        <ul class="metismenu " id="sidebarNav">
            
            <li class="nav-static-title">User</li>
            <li>
                <a href="/user" aria-expanded="false">
                    <i class="nav-icon ti ti-server"></i><span class="nav-title">User Dashboard</span>
                </a>
            </li>
            <li class="nav-static-title">Dashboard</li>
            <li>
                <a href="/admin" aria-expanded="false">
                    <i class="nav-icon ti ti-home"></i><span class="nav-title">Home</span>
                </a>
            </li>
            
            <li>
                <a href="/admin/wallets" aria-expanded="false">
                    <i class="nav-icon ti ti-wallet"></i><span class="nav-title">Wallets</span>
                </a>
            </li>
            <li>
                <a href="/admin/plans/parent" aria-expanded="false">
                    <i class="nav-icon ti ti-user"></i><span class="nav-title">Parent Plans</span>
                </a>
            </li>
            <li>
                <a href="/admin/plans/child" aria-expanded="false">
                    <i class="nav-icon ti ti-user"></i><span class="nav-title">Child Plans</span>
                </a>
            </li>
            <li>
                <a href="/admin/reviews" aria-expanded="false">
                    <i class="nav-icon ti ti-user"></i><span class="nav-title">Reviews</span>
                </a>
            </li>
            <li class="nav-static-title">KYC</li>
            <li>
                <a href="/admin/kyc/pending" aria-expanded="false">
                    <i class="nav-icon ti ti-briefcase"></i><span class="nav-title">Pending Kyc</span>
                </a>
            </li>
            <li>
                <a href="/admin/kyc/approved" aria-expanded="false">
                    <i class="nav-icon ti ti-loop"></i><span class="nav-title">Verified Kyc</span>
                </a>
            </li>
            <li>
                <a href="/admin/kyc/denied" aria-expanded="false">
                    <i class="nav-icon ti ti-bar-chart-alt"></i><span class="nav-title">Rejected Kyc</span>
                </a>
            </li>
            <li class="nav-static-title">Deposits</li>
            <li>
                <a href="/admin/deposits/pending" aria-expanded="false">
                    <i class="nav-icon ti ti-briefcase"></i><span class="nav-title">Pending Deposits</span>
                    <span class="nav-label label label-danger">{{ $pending_deposits }}</span>
                </a>
            </li>
            <li>
                <a href="/admin/deposits/approved" aria-expanded="false">
                    <i class="nav-icon ti ti-loop"></i><span class="nav-title">Approved Deposits</span>
                </a>
            </li>
            <li>
                <a href="/admin/deposits/denied" aria-expanded="false">
                    <i class="nav-icon ti ti-bar-chart-alt"></i><span class="nav-title">Denied Deposits</span>
                </a>
            </li>
            <li class="nav-static-title">Withdrawals</li>
            <li>
                <a href="/admin/withdrawals/pending" aria-expanded="false">
                    <i class="nav-icon ti ti-briefcase"></i><span class="nav-title">Pending Withdrawals</span>
                    <span class="nav-label label label-danger">{{ $pending_withdrawals }}</span>
                </a>
            </li>
            <li>
                <a href="/admin/withdrawals/approved" aria-expanded="false">
                    <i class="nav-icon ti ti-loop"></i><span class="nav-title">Approved Withdrawals</span>
                </a>
            </li>
            <li>
                <a href="/admin/withdrawals/denied" aria-expanded="false">
                    <i class="nav-icon ti ti-bar-chart-alt"></i><span class="nav-title">Denied Withdrawals</span>
                </a>
            </li>
            <li class="nav-static-title">Members</li>
            <li>
                <a href="/admin/members" aria-expanded="false">
                    <i class="nav-icon ti ti-bar-chart"></i><span class="nav-title">Users</span>
                </a>
            </li>
            <li>
                <a href="/admin/members/moderators" aria-expanded="false">
                    <i class="nav-icon ti ti-bar-chart"></i><span class="nav-title">Moderators</span>
                </a>
            </li>
            <li>
                <a href="/admin/members/admins" aria-expanded="false">
                    <i class="nav-icon ti ti-bar-chart"></i><span class="nav-title">Admins</span>
                </a>
            </li>
            <li>
                <a href="/admin/members/suspended" aria-expanded="false">
                    <i class="nav-icon ti ti-bar-chart"></i><span class="nav-title">Suspended Members</span>
                </a>
            </li>
            <li class="nav-static-title">Actions</li>
            <li class="">
                <a class="has-arrow" href="javascript:void(0)" aria-expanded="false">
                    <i class="nav-icon ti ti-rocket"></i>
                    <span class="nav-title">Confirm Fund</span>
                    <span class="nav-label label label-danger">9</span>
                </a>
                <ul aria-expanded="false">
                    <li class="active"> <a href='/admin/fund/confirm-credit'>Credit</a> </li>
                    <li> <a href='/admin/fund/confirm-debit'>Debit</a> </li>
                </ul>
            </li>
            <li class="">
                <a class="has-arrow" href="javascript:void(0)" aria-expanded="false">
                    <i class="nav-icon ti ti-rocket"></i>
                    <span class="nav-title">Confirm CI</span>
                    <span class="nav-label label label-danger">9</span>
                </a>
                <ul aria-expanded="false">
                    <li class="active"> <a href='/admin/fund/ci/confirm-credit'>Credit</a> </li>
                    <li> <a href='/admin/fund/ci/confirm-debit'>Debit</a> </li>
                </ul>
            </li>
            <li class="nav-static-title">Actions</li>
            <li>
                <a href="/admin/quick-withdrawal" aria-expanded="false">
                    <i class="nav-icon ti ti-link"></i><span class="nav-title">Quick Withdrawal</span>
                </a>
            </li>
            <li>
                <a href="/admin/manage/wallet-balance" aria-expanded="false">
                    <i class="nav-icon ti ti-settings"></i><span class="nav-title">Wallet balance</span>
                </a>
            </li>
            <li>
                <a href="/admin/manage/current-invested" aria-expanded="false">
                    <i class="nav-icon ti ti-new-window"></i><span class="nav-title">Currently Invested</span>
                </a>
            </li>
            <li>
                <a href="/admin/manage/referral-bonus" aria-expanded="false">
                    <i class="nav-icon ti ti-new-window"></i><span class="nav-title">Referral Bonus</span>
                </a>
            </li>
            <li class="nav-static-title">Pages</li>
            <li>
                <a href="/admin/pages/faqs" aria-expanded="false">
                    <i class="nav-icon ti ti-link"></i><span class="nav-title">FaQs</span>
                </a>
            </li>
            <li>
                <a href="/admin/pages/about" aria-expanded="false">
                    <i class="nav-icon ti ti-settings"></i><span class="nav-title">About Us</span>
                </a>
            </li>
            <li>
                <a href="/admin/pages/how-it-works" aria-expanded="false">
                    <i class="nav-icon ti ti-new-window"></i><span class="nav-title">How It Works</span>
                </a>
            </li>
            <li>
                <a href="/admin/pages/meet-our-traders" aria-expanded="false">
                    <i class="nav-icon ti ti-new-window"></i><span class="nav-title">Meet Our Traders</span>
                </a>
            </li>
            <li>
                <a href="/admin/pages/terms" aria-expanded="false">
                    <i class="nav-icon ti ti-new-window"></i><span class="nav-title">Terms And Conditions</span>
                </a>
            </li>
            <li>
                <a href="/admin/pages/privacy-policy" aria-expanded="false">
                    <i class="nav-icon ti ti-new-window"></i><span class="nav-title">Privacy Policy</span>
                </a>
            </li>
            <li class="nav-static-title">Others</li>
            <li>
                <a href="/admin/files" aria-expanded="false">
                    <i class="nav-icon ti ti-link"></i><span class="nav-title">Files</span>
                </a>
            </li>
            <li>
                <a href="/admin/logout" aria-expanded="false">
                    <i class="nav-icon ti ti-settings"></i><span class="nav-title">Log Out</span>
                </a>
            </li>
        </ul>
    </div>
</aside>