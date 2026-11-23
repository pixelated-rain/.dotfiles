{
  lib,
  fetchurl,
  stdenvNoCC,
  makeWrapper,
  rpmextract,
  jre,
}:
stdenvNoCC.mkDerivation {
  pname = "aladin";
  version = "12.060";

  src = fetchurl {
    url = "https://ftp5.gwdg.de/pub/linux/mageia/distrib/cauldron/x86_64/media/core/release/aladin-12.060-2.mga11.noarch.rpm";
    hash = "sha256-pIGsdHeD7EeCsGWRxARLvXK+4r/kQ2LjzMaA2rCuaoc=";
  };

  nativeBuildInputs = [makeWrapper rpmextract];

  unpackPhase = ''
    rpmextract "$src"
  '';

  dontConfigure = true;
  dontBuild = true;
  installPhase = ''
        install -Dm644 usr/share/java/Aladin.jar \
        $out/share/aladin/Aladin.jar

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
