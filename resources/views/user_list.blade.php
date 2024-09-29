<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User List with Dynamic URL</title>
</head>
<body>
    <h1>User List</h1>

    <table border="1" cellpadding="10" cellspacing="0">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Age</th>
                <th>Profile Link</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($users as $user)
            <tr>
                <td>{{ $user->id }}</td>
                <td>{{ $user->name }}</td>
                <td>{{ $user->age }}</td>
                <td>
                    {{-- Dynamic URL for each user --}}
                    <a href="{{ url('/profile/' . $user->id . '/' . $user->name . '/' . $user->age) }}">
                        View Profile
                    </a>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>

</body>
</html>
