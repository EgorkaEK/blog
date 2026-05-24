<?php

declare(strict_types=1);

namespace App\Controllers;

use App\Core\View;
use App\Models\Article;

class ArticleController
{
    public function show(string $slug): void
    {
        $articleModel = new Article();
        $article      = $articleModel->findBySlug($slug);

        if (!$article) {
            http_response_code(404);
            $view = new View();
            $view->render('pages/404.tpl', ['title' => '404 – Article Not Found']);
            return;
        }

        $related = $articleModel->getRelated((int) $article['id']);

        $view = new View();
        $view->render('pages/article.tpl', [
            'title'   => $article['title'] . ' – Blog',
            'article' => $article,
            'related' => $related,
        ]);
    }
}
