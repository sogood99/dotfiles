# default.nix
with import <nixpkgs> {};
stdenv.mkDerivation {
    name = "GL-DevEnv"; # Probably put a more meaningful name here
    buildInputs = [ 
        pkg-config 
        SDL2  
        gtk3
        zlib
        glfw
        glew
        mesa
    ];
}

