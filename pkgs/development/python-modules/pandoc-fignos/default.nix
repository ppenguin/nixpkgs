{ buildPythonPackage
, fetchFromGitHub
, lib
, pandoc-xnos
}:

buildPythonPackage rec {
  pname = "pandoc-fignos";
  version = "2.4.0";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "tomduck";
    repo = pname;
    rev = version;
    sha256 = "sha256-eDwAW0nLB4YqrWT3Ajt9bmX1A43wl+tOPm2St5VpCLk=";
  };

  propagatedBuildInputs = [ pandoc-xnos ];

  meta = with lib; {
    description = "Pandoc-fignos is a pandoc filter for numbering figures and their references when converting from markdown to other formats.";
    homepage = "https://github.com/tomduck/pandoc-fignos";
    license = licenses.gpl3;
    maintainers = with maintainers; [ ppenguin ];
  };
}
