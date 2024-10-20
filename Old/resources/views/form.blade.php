<!DOCTYPE html>
<html>
<head>
    <title>Submit Form</title>
</head>
<body>
    <h1>Submit your information</h1>

    <form action="/submit-form" method="POST">
        @csrf
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br><br>

        <button type="submit">Submit</button>
    </form>
</body>
</html>
