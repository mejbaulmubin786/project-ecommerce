এবার আমাদের আলোচনার বিষয় হচ্ছে union এটি এমন একটি মেথড

```php
function DemoAction() {
    $query = DB::table('products')->where('price', '>', 2000);
    $otherQuery = DB::table('products')->where('category_id', '=', 3)->union($query)->get();
    return $otherQuery;
}
```
