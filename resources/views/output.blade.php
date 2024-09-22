<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form Output</title>
</head>
<body>
    <h1>Submitted Form Data</h1>
    <ul>
        <li>Name: {{ $data['name'] }}</li>
        <li>Age: {{ $data['age'] }}</li>
        <li>Email: {{ $data['email'] }}</li>
        <li>Gender: {{ $data['gender'] }}</li>
        <li>Country: {{ $data['country'] }}</li>
        <li>Bio: {{ $data['bio'] }}</li>
        <li>Date of Birth: {{ $data['dob'] }}</li>
        <li>Interests: {{ implode(', ', $data['interests'] ?? []) }}</li>
    </ul>
</body>
</html>
