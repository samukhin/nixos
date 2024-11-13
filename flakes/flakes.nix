nixos-install --flake /mnt/etc/nixos#HOSTNAME --root /mnt

flake.nix:

{
  inputs.INPUT_NAME.url = "github:NixOS/nixpkgs/nixos-24.05";

  outputs = { self, INPUT_NAME }: {
    nixosConfigurations.HOSTNAME = INPUT_NAME.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [({ pkgs, ... }: {
        services.xserver = {
          enable = true;
          displayManager.job.logToFile = true;
          displayManager.sddm.enable = true;
        };
      })];
    };
  };
}





modules = [ 
        ./configuration.nix 


        [ ({ pkgs, ... }: {










{
  inputs.nixpkg.url = "github:NixOS/nixpkgs/nixos-22.11";

  outputs = { self, nixpkg }: {
      nixosConfigurations.nixos = nixpkg.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
          ./configuration.nix 
          ({ pkgs, ... }: {
          services.xserver = {
          enable = true;
          displayManager.job.logToFile = true;
          displayManager.sddm.enable = true;
        };
      })];
    };
  };
}












{
  inputs.cutefish.url = "github:mdevlamynck/nixpkgs/cutefish-0.8";

  outputs = { self, cutefish }: {
    nixosConfigurations.nixos = cutefish.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./configuration.nix ({ pkgs, ... }: {
        services.xserver = {
          enable = true;
          displayManager.job.logToFile = false;
          displayManager.sddm.enable = false;
          desktopManager.cutefish.enable = true;
        };
      })];
    };
  };
}








{
inputs.nixpkgs.url = "/home/user/nixos/";
#inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";


outputs = { self, nixpkgs }:
{
nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
          ./configuration.nix
      ];
};
};

}













inputs.nixpkgs.url = "/home/user/nixos/";
inputs.nixpkgs-old.url = "github:NixOS/nixpkgs/nixos-22.11";


outputs = { self, nixpkgs, ... }:
{
nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
          ./configuration.nix
      ];
};
};

}









