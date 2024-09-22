<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>PHP Comprehensive Form Example</title>
    <link rel="stylesheet" href="css/form-index.css" />
  </head>
  <body>
    <div class="container">
      <h1>Comprehensive Form with All Elements</h1>
      <!-- Combined Form -->
      <form action="/form-index" method="post">
        @csrf
        <h2>Complete Form</h2>

        <!-- Text Input -->
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required placeholder="name"/>
        <br />

        <!-- Number Input -->
        <label for="age">Age:</label>
        <input type="number" id="age" name="age" required placeholder="age"/>
        <br />

        <!-- Email Input -->
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required required placeholder="email"/>
        <br />

        <!-- Password Input -->
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required placeholder="password"/>
        <br />

        <!-- Radio Buttons -->
        <label>Gender:</label>
        <div class="inline-elements">
          <input type="radio" id="male" name="gender" value="Male" />
          <label for="male">Male</label>
          <input type="radio" id="female" name="gender" value="Female" />
          <label for="female">Female</label>
          <input type="radio" id="other" name="gender" value="Other" />
          <label for="other">Other</label>
        </div>
        <br />

        <!-- Checkbox -->
        <label>Interests:</label>
        <div class="inline-elements">
          <input
            type="checkbox"
            id="coding"
            name="interests[]"
            value="Coding"
          />
          <label for="coding">Coding</label>
          <input type="checkbox" id="music" name="interests[]" value="Music" />
          <label for="music">Music</label>
          <input
            type="checkbox"
            id="sports"
            name="interests[]"
            value="Sports"
          />
          <label for="sports">Sports</label>
        </div>
        <br />

        <!-- Dropdown -->
        <label for="country">Country:</label>
        <select id="country" name="country">
          <option value="Bangladesh">Bangladesh</option>
          <option value="India">India</option>
          <option value="USA">USA</option>
          <option value="Canada">Canada</option>
        </select>
        <br />

        <!-- Text Area -->
        <label for="bio">Bio:</label>
        <textarea id="bio" name="bio" rows="4" cols="50"></textarea>
        <br />

        <!-- Date Input -->
        <label for="dob">Date of Birth:</label>
        <input type="date" id="dob" name="dob" />
        <br />

        <!-- File Upload -->
        <label for="resume">Upload Resume:</label>
        <input type="file" id="resume" name="resume" />
        <br />

        <!-- Hidden input to specify the form method (GET or POST) -->
        <input type="hidden" name="form_method" value="comprehensive" />

        <input type="submit" value="Submit Form" />
      </form>
    </div>
  </body>
</html>
