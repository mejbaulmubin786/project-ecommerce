এবার আমরা শিখবো মাস্টার লেআউট সম্পর্কে । আমরা যখন একটি ওয়েব পেইজ বা ওয়েব এপ্লিকেশন তৈরি করবো তার যে মেইন লেআউট টা আমরা একবারি তৈরি করবো তার পর সেই লেআউট কে আমরা বার বার এক্সটেন্ড করবো। ধরুন Layout.blade.php যদি আমর মেইন লেআউট হয় তবে প্রতিটি পেইজে আমর যা কমন বিষয় থাকবে সেগুলোকে এখানে রেখে দিতে পারি । যেমন হেডার ফুটার, সিএসএস ফাইল জাভাস্ক্রিপ্ট ফাইল এর পর আমরা যে কোন পেইজে সেটিকে @extends ডিরেকটিভ দিয়ে দিবো তবে সেই পেইজ টি মেইন ফাইলের সকল বৈশিষ্ট সাথে সাথে পেয়ে যাবে।

```php
//app.blade.php
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Page title</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="{{ asset('css/bootstrap/bootstrap.min.css') }}">
    <link rel="icon" type="image/png" sizes="32x32" href="shuffle-for-bootstrap.png">
</head>
<body>
    @include('Layout.header')

    @include('Layout.footer')
    <script src="{{ asset('js/bootstrap/bootstrap.bundle.min.js') }}"></script>
</body>

//footer.blade.php
<footer class="py-5">
    <div class="container text-center pb-5 border-bottom">
      <a class="d-inline-block mx-auto mb-4" href="#">
        <img class="img-fluid" src="bootstrap5-plain-assets/logos/plainb-logo.svg" alt="" width="96px">
      </a>
      <ul class="d-flex flex-wrap justify-content-center align-items-center list-unstyled mb-4">
        <li><a class="link-secondary me-4" href="#">About</a></li>
        <li><a class="link-secondary me-4" href="#">Company</a></li>
        <li><a class="link-secondary me-4" href="#">Services</a></li>
        <li><a class="link-secondary" href="#">Testimonials</a></li>
      </ul>
      <div>
        <a class="d-inline-block me-4" href="#">
          <img src="bootstrap5-plain-assets/socials/facebook.svg">
        </a>
        <a class="d-inline-block me-4" href="#">
          <img src="bootstrap5-plain-assets/socials/twitter.svg">
        </a>
        <a class="d-inline-block me-4" href="#">
          <img src="bootstrap5-plain-assets/socials/github.svg">
        </a>
        <a class="d-inline-block me-4" href="#">
          <img src="bootstrap5-plain-assets/socials/instagram.svg">
        </a>
        <a class="d-inline-block" href="#">
          <img src="bootstrap5-plain-assets/socials/linkedin.svg">
        </a>
      </div>
    </div>
    <div class="mb-5"></div>
    <div class="container">
      <p class="text-center">All rights reserved © Wireframes Corporation 2021</p>
    </div>
  </footer>

//header.blade.php
<nav class="navbar navbar-expand-lg navbar-light py-4 shadow-sm">
    <div class="container">
      <a class="navbar-brand" href="#">
        <img class="img-fluid" src="bootstrap5-plain-assets/logos/plainb-logo.svg" alt="" width="96px">
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#nav06" aria-controls="nav06" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="nav06">
        <ul class="navbar-nav mt-3 mt-lg-0 mb-3 mb-lg-0 ms-lg-3">
          <li class="nav-item me-4"><a class="nav-link" href="#">About</a></li>
          <li class="nav-item me-4"><a class="nav-link" href="#">Company</a></li>
          <li class="nav-item me-4"><a class="nav-link" href="#">Services</a></li>
          <li class="nav-item"><a class="nav-link" href="#">Testimonials</a></li>
        </ul>
      </div>
      <div class="d-none d-lg-flex" action="">
        <div class="input-group">
          <input class="form-control" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-secondary" type="submit">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewbox="0 0 24 24" stroke="currentColor" style="width: 24px;height: 24px">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
            </svg>
          </button>
        </div>
      </div>
    </div>
  </nav>

//home.blade.php

@extends('Layout.app')

```

@extends('Layout.app') করার সাথে সাতে এই পেইজটি সকলি কিছু এড হয়ে যাবে । এখন এই পেইজ ছাড়াও তো আমাদের অনেক কিছু থাকেবে। এর জন্য আমরা যে মেইন বা মাস্টার লেআউট তৈরি করেছি সেগুলোকে পাস করাবো। এর জন্য আমরা মেইন পেইজে @yield যুক্ত করবো এর মাধমে আমরা চাইল লে আউটের ভিউ ইনজেক্ট করতে পারবো । এর জন্য সাব পেইজে @section('content')

@endsection
এতে আমি সেকশনের জায়গায় যা লিখবো সবি @yield এর জায়গায় এসে বসবে।
