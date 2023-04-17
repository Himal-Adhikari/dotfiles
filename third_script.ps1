npm install -g typescript typescript-language-server;
npm i -g vscode-langservers-extracted;
mkdir ~\Himal\AppData\Roaming\nushell;
cp config_files\config.nu ~\AppData\Roaming\nushell\config.nu;
cp config_files\env.nu ~\AppData\Roaming\nushell\env.nu;
mkdir ~\AppData\Roaming\helix\;
cp config_files\hx_config.toml ~\AppData\Roaming\helix\config.toml;
mkdir ~\.config
cp config_files\starship.toml ~\.config\starship.toml
mkdir ~\AppData\Roaming\gitui\;
cp config_files\theme.ron ~\AppData\Roaming\gitui\theme.ron;
mkdir ~\.cargo;
cp config_files\sccache_config.toml ~\.cargo\config.toml;
cp -r nuscripts ~\nuscripts
