{extends file="layouts/base.tpl"}

{block name="content"}

<div class="page-header">
    <nav class="breadcrumb">
        <a href="{$baseUrl}/">Home</a>
        <span>/</span>
        <span>{$category.title|escape}</span>
    </nav>
    <h1 class="page-title">{$category.title|escape}</h1>
    <p class="page-description">{$category.description|escape}</p>
</div>

<div class="toolbar">
    <p class="results-count">{$total} article{if $total != 1}s{/if}</p>
    <div class="sort-controls">
        <span>Sort by:</span>
        <a
            href="{$baseUrl}/category/{$category.slug|escape}?sort=date{if $page > 1}&page={$page}{/if}"
            class="sort-link{if $sort === 'date'} sort-link--active{/if}"
        >Latest</a>
        <a
            href="{$baseUrl}/category/{$category.slug|escape}?sort=views{if $page > 1}&page={$page}{/if}"
            class="sort-link{if $sort === 'views'} sort-link--active{/if}"
        >Most viewed</a>
    </div>
</div>

{if $articles}
    <div class="cards-grid">
        {foreach $articles as $article}
            {include file="partials/article-card.tpl" article=$article}
        {/foreach}
    </div>

    {* Pagination *}
    {if $lastPage > 1}
    <nav class="pagination" aria-label="Pagination">
        {if $page > 1}
            <a href="{$baseUrl}/category/{$category.slug|escape}?sort={$sort}&page={$page-1}" class="pagination-btn">&laquo; Prev</a>
        {/if}

        {for $p = 1 to $lastPage}
            {if $p == $page}
                <span class="pagination-btn pagination-btn--active">{$p}</span>
            {elseif $p == 1 || $p == $lastPage || ($p >= $page - 2 && $p <= $page + 2)}
                <a href="{$baseUrl}/category/{$category.slug|escape}?sort={$sort}&page={$p}" class="pagination-btn">{$p}</a>
            {elseif $p == $page - 3 || $p == $page + 3}
                <span class="pagination-ellipsis">…</span>
            {/if}
        {/for}

        {if $page < $lastPage}
            <a href="{$baseUrl}/category/{$category.slug|escape}?sort={$sort}&page={$page+1}" class="pagination-btn">Next &raquo;</a>
        {/if}
    </nav>
    {/if}

{else}
    <div class="empty-state">
        <p>No articles in this category yet.</p>
    </div>
{/if}

{/block}
