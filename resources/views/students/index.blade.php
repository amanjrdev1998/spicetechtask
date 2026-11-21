@extends('layouts.app')

@section('content')
    <div class="toolbar">
        <h2>Student List</h2>
        <span class="count" id="studentCount"></span>
    </div>

    <div class="toolbar">
        <div class="search-box">
            <input type="text" id="searchBox" placeholder="Search by name, email or class..." autocomplete="off">
        </div>
        <a class="btn btn-primary" href="{{ route('students.create') }}">Add New Student</a>
    </div>

    <div class="table-wrap">
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Class</th>
                    <th>Admission No</th>
                    <th>Date of Birth</th>
                    <th>Gender</th>
                    <th>City</th>
                    <th>State</th>
                    <th>Guardian</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody id="studentRows">
                <tr>
                    <td colspan="11" class="center">Loading students...</td>
                </tr>
            </tbody>
        </table>
    </div>
@endsection

@section('scripts')
<script>
    const rowsBody = document.getElementById('studentRows');
    const searchBox = document.getElementById('searchBox');
    const countText = document.getElementById('studentCount');
    const toast = document.getElementById('toast');
    const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
    let searchTimer = null;

    function showToast(message, isError) {
        toast.textContent = message;
        toast.className = 'toast show' + (isError ? ' error' : '');
        setTimeout(function () {
            toast.className = 'toast';
        }, 4000);
    }

    function escapeHtml(value) {
        const div = document.createElement('div');
        div.textContent = value === null || value === undefined ? '' : String(value);
        return div.innerHTML;
    }

    function loadStudents() {
        const search = searchBox.value.trim();
        rowsBody.innerHTML = '<tr><td colspan="11" class="center">Loading students...</td></tr>';

        let url = '/students/data';
        if (search) {
            url += '?search=' + encodeURIComponent(search);
        }

        fetch(url, { headers: { 'Accept': 'application/json' } })
            .then(function (response) {
                return response.json();
            })
            .then(function (data) {
                const students = data.students || [];
                countText.textContent = students.length + ' students';

                if (students.length === 0) {
                    rowsBody.innerHTML = '<tr><td colspan="11" class="center">No students found.</td></tr>';
                    return;
                }

                rowsBody.innerHTML = students.map(function (student) {
                    const guardian = escapeHtml(student.guardian_name) + ' (' + escapeHtml(student.guardian_phone) + ')';
                    const badge = student.copied ? ' <span class="badge">Copied</span>' : '';

                    return '<tr>'
                        + '<td>' + escapeHtml(student.name) + '</td>'
                        + '<td>' + escapeHtml(student.email) + '</td>'
                        + '<td>' + escapeHtml(student.phone) + '</td>'
                        + '<td>' + escapeHtml(student.class) + '</td>'
                        + '<td>' + escapeHtml(student.admission_no) + '</td>'
                        + '<td>' + escapeHtml(student.date_of_birth) + '</td>'
                        + '<td>' + escapeHtml(student.gender) + '</td>'
                        + '<td>' + escapeHtml(student.city) + '</td>'
                        + '<td>' + escapeHtml(student.state) + '</td>'
                        + '<td>' + guardian + '</td>'
                        + '<td><button type="button" class="btn btn-green copy-btn" data-id="' + student.id + '">Copy</button>' + badge + '</td>'
                        + '</tr>';
                }).join('');
            })
            .catch(function () {
                rowsBody.innerHTML = '<tr><td colspan="11" class="center">Could not load students. Please refresh the page.</td></tr>';
            });
    }

    function copyStudent(button) {
        const id = button.dataset.id;
        button.disabled = true;
        button.textContent = 'Copying...';

        fetch('/students/' + id + '/copy', {
            method: 'POST',
            headers: {
                'X-CSRF-TOKEN': token,
                'Accept': 'application/json',
                'X-Requested-With': 'XMLHttpRequest'
            }
        })
            .then(function (response) {
                return response.json().then(function (data) {
                    return { ok: response.ok, data: data };
                });
            })
            .then(function (result) {
                if (result.ok) {
                    button.disabled = false;
                    button.textContent = 'Copy';
                    showToast(result.data.message || 'Student copied to new school and mail queued.');
                    loadStudents();
                } else {
                    button.disabled = false;
                    button.textContent = 'Copy';
                    showToast(result.data.message || 'Could not copy student.', true);
                }
            })
            .catch(function () {
                button.disabled = false;
                button.textContent = 'Copy';
                showToast('Could not copy student.', true);
            });
    }

    rowsBody.addEventListener('click', function (event) {
        const button = event.target.closest('.copy-btn');
        if (!button || button.disabled) {
            return;
        }
        copyStudent(button);
    });

    searchBox.addEventListener('input', function () {
        clearTimeout(searchTimer);
        searchTimer = setTimeout(loadStudents, 300);
    });

    loadStudents();
</script>
@endsection
