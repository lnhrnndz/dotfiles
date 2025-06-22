# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "thethinker"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Zurich";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  fileSystems."/mnt/DAS" = {
    device = "/dev/disk/by-label/DAS";
    fsType = "btrfs";
    options = [ "compress=zstd" "noatime" ];
  };

  fileSystems."/mnt/BIGBOI" = {
    device = "/dev/disk/by-uuid/A676-DEE5";  # or by-label/MyDrive
    fsType = "exfat";
    options = [
      "defaults"
      "uid=1000"
      "gid=100"
      "umask=022"
      "nofail" # Prevent boot failure if drive is missing
    ];
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.leon = {
    isNormalUser = true;
    description = "Leon";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
      neovim
      fish
      zsh
      neofetch
      eza
      bat
      zoxide
      ripgrep
      fd
      fzf
      tmux
      tree
      sqlite
      lazygit
      ffmpeg
      htop
      iotop
      ranger
      #zed-editor
      mediainfo
      nzbget
      beets
      python3
      python312Packages.tqdm
      python312Packages.psutil
      yt-dlp
      syncthing
      podman-compose
      podman-tui
      # programs
    ];
  };

  programs.zsh.enable = true;
  #users.defaultUserShell = pkgs.zsh;

  # Enable cron service
  services.cron = {
    enable = true;
    systemCronJobs = [
      "*/5 * * * * leon /home/leon/docker/scripts/updateportpublic.sh > /tmp/portpublic.log"
      "*/5 * * * * leon /home/leon/docker/scripts/updateportprivate.sh > /tmp/portprivate.log"
      "33 3 * * * leon /home/leon/docker/updateallcontainers.sh > /tmp/updatecontainers.log 2> /tmp/updatecontainers.err"
      "* * * * * leon docker exec qbittorrent_private /config/refreshMAMcookie.sh >/tmp/SeedboxAPI.log 2>/tmp/SeedboxAPI.err"
      #"* * * * * leon date > /tmp/date.txt"
    ];
  };

  # launch fish unless the parent process is already fish
  programs.bash = {
  interactiveShellInit = ''
    if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    docker
    git
    stow
    gnumake
    gcc
    wget
    python312Packages.tqdm
    python312Packages.psutil
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = false;
      AllowUsers = null; # Allows all users by default. Can be [ "user1" "user2" ]
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "no"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
    };
  };
  services.tailscale.enable = true;
  systemd.services.tailscaled.after = [ "systemd-networkd-wait-online.service" ];

  virtualisation.docker.enable = true;
  virtualisation.podman.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  #services.logind.extraConfig = "HandleLidSwitch=ignore";
  services.logind.lidSwitch = "ignore";
  services.logind.lidSwitchDocked = "ignore";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

  services.samba = {
    enable = true;
    #securityType = "user";
    openFirewall = true;
    settings = {
      global = {
        "workgroup" = "WORKGROUP";
        "server string" = "smbnix";
        "netbios name" = "smbnix";
        "security" = "user";
        #"use sendfile" = "yes";
        #"max protocol" = "smb2";
        # note: localhost is the ipv6 localhost ::1
        "hosts allow" = "100.93.234.34 192.168.0. 127.0.0.1 localhost";
        "hosts deny" = "0.0.0.0/0";
        "guest account" = "nobody";
        "map to guest" = "bad user";
      };
      "public" = {
        "path" = "/mnt/DAS/smb/public";
        "browseable" = "yes";
        "read only" = "no";
        "guest ok" = "yes";
        "create mask" = "0644";
        "directory mask" = "0755";
        #"force user" = "username";
        #"force group" = "groupname";
      };
      "private" = {
        "path" = "/mnt/DAS/smb/private";
        "browseable" = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "create mask" = "0644";
        "directory mask" = "0755";
        "valid users" = "leon";
        "force user" = "leon";
        #"force group" = "groupname";
      };
      "books" = {
        "path" = "/mnt/DAS/media/books";
        "browseable" = "yes";
        "read only" = "yes";
        "guest ok" = "yes";
        "create mask" = "0644";
        "directory mask" = "0755";
      };
      "audiobooks" = {
        "path" = "/mnt/DAS/media/audiobooks";
        "browseable" = "yes";
        "read only" = "yes";
        "guest ok" = "yes";
        "create mask" = "0644";
        "directory mask" = "0755";
      };
    };
  };
  # for windows (ew)
  #services.samba-wsdd = {
  #  enable = true;
  #  openFirewall = true;
  #};
  networking.firewall.enable = true;
  networking.firewall.allowPing = true;

}
