{pkgs ? import <nixpkgs> {}, ...}: {
  font-etuvetica = pkgs.callPackage ./pkgs/font-etuvetica {};
  g90updatefw = pkgs.callPackage ./pkgs/g90updatefw {};
  llr = pkgs.callPackage ./pkgs/llr {};
  mkvcleaner = pkgs.callPackage ./pkgs/mkvcleaner {};
}
