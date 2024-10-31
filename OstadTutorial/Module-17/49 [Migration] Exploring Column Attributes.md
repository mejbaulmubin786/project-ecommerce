নিচে আপনার চিত্রের টেবিলটি টেক্সটে রূপান্তর করে দেওয়া হলো:

| Attribute              | Description                                                             | Example                                                     |
| ---------------------- | ----------------------------------------------------------------------- | ----------------------------------------------------------- |
| `nullable()`           | Accept null value                                                       | `$table->string('email')->nullable();`                      |
| `default($value)`      | Set default value if null                                               | `$table->string('email')->default($value);`                 |
| `useCurrent()`         | Set TIMESTAMP columns to use CURRENT_TIMESTAMP as default value         | `$table->timestamp('created_at')->useCurrent();`            |
| `useCurrentOnUpdate()` | Set TIMESTAMP columns to use CURRENT_TIMESTAMP when a record is updated | `$table->timestamp('updated_at')->useCurrentOnUpdate();`    |
| `collation()`          | Specify a collation for the column                                      | `$table->string('email')->collation('utf8mb4_unicode_ci');` |
| `charset()`            | Specify a character set for the column (MySQL)                          | `$table->string('email')->charset('utf8mb4');`              |
| `autoIncrement()`      | Set INTEGER columns as auto-incrementing (primary key)                  | `$table->increments('id')->autoIncrement();`                |
| `first()`              | Place the column "first" in the table (MySQL)                           | `$table->increments('id')->first();`                        |
| `invisible()`          | Make the column "invisible" to SELECT \* queries (MySQL)                | `$table->string('email')->invisible();`                     |
| `unsigned()`           | Set INTEGER columns as UNSIGNED (MySQL)                                 | `$table->integer('votes')->unsigned();`                     |
| `unique()`             | Ensure unique value                                                     | `$table->string('email')->unique();`                        |
| `change()`             | Allows you to modify the type and attributes of existing columns        | `$table->string('name', 50)->change();`                     |

### সংক্ষিপ্ত আলোচনা:

1. **`nullable()`**: এই মেথডটি ব্যবহার করে আমরা একটি কলামকে `null` মান গ্রহণ করার অনুমতি দিতে পারি। যদি একটি কলামে `nullable()` সেট করা থাকে, তবে সেই কলামে মান না থাকলেও তা গ্রহণযোগ্য হবে।

    উদাহরণ:

    ```php
    $table->string('email')->nullable();
    ```

    এর মাধ্যমে `email` কলামটি null মান গ্রহণ করতে পারবে।

2. **`default($value)`**: এই মেথডটি কলামের জন্য একটি ডিফল্ট মান সেট করে যদি সেই কলামে কোনো মান না দেওয়া হয়।

    উদাহরণ:

    ```php
    $table->string('email')->default('example@example.com');
    ```

3. **`useCurrent()`**: এটি টাইমস্ট্যাম্প কলামের জন্য `CURRENT_TIMESTAMP` কে ডিফল্ট মান হিসেবে ব্যবহার করে, অর্থাৎ যখন কোনো মান ইনসার্ট করা হবে তখন বর্তমান সময় সেট হবে।

    উদাহরণ:

    ```php
    $table->timestamp('created_at')->useCurrent();
    ```

4. **`useCurrentOnUpdate()`**: টাইমস্ট্যাম্প কলামের মান যখনই আপডেট হবে তখন বর্তমান সময় দিয়ে আপডেট হবে।

    উদাহরণ:

    ```php
    $table->timestamp('updated_at')->useCurrentOnUpdate();
    ```

5. **`collation()`**: এই মেথডটি ব্যবহার করে একটি কলামের জন্য বিশেষ `collation` সেট করা যায়, যা বিভিন্ন ভাষার বা চরিত্রের অর্ডারিং নিয়ন্ত্রণ করে।

    উদাহরণ:

    ```php
    $table->string('email')->collation('utf8mb4_unicode_ci');
    ```

6. **`charset()`**: এই মেথডটি ব্যবহার করে একটি কলামের জন্য নির্দিষ্ট ক্যারেক্টার সেট সেট করা যায়। যেমন UTF-8।

    উদাহরণ:

    ```php
    $table->string('email')->charset('utf8mb4');
    ```

7. **`autoIncrement()`**: এটি ব্যবহার করে একটি ইন্টিজার কলামকে স্বয়ংক্রিয়ভাবে ইনক্রিমেন্ট করা যায়, প্রাথমিক কী হিসেবে ব্যবহার করতে সুবিধাজনক।

    উদাহরণ:

    ```php
    $table->increments('id')->autoIncrement();
    ```

8. **`first()`**: এই মেথডটি কলামটিকে টেবিলের প্রথম কলাম হিসেবে রাখে (MySQL এর জন্য প্রযোজ্য)।

    উদাহরণ:

    ```php
    $table->increments('id')->first();
    ```

9. **`invisible()`**: এই মেথডটি কলামটিকে "অদৃশ্য" করে দেয় `SELECT *` কুয়েরিতে (MySQL এর জন্য প্রযোজ্য)।

    উদাহরণ:

    ```php
    $table->string('email')->invisible();
    ```

10. **`unsigned()`**: ইন্টিজার কলামকে `UNSIGNED` হিসাবে সেট করা হয়, যা নেতিবাচক মান গ্রহণ করতে পারে না (MySQL এর জন্য)।

    উদাহরণ:

    ```php
    $table->integer('votes')->unsigned();
    ```

11. **`unique()`**: এই মেথডটি কলামের মানকে ইউনিক (অদ্বিতীয়) রাখে, অর্থাৎ একই টেবিলে দুটি সারিতে একই মান থাকতে পারবে না।

    উদাহরণ:

    ```php
    $table->string('email')->unique();
    ```

12. **`change()`**: পূর্বে তৈরি করা একটি কলামের টাইপ বা এট্রিবিউট পরিবর্তন করতে ব্যবহৃত হয়।

    উদাহরণ:

    ```php
    $table->string('name', 50)->change();
    ```

### মাইগ্রেশন উদাহরণ:

```php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ModifyUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->string('email')->nullable(); // Email can be null
            $table->string('email')->default('example@example.com'); // Default email value
            $table->timestamp('created_at')->useCurrent(); // Current timestamp for created_at
            $table->timestamp('updated_at')->useCurrentOnUpdate(); // Update current timestamp when updated
            $table->string('email')->collation('utf8mb4_unicode_ci'); // Specific collation
            $table->string('email')->charset('utf8mb4'); // Specific charset
            $table->increments('id')->autoIncrement(); // Auto-incrementing primary key
            $table->increments('id')->first(); // Set id as first column
            $table->string('email')->invisible(); // Make email column invisible
            $table->integer('votes')->unsigned(); // Unsigned integer column for votes
            $table->string('email')->unique(); // Unique email column
            $table->string('name', 50)->change(); // Modify name column to have a length of 50
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            // Drop or reverse the changes made in the 'up' method
        });
    }
}
```

এটি একটি উদাহরণ, যেখানে Laravel এর মাইগ্রেশনের বিভিন্ন কলাম এট্রিবিউটগুলো ব্যবহার করা হয়েছে।
