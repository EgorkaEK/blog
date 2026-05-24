{extends file="layouts/base.tpl"}

{block name="content"}

<section class="hero">
    <h1 class="hero-title">Welcome to <span class="accent">AbeloBlog</span></h1>
    <p class="hero-subtitle">Explore articles on technology, design, science, and more.</p>
</section>

{if $categories}
    {foreach $categories as $category}
    <section class="category-section">
        <div class="category-header">
            <div class="category-header-text">
                <h2 class="category-title">
                    <a href="{$baseUrl}/category/{$category.slug|escape}">{$category.title|escape}</a>
                </h2>
                <p class="category-description">{$category.description|escape}</p>
            </div>
            <a href="{$baseUrl}/category/{$category.slug|escape}" class="btn btn--primary">
                All Articles <span class="badge">{$category.total_articles}</span>
            </a>
        </div>

        {if $category.articles}
        <div class="cards-grid">
            {foreach $category.articles as $article}
                {include file="partials/article-card.tpl" article=$article}
            {/foreach}
        </div>
        {/if}
    </section>
    {/foreach}
{else}
    <div class="empty-state">
        <p>No categories with articles yet. Check back soon!</p>
    </div>
{/if}

{/block}
