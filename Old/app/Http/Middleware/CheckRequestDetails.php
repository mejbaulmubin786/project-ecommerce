<?php
namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class CheckRequestDetails {

    public function handle(Request $request, Closure $next): Response {
        $request->headers->add(['email' => 'uopeople@uopeople.com']);
        return $next($request);

    }
}
