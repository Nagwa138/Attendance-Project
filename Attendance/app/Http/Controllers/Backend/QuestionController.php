<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Answer;
use Illuminate\Http\Request;
use App\Models\Question;
use App\Models\User;
use App\Models\Department;

class QuestionController extends Controller
{


    public function __construct(){
        $this->middleware('authAdmin:admin');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $users = User::all();
        $questions = Question::all();
        $departments = Department::all();
        return view('dashboard.admin.questions' ,compact('questions' , 'users', 'departments'));
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
    public function store(Request $request)
    {
        $request->validate([
            'text' => 'required',
            'department_id' => 'required'
        ]);

       $question = new Question();
       $question->text = $request['text'];
        $question->department_id = $request['department_id'];
        $question->save();

        $answer1 = new Answer();
        $answer1->text = $request['answer1'];
        $answer1->question_id  = $question->id;
        $answer1->save();
        $answer2 = new Answer();
        $answer2->text = $request['answer2'];
        $answer2->question_id  = $question->id;
        $answer2->save();
        $answer3 = new Answer();
        $answer3->text = $request['answer3'];
        $answer3->question_id  = $question->id;
        $answer3->save();

        return back();

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
        Question::findOrFail($id)->delete();
        return back();
    }
}
