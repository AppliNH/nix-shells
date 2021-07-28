with import <nixpkgs> {};

let	
	my-py-pkg = poetry2nix.mkPoetryEditablePackage {
    	projectDir = ./.;
		python = python36;
		editablePackageSources = {
		    my-py-pkg-name= ./.;
		};
	}; # For using in python scripts

	my-py-cli = poetry2nix.mkPoetryScriptsPackage {
    	projectDir = ./.;
		python = python36;
	}; # For using as cli
	
in mkShell {
  

	name = "MyPyPkg-DevShell";
 	
	buildInputs = with pkgs; [
		vim
		figlet
		python36
		python3Packages.pip
		chromium
		docker
		my-py-pkg
		my-py-cli
	];
	
	shellHook = 
		''
			echo "MyPyPkg" | figlet;
			echo "~ ~ ~ Dev Shell ~ ~ ~"
		'';
	
	PROJECT_WORKDIR = builtins.toString ./.;

}
