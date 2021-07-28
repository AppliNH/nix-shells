{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell { # This is an object
  
	# ... with properties
	name = "AwesomeShell";
  
	# Init with packages
	buildInputs = with pkgs; [
		vim
		figlet
	];
	
	# Command to run on shell startup
  # ~ equivalent to docker ENTRYPOINT in Dockerfile
	shellHook = 
		''
			echo "Welcome :-)" | figlet;
		'';

}
