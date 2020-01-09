<?php

if (
    defined('XHPROF') && XHPROF &&
    defined('XHPROF_ENABLED') && XHPROF_ENABLED &&
    extension_loaded('xhprof') &&
    !preg_match('/xhprof/', $_SERVER['SCRIPT_NAME'])
) {
    $xhprof_data = xhprof_disable();
    $xhprof_runs = new XHProfRuns_Default();
    $xhprof_data['QUERY']['REQUEST_URI']    = strtok($_SERVER["REQUEST_URI"],'?');
    $xhprof_data['QUERY']['GET']            = $_GET;
    $xhprof_data['QUERY']['POST']           = $_POST;
    $run_id = $xhprof_runs->save_run($xhprof_data, XHPROF_NAMESPACE);

    // url to the XHProf UI libraries (change the host name and path)
//    $profiler_url = sprintf('http://company.dev.server/xhprof/?run=%s&amp;source=%s', $run_id, $profiler_namespace);
//    echo '<a href="'. $profiler_url .'" target="_blank">Profiler output</a>';
}