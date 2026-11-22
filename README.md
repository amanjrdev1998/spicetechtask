# School Project - Old School / New School

Fresh Laravel project with two MySQL databases - old_school and new_school.
Each database has two tables: students and student_details (1-to-1).

100 dummy students are seeded into old_school in ascending order by name.
new_school starts empty - students are copied into it one by one with the
Copy button on the list page, so every row shows a working Copy button.

## What it does

- Student list page (`/students`) shows students from the OLD school database.
- Add Student form (`/students/create`) saves into the OLD school database only,
  both tables in one transaction.
- Copy button on each row copies that single student (+ details) into the NEW
  school database. If the student already exists in new_school (checked by
  email), it is skipped. On copy, a queued mail is sent to the student's email
  with the message "your Record copied to new School".
- The Add Student form, the student list and the Copy buttons all work with
  AJAX (fetch), so the page does not reload. The list loads from the JSON
  endpoint `GET /students/data` and has a live search box that filters by
  name, email or class. The form shows validation errors inline, and the
  Copy button changes to Copied after a successful copy.

## Requirements

- PHP 8.2 or higher (tested with PHP 8.2.12 on XAMPP)
- Laravel 12
- Composer
- MySQL / MariaDB

## Setup

1. Install dependencies:

   ```
   composer install
   ```

2. Create the two databases in MySQL (phpMyAdmin or the MySQL shell):

   ```sql
   CREATE DATABASE old_school;
   CREATE DATABASE new_school;
   ```

   The project uses the XAMPP default login: user `root` with no password.
   That is already set in `.env` (`DB_USERNAME=root`, `DB_PASSWORD=` empty,
   same for the new school connection). If your MySQL has a different user
   or password, change `DB_USERNAME`, `DB_PASSWORD`, `DB_NEW_USERNAME` and
   `DB_NEW_PASSWORD` in `.env` to match it.

3. Copy the env file and generate the app key:

   ```
   cp .env.example .env
   php artisan key:generate
   ```

   `.env` already has both database connections set:
   `mysql_old` (default, old_school) and `mysql_new` (new_school).

4. Run migrations on the old school database:

   ```
   php artisan migrate
   ```

5. Run migrations on the new school database (students tables only):

   ```
   php artisan migrate --database=mysql_new --path=database/migrations/2026_11_21_000001_create_students_table.php --path=database/migrations/2026_11_21_000002_create_student_details_table.php
   ```

6. Seed the 100 dummy students fresh into old_school (ascending by name):

   ```
   php artisan db:seed
   ```

   The seeder first clears both databases, so running it again always gives
   a fresh start. new_school stays empty until you copy a student with the
   Copy button.

7. Start the app:

   ```
   php artisan serve
   ```

   Open http://localhost:8000/students

8. Start the queue worker so copied-student mails are sent:

   ```
   php artisan queue:work
   ```

## Mail

For local testing `MAIL_MAILER=log` is set in `.env`, so mails are written to
`storage/logs/laravel.log` instead of being sent. The mail code is real queue
+ mail code (`ShouldQueue` Mailable, `Mail::to(...)->queue(...)`).

To send real mails, set `MAIL_MAILER=smtp` and fill in `MAIL_HOST`,
`MAIL_PORT`, `MAIL_USERNAME`, `MAIL_PASSWORD` and `MAIL_FROM_ADDRESS` in `.env`.

## Files

- `old_school.sql` - export of old_school (students + student_details, 100 rows each)
- `new_school.sql` - export of new_school (tables only, no rows yet - rows appear as students are copied with the Copy button)
- `app/Models/Student.php`, `app/Models/StudentDetail.php`
- `app/Http/Controllers/StudentController.php`
- `app/Mail/StudentCopiedMail.php`
- `database/seeders/StudentSeeder.php` - the 100 dummy students
- `resources/views/students/index.blade.php` - list + Copy button
- `resources/views/students/create.blade.php` - add student form
