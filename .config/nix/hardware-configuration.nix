# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "uas" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/59125dd4-0ef6-4bc4-bb65-b01e73c9ba5c";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/32A6-A605";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  #fileSystems."/mnt/ssd01" =
  #  { device = "/dev/disk/by-uuid/A676-DEE5";
  #    fsType = "exfat";
  #    options = [ "umask=0022" "gid=100" "uid=1000" ];
  #  };

  fileSystems."/mnt/hdd01" =
    { device = "/dev/disk/by-uuid/76C7-E584";
      fsType = "exfat";
      options = [ "umask=0022" "gid=100" "uid=1000" ];
    };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.br-1235a795cd10.useDHCP = lib.mkDefault true;
  # networking.interfaces.br-20b86de79c3d.useDHCP = lib.mkDefault true;
  # networking.interfaces.br-711d7a308657.useDHCP = lib.mkDefault true;
  # networking.interfaces.br-93f994c6c1d9.useDHCP = lib.mkDefault true;
  # networking.interfaces.br-a58f65914bcc.useDHCP = lib.mkDefault true;
  # networking.interfaces.br-f6ad41fc6f37.useDHCP = lib.mkDefault true;
  # networking.interfaces.docker0.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp4s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.tailscale0.useDHCP = lib.mkDefault true;
  # networking.interfaces.veth6330931.useDHCP = lib.mkDefault true;
  # networking.interfaces.veth6a2757c.useDHCP = lib.mkDefault true;
  # networking.interfaces.veth7b7b78b.useDHCP = lib.mkDefault true;
  # networking.interfaces.vethfa8fead.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp0s20f3.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
