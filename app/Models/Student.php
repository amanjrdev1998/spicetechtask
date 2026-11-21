<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Student extends Model
{
    protected $connection = 'mysql_old';

    protected $fillable = [
        'name',
        'email',
        'phone',
        'class',
        'admission_no',
    ];

    public function detail(): HasOne
    {
        return $this->hasOne(StudentDetail::class, 'student_id');
    }
}
