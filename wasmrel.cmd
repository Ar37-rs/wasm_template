@echo off

set wasm=%1
set build=release
set out=--out-dir
cargo build --target wasm32-unknown-unknown --%build%

if exist "public" (
	wasm-bindgen --target web target\wasm32-unknown-unknown\%build%\%wasm%.wasm --no-typescript %out% public
) else (
    mkdir public
    wasm-bindgen --target web target\wasm32-unknown-unknown\%build%\%wasm%.wasm --no-typescript %out% public
)

if exist "public\index.html" (
    echo %out% ./public
	echo Ok.
) else (
    wasmhtml
    echo %out% ./public
    echo Done with html initialized.
)
