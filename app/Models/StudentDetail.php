<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class StudentDetail extends Model
{
    protected $connection = 'mysql_old';

    protected $fillable = [
        'student_id',
        'date_of_birth',
        'gender',
        'address',
        'city',
        'state',
        'pincode',
        'guardian_name',
        'guardian_phone',
    ];

    public function student(): BelongsTo
    {
        return $this->belongsTo(Student::class, 'student_id');
    }
}
