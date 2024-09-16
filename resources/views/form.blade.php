<!DOCTYPE html>
<html>
    <head>
        <title>Form Submission</title>
    </head>
    <body>
        <form action="/submit" method="POST">
            @csrf
            <label for="name">Enter your name:</label>
            <input type="text" name="name" id="name" />
            <button type="submit">Submit</button>
        </form>
    </body>
</html>
