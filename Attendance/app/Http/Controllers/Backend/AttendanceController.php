<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Attendance;
use App\Models\Department;
use App\Models\Employee;
use App\Models\User;
use Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AttendanceController extends Controller
{
    /**
     * AttendanceController constructor.
     */
    public function __construct()
    {
        $this->middleware('authAdmin:admin');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */



    public function index()
    {
        $users = DB::table('users')
            ->where('active' , 1)
            ->get();
        $employees = Employee::paginate();
        $departments = Department::paginate();

        $hours_of_user_attendance = array();
        $attendances = Attendance::paginate();

        if($users->count() > 0){
            foreach ($users as $user){
                $hours_of_user_attendance[$user->id] = DB::table('attendances')->where('user_id',$user->id)->sum('sum');
            }
        }

        return view('dashboard.admin.attendance' , compact('users' , 'departments' , 'employees' , 'attendances' , 'hours_of_user_attendance'));
    }

    public function create()
    {

        $users = DB::table('users')
            ->where('active' , 1)
            ->get();

        $head_employee = DB::table('employees')->where('user_id' ,Auth::user()->id)->get();
        if($head_employee->count() > 0){
            foreach ($head_employee as $a){
                $employees = DB::table('employees')->where('department_id' , $a->department_id)->get();
                $hours_of_user_attendance = array();
                $department = Department::findOrFail($a->department_id);

                if($employees->count() > 0){
                    foreach ($employees as $employee){
                        $hours_of_user_attendance[$employee->user_id] = DB::table('attendances')->where('user_id',$employee->user_id)->sum('sum');
                    }
                }
            }
        }

        return view('dashboard.request.attendance_department' , compact('users' ,'department' , 'hours_of_user_attendance'));

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
    public function show($id)
    {
        //
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
}
