#!/bin/bash
sudo usermod -s $(which zsh) $USER

cd `dirname $0`

# ディレクトリ内の`.`で始まるエントリへのシンボリックリンクを作る
find . -name ".*" -printf '%f\n' | grep -ve "^\.$" | grep -ve "^\.git$" \
| xargs -I{} ln -s $(pwd)/{} $HOME/{}

# load extra configs
cat >> ~/.zshrc << TEXT
for file in \`ls ~/.dotfiles.d/*.conf\`; do
    source \$file
done
TEXT
