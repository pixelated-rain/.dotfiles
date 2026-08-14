{
  lib,
  fetchurl,
  stdenvNoCC,
  makeWrapper,
  jre,
}:

stdenvNoCC.mkDerivation {
  pname = "aladin";
  version = "12.060";

  src = fetchurl {
    url = "https://aladin.cds.unistra.fr/java/Aladin.tar";
    hash = "sha256-T9VKAfo6s90npVyJH1BkoGYLTpMWgXqTRvAUcEFMrV8=";
  };

  nativeBuildInputs = [ makeWrapper ];

  sourceRoot = "Aladin";

  installPhase = ''
    mkdir -p $out/share/aladin
    cp -r . $out/share/aladin/

    mkdir -p $out/bin
    makeWrapper ${jre}/bin/java $out/bin/aladin \
      --add-flags "-Xmx1024m" \
      --add-flags "-jar $out/share/aladin/Aladin.jar"

    mkdir -p $out/share/applications
    cat > $out/share/applications/aladin.desktop <<EOF
[Desktop Entry]
Name=Aladin Desktop
Comment=Interactive sky atlas
Exec=aladin
Terminal=false
Type=Application
Categories=Science;Astronomy;
EOF
  '';

  meta = with lib; {
    description = "Interactive sky atlas";
    homepage = "https://aladin.cds.unistra.fr/";
    mainProgram = "aladin";
    platforms = platforms.linux;
  };
}
