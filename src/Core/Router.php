<?php

declare(strict_types=1);

namespace App\Core;

class Router
{
    private array $routes = [];

    public function get(string $pattern, callable|array $handler): void
    {
        $this->routes[] = [
            'method'  => 'GET',
            'pattern' => $pattern,
            'handler' => $handler,
        ];
    }

    public function dispatch(string $method, string $uri): void
    {
        // Strip query string
        $path = strtok($uri, '?') ?: '/';
        $path = rtrim($path, '/') ?: '/';

        foreach ($this->routes as $route) {
            if ($route['method'] !== strtoupper($method)) {
                continue;
            }

            $params = $this->match($route['pattern'], $path);

            if ($params !== null) {
                [$class, $action] = $route['handler'];
                $controller = new $class();
                $controller->$action(...array_values($params));
                return;
            }
        }

        http_response_code(404);
        $view = new View();
        $view->render('pages/404.tpl', ['title' => '404 – Page Not Found']);
    }

    private function match(string $pattern, string $path): ?array
    {
        // Convert :param placeholders to named capture groups
        $regex = preg_replace('#:([a-zA-Z_]+)#', '(?P<$1>[^/]+)', $pattern);
        $regex = '#^' . $regex . '$#';

        if (!preg_match($regex, $path, $matches)) {
            return null;
        }

        // Return only named captures
        return array_filter($matches, fn($k) => is_string($k), ARRAY_FILTER_USE_KEY);
    }
}
