{ pkgs ? import <nixpkgs> { } }:


# Custom scripts : 
let
	myScript = pkgs.writeScriptBin "sayHello" ''
		echo "Hello" | figlet
	'';
	strasbourgMeteo = pkgs.writeScriptBin "stras-meteo" ''
    curl wttr.in/strasbourg
	'';

# ^
# by using "sayHello" cmd inside the nix-shell
# it will execute the following script


in pkgs.mkShell { # This is an object
  

	name = "AdvancedShell";
  
	
	buildInputs = with pkgs; [
		vim
		figlet
		myScript # Load shell with custom scripts
		strasbourgMeteo
	];
	
	shellHook = 
		''
			echo "Advanced" | figlet;
		'';

}
