<?php

namespace App\Http\Controllers;

use App\Mail\StudentCopiedMail;
use App\Models\Student;
use App\Models\StudentDetail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;

class StudentController extends Controller
{
    public function index()
    {
        return view('students.index');
    }

    public function data(Request $request)
    {
        $search = $request->input('search');

        $query = Student::with('detail')->orderBy('name');

        if ($search) {
            $query->where(function ($q) use ($search) {
                $q->where('name', 'like', '%' . $search . '%')
                    ->orWhere('email', 'like', '%' . $search . '%')
                    ->orWhere('class', 'like', '%' . $search . '%');
            });
        }

        $students = $query->get();
        $copiedEmails = Student::on('mysql_new')->pluck('email')->all();

        $rows = $students->map(function ($student) use ($copiedEmails) {
            $detail = $student->detail;

            return [
                'id' => $student->id,
                'name' => $student->name,
                'email' => $student->email,
                'phone' => $student->phone,
                'class' => $student->class,
                'admission_no' => $student->admission_no,
                'date_of_birth' => $detail ? $detail->date_of_birth : '',
                'gender' => $detail ? $detail->gender : '',
                'address' => $detail ? $detail->address : '',
                'city' => $detail ? $detail->city : '',
                'state' => $detail ? $detail->state : '',
                'pincode' => $detail ? $detail->pincode : '',
                'guardian_name' => $detail ? $detail->guardian_name : '',
                'guardian_phone' => $detail ? $detail->guardian_phone : '',
                'copied' => in_array($student->email, $copiedEmails),
            ];
        });

        return response()->json(['students' => $rows]);
    }

    public function create()
    {
        return view('students.create');
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:students,email',
            'phone' => 'required|string|max:20',
            'class' => 'required|string|max:20',
            'admission_no' => 'required|string|unique:students,admission_no',
            'date_of_birth' => 'required|date',
            'gender' => 'required|string',
            'address' => 'required|string',
            'city' => 'required|string|max:100',
            'state' => 'required|string|max:100',
            'pincode' => 'required|string|max:10',
            'guardian_name' => 'required|string|max:255',
            'guardian_phone' => 'required|string|max:20',
        ]);

        $student = null;

        DB::connection('mysql_old')->transaction(function () use ($data, &$student) {
            $student = Student::create([
                'name' => $data['name'],
                'email' => $data['email'],
                'phone' => $data['phone'],
                'class' => $data['class'],
                'admission_no' => $data['admission_no'],
            ]);

            StudentDetail::create([
                'student_id' => $student->id,
                'date_of_birth' => $data['date_of_birth'],
                'gender' => $data['gender'],
                'address' => $data['address'],
                'city' => $data['city'],
                'state' => $data['state'],
                'pincode' => $data['pincode'],
                'guardian_name' => $data['guardian_name'],
                'guardian_phone' => $data['guardian_phone'],
            ]);
        });

        if ($request->wantsJson() || $request->ajax()) {
            return response()->json([
                'message' => 'Student saved in old school.',
                'student' => [
                    'id' => $student->id,
                    'name' => $student->name,
                    'email' => $student->email,
                ],
            ], 201);
        }

        return redirect()->route('students.index')->with('success', 'Student saved in old school.');
    }

    public function copy(Request $request, $id)
    {
        $student = Student::with('detail')->findOrFail($id);

        $exists = Student::on('mysql_new')->where('email', $student->email)->first();

        if ($exists) {
            if ($request->wantsJson() || $request->ajax()) {
                return response()->json([
                    'message' => 'Student already exists in new school.',
                    'copied' => true,
                ], 200);
            }

            return redirect()->route('students.index')->with('success', 'Student already exists in new school.');
        }

        $newStudent = new Student();
        $newStudent->setConnection('mysql_new');
        $newStudent->name = $student->name;
        $newStudent->email = $student->email;
        $newStudent->phone = $student->phone;
        $newStudent->class = $student->class;
        $newStudent->admission_no = $student->admission_no;
        $newStudent->save();

        $newDetail = new StudentDetail();
        $newDetail->setConnection('mysql_new');
        $newDetail->student_id = $newStudent->id;
        $newDetail->date_of_birth = $student->detail->date_of_birth;
        $newDetail->gender = $student->detail->gender;
        $newDetail->address = $student->detail->address;
        $newDetail->city = $student->detail->city;
        $newDetail->state = $student->detail->state;
        $newDetail->pincode = $student->detail->pincode;
        $newDetail->guardian_name = $student->detail->guardian_name;
        $newDetail->guardian_phone = $student->detail->guardian_phone;
        $newDetail->save();

        Mail::to($student->email)->queue(new StudentCopiedMail($student));

        if ($request->wantsJson() || $request->ajax()) {
            return response()->json([
                'message' => 'Student copied to new school and mail queued.',
                'copied' => true,
            ], 200);
        }

        return redirect()->route('students.index')->with('success', 'Student copied to new school and mail queued.');
    }
}
