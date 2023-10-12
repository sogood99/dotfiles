{ pkgs ? import <nixpkgs> { } }:
with pkgs;
clangStdenv.mkDerivation {
  name = "OpenCL";
  buildInputs = [
    opencl-headers 
    ocl-icd
  ];
  nativeBuildInputs = [
    clang-tools
    lldb
  ];
}
