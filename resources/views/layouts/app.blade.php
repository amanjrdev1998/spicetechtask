<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>Old School - Students</title>
    <style>
        * { box-sizing: border-box; }
        body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Arial, sans-serif; margin: 0; background: #eef1f5; color: #1f2937; }
        a { color: #2563eb; text-decoration: none; }
        a:hover { text-decoration: underline; }
        .topbar { background: #1f3a5f; color: #fff; padding: 16px 24px; display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 10px; }
        .topbar h1 { margin: 0; font-size: 22px; }
        .topbar p { margin: 2px 0 0; font-size: 13px; color: #cbd5e1; }
        .topbar nav a { color: #fff; margin-left: 18px; font-size: 15px; }
        .topbar nav a:hover { color: #bfdbfe; }
        .container { max-width: 1120px; margin: 24px auto; padding: 0 16px; }
        .card { background: #fff; border-radius: 10px; box-shadow: 0 1px 4px rgba(0, 0, 0, 0.1); padding: 20px; }
        .card h2 { margin: 0 0 16px; font-size: 20px; }
        .toolbar { display: flex; justify-content: space-between; align-items: center; gap: 12px; flex-wrap: wrap; margin-bottom: 16px; }
        .toolbar h2 { margin: 0; }
        .count { color: #64748b; font-size: 14px; }
        .search-box input { width: 320px; max-width: 100%; padding: 9px 12px; border: 1px solid #cbd5e1; border-radius: 6px; font-size: 15px; }
        .table-wrap { overflow-x: auto; }
        table { border-collapse: collapse; width: 100%; min-width: 900px; }
        th, td { padding: 10px 12px; text-align: left; border-bottom: 1px solid #e5e7eb; font-size: 14px; }
        thead th { background: #f1f5f9; position: sticky; top: 0; }
        tbody tr:hover { background: #f8fafc; }
        .center { text-align: center; color: #64748b; padding: 24px 12px; }
        .btn { display: inline-block; padding: 8px 16px; border: none; border-radius: 6px; cursor: pointer; font-size: 14px; }
        .btn-primary { background: #2563eb; color: #fff; }
        .btn-primary:hover { background: #1d4ed8; }
        .btn-green { background: #16a34a; color: #fff; }
        .btn-green:hover { background: #15803d; }
        .btn:disabled { opacity: 0.6; cursor: default; }
        .btn-copied { background: #64748b; color: #fff; }
        .badge { display: inline-block; background: #e2e8f0; color: #475569; font-size: 12px; padding: 3px 8px; border-radius: 999px; margin-left: 6px; }
        .form-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 16px; }
        .field label { display: block; margin-bottom: 5px; font-weight: 600; font-size: 14px; }
        .field input, .field select, .field textarea { width: 100%; padding: 9px 10px; border: 1px solid #cbd5e1; border-radius: 6px; font-size: 15px; font-family: inherit; }
        .field textarea { min-height: 70px; }
        .field-full { grid-column: 1 / -1; }
        .field-error { color: #dc2626; font-size: 13px; min-height: 16px; margin-top: 3px; }
        .msg { padding: 11px 14px; border-radius: 6px; margin-bottom: 16px; display: none; }
        .msg.show { display: block; }
        .msg.success { background: #dcfce7; color: #166534; }
        .msg.error { background: #fee2e2; color: #991b1b; }
        .toast { position: fixed; bottom: 20px; right: 20px; background: #16a34a; color: #fff; padding: 12px 18px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2); display: none; max-width: 90%; z-index: 50; }
        .toast.show { display: block; }
        .toast.error { background: #dc2626; }
        @media (max-width: 700px) {
            .form-grid { grid-template-columns: 1fr; }
            .topbar nav a { margin-left: 0; margin-right: 14px; }
        }
    </style>
</head>
<body>
    <header class="topbar">
        <div>
            <h1>Old School</h1>
            <p>Student records - Old School and New School</p>
        </div>
        <nav>
            <a href="{{ route('students.index') }}">Student List</a>
            <a href="{{ route('students.create') }}">Add New Student</a>
        </nav>
    </header>

    <main class="container">
        <div class="card">
            @if (session('success'))
                <div class="msg success show">{{ session('success') }}</div>
            @endif

            @yield('content')
        </div>
    </main>

    <div id="toast" class="toast"></div>

    @yield('scripts')
</body>
</html>
