এবার আমরা শিখবো কি করে টেবিল রিনেইম করতে হয় এবং টেবিল ড্রপ করতে হয়। আমরা সবসময় নেমিং কনভেনশন ফলো করেই মাইগ্রেশন ফাইল জেনারেইট করবো। যেমন `_rename_profiles.php` drop

```php

public function up():void{
    schema::rename("profile", "user_profile");
}
```
