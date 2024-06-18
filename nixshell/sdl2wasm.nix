# default.nix
with import <nixpkgs> {};
stdenv.mkDerivation {
    name = "SDL2-WASM"; 
    nativeBuildInputs = [ pkg-config ]; 
    buildInputs = [ 
        SDL2 
        SDL2_gfx 
        SDL2_image 
        emscripten
        linuxKernel.packages.linux_6_1.perf
        perf-tools
    ];
}

