library updating is broken, but maybe we can do this by just updating the revisions (from master/default)
doing something like

```nix
let
  omlibs=(import ./src-libs.nix);
in
updlibs = (map (omlib: (builtins.fetchGit (lib.attrsets.filterAttrs (n: _: n == "url") omlib))) omlibs);
```