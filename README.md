# Hostshare

An easy way to share private IP and port with other devices in the network. Quite handy when developing front end applications. 

![hostshare](screenshots/hostshare_demo.png)

## Install
- Download the script into your home directory

`$ curl -o ${HOME}/hostshare.sh https://raw.githubusercontent.com/pierreportal/hostshare/master/hostshare.sh`
- Make script executable

`$ chmod +x ${HOME}/hostshare.sh`
- Source the script inside `.zshrc`

`$ echo "source ${HOME}/hostshare.sh" >> ${HOME}/.zshrc`
- Source `.zshrc`

`$ source ${HOME}/.zshrc`

## Usage:
`$ hostshare -p <PORT> [-s]`
(optional -s option for using https)

