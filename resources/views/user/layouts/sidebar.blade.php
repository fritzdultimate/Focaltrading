<aside class="app-navbar">
    <!-- begin sidebar-nav -->
    <div class="sidebar-nav scrollbar scroll_light">
        <ul class="metismenu " id="sidebarNav">
            @if ($user['is_admin'])
            <li class="nav-static-title">Admin</li>
            <li>
                <a href="/admin" aria-expanded="false">
                    <i class="nav-icon ti ti-server"></i><span class="nav-title">Admin Dashboard</span>
                </a>
            </li>
            @endif
            <li class="nav-static-title">Dashboard</li>
            <li>
                <a href="/user" aria-expanded="false">
                    <i class="nav-icon ti ti-home"></i><span class="nav-title">Home</span>
                </a>
            </li>
            <li>
                <a href="/user/profile" aria-expanded="false">
                    <i class="nav-icon ti ti-user"></i><span class="nav-title">Profile</span>
                </a>
            </li>
            <li>
                <a href="/user/wallets" aria-expanded="false">
                    <i class="nav-icon ti ti-wallet"></i><span class="nav-title">Wallets</span>
                </a>
            </li>
            <li class="nav-static-title">Finance</li>
            <li>
                <a href="/user/deposit" aria-expanded="false">
                    <i class="nav-icon ti ti-briefcase"></i><span class="nav-title">Investment</span>
                </a>
            </li>
            <li>
                <a href="/user/reinvest" aria-expanded="false">
                    <i class="nav-icon ti ti-loop"></i><span class="nav-title">ReInvestment</span>
                </a>
            </li>
            <li>
                <a href="/user/withdrawal" aria-expanded="false">
                    <i class="nav-icon ti ti-bar-chart-alt"></i><span class="nav-title">Withdrawal</span>
                </a>
            </li>
            
            <li class="nav-static-title">Histories</li>
            <li>
                <a href="/user/transactions" aria-expanded="false">
                    <i class="nav-icon ti ti-bar-chart"></i><span class="nav-title">Transactions History</span>
                </a>
            </li>
            <li>
                <a href="/user/deposits" aria-expanded="false">
                    <i class="nav-icon ti ti-bar-chart"></i><span class="nav-title">Investment History</span>
                </a>
            </li>
            <li>
                <a href="/user/reinvestments" aria-expanded="false">
                    <i class="nav-icon ti ti-bar-chart"></i><span class="nav-title">ReInvestment History</span>
                </a>
            </li>
            <li>
                <a href="/user/withdrawals" aria-expanded="false">
                    <i class="nav-icon ti ti-bar-chart"></i><span class="nav-title">Withdrawal History</span>
                </a>
            </li>
            <li>
                <a href="/user/referrals" aria-expanded="false">
                    <i class="nav-icon ti ti-link"></i><span class="nav-title">Referrals</span>
                </a>
            </li>
            <li>
                <a href="/user/security" aria-expanded="false">
                    <i class="nav-icon ti ti-settings"></i><span class="nav-title">Security</span>
                </a>
            </li>
             @if ($user['permission'] == 2)
            <li class="nav-static-title">Moderator</li>
            <li>
                <a href="/admin/quick-withdrawal" aria-expanded="false">
                    <i class="nav-icon ti ti-server"></i><span class="nav-title">Quick Withdrawal</span>
                </a>
            </li>
            @endif
            <li>
                <a href="/user/logout" aria-expanded="false">
                    <i class="nav-icon ti ti-new-window"></i><span class="nav-title">Log Out</span>
                </a>
            </li>
        </ul>
    </div>
</aside>