<?php

declare(strict_types=1);

namespace App\Controllers;

use App\Core\View;
use App\Models\Category;

class CategoryController
{
    public function show(string $slug): void
    {
        $categoryModel = new Category();
        $category      = $categoryModel->findBySlug($slug);

        if (!$category) {
            http_response_code(404);
            $view = new View();
            $view->render('pages/404.tpl', ['title' => '404 – Category Not Found']);
            return;
        }

        $config  = require __DIR__ . '/../config.php';
        $perPage = (int) $config['pagination']['per_page'];

        $sort    = in_array($_GET['sort'] ?? '', ['views', 'date'], true)
                   ? ($_GET['sort'])
                   : 'date';
        $page    = max(1, (int) ($_GET['page'] ?? 1));

        $total    = $categoryModel->countArticles((int) $category['id']);
        $articles = $categoryModel->getArticles((int) $category['id'], $page, $perPage, $sort);
        $lastPage = (int) ceil($total / $perPage);

        $view = new View();
        $view->render('pages/category.tpl', [
            'title'    => $category['title'] . ' – Blog',
            'category' => $category,
            'articles' => $articles,
            'sort'     => $sort,
            'page'     => $page,
            'lastPage' => $lastPage,
            'total'    => $total,
        ]);
    }
}
