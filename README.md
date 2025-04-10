# nixos-htop

nixos-htop = fetchGit {
	url = "https://github.com/typovrak/nixos-htop.git";
	ref = "main";
};

(import "${nixos-htop}/configuration.nix")
