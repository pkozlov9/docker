<?php

define('XHPROF_CONSTANTS', __DIR__ . '/../config/app/constants.dev.local.php');
include_once XHPROF_CONSTANTS;

if (
    defined('XHPROF') && XHPROF &&
    defined('XHPROF_ENABLED') && XHPROF_ENABLED &&
    extension_loaded('xhprof') &&
    !preg_match('/xhprof/', $_SERVER['SCRIPT_NAME'])
) {
    include_once __DIR__ . '/xhprof_lib/utils/xhprof_lib.php';
    include_once __DIR__ . '/xhprof_lib/utils/xhprof_runs.php';
    xhprof_enable(XHPROF_FLAGS_CPU + XHPROF_FLAGS_MEMORY);
}