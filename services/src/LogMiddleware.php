<?php

class LogMiddleware
{
	private $container;

    public function __construct($container) {
        $this->container = $container;
    }

    public function __invoke ($request, $response, $next)
    {
        // add logging of response here, after call to $next
        $uri = $request->getUri();
    	$path = $uri->getPath();
    	$ipAddress = $request->getAttribute('ip_address');
    	$userAgent = $request->getHeader('HTTP_USER_AGENT');

    	
        $response = $next($request, $response);
        return $response;
    }
}
