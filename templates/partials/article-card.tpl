{* Partial: single article card *}
<article class="card">
    <a href="{$baseUrl}/article/{$article.slug|escape}" class="card-image-link">
        {if $article.image}
            <img
                src="{$baseUrl}/images/uploads/{$article.image|escape}"
                alt="{$article.title|escape}"
                class="card-image"
                loading="lazy"
            >
        {else}
            <div class="card-image card-image--placeholder">
                <span>{$article.title|truncate:1:'':true}</span>
            </div>
        {/if}
    </a>
    <div class="card-body">
        <p class="card-meta">
            <time datetime="{$article.published_at|date_format:'%Y-%m-%d'}">{$article.published_at|date_format:'%B %d, %Y'}</time>
            <span class="separator">·</span>
            <span class="views-count">👁 {$article.views} views</span>
        </p>
        <h3 class="card-title">
            <a href="{$baseUrl}/article/{$article.slug|escape}">{$article.title|escape}</a>
        </h3>
        <p class="card-description">{$article.description|escape|truncate:120:'…'}</p>
        <a href="{$baseUrl}/article/{$article.slug|escape}" class="btn btn--ghost btn--sm">Read more</a>
    </div>
</article>
