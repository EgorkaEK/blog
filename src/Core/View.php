<?php

declare(strict_types=1);

namespace App\Core;

use Smarty;
use SmartyException;

class View
{
    private Smarty $smarty;

    public function __construct()
    {
        $config = require __DIR__ . '/../config.php';
        $cfg    = $config['smarty'];

        foreach (['compile_dir', 'cache_dir'] as $dir) {
            if (!is_dir($cfg[$dir])) {
                mkdir($cfg[$dir], 0755, true);
            }
        }

        $this->smarty = new Smarty();
        $this->smarty->setTemplateDir($cfg['template_dir']);
        $this->smarty->setCompileDir($cfg['compile_dir']);
        $this->smarty->setCacheDir($cfg['cache_dir']);
        $this->smarty->caching = $cfg['caching'] ? Smarty::CACHING_LIFETIME_CURRENT : Smarty::CACHING_OFF;

        $this->smarty->assign('baseUrl', $this->baseUrl());
    }

    /**
     * @throws SmartyException
     */
    public function render(string $template, array $data = []): void
    {
        foreach ($data as $key => $value) {
            $this->smarty->assign($key, $value);
        }
        $this->smarty->display($template);
    }

    private function baseUrl(): string
    {
        $scheme = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') ? 'https' : 'http';
        $host   = $_SERVER['HTTP_HOST'] ?? 'localhost';
        return $scheme . '://' . $host;
    }
}
