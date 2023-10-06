with import <nixpkgs> {};

(pkgs.python39.buildEnv.override  {
  extraLibs = with pkgs.python39Packages; [ 
    numpy 
    scipy 
    pyopengl 
    # pyopengl-accelerate
  ];
}).env
