#!/bin/zsh

function hostshare {
	readonly port=${1:?"You must provide the port"}
	readonly publicIP=$(ipconfig getifaddr en0)
	if [[ "$(which qrencode)" = "qrencode not found" ]]; then
		echo "You need to install a dependency (qrencode) for hostshare to work. Please run 'brew install qrencode'\nDo you want to install it now? (Y/n)"
		read
		case $REPLY in
			[Yy] ) brew install qrencode;;
			[Nn] ) echo "Quit Hostshare.";;
			* ) echo "Invalid input. please type 'y' for yes or 'n' for no";;
		esac
	fi
	echo "\n\n\n
@@@  @@@   @@@@@@    @@@@@@   @@@@@@@   @@@@@@   @@@  @@@   @@@@@@   @@@@@@@   @@@@@@@@
@@@  @@@  @@@@@@@@  @@@@@@@   @@@@@@@  @@@@@@@   @@@  @@@  @@@@@@@@  @@@@@@@@  @@@@@@@@
@@!  @@@  @@!  @@@  !@@         @@!    !@@       @@!  @@@  @@!  @@@  @@!  @@@  @@!
!@!  @!@  !@!  @!@  !@!         !@!    !@!       !@!  @!@  !@!  @!@  !@!  @!@  !@!
@!@!@!@!  @!@  !@!  !!@@!!      @!!    !!@@!!    @!@!@!@!  @!@!@!@!  @!@!!@!   @!!!:!
!!!@!!!!  !@!  !!!   !!@!!!     !!!     !!@!!!   !!!@!!!!  !!!@!!!!  !!@!@!    !!!!!:
!!:  !!!  !!:  !!!       !:!    !!:         !:!  !!:  !!!  !!:  !!!  !!: :!!   !!:
:!:  !:!  :!:  !:!      !:!     :!:        !:!   :!:  !:!  :!:  !:!  :!:  !:!  :!:
::   :::  ::::: ::  :::: ::      ::    :::: ::   ::   :::  ::   :::  ::   :::   :: ::::
 :   : :   : :  :   :: : :       :     :: : :     :   : :   :   : :   :   : :  : :: ::
 \n\n
----------------------- Serving @ http://$publicIP:$port 👾 -----------------------
 \n\n"
 	qrencode -s 1 -m 1 -t ANSI -o - "http://${publicIP}:${port}"
	echo "\n\nThanks for using Hostshare!\n\n"
}
