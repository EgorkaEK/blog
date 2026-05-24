{extends file="layouts/base.tpl"}

{block name="content"}

<article class="article-full">

    <nav class="breadcrumb">
        <a href="{$baseUrl}/">Home</a>
        <span>/</span>
        {if $article.categories}
            <a href="{$baseUrl}/category/{$article.categories[0].slug|escape}">{$article.categories[0].title|escape}</a>
            <span>/</span>
        {/if}
        <span>{$article.title|escape|truncate:40:'…'}</span>
    </nav>

    <header class="article-header">
        <div class="article-tags">
            {foreach $article.categories as $cat}
                <a href="{$baseUrl}/category/{$cat.slug|escape}" class="tag">{$cat.title|escape}</a>
            {/foreach}
        </div>
        <h1 class="article-title">{$article.title|escape}</h1>
        <p class="article-description">{$article.description|escape}</p>
        <div class="article-meta">
            <time datetime="{$article.published_at|date_format:'%Y-%m-%d'}">
                {$article.published_at|date_format:'%B %d, %Y'}
            </time>
            <span class="separator">·</span>
            <span>👁 {$article.views} views</span>
        </div>
    </header>

    {if $article.image}
    <div class="article-cover">
        <img
            src="{$baseUrl}/images/uploads/{$article.image|escape}"
            alt="{$article.title|escape}"
            class="article-cover-img"
        >
    </div>
    {/if}

    <div class="article-body prose">
        {$article.text}
    </div>

</article>

{* Related articles *}
{if $related}
<section class="related-section">
    <h2 class="related-title">Related Articles</h2>
    <div class="cards-grid">
        {foreach $related as $article}
            {include file="partials/article-card.tpl" article=$article}
        {/foreach}
    </div>
</section>
{/if}

{/block}
