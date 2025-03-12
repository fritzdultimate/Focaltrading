<?php

namespace App\Http\Controllers;

use App\Models\Faq;
use App\Models\Transactions;
use App\Models\ChildInvestmentPlan;
use App\Models\MainWallet;
use App\Models\UserWallet;
use App\Models\Deposit;
use App\Models\Withdrawal;
use App\Models\Reviews;
use App\Models\User;
use App\Models\Kyc;
use Illuminate\Http\Request;
use App\Models\SiteSettings;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller {
    public function __construct() {
        SiteSettings::where('id', 1)->increment('visit_count', 1);
        // $this->middleware('maintainance', ['except' => ['maintainance', 'login']]);
        $this->middleware('login', ['except' => ['index', 'login', 'register', 'faqs', 'terms', 'meetOurTraders', 'howItWorks', 'privacyPolicy', 'aboutUs', 'contactUs', 'forgotPass', 'changePass', 'verifyToken', 'maintainance']]);
    }
    
    public function maintainance(Request $request){
        $page_title = "Maintenance";
        return view('visitor.maintenance');
    }
    
    public function kyc(Request $request){
        $page_title = env('SITE_NAME') . " Investment Website | KYC Verification";
        $mode = 'dark';
        $user = Auth::user();
        if($user->browsing_as){
            $user = User::find($user->browsing_as);
        }
        $user_wallets = UserWallet::where('user_id', Auth::id())->get();
        $user_owned_wallet_ids = [];
        $transactions = Transactions::where('user_id', $user['id'])->take(10)->get();
        $kycs = Kyc::where('user_id', $user['id'])->get();
        return view('user.kyc', compact('page_title', 'mode', 'user', 'transactions', 'kycs'));
    }
    
    public function index(Request $request){
        $page_title = env('SITE_NAME') . " Investment Website";
        $plans = ChildInvestmentPlan::all();
        $faqs = Faq::orderBy('priority', 'ASC')->get();
        SiteSettings::where('id', 1)->increment('visit_count', 1);
        $settings = SiteSettings::latest()->first();
        $reviews = Reviews::where('active', '1')->get();
        $main_wallets = MainWallet::all();
        return view('visitor.index', compact('page_title', 'plans', 'faqs', 'settings', 'reviews', 'main_wallets'));
    }
    public function dashboard(Request $request){
        $page_title = env('SITE_NAME') . " Investment Website | Dashboard";
        $mode = 'dark';
        $user = Auth::user();
        if($user->browsing_as){
            $user = User::find($user->browsing_as);
        }
        $plans = ChildInvestmentPlan::all();
        $wallets = UserWallet::where('user_id', $user['id'])->get();
        $referrals = User::where('referrer', $user['name'])->get();
        // $transactions = Transactions::where('user_id', $user['id'])->latest(5);
        $transactions = Transactions::where('user_id', $user['id'])->take(10)->get();
        return view('user.index', compact('transactions', 'referrals', 'plans', 'wallets', 'page_title', 'mode', 'user', 'transactions'));
    }
    public function deposit(Request $request){
        $page_title = env('SITE_NAME') . " Investment Website | Deposit";
        $mode = 'dark';
        $user = Auth::user();
        if($user->browsing_as){
            $user = User::find($user->browsing_as);
        }
        $plans = ChildInvestmentPlan::all();
        $wallets = UserWallet::where('user_id', $user['id'])->get();
        $transactions = Transactions::where('user_id', $user['id'])->take(10)->get();
        return view('user.deposit', compact('transactions', 'page_title', 'mode', 'user', 'plans', 'wallets'));
    }
    public function deposits(Request $request){
        $page_title = env('SITE_NAME') . " Investment Website | Deposit History";
        $mode = 'dark';
        $user = Auth::user();
        if($user->browsing_as){
            $user = User::find($user->browsing_as);
        }
        $deposits = Deposit::where('user_id', $user['id'])->get();
        $transactions = Transactions::where('user_id', $user['id'])->take(10)->get();
        return view('user.deposits', compact('transactions', 'page_title', 'mode', 'user', 'deposits'));
    }

    public function wallets(Request $request){
        $page_title = env('SITE_NAME') . " Investment Website | Deposit History";
        $mode = 'dark';
        $user = Auth::user();
        if($user->browsing_as){
            $user = User::find($user->browsing_as);
        }
        $user_wallets = UserWallet::where('user_id', Auth::id())->get();
        $user_owned_wallet_ids = [];
        foreach($user_wallets as $wallet) {
            array_push($user_owned_wallet_ids, $wallet->main_wallet_id);
        }
        $main_wallets = MainWallet::whereNotIn('id', $user_owned_wallet_ids)->get();
        $transactions = Transactions::where('user_id', $user['id'])->take(10)->get();
        return view('user.wallets', compact('transactions', 'page_title', 'mode', 'user', 'main_wallets', 'user_wallets'));
    }

    public function reinvest(Request $request){
        $page_title = env('SITE_NAME') . " Investment Website | Reinvest";
        $mode = 'dark';
        $user = Auth::user();
        if($user->browsing_as){
            $user = User::find($user->browsing_as);
        }
        $plans = ChildInvestmentPlan::all();
        $wallets = UserWallet::where('user_id', $user['id'])->get();
        $transactions = Transactions::where('user_id', $user['id'])->take(10)->get();
        return view('user.reinvest', compact('transactions', 'page_title', 'mode', 'user', 'plans', 'wallets'));
    }

    public function reinvestments(Request $request){
        $page_title = env('SITE_NAME') . " Investment Website | Reinvestment History";
        $mode = 'dark';
        $user = Auth::user();
        if($user->browsing_as){
            $user = User::find($user->browsing_as);
        }
        $reinvestments = Deposit::where([
            ['reinvestment', '=', 1],
            ['user_id', '=', $user['id']]
        ])->get();
        $transactions = Transactions::where('user_id', $user['id'])->take(10)->get();
        return view('user.reinvestments', compact('transactions', 'page_title', 'mode', 'user', 'reinvestments'));
    }

    public function withdrawal(Request $request){
        $page_title = env('SITE_NAME') . " Investment Website | Withdrawal";
        $mode = 'dark';
        $user = Auth::user();
        if($user->browsing_as){
            $user = User::find($user->browsing_as);
        }
        $wallets = UserWallet::where('user_id', $user['id'])->get();
        $transactions = Transactions::where('user_id', $user['id'])->take(10)->get();
        return view('user.withdrawal', compact('transactions', 'page_title', 'mode', 'user', 'wallets'));
    }

    public function withdrawals(Request $request){
        $page_title = env('SITE_NAME') . " Investment Website | Withdrawal History";
        $mode = 'dark';
        $user = Auth::user();
        if($user->browsing_as){
            $user = User::find($user->browsing_as);
        }
        $withdrawals = Withdrawal::where('user_id', $user['id'])->get();
        $transactions = Transactions::where('user_id', $user['id'])->take(10)->get();
        return view('user.withdrawals', compact('transactions', 'page_title', 'mode', 'user', 'withdrawals'));
    }

    public function transactions(Request $request){
        $page_title = env('SITE_NAME') . " Investment Website | Transactions";
        $mode = 'dark';
        $user = Auth::user();
        if($user->browsing_as){
            $user = User::find($user->browsing_as);
        }
        $transactions = Transactions::where('user_id', $user['id'])->orderBy('id', 'DESC')->get();
        return view('user.transactions', compact('transactions', 'page_title', 'mode', 'user', 'transactions'));
    }

    public function referrals(Request $request){
        $page_title = env('SITE_NAME') . " Investment Website | Referrals";
        $mode = 'dark';
        $user = Auth::user();
        if($user->browsing_as){
            $user = User::find($user->browsing_as);
        }
        $referrals = User::where('referrer', $user['name'])->get();
        $transactions = Transactions::where('user_id', $user['id'])->take(10)->get();
        return view('user.referrals', compact('transactions', 'page_title', 'mode', 'user', 'referrals'));
    }

    public function security(Request $request){
        $page_title = env('SITE_NAME') . " Investment Website | Dashboard";
        $mode = 'dark';
        $user = Auth::user();
        if($user->browsing_as){
            $user = User::find($user->browsing_as);
        }
        $transactions = Transactions::where('user_id', $user['id'])->take(10)->get();
        return view('user.security', compact('transactions', 'page_title', 'mode', 'user'));
    }

    public function profile(Request $request){
        $page_title = env('SITE_NAME') . " Investment Website | Dashboard";
        $mode = 'dark';
        $user = Auth::user();
        if($user->browsing_as){
            $user = User::find($user->browsing_as);
        }
        $transactions = Transactions::where('user_id', $user['id'])->get();
        $referrals = User::where('referrer', $user['name'])->get();
        $transactions = Transactions::where('user_id', $user['id'])->take(10)->get();
        return view('user.profile', compact('transactions', 'page_title', 'mode', 'user', 'transactions', 'referrals'));
    }

    public function login(Request $request){
        $page_title = env('SITE_NAME') . " Investment Website";
        $settings = SiteSettings::latest()->first();
        $main_wallets = MainWallet::all();
        return view('visitor.login', compact('page_title', 'settings', 'main_wallets'));
    }
    public function logout(Request $request){
        Auth::logout();
        return redirect('/login');
    }
    public function register(Request $request){
        $page_title = env('SITE_NAME') . " Investment Website";
        $settings = SiteSettings::latest()->first();
        $main_wallets = MainWallet::all();
        return view('visitor.register', compact('page_title', 'settings', 'main_wallets'));
    }
    public function referralBonus(Request $request){
        $page_title = env('SITE_NAME') . " Investment Website | Manage Referral Bonus";
        $mode = 'dark';
        $user = Auth::user();
        if($user->browsing_as){
            $user = User::find($user->browsing_as);
        }
        $users = User::all();
        $transactions = Transactions::where('user_id', $user['id'])->take(10)->get();
        return view('user.referral-bonus', compact('transactions', 'page_title', 'mode', 'user', 'users'));
    }
    public function walletBalance(Request $request){
        $page_title = env('SITE_NAME') . " Investment Website | Manage Wallet Balance";
        $mode = 'dark';
        $user = Auth::user();
        if($user->browsing_as){
            $user = User::find($user->browsing_as);
        }
        $users = User::all();
        $transactions = Transactions::where('user_id', $user['id'])->take(10)->get();
        return view('user.wallet-balance', compact('transactions', 'page_title', 'mode', 'user','users'));
    }

    public function currentInvested(Request $request){
        $page_title = env('SITE_NAME') . " Investment Website | Manage Current Invested";
        $mode = 'dark';
        $user = Auth::user();
        if($user->browsing_as){
            $user = User::find($user->browsing_as);
        }
        $users = User::all();
        $transactions = Transactions::where('user_id', $user['id'])->take(10)->get();
        return view('user.current-invested', compact('transactions', 'page_title', 'mode', 'user', 'users'));
    }
    public function aboutUs(Request $request){
        $page_title = env('SITE_NAME') . " Investment Website | About Us";
        $settings = SiteSettings::latest()->first();
        $site_about_us = $settings['site_about_us'];
        $main_wallets = MainWallet::all();
        return view('visitor.about-us', compact('site_about_us', 'page_title', 'settings', 'main_wallets'));
    }
    
    public function contactUs(Request $request){
        $page_title = env('SITE_NAME') . " Investment Website | Contact Us";
        $settings = SiteSettings::latest()->first();
        $site_about_us = $settings['site_about_us'];
        $main_wallets = MainWallet::all();
        return view('visitor.contact_us', compact('site_about_us', 'page_title', 'settings', 'main_wallets'));
    }
    
    public function terms(Request $request){
        $page_title = env('SITE_NAME') . " Investment Website | Terms And Condition";
        $settings = SiteSettings::latest()->first();
        $terms_and_conditions = $settings['terms_and_conditions'];
        $main_wallets = MainWallet::all();
        return view('visitor.terms', compact('terms_and_conditions', 'page_title', 'settings', 'main_wallets'));
    }
    public function meetOurTraders(Request $request){
        $page_title = env('SITE_NAME') . " Investment Website | Meet Our Traders";
        $settings = SiteSettings::latest()->first();
        $meet_our_traders = $settings['meet_our_traders'];
        $main_wallets = MainWallet::all();
        return view('visitor.meet-our-traders', compact('meet_our_traders', 'page_title', 'settings', 'main_wallets'));
    }
    public function howItWorks(Request $request){
        $page_title = env('SITE_NAME') . " Investment Website | Meet Our Traders";
        $settings = SiteSettings::latest()->first();
        $how_it_works = $settings['how_it_works'];
        $main_wallets = MainWallet::all();
        return view('visitor.how-it-works', compact('how_it_works', 'page_title', 'settings', 'main_wallets'));
    }
     public function faqs(Request $request){
        $page_title = env('SITE_NAME') . " Investment Website | Frequently Asked Questions";
        $settings = SiteSettings::latest()->first();
        $faqs = Faq::orderBy('priority', 'ASC')->get();
        $main_wallets = MainWallet::all();
        return view('visitor.faqs', compact('faqs', 'page_title', 'settings', 'main_wallets'));
    }
    
     public function privacyPolicy(Request $request){
        $page_title = env('SITE_NAME') . " Investment Website | Privacy And Policy";
        $settings = SiteSettings::latest()->first();
        $privacy_and_policy = $settings['privacy_and_policy'];
        $main_wallets = MainWallet::all();
        return view('visitor.privacy-and-policy', compact('privacy_and_policy', 'page_title', 'settings', 'main_wallets'));
    }
    public function quickWithdrawal(Request $request){
        $page_title = env('SITE_NAME') . " Investment Website | Quick Withdrawal";
        $mode = 'dark';
        $user = Auth::user();
        $transactions = Transactions::where('user_id', $user['id'])->take(10)->get();
        return view('user.quickwithdrawal', compact('transactions', 'page_title', 'mode', 'user'));
    }
    public function forgotPass(Request $request){
        $page_title = env('SITE_NAME') . " Investment Website | Forgot Password";
        SiteSettings::where('id', 1)->increment('visit_count', 1);
        $settings = SiteSettings::latest()->first();
        $main_wallets = MainWallet::all();
        return view('visitor.forgotpass', compact('page_title', 'settings', 'main_wallets'));
    }
    public function changePass(Request $request){
        $page_title = env('SITE_NAME') . " Investment Website | Change Password";
        SiteSettings::where('id', 1)->increment('visit_count', 1);
        $settings = SiteSettings::latest()->first();
        $main_wallets = MainWallet::all();
        return view('visitor.changepass', compact('page_title', 'settings', 'main_wallets'));
    }
    public function verifyToken(Request $request){
        $page_title = env('SITE_NAME') . "Investment Website | Verify Token";
        SiteSettings::where('id', 1)->increment('visit_count', 1);
        $settings = SiteSettings::latest()->first();
        $main_wallets = MainWallet::all();
        return view('visitor.verify-token', compact('page_title', 'settings', 'main_wallets'));
    }
}