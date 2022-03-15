{ buildPythonPackage
, fetchFromGitHub
, fetchgit
, lib
, pandoc-xnos
}:

buildPythonPackage rec {
  pname = "pandoc-secnos";
  version = "2.2.2";
  format = "pyproject";

  src = fetchgit {
    # FIXME: after PR to fix manifest accepted upstream, go back to upstream
    # owner = "tomduck";
    # repo = pname;
    url = "https://github.com/ppenguin/pandoc-secnos.git";
    rev = "165ee1f4c1208636254392335d34934dc50d273e";
    sha256 = "sha256-5VgEq5NeKRexPLJyQ8Uwj3vfnN9LUGoVIUUMiaWzyxw=";
  };

  propagatedBuildInputs = [ pandoc-xnos ];

  meta = with lib; {
    description = "Pandoc-secnos is a pandoc filter for numbering sections and their references when converting from markdown to other formats.";
    homepage = "https://github.com/tomduck/pandoc-secnos";
    license = licenses.gpl3;
    maintainers = with maintainers; [ ppenguin ];
  };
}
