<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{$title|escape}</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Merriweather:ital,wght@0,400;0,700;1,400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="{$baseUrl}/css/main.css">
</head>
<body>

<header class="site-header">
    <div class="container">
        <a href="{$baseUrl}/" class="site-logo">
            <span class="logo-mark">B</span>
            <span class="logo-text">AbeloBlog</span>
        </a>
        <nav class="site-nav">
            <a href="{$baseUrl}/">Home</a>
        </nav>
    </div>
</header>

<main class="site-main">
    <div class="container">
        {block name="content"}{/block}
    </div>
</main>

<footer class="site-footer">
    <div class="container">
        <p>&copy; {$smarty.now|date_format:"%Y"} AbeloBlog. Built with PHP &amp; Smarty.</p>
    </div>
</footer>

</body>
</html>
