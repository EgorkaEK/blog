<?php

declare(strict_types=1);

namespace App\Models;

use App\Core\Database;
use PDO;

class Article
{
    private PDO $db;

    public function __construct()
    {
        $this->db = Database::getInstance();
    }

    /**
     * Find a single article by slug and increment its view counter.
     */
    public function findBySlug(string $slug): ?array
    {
        $stmt = $this->db->prepare(
            'SELECT * FROM articles WHERE slug = :slug LIMIT 1'
        );
        $stmt->execute([':slug' => $slug]);
        $article = $stmt->fetch();

        if (!$article) {
            return null;
        }

        $this->incrementViews((int) $article['id']);
        $article['views']++;

        $article['categories'] = $this->getCategoriesForArticle((int) $article['id']);

        return $article;
    }

    /**
     * 3 related articles: same categories, excluding the current article.
     */
    public function getRelated(int $articleId, int $limit = 3): array
    {
        $sql = <<<SQL
            SELECT DISTINCT a.id, a.title, a.description, a.image, a.slug, a.views, a.published_at
            FROM articles a
            INNER JOIN article_categories ac ON ac.article_id = a.id
            WHERE ac.category_id IN (
                SELECT category_id FROM article_categories WHERE article_id = :article_id
            )
            AND a.id != :exclude_id
            ORDER BY a.published_at DESC
            LIMIT :lim
        SQL;

        $stmt = $this->db->prepare($sql);
        $stmt->bindValue(':article_id', $articleId, PDO::PARAM_INT);
        $stmt->bindValue(':exclude_id', $articleId, PDO::PARAM_INT);
        $stmt->bindValue(':lim',        $limit,     PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }

    // ─── Private helpers ─────────────────────────────────────────────────────

    private function incrementViews(int $id): void
    {
        $this->db->prepare('UPDATE articles SET views = views + 1 WHERE id = :id')
                 ->execute([':id' => $id]);
    }

    private function getCategoriesForArticle(int $articleId): array
    {
        $sql = <<<SQL
            SELECT c.id, c.title, c.slug
            FROM categories c
            INNER JOIN article_categories ac ON ac.category_id = c.id
            WHERE ac.article_id = :article_id
            ORDER BY c.title
        SQL;

        $stmt = $this->db->prepare($sql);
        $stmt->execute([':article_id' => $articleId]);

        return $stmt->fetchAll();
    }
}
