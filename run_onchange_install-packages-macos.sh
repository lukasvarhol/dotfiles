#!/bin/sh

brew install wget python@3.12 openjdk@21 cmake llvm jdtls cmake-language-server basedpyright

# Install Verible Verilog Language Server
if ! command -v verible-verilog-ls >/dev/null 2>&1; then
    VERIBLE_URL=$(curl -s https://api.github.com/repos/chipsalliance/verible/releases/latest | grep macOS | grep browser_download_url | sed 's/.*"browser_download_url": //' | tr -d ' "')
    wget $VERIBLE_URL -O /tmp/verible.tar.gz
    tar -xvzf /tmp/verible.tar.gz -C /tmp/
    sudo mv /tmp/verible-*/bin/* /usr/local/bin/
    rm -rf /tmp/verible*
fi

# Install VHDL_LS 
if ! command -v vhdl_ls >/dev/null 2>&1; then
    VHDL_LS_URL=$(curl -s https://api.github.com/repos/VHDL-LS/rust_hdl/releases/latest | grep vhdl_ls | grep aarch64-apple | grep browser_download_url | sed 's/.*"browser_download_url": //' | tr -d ' "')
    wget $VHDL_LS_URL -O /tmp/vhdl_ls.zip
    unzip -d /tmp/ /tmp/vhdl_ls.zip
    sudo mkdir -p /usr/local/vhdl_ls/
    sudo mv /tmp/vhdl_ls*/* /usr/local/vhdl_ls/
    sudo ln -s /usr/local/vhdl_ls/bin/vhdl_ls /usr/local/bin/vhdl_ls
    rm -rf /tmp/vhdl_ls*
fi

# Install Iosevka font
if [ ! -d "$HOME/Library/Fonts/Iosevka" ]; then
    IOSEVKA_URL=$(curl -s https://api.github.com/repos/be5invis/Iosevka/releases/latest | grep browser_download_url | grep -i ttf | grep "PkgTTF-Iosevka-[0-9]" | sed 's/.*"browser_download_url": //' | tr -d ' "')
    wget $IOSEVKA_URL -O /tmp/iosevka.zip
    unzip /tmp/iosevka.zip -d /tmp/iosevka_fonts/
    mkdir -p ~/Library/Fonts/Iosevka/
    mv /tmp/iosevka_fonts/* ~/Library/Fonts/Iosevka/
    rm -rf /tmp/iosevka*
fi

	

    

