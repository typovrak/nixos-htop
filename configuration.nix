{ config, pkgs, ... }:

let
	username = config.username;
	group = config.users.users.${username}.group or "users";
	home = config.users.users.${username}.home;
in {
	system.activationScripts.htop = ''
		mkdir -p ${home}/.config
		chown ${username}:${group} ${home}/.config
		chmod 700 ${home}/.config

		rm -rf ${home}/.config/htop
		mkdir ${home}/.config/htop
		chown ${username}:${group} ${home}/.config/htop
		chmod 700 ${home}/.config/htop

		cp ${./htoprc} ${home}/.config/htop/htoprc
		chown ${username}:${group} ${home}/.config/htop/htoprc
		chmod 600 ${home}/.config/htop/htoprc
	'';
	
	environment.systemPackages = with pkgs; [
		htop
	];
}
