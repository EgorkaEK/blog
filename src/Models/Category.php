<?php

declare(strict_types=1);

namespace App\Models;

use App\Core\Database;
use PDO;

class Category
{
    private PDO $db;

    public function __construct()
    {
        $this->db = Database::getInstance();
    }

    /**
     * All categories that have at least one article,
     * each with their 3 most recently published articles.
     */
    public function getAllWithLatestArticles(): array
    {
        $sql = <<<SQL
            SELECT
                c.id,
                c.title,
                c.description,
                c.slug,
                COUNT(DISTINCT ac.article_id) AS total_articles
            FROM categories c
            INNER JOIN article_categories ac ON ac.category_id = c.id
            GROUP BY c.id
            ORDER BY c.title
        SQL;

        $categories = $this->db->query($sql)->fetchAll();

        foreach ($categories as &$category) {
            $category['articles'] = $this->getLatestArticles((int) $category['id'], 3);
        }

        return $categories;
    }

    /**
     * Find a single category by slug.
     */
    public function findBySlug(string $slug): ?array
    {
        $stmt = $this->db->prepare(
            'SELECT * FROM categories WHERE slug = :slug LIMIT 1'
        );
        $stmt->execute([':slug' => $slug]);
        $row = $stmt->fetch();

        return $row ?: null;
    }

    /**
     * Paginated + sorted list of articles in a category.
     *
     * @param string $sort  'date' | 'views'
     */
    public function getArticles(int $categoryId, int $page, int $perPage, string $sort): array
    {
        $orderBy = ($sort === 'views') ? 'a.views DESC' : 'a.published_at DESC';
        $offset  = ($page - 1) * $perPage;

        $sql = <<<SQL
            SELECT a.*
            FROM articles a
            INNER JOIN article_categories ac ON ac.article_id = a.id
            WHERE ac.category_id = :category_id
            ORDER BY {$orderBy}
            LIMIT :limit OFFSET :offset
        SQL;

        $stmt = $this->db->prepare($sql);
        $stmt->bindValue(':category_id', $categoryId, PDO::PARAM_INT);
        $stmt->bindValue(':limit',       $perPage,    PDO::PARAM_INT);
        $stmt->bindValue(':offset',      $offset,     PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }

    /**
     * Total count of articles in a category (for pagination).
     */
    public function countArticles(int $categoryId): int
    {
        $stmt = $this->db->prepare(
            'SELECT COUNT(*) FROM article_categories WHERE category_id = :id'
        );
        $stmt->execute([':id' => $categoryId]);

        return (int) $stmt->fetchColumn();
    }

    // ─── Private helpers ─────────────────────────────────────────────────────

    private function getLatestArticles(int $categoryId, int $limit): array
    {
        $sql = <<<SQL
            SELECT a.id, a.title, a.description, a.image, a.slug, a.views, a.published_at
            FROM articles a
            INNER JOIN article_categories ac ON ac.article_id = a.id
            WHERE ac.category_id = :category_id
            ORDER BY a.published_at DESC
            LIMIT :lim
        SQL;

        $stmt = $this->db->prepare($sql);
        $stmt->bindValue(':category_id', $categoryId, PDO::PARAM_INT);
        $stmt->bindValue(':lim',         $limit,      PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
}
