<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search User with Query String</title>
</head>
<body>
    <h1>Search User</h1>

    {{-- Form to send query string --}}
    <form action="{{ url('/profile') }}" method="GET">
        <label for="id">User ID:</label><br>
        <input type="text" id="id" name="id" placeholder="Enter User ID" required><br><br>

        <label for="name">Name:</label><br>
        <input type="text" id="name" name="name" placeholder="Enter User Name" required><br><br>

        <label for="age">Age:</label><br>
        <input type="text" id="age" name="age" placeholder="Enter User Age" required><br><br>

        <button type="submit">Search User</button>
    </form>

    {{-- Display the searched user details --}}
    @if(isset($id) && isset($name) && isset($age))
    <h2>Search Result</h2>
    <p><strong>User ID:</strong> {{ $id }}</p>
    <p><strong>Name:</strong> {{ $name }}</p>
    <p><strong>Age:</strong> {{ $age }}</p>
    @endif

</body>
</html>
