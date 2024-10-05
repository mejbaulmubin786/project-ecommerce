এবার আমরা home পেইজে কম্পেনেন্ট এড করবো।

### ধাপ ১: component ফোল্ডার তৈরি করা

এর জন্য প্রথমে, resources/views ডিরেক্টরির মধ্যে একটি component নামের ফোল্ডার তৈরি করতে হবে, যেখানে বিভিন্ন কম্পোনেন্টের জন্য Blade ফাইল তৈরি করা হবে।

তাতে কিচু ফাইল তৈরি করে নিলাম্ যেমন hero.blade.php, howWeDo.blade.php, pricing.blade.php, team.blade.php

প্রথমে, `resources/views` ডিরেক্টরির মধ্যে একটি `component` নামের ফোল্ডার তৈরি করতে হবে, যেখানে বিভিন্ন কম্পোনেন্টের জন্য Blade ফাইল তৈরি করা হবে।

```bash
resources/views/component
```

### ধাপ ২: কম্পোনেন্টের জন্য Blade ফাইল তৈরি করা

এখন আমরা চারটি নতুন Blade ফাইল তৈরি করবো, যেগুলো হোম পেইজের বিভিন্ন অংশের জন্য আলাদা আলাদা কম্পোনেন্ট হিসেবে কাজ করবে। এই Blade ফাইলগুলো `component` ফোল্ডারের ভিতরে থাকবে।

1. **Hero Section (hero.blade.php):**
   প্রথমেই `hero.blade.php` ফাইল তৈরি করুন, যা হোম পেজের হিরো সেকশন তৈরি করবে। এটি সাধারণত পেজের উপরের অংশে একটি বড় হেডলাইন এবং একটি ব্যাকগ্রাউন্ড ইমেজ থাকবে।

```bash
resources/views/component/hero.blade.php
```

```blade
<section class="pb-5 bg-light"><div class="container pt-5">
    <div class="row align-items-center mb-5">
      <div class="col-12 col-md-10 col-lg-5 mb-5 mb-lg-0">
        <h2 class="display-4 fw-bold mb-5">Take care of your performance every day.</h2>
        <p class="lead text-muted mb-5">Build a well-presented brand that everyone will love. Take care to develop resources continually and integrity them with previous projects.</p>
        <div class="d-flex flex-wrap"><a class="btn btn-primary me-2 mb-2 mb-sm-0" href="#">Track your performance</a><a class="btn btn-outline-secondary mb-2 mb-sm-0" href="#">Learn more</a></div>
      </div>
      <div class="col-12 col-lg-6 offset-lg-1">
        <img class="img-fluid" src="bootstrap5-plain-assets/images/blue-400-square.png" alt=""></div>
    </div>
    <div class="text-center d-none d-lg-block">
      <button class="btn border rounded-circle" style="width: 56px;height: 56px">
        <svg class="text-muted mx-auto" xmlns="http://www.w3.org/2000/svg" fill="none" viewbox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path></svg></button>
    </div>
  </div>
</section>
```

2. **How We Do (howWeDo.blade.php):**
   `howWeDo.blade.php` কম্পোনেন্টে আপনি আপনার সেবাগুলোর কার্যক্রম এবং কর্মপ্রণালী তুলে ধরতে পারেন।

```bash
resources/views/component/howWeDo.blade.php
```

```blade
<section class="py-5">
    <div class="container">
      <div class="row align-items-center justify-content-center">
        <div class="col-12 col-md-9 col-lg-6 col-xl-5">
          <div class="mx-auto mb-5">
            <span class="text-muted">Lorem ipsum</span>
            <h2 class="display-5 fw-bold mt-2 mb-4">Lorem ipsum dolor sit amet consectutar domor at elis</h2>
            <p class="lead text-muted mb-4">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque massa nibh, pulvinar vitae aliquet nec, accumsan aliquet orci.</p>
            <a class="btn btn-primary d-inline-block" href="#">Action</a>
          </div>
        </div>
        <div class="col-12 col-md-9 col-lg-6 col-xl-5 offset-xl-2">
          <div class="px-4 py-5 px-lg-5 bg-light rounded mx-auto">
            <div class="d-flex mb-5">
              <span class="d-flex flex-shrink-0 me-3 me-lg-5 justify-content-center align-items-center rounded-circle bg-primary text-white" style="width: 48px;height: 48px">1</span>
              <div>
                <p class="lead text-muted">Etiam pellentesque non nibh non pulvinar. Mauris posuere, tellus sit amet tempus vestibulum.</p>
              </div>
            </div>
            <div class="d-flex mb-5">
              <span class="d-flex flex-shrink-0 me-3 me-lg-5 justify-content-center align-items-center rounded-circle bg-primary text-white" style="width: 48px;height: 48px">2</span>
              <div>
                <p class="lead text-muted">Etiam pellentesque non nibh non pulvinar. Mauris posuere, tellus sit amet tempus vestibulum.</p>
              </div>
            </div>
            <div class="d-flex">
              <span class="d-flex flex-shrink-0 me-3 me-lg-5 justify-content-center align-items-center rounded-circle bg-primary text-white" style="width: 48px;height: 48px">3</span>
              <div>
                <p class="lead text-muted">Etiam pellentesque non nibh non pulvinar. Mauris posuere, tellus sit amet tempus vestibulum.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

```

3. **Pricing Section (pricing.blade.php):**
   এই Blade ফাইলটি আপনার সেবার প্রাইসিং প্ল্যানগুলো দেখাবে।

```bash
resources/views/component/pricing.blade.php
```

```blade
<section class="py-5 bg-light">
    <div class="container">
      <div class="col-12 col-lg-8 col-xxl-7 text-center mx-auto mb-5">
        <span class="text-muted">Lorem ipsum</span>
        <h2 class="display-5 fw-bold mt-2 mb-3">Lorem ipsum dolor sit amet consectutar domor at elis</h2>
        <p class="lead text-muted mb-5">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque massa nibh, pulvinar vitae aliquet nec, accumsan aliquet orci.</p>
        <ul class="nav nav-pills justify-content-center">
          <li class="nav-item"><a class="nav-link active" href="#">Monthly</a></li>
          <li class="nav-item"><a class="nav-link" href="#">Yearly</a></li>
        </ul>
      </div>
      <div class="row align-items-center justify-content-center">
        <div class="col-12 col-md-8 col-xl-4 mb-5 mb-xl-0">
          <div class="p-3 p-md-5 bg-light rounded text-center">
            <h4 class="text-muted">Starter</h4>
            <span class="d-inline-block display-4 fw-bold mb-5">$34,99</span>
            <ul class="mb-5">
              <li class="d-flex align-items-center mb-3">
                <svg class="text-muted me-2" xmlns="http://www.w3.org/2000/svg" fill="none" viewbox="0 0 24 24" stroke="currentColor" style="width: 24px;height: 24px">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                </svg>
                <p class="mb-0">Complete documentation</p>
              </li>
              <li class="d-flex align-items-center mb-3">
                <svg class="text-muted me-2" xmlns="http://www.w3.org/2000/svg" fill="none" viewbox="0 0 24 24" stroke="currentColor" style="width: 24px;height: 24px">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                </svg>
                <p class="mb-0">Working materials in Figma</p>
              </li>
              <li class="d-flex align-items-center mb-3">
                <svg class="text-muted me-2" xmlns="http://www.w3.org/2000/svg" fill="none" viewbox="0 0 24 24" stroke="currentColor" style="width: 24px;height: 24px">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                </svg>
                <p class="mb-0">100GB cloud storage</p>
              </li>
              <li class="d-flex align-items-center mb-3">
                <svg class="text-muted me-2" xmlns="http://www.w3.org/2000/svg" fill="none" viewbox="0 0 24 24" stroke="currentColor" style="width: 24px;height: 24px">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                </svg>
                <p class="mb-0">500 team members</p>
              </li>
            </ul>
            <a class="btn btn-primary w-100" href="#">Action</a>
          </div>
        </div>
        <div class="col-12 col-md-8 col-xl-4 mb-5 mb-xl-0">
          <div class="p-3 p-md-5 bg-primary rounded text-center">
            <h4 class="text-white">Pro</h4>
            <span class="d-inline-block display-4 fw-bold text-white mb-5">$65,99</span>
            <ul class="mb-5">
              <li class="d-flex align-items-center mb-3">
                <svg class="text-info me-2" xmlns="http://www.w3.org/2000/svg" fill="none" viewbox="0 0 24 24" stroke="currentColor" style="width: 24px;height: 24px">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                </svg>
                <p class="mb-0 text-white">Complete documentation</p>
              </li>
              <li class="d-flex align-items-center mb-3">
                <svg class="text-info me-2" xmlns="http://www.w3.org/2000/svg" fill="none" viewbox="0 0 24 24" stroke="currentColor" style="width: 24px;height: 24px">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                </svg>
                <p class="mb-0 text-white">Working materials in Figma</p>
              </li>
              <li class="d-flex align-items-center mb-3">
                <svg class="text-info me-2" xmlns="http://www.w3.org/2000/svg" fill="none" viewbox="0 0 24 24" stroke="currentColor" style="width: 24px;height: 24px">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                </svg>
                <p class="mb-0 text-white">100GB cloud storage</p>
              </li>
              <li class="d-flex align-items-center mb-3">
                <svg class="text-info me-2" xmlns="http://www.w3.org/2000/svg" fill="none" viewbox="0 0 24 24" stroke="currentColor" style="width: 24px;height: 24px">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                </svg>
                <p class="mb-0 text-white">500 team members</p>
              </li>
              <li class="d-flex align-items-center mb-3">
                <svg class="text-info me-2" xmlns="http://www.w3.org/2000/svg" fill="none" viewbox="0 0 24 24" stroke="currentColor" style="width: 24px;height: 24px">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                </svg>
                <p class="mb-0 text-white">Premium support</p>
              </li>
            </ul>
            <a class="btn btn-light w-100 text-center" href="#">Action</a>
          </div>
        </div>
        <div class="col-12 col-md-8 col-xl-4">
          <div class="p-3 p-md-5 bg-light rounded text-center">
            <h4 class="text-muted">Premium</h4>
            <span class="d-inline-block display-4 fw-bold mb-5">$99,99</span>
            <ul class="mb-5">
              <li class="d-flex align-items-center mb-3">
                <svg class="text-muted me-2" xmlns="http://www.w3.org/2000/svg" fill="none" viewbox="0 0 24 24" stroke="currentColor" style="width: 24px;height: 24px">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                </svg>
                <p class="mb-0">Complete documentation</p>
              </li>
              <li class="d-flex align-items-center mb-3">
                <svg class="text-muted me-2" xmlns="http://www.w3.org/2000/svg" fill="none" viewbox="0 0 24 24" stroke="currentColor" style="width: 24px;height: 24px">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                </svg>
                <p class="mb-0">Working materials in Figma</p>
              </li>
              <li class="d-flex align-items-center mb-3">
                <svg class="text-muted me-2" xmlns="http://www.w3.org/2000/svg" fill="none" viewbox="0 0 24 24" stroke="currentColor" style="width: 24px;height: 24px">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                </svg>
                <p class="mb-0">100GB cloud storage</p>
              </li>
              <li class="d-flex align-items-center mb-3">
                <svg class="text-muted me-2" xmlns="http://www.w3.org/2000/svg" fill="none" viewbox="0 0 24 24" stroke="currentColor" style="width: 24px;height: 24px">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                </svg>
                <p class="mb-0">500 team members</p>
              </li>
            </ul>
            <a class="btn btn-primary w-100 text-center" href="#">Action</a>
          </div>
        </div>
      </div>
    </div>
  </section>

```

4. **Team Section (team.blade.php):**
   এখানে আপনি আপনার টিমের সদস্যদের ছবি এবং বায়ো তুলে ধরতে পারবেন।

```bash
resources/views/component/team.blade.php
```

```blade
<section class="py-5">
    <div class="container">
      <div class="row">
        <div class="col-12 col-lg-8 mx-auto text-center mb-5">
          <span class="text-muted">Lorem Ipsum</span>
          <h2 class="display-5 fw-bold mt-2 mb-3">Lorem ipsum dolor sit amet consectutar domor at elis</h2>
          <p class="lead text-muted">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque massa nibh, pulvinar vitae aliquet nec, accumsan aliquet orci.</p>
        </div>
      </div>
      <div class="row">
        <div class="col-12 col-md-6 col-lg-4 mb-4">
          <div class="d-flex justify-content-center align-items-center py-5 bg-light rounded">
            <div class="text-center">
              <img class="mx-auto mb-5 img-fluid" src="bootstrap5-plain-assets/images/blue-400-avatar.png" alt="" style="width: 80px;height: 80px">
              <h4 class="fw-bold">Danny Bailey</h4>
              <p class="text-muted">CEO &amp; Founder</p>
            </div>
          </div>
        </div>
        <div class="col-12 col-md-6 col-lg-4 mb-4">
          <div class="d-flex justify-content-center align-items-center py-5 bg-light rounded">
            <div class="text-center">
              <img class="mx-auto mb-5 img-fluid" src="bootstrap5-plain-assets/images/blue-400-avatar.png" alt="" style="width: 80px;height: 80px">
              <h4 class="fw-bold">Danny Bailey</h4>
              <p class="text-muted">CEO &amp; Founder</p>
            </div>
          </div>
        </div>
        <div class="col-12 col-md-6 col-lg-4 mb-4">
          <div class="d-flex justify-content-center align-items-center py-5 bg-light rounded">
            <div class="text-center">
              <img class="mx-auto mb-5 img-fluid" src="bootstrap5-plain-assets/images/blue-400-avatar.png" alt="" style="width: 80px;height: 80px">
              <h4 class="fw-bold">Danny Bailey</h4>
              <p class="text-muted">CEO &amp; Founder</p>
            </div>
          </div>
        </div>
        <div class="col-12 col-md-6 col-lg-4 mb-4 mb-lg-0">
          <div class="d-flex justify-content-center align-items-center py-5 bg-light rounded">
            <div class="text-center">
              <img class="mx-auto mb-5 img-fluid" src="bootstrap5-plain-assets/images/blue-400-avatar.png" alt="" style="width: 80px;height: 80px">
              <h4 class="fw-bold">Danny Bailey</h4>
              <p class="text-muted">CEO &amp; Founder</p>
            </div>
          </div>
        </div>
        <div class="col-12 col-md-6 col-lg-4 mb-4 mb-md-0">
          <div class="d-flex justify-content-center align-items-center py-5 bg-light rounded">
            <div class="text-center">
              <img class="mx-auto mb-5 img-fluid" src="bootstrap5-plain-assets/images/blue-400-avatar.png" alt="" style="width: 80px;height: 80px">
              <h4 class="fw-bold">Danny Bailey</h4>
              <p class="text-muted">CEO &amp; Founder</p>
            </div>
          </div>
        </div>
        <div class="col-12 col-md-6 col-lg-4">
          <div class="d-flex justify-content-center align-items-center py-5 bg-light rounded">
            <div class="text-center">
              <img class="mx-auto mb-5 img-fluid" src="bootstrap5-plain-assets/images/blue-400-avatar.png" alt="" style="width: 80px;height: 80px">
              <h4 class="fw-bold">Danny Bailey</h4>
              <p class="text-muted">CEO &amp; Founder</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

```

5. **News Letter Section (newsletter.blade.php):**
   এখানে আপনি আপনার টিমের সদস্যদের ছবি এবং বায়ো তুলে ধরতে পারবেন।

```bash
resources/views/component/team.blade.php
```

```blade
<section class="py-5 bg-light">
    <div class="container text-center">
      <div class="row justify-content-center">
        <div class="col-12 col-lg-10 col-xl-8">
          <span class="d-flex justify-content-center align-items-center mb-3 mx-auto rounded-circle bg-primary text-white" style="width: 56px;height: 56px">
            <svg width="32" height="32" viewbox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M18.1332 14.5333C18.2665 14.6667 18.3998 14.6667 18.6665 14.6667H27.9998C28.7998 14.6667 29.3332 14.1333 29.3332 13.3333C29.3332 13.0667 29.3332 12.9333 29.1998 12.8L24.5332 3.46667C24.1332 2.8 23.3332 2.53334 22.6665 2.93334C22.5332 3.06667 22.2665 3.2 22.1332 3.46667L17.4665 12.8C17.1998 13.3333 17.4665 14.1333 18.1332 14.5333ZM23.3332 6.93334L25.8665 12H20.7998L23.3332 6.93334ZM8.6665 2.66667C5.33317 2.66667 2.6665 5.33334 2.6665 8.66667C2.6665 12 5.33317 14.6667 8.6665 14.6667C11.9998 14.6667 14.6665 12 14.6665 8.66667C14.6665 5.33334 11.9998 2.66667 8.6665 2.66667ZM8.6665 12C6.79984 12 5.33317 10.5333 5.33317 8.66667C5.33317 6.80001 6.79984 5.33334 8.6665 5.33334C10.5332 5.33334 11.9998 6.80001 11.9998 8.66667C11.9998 10.5333 10.5332 12 8.6665 12ZM14.2665 17.7333C13.7332 17.2 12.9332 17.2 12.3998 17.7333L8.6665 21.4667L4.93317 17.7333C4.39984 17.2 3.59984 17.2 3.0665 17.7333C2.53317 18.2667 2.53317 19.0667 3.0665 19.6L6.79984 23.3333L3.0665 27.0667C2.53317 27.6 2.53317 28.4 3.0665 28.9333C3.59984 29.4667 4.39984 29.4667 4.93317 28.9333L8.6665 25.2L12.3998 28.9333C12.9332 29.4667 13.7332 29.4667 14.2665 28.9333C14.7998 28.4 14.7998 27.6 14.2665 27.0667L10.5332 23.3333L14.2665 19.6C14.7998 19.0667 14.7998 18.2667 14.2665 17.7333ZM27.9998 17.3333H18.6665C17.8665 17.3333 17.3332 17.8667 17.3332 18.6667V28C17.3332 28.8 17.8665 29.3333 18.6665 29.3333H27.9998C28.7998 29.3333 29.3332 28.8 29.3332 28V18.6667C29.3332 17.8667 28.7998 17.3333 27.9998 17.3333ZM26.6665 26.6667H19.9998V20H26.6665V26.6667Z" fill="CurrentColor"></path>
            </svg>
          </span>
          <span class="text-muted">Lorem ipsum</span>
          <h2 class="display-4 fw-bold mt-2 mb-3">Lorem ipsum dolor sit amet consectutar domor at elis</h2>
          <p class="lead text-muted mb-5">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque massa nibh, pulvinar vitae aliquet nec, accumsan aliquet orci.</p>
          <form action="#">
            <div class="row justify-content-center">
              <div class="col-12 col-md-8 col-lg-5 mb-3 mb-lg-0">
                <input class="form-control" type="e-mail" placeholder="Type your e-mail">
              </div>
              <div class="col-12 col-md-8 col-lg-5 mb-3 mb-lg-0">
                <input class="form-control" type="name" placeholder="Your name">
              </div>
              <div class="col-12 col-md-8 col-lg-2">
                <button class="btn btn-primary w-100">Action</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </section>

```

### ধাপ ৩: হোম পেজে কম্পোনেন্ট যুক্ত করা

এখন আমরা `resources/views/home.blade.php` ফাইলে এই কম্পোনেন্টগুলো ইনক্লুড করবো। `@include` Blade ডিরেক্টিভ ব্যবহার করে এগুলোকে যুক্ত করা হবে:

```bash
resources/views/home.blade.php
```

```blade
@extends('layouts.app')

@section('content')

    {{-- Hero Section --}}
    @include('component.hero')

    {{-- How We Do Section --}}
    @include('component.howWeDo')

    {{-- Pricing Section --}}
    @include('component.pricing')

    {{-- Team Section --}}
    @include('component.team')

@endsection
```

### ধাপ 4: Laravel সেভার রান করা

সবকিছু ঠিকঠাক ইনস্টল এবং কনফিগার হয়ে গেলে, Laravel সেভার চালু করে আউটপুট দেখুন:

```bash
php artisan serve
```

এখন ব্রাউজারে গিয়ে `http://localhost:8000` এ গিয়ে আপনার হোম পেজে যুক্ত করা কম্পোনেন্টগুলো দেখতে পারবেন।
