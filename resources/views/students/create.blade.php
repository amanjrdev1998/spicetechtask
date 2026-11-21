@extends('layouts.app')

@section('content')
    <h2>Add Student (Old School)</h2>

    <div id="formMessage" class="msg"></div>

    <form id="studentForm" action="{{ route('students.store') }}" method="POST">
        @csrf

        <div class="form-grid">
            <div class="field">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" value="{{ old('name') }}" required>
                <div class="field-error" id="error-name"></div>
            </div>

            <div class="field">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" value="{{ old('email') }}" required>
                <div class="field-error" id="error-email"></div>
            </div>

            <div class="field">
                <label for="phone">Phone</label>
                <input type="text" id="phone" name="phone" value="{{ old('phone') }}" required>
                <div class="field-error" id="error-phone"></div>
            </div>

            <div class="field">
                <label for="class">Class</label>
                <input type="text" id="class" name="class" value="{{ old('class') }}" placeholder="e.g. 5th" required>
                <div class="field-error" id="error-class"></div>
            </div>

            <div class="field">
                <label for="admission_no">Admission No</label>
                <input type="text" id="admission_no" name="admission_no" value="{{ old('admission_no') }}" required>
                <div class="field-error" id="error-admission_no"></div>
            </div>

            <div class="field">
                <label for="date_of_birth">Date of Birth</label>
                <input type="date" id="date_of_birth" name="date_of_birth" value="{{ old('date_of_birth') }}" required>
                <div class="field-error" id="error-date_of_birth"></div>
            </div>

            <div class="field">
                <label for="gender">Gender</label>
                <select id="gender" name="gender" required>
                    <option value="">Select</option>
                    <option value="Male" {{ old('gender') == 'Male' ? 'selected' : '' }}>Male</option>
                    <option value="Female" {{ old('gender') == 'Female' ? 'selected' : '' }}>Female</option>
                </select>
                <div class="field-error" id="error-gender"></div>
            </div>

            <div class="field">
                <label for="pincode">Pincode</label>
                <input type="text" id="pincode" name="pincode" value="{{ old('pincode') }}" required>
                <div class="field-error" id="error-pincode"></div>
            </div>

            <div class="field field-full">
                <label for="address">Address</label>
                <textarea id="address" name="address" required>{{ old('address') }}</textarea>
                <div class="field-error" id="error-address"></div>
            </div>

            <div class="field">
                <label for="city">City</label>
                <input type="text" id="city" name="city" value="{{ old('city') }}" required>
                <div class="field-error" id="error-city"></div>
            </div>

            <div class="field">
                <label for="state">State</label>
                <input type="text" id="state" name="state" value="{{ old('state') }}" required>
                <div class="field-error" id="error-state"></div>
            </div>

            <div class="field">
                <label for="guardian_name">Guardian Name</label>
                <input type="text" id="guardian_name" name="guardian_name" value="{{ old('guardian_name') }}" required>
                <div class="field-error" id="error-guardian_name"></div>
            </div>

            <div class="field">
                <label for="guardian_phone">Guardian Phone</label>
                <input type="text" id="guardian_phone" name="guardian_phone" value="{{ old('guardian_phone') }}" required>
                <div class="field-error" id="error-guardian_phone"></div>
            </div>
        </div>

        <button type="submit" id="saveButton" class="btn btn-primary">Save</button>
    </form>
@endsection

@section('scripts')
<script>
    const form = document.getElementById('studentForm');
    const saveButton = document.getElementById('saveButton');
    const formMessage = document.getElementById('formMessage');
    const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
    const fields = ['name', 'email', 'phone', 'class', 'admission_no', 'date_of_birth', 'gender', 'address', 'city', 'state', 'pincode', 'guardian_name', 'guardian_phone'];

    function showMessage(text, isError) {
        formMessage.textContent = text;
        formMessage.className = 'msg show ' + (isError ? 'error' : 'success');
    }

    function clearErrors() {
        fields.forEach(function (name) {
            const errorBox = document.getElementById('error-' + name);
            if (errorBox) {
                errorBox.textContent = '';
            }
        });
    }

    form.addEventListener('submit', function (event) {
        event.preventDefault();
        clearErrors();
        formMessage.className = 'msg';
        formMessage.textContent = '';

        saveButton.disabled = true;
        saveButton.textContent = 'Saving...';

        fetch(form.action, {
            method: 'POST',
            body: new FormData(form),
            headers: {
                'X-CSRF-TOKEN': token,
                'Accept': 'application/json',
                'X-Requested-With': 'XMLHttpRequest'
            }
        })
            .then(function (response) {
                return response.json().then(function (data) {
                    return { status: response.status, ok: response.ok, data: data };
                });
            })
            .then(function (result) {
                if (result.status === 201) {
                    showMessage(result.data.message || 'Student saved in old school.', false);
                    form.reset();
                } else if (result.status === 422 && result.data.errors) {
                    Object.keys(result.data.errors).forEach(function (name) {
                        const errorBox = document.getElementById('error-' + name);
                        if (errorBox) {
                            errorBox.textContent = result.data.errors[name][0];
                        }
                    });
                    showMessage('Please fix the errors below.', true);
                } else {
                    showMessage(result.data.message || 'Something went wrong. Please try again.', true);
                }
            })
            .catch(function () {
                showMessage('Something went wrong. Please try again.', true);
            })
            .finally(function () {
                saveButton.disabled = false;
                saveButton.textContent = 'Save';
            });
    });
</script>
@endsection
