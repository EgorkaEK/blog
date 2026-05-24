<?php

return [
    'db' => [
        'host'     => getenv('DB_HOST')     ?: 'db',
        'port'     => getenv('DB_PORT')     ?: '3306',
        'name'     => getenv('DB_NAME')     ?: 'blog',
        'user'     => getenv('DB_USER')     ?: 'blog_user',
        'password' => getenv('DB_PASSWORD') ?: 'blog_password',
        'charset'  => 'utf8mb4',
    ],
    'smarty' => [
        'template_dir' => __DIR__ . '/../templates',
        'compile_dir'  => __DIR__ . '/../storage/smarty/compile',
        'cache_dir'    => __DIR__ . '/../storage/smarty/cache',
        'caching'      => false,
    ],
    'pagination' => [
        'per_page' => 6,
    ],
    'upload_dir' => __DIR__ . '/../public/images/uploads',
];
