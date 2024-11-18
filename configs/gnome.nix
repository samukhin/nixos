{

  # Включить pulseaudio для всех
  services.pipeware.enable = false;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.systemWide = true;
  # Добавляем в группу, чтобы сработало
  users.users.root = {
  extraGroups = [ "pulse-access" ];
  };
  
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  # Убрать лишнюю службу
  services.gnome.gnome-remote-desktop.enable = false;

  # Убрать лишние приложения
  environment.gnome.excludePackages = (with pkgs; [
  gnome-photos
  gnome-tour
  gedit # text editor
  ]) ++ (with pkgs.gnome; [
  cheese # webcam tool
  gnome-music
  gnome-terminal
  epiphany # web browser
  geary # email reader
  evince # document viewer
  gnome-characters
  totem # video player
  tali # poker game
  iagno # go game
  hitori # sudoku game
  atomix # puzzle game
  ]);

  



}
