<?php

declare(strict_types=1);

namespace App\Controllers;

use App\Core\View;
use App\Models\Category;

class HomeController
{
    public function index(): void
    {
        $categoryModel = new Category();
        $categories    = $categoryModel->getAllWithLatestArticles();

        $view = new View();
        $view->render('pages/home.tpl', [
            'title'      => 'Blog – Home',
            'categories' => $categories,
        ]);
    }
}
