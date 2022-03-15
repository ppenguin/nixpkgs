{ buildPythonPackage
, fetchFromGitHub
, lib
, pandoc-xnos
}:

buildPythonPackage rec {
  pname = "pandoc-eqnos";
  version = "2.5.0";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "tomduck";
    repo = pname;
    rev = version;
    sha256 = "sha256-7GQdfGHhtQs6LZK+ZyMmcPSkoFfBWmATTMejMiFcS7Y=";
  };

  propagatedBuildInputs = [ pandoc-xnos ];

  meta = with lib; {
    description = "Pandoc-eqnos is a pandoc filter for numbering equations and their references when converting from markdown to other formats.";
    homepage = "https://github.com/tomduck/pandoc-eqnos";
    license = licenses.gpl3;
    maintainers = with maintainers; [ ppenguin ];
  };
}
