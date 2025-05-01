# 📊 NixOS Htop

> Declarative NixOS module to deploy a customized per-user htop configuration for advanced process monitoring.

## 📦 Features

- 🔒 **Secure config directory :** Creates ```~/.config/htop``` with ```700``` permissions and correct ownership.

- ⚙️ **Custom htop settings :** Deploys ```htoprc``` with tree view, CPU temperature, meters layout, sorting and coloring presets.

- 📈 **Enhanced monitoring :** Enables display of CPU temps, per-process thread hiding, merged commands and more.

- 🔄 **Idempotent :** Cleans and recreates the config folder on each rebuild without overwriting existing data.

- 📦 **Package installation :** Ensures ```htop``` is installed via ```environment.systemPackages```.

- 💾 **Backup guidance :** Documentation covers backing up any existing ```~/.config/htop/htoprc```.

## ⚙️ Prerequisites

### 1. NixOS version
Requires NixOS 24.11 or newer.

### 2. User validation
the target user must be defined in ```config.username```. See [typovrak main nixos configuration](https://github.com/typovrak/nixos) for more details.

### 3. Backup
Before proceeding, back up existing configuration if needed
```bash
cp ~/.config/htop{,.bak}
```

## 🚀 Installation
Fetch the module directly in your main nixos configuration at ```/etc/nixos/configuration.nix``` using fetchGit
```nix
# /etc/nixos/configuration.nix

let
  nixos-htop = fetchGit {
    url = "https://github.com/typovrak/nixos-htop.git";
    ref = "main";
    rev = "8ccceef40689f4ad4e994c0a1747bb82df62bbe2"; # update to the desired commit
  };
in
{
  imports = [
    /etc/nixos/hardware-configuration.nix # system hardware settings
    /etc/nixos/variables.nix # defines config.username and other variables, see https://github.com/typovrak/nixos for more details
    (import "${nixos-htop}/configuration.nix")
  ];
}
```

Once imported, rebuild your system to apply changes
```bash
sudo nixos-rebuild switch
```

## 🎬 Usage

run ```htop``` as your user in a terminal to see the custom layout.

## ❤️ Support

If this module saved you time, please ⭐️ the repo and share feedback.  
You can also support me on ☕ [Buy me a coffee](https://www.buymeacoffee.com/typovrak).

## 📝 License

Distributed under the [MIT license](LICENSE.md).

## 📜 Code of conduct

This project maintains a [code of conduct](.github/CODE_OF_CONDUCT.md) to ensure a respectful, inclusive and constructive community.

## 🛡️ Security

To report vulnerabilities or learn about supported versions and response timelines, please see our [security policy](.github/SECURITY.md).

---

<p align="center"><i>Made with 💜 by typovrak</i></p>

