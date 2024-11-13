Иногда для применения нужно сделать --override-input

На момент 24.11 всё ещё нужно прописывать  в configuration.nix
nix.settings.experimental-features = [ "nix-command" "flakes" ];
Для активации
