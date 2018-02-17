#!/bin/sh
sudo chcon -Rt svirt_sandbox_file_t $PWD
sudo docker run -v $PWD:/workingdir -it neovim nvim workingdir
