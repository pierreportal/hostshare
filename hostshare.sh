#!/bin/zsh

function hostshare {
	unset -v port

	local protocol="http"

	while getopts "sp:" option; do
	
		case $option in
		
			s) protocol="https" ;;
			p) port=$OPTARG ;;
			*)
				echo "Error: Invalid option" >%2 ;;
		esac
	done

	if [ -z "$port" ]; then
		
		echo "$0 - Error - no port specified" >%2
		return 1
	fi

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
----------------------- Serving @ $protocol://$publicIP:$port 👾 -----------------------
 \n\n"
 	qrencode -s 1 -m 1 -t ANSI -o - "${protocol}://${publicIP}:${port}"
	
	echo "\n\nThanks for using Hostshare!\n\n"

}
