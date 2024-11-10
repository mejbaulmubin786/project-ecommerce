```php
<?php
//Indexed Arrays
$fruits1=array("apple", "banana", "cherry");
$fruits2=["apple", "banana", "cherry"];
print_r($fruits1[1]);


//How to loop over Indexed Arrays
$app=['Android','IOS','Windows','Linux'];
foreach($app as $item){
    echo $item."<br/>";
}
// Associative arrays
$bilGates=[
    "firstName"=>"Bill",
    "lastName"=>"Gates",
    "age"=>"65",
    "gender"=>"male",
    "email"=>"gates@gmail.com",
    "phone"=>"0123456789",
];
print_r($bilGates['phone']);


// How to loop over Associative arrays
$bilGates=[
    "firstName"=>"Bill",
    "lastName"=>"Gates",
    "age"=>"65",
    "gender"=>"male",
    "email"=>"gates@gmail.com",
    "phone"=>"0123456789",
];
foreach ($bilGates as $key=>$value){
    echo $key.":".$value."<br>";
}




// Multidimensional indexed arrays

$fruits1=["apple1", "banana1", "cherry1"];
$fruits2=["apple2", "banana2", "cherry2"];
$fruits3=["apple3", "banana3", "cherry3"];
$fruits4=["apple4", "banana4", "cherry4"];
$All_fruits=[$fruits1, $fruits2, $fruits3, $fruits4];
print_r($All_fruits[1][2]);


//How to loop over Multidimensional indexed arrays
$fruits1=["apple1", "banana1", "cherry1"];
$fruits2=["apple2", "banana2", "cherry2"];
$fruits3=["apple3", "banana3", "cherry3"];
$fruits4=["apple4", "banana4", "cherry4"];
$All_fruits=[$fruits1, $fruits2, $fruits3, $fruits4];

foreach ($All_fruits as $ParentItem){
    foreach ($ParentItem as $ChildItem){
        echo $ChildItem."<br/>";
    }
}


// Multidimensional Associative arrays
$person1=[
    "firstName"=>"person1",
    "lastName"=>"Gates1",
    "age"=>"65",
    "gender"=>"male",
    "email"=>"gates1@gmail.com",
    "phone"=>"0123456789",
];

$person2=[
    "firstName"=>"person2",
    "lastName"=>"Gates2",
    "age"=>"65",
    "gender"=>"male",
    "email"=>"gates1@gmail.com",
    "phone"=>"0123456789",
];

$person3=[
    "firstName"=>"person3",
    "lastName"=>"Gates3",
    "age"=>"65",
    "gender"=>"male",
    "email"=>"gates1@gmail.com",
    "phone"=>"0123456789",
];


$All_Person=[$person1,$person2,$person3];
print_r($All_Person[2]['lastName']);


// How to loop over Multidimensional Associative arrays
$person1=[
    "firstName"=>"person1",
    "lastName"=>"Gates1",
    "age"=>"65",
    "gender"=>"male",
    "email"=>"gates1@gmail.com",
    "phone"=>"0123456789",
];

$person2=[
    "firstName"=>"person2",
    "lastName"=>"Gates2",
    "age"=>"65",
    "gender"=>"male",
    "email"=>"gates1@gmail.com",
    "phone"=>"0123456789",
];

$person3=[
    "firstName"=>"person3",
    "lastName"=>"Gates3",
    "age"=>"65",
    "gender"=>"male",
    "email"=>"gates1@gmail.com",
    "phone"=>"0123456789",
];

$All_Person=[
    'one'=>$person1,
    'two'=>$person2,
    'three'=>$person3
];


foreach ($All_Person as $ParentKey=>$ParentValue) {

    foreach ($ParentValue as $ChildKey=>$ChildValue) {
            echo $ChildKey.": ".$ChildValue."<br>";
    }
}

```
**part-2:**
```php
<?php


$bilGates=[
    "firstName"=>"Bill",
    "lastName"=>"Gates",
    "age"=>"65",
    "gender"=>"male",
    "email"=>"gates@gmail.com",
    "phone"=>"0123456789",
];

$values=array_values($bilGates);
$keys=array_keys($bilGates);
$isExits=array_key_exists("firstName",$bilGates);
$searchValue=array_search('Gates',$bilGates);
$flippedArray=array_flip($bilGates);

$assortArray=asort($bilGates);


print_r($assortArray);
```
part-3:
```php
<?php
$fruits=array("apple", "banana", "cherry");
$count=count($fruits);
$size=sizeof($fruits);


$numbers = array(1, 2, 3, 4, 5);
$arraySum = array_sum($numbers);
$arrayProduct= array_product($numbers);



$numbers1 = array(1, 2, 3, 4, 5);
$numbers2 = array(6, 7, 8, 9, 10);
$merged=array_merge($numbers1,$numbers2);



$city=["Dhaka","Khulna","Rajshahi","Barisal"];
$replacement=[0=>"Cox-Bazar",2=>"Sahara Desert"];
$replaced =array_replace($city,$replacement);


$input = ["a", "b", "a", "c", "d", "b"];
$result = array_unique($input);
$result = array_reverse($result);
print_r($result);
```


