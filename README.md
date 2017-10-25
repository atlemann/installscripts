# Ubuntu install scripts

## install-docker.sh

Installs the latest docker tools.

## install-dotnet.sh

Installs dotnet core CLI 2.0.0.

## install-mono.sh

Installs the latest Mono and the F# compiler.

## install-fsharp-devenv.sh

Installs everything needed for F# .NET Core development by invoking:

- install-mono.sh
- install-dotnet.sh
- install-vscode.sh
- install-firacode-font.sh

## install-firacode-font.sh

Prompts you if you want to install the [FiraCode](https://github.com/tonsky/FiraCode) font in your system and enable it in VSCode's user settings file.

## install-nodejs.sh

Installs Node.js 6.x LTS runtime

## install-yarn.sh

Installs the latest Yarn dependency manager

## setup-git.sh

Adds a set of nice Git aliases to the global Git config as well as Git branch info in the terminal.

![image](https://user-images.githubusercontent.com/16226914/32015244-c95b6760-b9c0-11e7-8738-3e3faae891dd.png)

## setup-teamcity-agent.sh

Downloads the TeamCity agent binaries from a given TeamCity server and registers itself to it with the given agent name.