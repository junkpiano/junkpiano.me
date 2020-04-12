#!/bin/bash

current_dir=${PWD}

echo "publish on my server..."
hugo --gc --minify
git add .
git commit -m "Update blog"
git push origin master

echo "publish on github page..."

mv $current_dir/public $current_dir/public.bak
git clone https://github.com/junkpiano/junkpiano.github.io.git $current_dir/public 
hugo --gc --minify --config config_github.toml
cd $current_dir/public
git add .
git commit -m "Update blog"
git push origin master

cd $current_dir
rm -rf $curret_dir/public