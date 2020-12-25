<?php

namespace App\Http\Controllers\Admin;

use Auth;
use App\Http\Controllers\Controller;
use App\Models\Department;
use App\Models\Employee;
use App\Models\Notifications;
use App\Models\Requests;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AdminController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function __construct(){

    }


    public function index()
    {
         return view('auth.loginAdmin');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $remember = request()->has('remember') ? true : false;


        if(Auth::guard('admin')->attempt(['email' =>request('email') , 'password' => request('password')], $remember))
        {

            return redirect('/admin/home');

        } else{

            return back();
        }

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show()
    {
        if(Auth::guard('admin')->check()){

            $notifications_list = Notifications::paginate();
            $employees = Employee::paginate();
            $departments = Department::paginate();
            $users = User::paginate();
            $notifications = DB::table('notifications')->get();
            $requests = Requests::paginate();
            return view('dashboard.admin.index' , compact('notifications' , 'requests' , 'notifications_list' , 'users' , 'departments' , 'employees'));
        } else {
            return redirect('loginAdmin');
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function guard() {
        return Auth::guard('admin');
    }

    public function logout(Request $request){
        $this->guard()->logout();
        return redirect('/');
    }

    public function getNewNotificationsNumberAdmin()
    {
            $notifications = DB::table('notifications')
                            ->where('seen' , 0)
                            ->count();


        return $notifications;
    }


    public function getNotificationsAdmin()
    {
            $notifications = DB::table('notifications')->where('seen', 0)->paginate(5);
            return $notifications;

    }


    public function viewRequest($notificationId){

        $users =User::all();
        $notification = Notifications::findOrFail($notificationId);
        $request = Requests::findOrFail($notification->request_id);
        $user = User::where('id', $request->user_id)->first();
        $employee = Employee::where('user_id' , $request->user_id)->first();
        return view('dashboard.admin.view_request' , compact('request' , 'user' , 'employee' , 'users' , 'notification'));
    }

    public function notifications(){
        $users =User::all();
        $requests = Requests::all();

        return view('dashboard.admin.notifications' , compact('users' , 'requests'));
    }

}
