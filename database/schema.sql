CREATE DATABASE IF NOT EXISTS `blog` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `blog`;

CREATE TABLE IF NOT EXISTS `categories` (
    `id`          INT UNSIGNED    NOT NULL AUTO_INCREMENT,
    `title`       VARCHAR(255)    NOT NULL,
    `description` TEXT            NOT NULL,
    `slug`        VARCHAR(255)    NOT NULL UNIQUE,
    `created_at`  DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `idx_slug` (`slug`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `articles` (
    `id`           INT UNSIGNED    NOT NULL AUTO_INCREMENT,
    `title`        VARCHAR(255)    NOT NULL,
    `description`  VARCHAR(500)    NOT NULL,
    `text`         LONGTEXT        NOT NULL,
    `image`        VARCHAR(255)    NULL,
    `slug`         VARCHAR(255)    NOT NULL UNIQUE,
    `views`        INT UNSIGNED    NOT NULL DEFAULT 0,
    `published_at` DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `created_at`   DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `idx_slug`         (`slug`),
    INDEX `idx_published_at` (`published_at`),
    INDEX `idx_views`        (`views`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `article_categories` (
    `article_id`  INT UNSIGNED NOT NULL,
    `category_id` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`article_id`, `category_id`),
    FOREIGN KEY (`article_id`)  REFERENCES `articles`(`id`)   ON DELETE CASCADE,
    FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB;
