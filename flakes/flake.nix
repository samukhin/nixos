{
  description = "NixOS configuration with nano from 23.11";

  inputs = {
    # Указываем флейк для NixOS 23.11
    nixpkgs.url = "/home/user/nixos/";

    # Флейк для нашего текущего NixOS 22.11
    nixpkgs_old.url = "github:nixos/nixpkgs/nixos-22.11";
  };

  outputs = { self, nixpkgs, nixpkgs_old }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux"; # Или другой поддерживаемый системой тип

      modules = [
        ({ config, pkgs, lib, ... }: {
          # Импортируем основной модуль конфигурации системы
          imports = [ ./configuration.nix ];

          # Используем overlay для добавления пакета nano из 23.11
          nixpkgs.overlays = [
            (final: prev: {
              nano3 = nixpkgs_old.legacyPackages.x86_64-linux.nano;
            })
          ];

          environment.systemPackages = with pkgs; [
            nano
            nano3
          ];


        })
      ];
    };
  };
}
