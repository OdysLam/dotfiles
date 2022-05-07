#!/usr/bin/env bash
set -e

source ./install-software-mac.sh
source ./install-software-eth.sh
source ./sync.sh

message() {

    echo
    echo -----------------------------------------------------------------------------
    echo -e "$@"
    echo -----------------------------------------------------------------------------
    echo
}
welcome="
 _______________________________
< Welcome to Odysseas' dotfiles >
 -------------------------------
    \
     \
              .,-:;//;:=,
          . :H@@@MM@M#H/.,+%;,
       ,/X+ +M@@M@MM%=,-%HMMM@X/,
     -+@MM; $M@@MH+-,;XMMMM@MMMM@+-
    ;@M@@M- XM@X;. -+XXXXXHHH@M@M#@/.
  ,%MM@@MH ,@%=            .---=-=:=,.
  =@#@@@MX .,      WE      -%HX$$%%%+;
 =-./@M@M$         DO       .;@MMMM@MM:
 X@/ -$MM/        WHAT        .+MM@@@M$
,@M@H: :@:         WE         . =X#@@@@-
,@@@MMX, .        MUST        /H- ;@M@M=
.H@@@@M@+,      BECAUSE       %MM+..%#$.
 /MMMM@MMH/.       WE         XM@MH; =;
  /%+%$XHH@$=     CAN      , .H@@@@MX,
   .=--------.           -%H.,@@@@@MX,
   .%MM@@@HHHXX$$$%+- .:$MMX =M@@MM%.
     =XMMM@MM@MM#H;,-+HMM@M+ /MMMX=
       =%@M@M#@$-.=$@MM@@@M; %M%=
         ,:+$+-,/H#MMMMMMM@= =,
               =++%%%%+/:-.
"
message "$welcome"
while getopts 'ad' OPTION; do
  case "$OPTION" in
    a) install="all"
    d) install="dotfiles"
    ?) echo "print_usage"
done

if [[ $install == "all" ]]; then

  if [[ $OSTYPE == 'darwin'* ]]; then
    message "macOS detected. Installating macOS software & apps"
    if ! [ -x "$(which brew)" ]; then
      message "Installing brew"
      /usr/bin/ruby -e \
        "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    install_software_mac
  fi

  message "Installing Ethereum development toolchain"
  install_software_eth

  message "Installing Rust toolchain"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
elif [[ $install == "dotfiles" ]]; then
  message "Installing dotfiles"
  message "Please visit ~/.zsh/zsh_secrets and populate your API keys"
  echo -e "export BALENA_TOKEN=\nexport ETHERSCAN_API_KEY\nexport ETH_RPC_URL=" > ~/.zsh/zsh_secrets
  sync local
fi
