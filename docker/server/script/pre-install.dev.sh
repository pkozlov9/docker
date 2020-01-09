#!/usr/bin/env sh

cp docker/server/config/app/.env.dev .env
cp docker/server/config/app/constants.dev.php docker/server/config/app/constants.dev.local.php
chmod 0777 docker/server/config/app/constants.dev.local.php
mkdir -p docker/server/xhprof/xhprof_runs
chmod 0777 docker/server/xhprof/xhprof_runs