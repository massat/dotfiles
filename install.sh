#!/bin/sh
cd `dirname $0`

# ディレクトリ内の`.`で始まるエントリへのシンボリックリンクを作る
find . -name ".*" -printf '%f\n' | grep -ve "^\.$" | grep -ve "^\.git$" \
| xargs -I{} ln -s $(pwd)/{} $HOME/{}

echo 'alias g="git"' >> ~/.bashrc
