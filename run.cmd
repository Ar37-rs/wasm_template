@echo off

@REM the libwasm_template name taken from Cargo.toml package [lib] name.
@REM for release mode run: run.cmd --release

if "%1" == "--release" (
    wasmrel ./libwasm_template
) else (
    wasmdeb ./libwasm_template
)