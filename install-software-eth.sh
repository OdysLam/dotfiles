#!/usr/bin/env bash

install_software_eth(){
  # Install Foundry
  curl -L https://foundry.paradigm.xyz | bash
  foundryup
  # Install Slither static analyzer
  pip3 install slither-analyzer
  # Install Solidity Version Manager
  cargo install svm-rs
}
