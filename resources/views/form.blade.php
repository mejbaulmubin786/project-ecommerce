<!DOCTYPE html>
<html>
    <head>
        <title>Form Submission</title>
    </head>
    <body>
        @if (session('success'))
            <p>{{ session('success') }}</p>
        @endif

        <form action="{{ route('form.submit') }}" method="POST">
            @csrf
            <label for="name">Enter your name:</label>
            <input type="text" name="name" id="name" />
            <button type="submit">Submit</button>
        </form>
    </body>
</html>
