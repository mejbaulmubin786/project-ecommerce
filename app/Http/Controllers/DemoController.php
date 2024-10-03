<?php

namespace App\Http\Controllers;

class DemoController extends Controller {

    function DemoAction1() {

        return "Hello1";

    }

    function DemoAction2() {

        return "Hello2";
    }

}

/*

class DemoController extends Controller {
function DemoAction($name) {

return "$name";

}
}
 */

/*

<?php
namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class CheckRequestDetails {

public function handle(Request $request, Closure $next): Response {
$key = $request->key;

if ($key == "123") {
return $next($request);
} else {
return redirect('hello2');
}
}
}
 */
