{ lib
, jre8
, qmake
, git
, qtbase
, qttools
, qtwebkit
, qtxmlpatterns
, binutils
, wrapQtAppsHook
, openmodelica
, openscenegraph
, omniorb
, libGLU
, mkOpenModelicaDerivation
}:
with openmodelica;
mkOpenModelicaDerivation rec {
  pname = "omedit";
  omdir = "OMEdit";
  omdeps = [ omcompiler omplot omparser omsimulator ];
  omautoconf = true;

  nativeBuildInputs = [ jre8 qmake qtbase qttools wrapQtAppsHook git ]; # git necessary to include version info

  buildInputs = [ qtwebkit openscenegraph libGLU omniorb qtxmlpatterns binutils ];

  postPatch = ''
    sed -i ''$(find -name qmake.m4) -e '/^\s*LRELEASE=/ s|LRELEASE=.*$|LRELEASE=${lib.getDev qttools}/bin/lrelease|'
  '';

  dontUseQmakeConfigure = true;
  QMAKESPEC = "linux-clang";

  meta = with lib; {
    description = "A Modelica connection editor for OpenModelica";
    homepage = "https://openmodelica.org";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ balodja smironov ];
    platforms = platforms.linux;
  };
}
