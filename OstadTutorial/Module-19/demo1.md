ডায়াগ্রাম অনুযায়ী ডাটাবেজটি তৈরি করার জন্য SQL কমান্ড নিচে দেওয়া হলো। এই ডাটাবেজে টেবিল তৈরি করা হয়েছে এবং ডায়াগ্রাম অনুযায়ী প্রয়োজনীয় ফিল্ড ও রিলেশনশিপ (foreign keys) যোগ করা হয়েছে।

```sql
-- Database Creation
CREATE DATABASE Demo1;
USE Demo1;

-- Table Creation
CREATE TABLE users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE profiles (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    bio VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE posts (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE comments (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    post_id BIGINT NOT NULL,
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (post_id) REFERENCES posts(id)
);

CREATE TABLE tags (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE post_tags (
    post_id BIGINT NOT NULL,
    tag_id BIGINT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id),
    PRIMARY KEY (post_id, tag_id)
);

-- Data Insertion
-- Inserting 20 rows as sample data

-- Users
INSERT INTO users (name, email) VALUES
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com'),
('Charlie', 'charlie@example.com'),
('David', 'david@example.com'),
('Eve', 'eve@example.com');

-- Profiles
INSERT INTO profiles (user_id, bio) VALUES
(1, 'Bio for Alice'),
(2, 'Bio for Bob'),
(3, 'Bio for Charlie'),
(4, 'Bio for David'),
(5, 'Bio for Eve');

-- Posts
INSERT INTO posts (user_id, title, content) VALUES
(1, 'Alice\'s First Post', 'Content of Alice\'s first post'),
(2, 'Bob\'s Thoughts', 'Content of Bob\'s thoughts'),
(3, 'Charlie\'s Adventure', 'Content of Charlie\'s adventure'),
(4, 'David\'s Journey', 'Content of David\'s journey'),
(5, 'Eve\'s Insight', 'Content of Eve\'s insight');

-- Comments
INSERT INTO comments (user_id, post_id, content) VALUES
(1, 2, 'Alice comments on Bob\'s post'),
(2, 3, 'Bob comments on Charlie\'s post'),
(3, 4, 'Charlie comments on David\'s post'),
(4, 5, 'David comments on Eve\'s post'),
(5, 1, 'Eve comments on Alice\'s post');

-- Tags
INSERT INTO tags (name) VALUES
('Technology'),
('Science'),
('Education'),
('Health'),
('Travel');

-- Post_Tags
INSERT INTO post_tags (post_id, tag_id) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(2, 1),
(3, 4),
(4, 5),
(5, 3);
```

এই SQL কমান্ডগুলো Demo1 নামক ডাটাবেজে টেবিলগুলো তৈরি করবে এবং ২০টি ডাটাও ইনসার্ট করবে।
নিচে Laravel মাইগ্রেশন ফাইল এবং Artisan কমান্ডের মাধ্যমে এই টেবিলগুলো তৈরি করার প্রক্রিয়া দেখানো হলো। প্রতিটি টেবিলের জন্য একটি করে মাইগ্রেশন ফাইল তৈরি করা হয়েছে এবং সম্পর্কগুলো (`foreign keys`) যোগ করা হয়েছে।

### 1. Artisan Command to Create Migration Files

প্রথমে Artisan কমান্ড ব্যবহার করে প্রতিটি টেবিলের জন্য মাইগ্রেশন ফাইল তৈরি করুন:

```bash
php artisan make:migration create_users_table
php artisan make:migration create_profiles_table
php artisan make:migration create_posts_table
php artisan make:migration create_comments_table
php artisan make:migration create_tags_table
php artisan make:migration create_post_tags_table
```

এখন প্রতিটি মাইগ্রেশন ফাইলে নিচের কোডগুলো যুক্ত করুন।

### 2. Migration Files Code

#### `create_users_table` Migration

```php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name');
            $table->string('email')->unique();
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('users');
    }
}
```

#### `create_profiles_table` Migration

```php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProfilesTable extends Migration
{
    public function up()
    {
        Schema::create('profiles', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('user_id');
            $table->string('bio')->nullable();
            $table->timestamps();

            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('profiles');
    }
}
```

#### `create_posts_table` Migration

```php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePostsTable extends Migration
{
    public function up()
    {
        Schema::create('posts', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('user_id');
            $table->string('title');
            $table->text('content')->nullable();
            $table->timestamps();

            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('posts');
    }
}
```

#### `create_comments_table` Migration

```php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCommentsTable extends Migration
{
    public function up()
    {
        Schema::create('comments', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('user_id');
            $table->unsignedBigInteger('post_id');
            $table->text('content');
            $table->timestamps();

            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('post_id')->references('id')->on('posts')->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('comments');
    }
}
```

#### `create_tags_table` Migration

```php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTagsTable extends Migration
{
    public function up()
    {
        Schema::create('tags', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name')->unique();
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('tags');
    }
}
```

#### `create_post_tags_table` Migration

```php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePostTagsTable extends Migration
{
    public function up()
    {
        Schema::create('post_tags', function (Blueprint $table) {
            $table->unsignedBigInteger('post_id');
            $table->unsignedBigInteger('tag_id');
            $table->timestamps();

            $table->primary(['post_id', 'tag_id']);
            $table->foreign('post_id')->references('id')->on('posts')->onDelete('cascade');
            $table->foreign('tag_id')->references('id')->on('tags')->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('post_tags');
    }
}
```

### 3. Run Migrations

সবগুলো মাইগ্রেশন রান করার জন্য নিচের কমান্ডটি ব্যবহার করুন:

```bash
php artisan migrate
```

এতে Laravel ডাটাবেজে সব টেবিল তৈরি করবে, এবং সম্পর্কসমূহ সঠিকভাবে যোগ হবে।
Laravel মাইগ্রেশনের জন্য উভয় পদ্ধতিই সঠিক, তবে এগুলোর ব্যবহার ভিন্ন পরিস্থিতিতে করা হয়। নিচে উভয় ধরণের ব্যাখ্যা এবং তাদের ব্যবহারের পদ্ধতি দেওয়া হলো।

### 1. Traditional Named Class

`class CreateUsersTable extends Migration` এর মতো নির্দিষ্ট নামের ক্লাস ব্যবহার করা সাধারণত Laravel মাইগ্রেশনে প্রচলিত পদ্ধতি। এই পদ্ধতিতে প্রতিটি মাইগ্রেশন ফাইলে একটি আলাদা ক্লাসের নাম থাকে, যা সেই মাইগ্রেশনের কাজ এবং টেবিলের উদ্দেশ্য বর্ণনা করে।

উদাহরণ:

```php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name');
            $table->string('email')->unique();
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('users');
    }
}
```

**এটির সুবিধা:**

- ক্লাসের নাম দেখে সহজেই বোঝা যায় যে এই মাইগ্রেশনটি কী কাজ করে।
- বড় প্রকল্পে বা টিম ওয়ার্কে মাইগ্রেশন ফাইল পরিচালনা করা সহজ হয়।

### 2. Anonymous Class (নামহীন ক্লাস)

Laravel 8 থেকে `return new class extends Migration` ব্যবহার করে নামহীন (Anonymous) ক্লাস সমর্থন করা হয়েছে। যখন কোনো মাইগ্রেশন ফাইলের নাম গুরুত্বপূর্ণ না এবং ডায়নামিক ভাবে মাইগ্রেশন তৈরি করতে চান, তখন এই পদ্ধতি ব্যবহার করা যায়। তবে এটি সাধারণত কম ব্যবহার করা হয়।

উদাহরণ:

```php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name');
            $table->string('email')->unique();
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('users');
    }
};
```

**এটির সুবিধা:**

- ছোট প্রকল্পে বা অস্থায়ী মাইগ্রেশনের জন্য এটি ব্যবহার করা যেতে পারে।
- নামহীন হওয়ার কারণে, ফাইলের ভেতরেই কনটেক্সট থাকে এবং প্রোজেক্টে নাম দ্বন্দ্বের সম্ভাবনা কমে।

### কোনটি ব্যবহার করবেন?

1. **বড় প্রকল্পে** বা যেখানে **মাইগ্রেশনের ক্লাসের নাম গুরুত্বপূর্ণ**, সেখানে `class CreateUsersTable extends Migration` এর মতো নির্দিষ্ট নামযুক্ত ক্লাস ব্যবহার করা উচিত।
2. ছোট বা ব্যক্তিগত প্রকল্পে, অথবা এমন ক্ষেত্রে যেখানে মাইগ্রেশন ফাইলের নাম খুব বেশি গুরুত্বপূর্ণ নয়, সেখানে `return new class extends Migration` ব্যবহার করতে পারেন।

Laravel ডিফল্টভাবে `php artisan make:migration` কমান্ড ব্যবহার করলে নির্দিষ্ট নামযুক্ত ক্লাস (Named Class) তৈরি করে, যা Laravel-এর স্ট্যান্ডার্ড পদ্ধতি।
আপনি `return new class extends Migration` ব্যবহার করে প্রতিটি মাইগ্রেশন ফাইল তৈরি করতে চাইছেন। এই স্ট্রাকচারে `class` সংজ্ঞায়িত করা হচ্ছে `return new class` ব্যবহার করে, যা PHP 7.0 এবং পরবর্তি সংস্করণে অ্যানোনিমাস ক্লাস হিসেবে পরিচিত। নিচে প্রতিটি টেবিলের মাইগ্রেশন ফাইলের কোড দেওয়া হলো:

### `users` টেবিলের মাইগ্রেশন

```php
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name');
            $table->string('email')->unique();
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('users');
    }
};
```

### `profiles` টেবিলের মাইগ্রেশন

```php
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('profiles', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('user_id');
            $table->string('bio')->nullable();
            $table->timestamps();

            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('profiles');
    }
};
```

### `posts` টেবিলের মাইগ্রেশন

```php
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('posts', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('user_id');
            $table->string('title');
            $table->text('content');
            $table->timestamps();

            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('posts');
    }
};
```

### `comments` টেবিলের মাইগ্রেশন

```php
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('comments', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('user_id');
            $table->unsignedBigInteger('post_id');
            $table->text('content');
            $table->timestamps();

            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('post_id')->references('id')->on('posts')->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('comments');
    }
};
```

### `tags` টেবিলের মাইগ্রেশন

```php
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('tags', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name')->unique();
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('tags');
    }
};
```

### `post_tags` পিভট টেবিলের মাইগ্রেশন

```php
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('post_tags', function (Blueprint $table) {
            $table->unsignedBigInteger('post_id');
            $table->unsignedBigInteger('tag_id');
            $table->timestamps();

            $table->foreign('post_id')->references('id')->on('posts')->onDelete('cascade');
            $table->foreign('tag_id')->references('id')->on('tags')->onDelete('cascade');

            $table->primary(['post_id', 'tag_id']);
        });
    }

    public function down()
    {
        Schema::dropIfExists('post_tags');
    }
};
```

এই মাইগ্রেশন ফাইলগুলো তৈরি করার পর, `php artisan migrate` কমান্ডটি চালিয়ে দেখুন। আশা করছি, এর ফলে আপনার ডাটাবেজের কাঠামোটি সঠিকভাবে তৈরি হবে।
