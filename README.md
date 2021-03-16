# Friday Night Funkin': Foned In
![image](/fonedin.png)

You can play directly in your browser right here: https://phykro.itch.io/fonedin

Please support the official project as well on their itch.io page: https://ninja-muffin24.itch.io/funkin

## Build instructions

### Installing the Required Programs

First you need to install Haxe and HaxeFlixel. 
1. [Install Haxe 4.1.5](https://haxe.org/download/version/4.1.5/) (Only version 4.1.5 works, 4.2.1 fixed the git issue but won't compile)
2. [Install HaxeFlixel](https://haxeflixel.com/documentation/install-haxeflixel/) after downloading Haxe
  a. Run 'haxelib install lime'
  b. Run 'haxelib install openfl'
  c. Run 'haxelib install flixel'
  d. Run 'haxelib run lime setup flixel'
7. Optionally, you can run 'haxelib install flixel-tools' and 'haxelib run flixel-tools setup' to setup your IDE to work with haxe and lime.
8. Run 'haxelib install newgrounds'
9. Download [git-scm](https://git-scm.com/downloads).
10. Run `haxelib git polymod https://github.com/larsiusprime/polymod.git`
11. Run `haxelib git flixel-addons https://github.com/HaxeFlixel/flixel-addons`

### Compiling the Game

1. Open a command line prompt/powershell/terminal window in the root of the game directory. (In Windows, Shift-Right Click > Open Powershell Window Here)
2. Run 'lime build html5' to compile the game, 'lime run html5' to run it, or 'lime test html5' to do both. You can append '-debug' to enter debugging mode, where pressing tilde (~) will open up the console. Appending '-minify' minimizes some Javascript code.
3. Running 'lime run html5' or 'lime test html5' will open the game in a browser tab. Note that some songs like the ones in Week 6 will open a console window in debug mode.    
