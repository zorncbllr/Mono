@echo off
goto :main

:handle_operation
    set is_gen=0
    set is_serve=0

    if "%mode%" == "gen" set is_gen=1
    if "%mode%" == "generate" set is_gen=1
    if "%mode%" == "-g" set is_gen=1
    if "%mode%" == "serve" set is_serve=1
    if "%mode%" == "-s" set is_serve=1

    if %is_gen%==1 (
        php app/core/utils/mono_cli/cli.php %mode% %2
    ) else if %is_serve%==1 (
        php -S localhost:3000 public/index.php
    ) else (
        echo invalid mono command
    )

goto :eof

:main
    set mode=%1

    call :handle_operation

    set mode=
goto :eof