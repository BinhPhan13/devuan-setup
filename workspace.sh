#!/bin/bash
sudo apt install -y git curl
git clone https://github.com/BinhPhan13/dev-workspace
cd dev-workspace

bash core/setup.sh
bash tools/eza.sh
bash tools/nvim.sh

