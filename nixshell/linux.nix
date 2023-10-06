with import <nixpkgs> {};
{
     testEnv = stdenv.mkDerivation {
       name = "Linux-Dev Env";
       buildInputs = [
           stdenv
           ncurses
           bc
           gnumake
           flex 
           bison 
           elfutils
           openssl
           qemu_full
           debootstrap
           gcc13
           gdb
           clang_16
           clang-tools_16
           lld_16
           llvmPackages_16.libllvm
       ];
     };
}
