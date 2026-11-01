{pkgs, ...}: {
  hardware = {
    sane = {
      enable = true;
      extraBackends = [pkgs.sane-airscan];
      disabledDefaultBackends = ["escl"];
    };

    logitech.wireless.enable = false;
    logitech.wireless.enableGraphical = false;
    graphics.enable = true;
    enableRedistributableFirmware = true;
    keyboard.qmk.enable = true;
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;

    opentabletdriver = {
      enable = true;

      package = pkgs.opentabletdriver.overrideAttrs (old: {
        postPatch =
          (old.postPatch or "")
          + ''
            file=OpenTabletDriver.Configurations/Parsers/Huion/GianoReport.cs

            # Add the eraser-report interface.
            grep -q 'public struct GianoReport :' "$file"
            sed -i '/public struct GianoReport :/ s/$/, IEraserReport/' "$file"

            # Bit 5 distinguishes the physical eraser end.
            sed -i '/Raw = report;/a\
                        Eraser = report[1].IsBitSet(5);' "$file"

            # Expose eraser state to OpenTabletDriver.
            sed -i '/public byte\[\] Raw { set; get; }/i\
                    public bool Eraser { set; get; }' "$file"

            # Verify all three edits were applied.
            grep -q 'ITiltReport, IEraserReport' "$file"
            grep -Fq 'Eraser = report[1].IsBitSet(5);' "$file"
            grep -Fq 'public bool Eraser { set; get; }' "$file"
          '';
      });
    };

    openrazer = {
      enable = true;
      users = ["amelia"];
    };
  };

  local.hardware-clock.enable = false;
}
