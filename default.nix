{pkgs ? import <nixpkgs> {}, ...}: {
  llr = pkgs.callPackage ./pkgs/llr {};
}
