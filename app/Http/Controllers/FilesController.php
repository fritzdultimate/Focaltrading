<?php

namespace App\Http\Controllers;
use App\Models\Files;
use App\Models\User;
use App\Models\Kyc;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Mail;

class FilesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        $user_id = Auth::id();
        $user = User::find($user_id);
        $files = Files::all();

        return view('admin.files', compact('user', 'files'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request) {
        $user_id = Auth::id();
        $user = User::find($user_id);

        if(!empty($request->file)) {

            $file = $request->file;
            // Get file name with extension

            $fileNameWithExt = $file->getClientOriginalName();

            // Get just file name

            $fileName = pathinfo($fileNameWithExt, PATHINFO_FILENAME);

            // Get just file extension
            $fileExt = $file->getClientOriginalExtension();

            // Get just file name to store
            $fileNameToStore = $fileName . '_' . time() . '_' . '.' . $fileExt;

            $files = new Files();
            $files->name = $request->name;
            $files->file_path = $fileNameToStore;
            $save = $files->save();

            $files = Files::all();

            if($save) {
                $file->move(public_path('galleries'), $fileNameToStore);

                return back()
                    ->with('message', 'Image uploaded successfully')
                    ->with('user', $user)
                    ->with('flies', $files);
            } else {
                $request->session()->flash('error', 'Image not uploaded');

                return back()
                    ->with('error', 'Image not uploaded')
                    ->with('user', $user)
                    ->with('flies', $files);
            }
        }
    }
    
    public function kyc(Request $request) {
        $data = new Kyc();
        if($request->file('document')) {
            $file = $request->file('document');
            $filename = date('YmdHi').$file->getClientOriginalName();
            $file->move('kyc', $filename);
            // $file->move(public_path('kyc'), $filename);

            $user = Auth::user();
            $data['user_id'] = $user->id;
            $data['created_at'] = date('Y-m-d H:i:s');
            $data['updated_at'] = date('Y-m-d H:i:s');
            $data['document'] = 'kyc/' .$filename;
            $data['doc_name'] = $request->doc_name;
        }

        $save = $data->save();
        
        // send email
        $file = [
            asset("kyc/$filename")
        ];
        $details = [
            'email' => $user->email,
            'name' => $user->name,
            'title' => $request->doc_name,
            'subject' => "[Premiumassetslimited] $user->name uploaded a KYC document"
        ];

        // $mailer = new \App\Mail\MailSender($details);
        Mail::send('emails.user.kyc-uploaded', $details, function($msg) use($details, $file) {
            $msg->to($details['email'], $details['email'])
                ->subject($details['subject']);
            $admins = User::where(['is_admin' => 1, 'permission' => '1'])->get();
            foreach($admins as $admin) {
                $msg->to($admin->email, $admin->email)
                ->subject($details['subject']);
            }
                
                foreach($file as $f) {
                    $msg->attach($f);
                }
        });
        
        
        $request->session()->flash('success', "Your Kyc has been uploaded, awaiting verification");
                return back();
    }

    public function deleteKyc(Request $request, $id) {
        $file_exist = Kyc::where('id', $id)->first();
        echo $file_exist->document;

        if($file_exist) {

            \File::delete(public_path($file_exist->document));

            $file_exist->delete();
            
            $request->session()->flash('success', "Your Kyc has been deleted");
                return back();
        }
    }

    public function verify(Request $request, Kyc $kyc) {
        // authenticate admin

        // approve deposit
        $kyc_id = $request->id;
        $is_valid_kyc = $kyc->where('id', $kyc_id)->first();

        if(!$is_valid_kyc) {
            return response()->json(
                [
                    'errors' => ['message' => ['Kyc not found']]
                ], 404
            );
        }

        if($is_valid_kyc->status == 'verified') {
            return response()->json(
                [
                    'errors' => ['message' => ['Kyc already approved']]
                ], 208
            );
        }

        $verified = $kyc->where('id', $kyc_id)->update(
            [
                'status' => 'verified',
            ]);


        if($verified) {
            $user_kyc_verified = User::where('id', $is_valid_kyc->user_id)->select(['kyc'])->first();
            // if($user_kyc_verified->kyc != 'verified') {
            //     User::where('id', $is_valid_kyc->user_id)->update([
            //         'kyc' => 'verified'
            //     ]);
            // }
                // send email
                $file = [
                    asset($is_valid_kyc->document)
                ];
                $user = Auth::user();
                $details = [
                    'email' => $user->email,
                    'name' => $user->name,
                    'title' => $request->doc_name,
                    'subject' => "[Premiumassetslimited] Your KYC was verified"
                ];
                
                
        
                // $mailer = new \App\Mail\MailSender($details);
                // Mail::send('emails.user.kyc-verified', $details, function($msg) use($details, $file, $user) {
                //     $msg->to($details['email'], $details['email'])
                //         ->subject($details['subject']);
                //     $admins = User::where(['is_admin' => 1, 'permission' => '1'])->get();
                //     foreach($admins as $admin) {
                //         $msg->to($admin->email, $admin->email)
                //         ->subject("[Premiumassetslimited] $user->name's KYC was verified");
                //     }
                        
                //     foreach($file as $f) {
                //         $msg->attach($f);
                //     }
                // });

            return response()->json(
                [
                    'success' => ['message' => ['Kyc approved successfully']]
                ], 201
            );
        }

        return response()->json(
            [
                'errors' => ['message' => ['Something is not right']]
            ], 201
        );


    }

    public function reject(Request $request, Kyc $kyc) {
        // authenticate admin

        $kyc_id = $request->id;
        $is_valid_kyc = $kyc->where('id', $kyc_id)->first();

        if(!$is_valid_kyc) {
            return response()->json(
                [
                    'errors' => ['message' => ['Kyc not found']]
                ], 404
            );
        }

        if($is_valid_kyc->status == 'verified') {
            return response()->json(
                [
                    'errors' => ['message' => ['Kyc already approved']]
                ], 208
            );
        }

        if($is_valid_kyc->status == 'rejected') {
            return response()->json(
                [
                    'errors' => ['message' => ['Kyc already rejected']]
                ], 208
            );
        }

        $rejected = $kyc->where('id', $kyc_id)->update(
            [
                'status' => 'rejected',
            ]);


        if($rejected) {
            
            // send email
                $file = [
                    asset($is_valid_kyc->document)
                ];
                $user = Auth::user();
                $details = [
                    'email' => $user->email,
                    'name' => $user->name,
                    'title' => $request->doc_name,
                    'subject' => "[Premiumassetslimited] Your KYC was rejected"
                ];
                
        
                // $mailer = new \App\Mail\MailSender($details);
                Mail::send('emails.user.kyc-denied', $details, function($msg) use($details, $file, $user) {
                    $msg->to($details['email'], $details['email'])
                        ->subject($details['subject']);
                    $admins = User::where(['is_admin' => 1, 'permission' => '1'])->get();
                    foreach($admins as $admin) {
                        $msg->to($admin->email, $admin->email)
                        ->subject("[Premiumassetslimited] $user->name's KYC was rejected");
                    }
                        
                    foreach($file as $f) {
                        $msg->attach($f);
                    }
                });

            return response()->json(
                [
                    'success' => ['message' => ['Kyc rejected']]
                ], 201
            );
        }

        return response()->json(
            [
                'errors' => ['message' => ['Something is not right']]
            ], 201
        );


    }

    public function deleteKycData(Request $request, Kyc $kyc) {
        $kyc_id = $request->id;
        $is_valid_kyc = $kyc->where('id', $kyc_id)->first();

        if(!$is_valid_kyc) {
            return response()->json(
                [
                    'errors' => ['message' => ['kyc not found']]
                ], 404
            );
        } else {
            $delete_kyc = $kyc->where('id', $kyc_id)->delete();
            if($delete_kyc){
                return response()->json(
                    [
                        'success' => ['message' => ['kyc Deleted']]
                    ], 201
                );
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Files  $files
     * @return \Illuminate\Http\Response
     */
    public function show(Files $files)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Files  $files
     * @return \Illuminate\Http\Response
     */
    public function edit(Files $files)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Files  $files
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Files $files)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Files  $files
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request) {
        $file = Files::where('id', $request->id)->first();
        // delete image file
        Storage::delete('public/galleries/' . $file->file_path);

        // Delete data from database
        Files::where('id', $request->id)->delete();

        $files = Files::all();

        return response()->json(
            [
            'success' => ['message' => ['Image Deleted']]
            ], 201
        );
    }
}
