{ buildPythonPackage
, fetchFromGitHub
, lib
, psutil
, pandoc-xnos
}:

buildPythonPackage rec {
  pname = "pandoc-tablenos";
  version = "2.3.0";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "tomduck";
    repo = pname;
    rev = version;
    sha256 = "sha256-FwzsRziY3PoySo9hIFuLw6tOO9oQij6oQEyoY8HgnII=";
  };

  propagatedBuildInputs = [ pandoc-xnos ];

  meta = with lib; {
    description = "Pandoc-tablenos is a pandoc filter for numbering tables and their references when converting from markdown to other formats.";
    homepage = "https://github.com/tomduck/pandoc-tablenos";
    license = licenses.gpl3;
    maintainers = with maintainers; [ ppenguin ];
  };
}
