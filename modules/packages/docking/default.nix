{
  lib,
  fetchFromGitHub,
  python3Packages,
  gettext,
  gobject-introspection,
  wrapGAppsHook3,
  gtk3,
  gtk-layer-shell,
  libwnck,
  networkmanager,
  gdk-pixbuf,
  pango,
  cairo,
  gst_all_1,
  webkitgtk_4_1,
  librsvg,
}:

python3Packages.buildPythonApplication rec {
  pname = "docking";
  version = "2.12.1";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "edumucelli";
    repo = "docking";
    rev = "60b941531fcad6c19eb38431c3f7bb14013915b7";
    hash = "sha256-UfOm9UgHkFnHyrQuCvTj6LB2EmP5ktKYRAQwio37o50=";
  };

  nativeBuildInputs = with python3Packages; [
    setuptools
    wheel
    gettext
    gobject-introspection
    wrapGAppsHook3
  ];

  buildInputs = [
    gtk3
    gtk-layer-shell
    libwnck
    networkmanager
    gdk-pixbuf
    pango
    cairo
    gst_all_1.gstreamer
    webkitgtk_4_1
    librsvg
  ];

  propagatedBuildInputs = with python3Packages; [
    pycairo
    pygobject3
    pywayland
  ];

  # These dependencies are declared upstream but aren't
  # consistently available in nixpkgs.
  pythonRemoveDeps = [
    "openmeteo-requests"
    "requests-cache"
    "retry-requests"
  ];

  doCheck = false;

  preBuild = ''
    bash tools/i18n.sh --compile
  '';

  postInstall = ''
    install -Dm644 "$src/packaging/shared/org.docking.Docking.desktop" \
      "$out/share/applications/org.docking.Docking.desktop"

    substituteInPlace "$out/share/applications/org.docking.Docking.desktop" \
      --replace-fail "Exec=docking" "Exec=$out/bin/docking"

    install -Dm644 "$src/packaging/shared/org.docking.camshield.policy" \
      "$out/share/polkit-1/actions/org.docking.camshield.policy"

    mkdir -p "$out/share/icons/hicolor"
    cp -a "$src/packaging/deb/icons/hicolor/." \
      "$out/share/icons/hicolor/"
  '';

  meta = with lib; {
    description =
      "A lightweight, feature-rich dock for Linux written in Python with GTK 3 and Cairo";
    homepage = "https://github.com/edumucelli/docking";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
    mainProgram = "docking";
  };
}

