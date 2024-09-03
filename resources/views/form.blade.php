<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Styled Form Demo</title>
    <link rel="stylesheet" href="{{ asset('styles.css') }}" />
  </head>
  <body>
    <div class="container">
      <h1>Form Demo</h1>
      <form action="{{ url('process.php') }}" method="post">
        @csrf
        <!-- Text Input -->
        <div class="form-group">
          <label for="username">Username:</label>
          <input
            type="text"
            id="username"
            name="username"
            placeholder="Enter your username"
            value="{{ old('username') }}"
          />
        </div>

        <!-- Password Input -->
        <div class="form-group">
          <label for="password">Password:</label>
          <input
            type="password"
            id="password"
            name="password"
            placeholder="Enter your password"
          />
        </div>

        <!-- Email Input -->
        <div class="form-group">
          <label for="email">Email:</label>
          <input
            type="email"
            id="email"
            name="email"
            placeholder="Enter your email"
            value="{{ old('email') }}"
          />
        </div>

        <!-- Number Input -->
        <div class="form-group">
          <label for="age">Age:</label>
          <input
            type="number"
            id="age"
            name="age"
            placeholder="Enter your age"
            value="{{ old('age') }}"
          />
        </div>

        <!-- Date Input -->
        <div class="form-group">
          <label for="dob">Date of Birth:</label>
          <input type="date" id="dob" name="dob" value="{{ old('dob') }}" />
        </div>

        <!-- Checkbox -->
        <div class="form-group">
          <label>
            <input
              type="checkbox"
              name="subscribe"
              value="newsletter"
              {{ old('subscribe') ? 'checked' : '' }}
            />
            Subscribe to newsletter
          </label>
        </div>

        <!-- Radio Buttons -->
        <div class="form-group">
          <label>Gender:</label>
          <label>
            <input type="radio" name="gender" value="male" {{ old('gender') == 'male' ? 'checked' : '' }} />
            Male
          </label>
          <label>
            <input type="radio" name="gender" value="female" {{ old('gender') == 'female' ? 'checked' : '' }} />
            Female
          </label>
        </div>

        <!-- Select Dropdown -->
        <div class="form-group">
          <label for="country">Country:</label>
          <select id="country" name="country">
            <option value="usa" {{ old('country') == 'usa' ? 'selected' : '' }}>USA</option>
            <option value="uk" {{ old('country') == 'uk' ? 'selected' : '' }}>UK</option>
            <option value="canada" {{ old('country') == 'canada' ? 'selected' : '' }}>Canada</option>
          </select>
        </div>

        <!-- Textarea -->
        <div class="form-group">
          <label for="comments">Comments:</label>
          <textarea
            id="comments"
            name="comments"
            rows="4"
            placeholder="Enter your comments"
          >{{ old('comments') }}</textarea>
        </div>

        <!-- File Input -->
        <div class="form-group">
          <label for="resume">Upload Resume:</label>
          <input type="file" id="resume" name="resume" />
        </div>

        <!-- Hidden Input -->
        <input type="hidden" name="token" value="{{ csrf_token() }}" />

        <!-- DateTime Input -->
        <div class="form-group">
          <label for="appointment">Appointment:</label>
          <input
            type="datetime-local"
            id="appointment"
            name="appointment"
            value="{{ old('appointment') }}"
          />
        </div>

        <!-- Color Input -->
        <div class="form-group">
          <label for="color">Favorite Color:</label>
          <input type="color" id="color" name="color" value="{{ old('color') }}" />
        </div>

        <!-- Range Input -->
        <div class="form-group">
          <label for="volume">Volume:</label>
          <input
            type="range"
            id="volume"
            name="volume"
            min="0"
            max="100"
            value="{{ old('volume', 50) }}"
          />
        </div>

        <!-- Month Input -->
        <div class="form-group">
          <label for="month">Month:</label>
          <input type="month" id="month" name="month" value="{{ old('month') }}" />
        </div>

        <!-- Week Input -->
        <div class="form-group">
          <label for="week">Week:</label>
          <input type="week" id="week" name="week" value="{{ old('week') }}" />
        </div>

        <!-- Time Input -->
        <div class="form-group">
          <label for="time">Time:</label>
          <input type="time" id="time" name="time" value="{{ old('time') }}" />
        </div>

        <!-- Submit Button -->
        <div class="form-group">
          <button type="button">Click Me</button>
        </div>

        <div class="form-group">
          <input type="submit" value="Submit" />
        </div>
      </form>
    </div>
  </body>
</html>
