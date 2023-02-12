{pkgs ? import <nixpkgs> {}, ...}: {
  chalet = pkgs.callPackage ./pkgs/chalet {};
  font-etuvetica = pkgs.callPackage ./pkgs/font-etuvetica {};
  font-talyznewroman = pkgs.callPackage ./pkgs/font-talyznewroman {};
  g90updatefw = pkgs.callPackage ./pkgs/g90updatefw {};
  llr = pkgs.callPackage ./pkgs/llr {};
  mkvcleaner = pkgs.callPackage ./pkgs/mkvcleaner {};
}
