# default.nix
with import <nixpkgs> {};
stdenv.mkDerivation {
    name = "GL-DevEnv"; # Probably put a more meaningful name here
    nativeBuildInputs = [
        pkg-config 
        wrapGAppsHook
        gsettings-desktop-schemas
        dconf
    ];
    buildInputs = [ 
        dracula-theme
        dracula-icon-theme
        glib
        SDL2  
        gtk3
        zlib
        glfw
        glew
        mesa
    ];
}

