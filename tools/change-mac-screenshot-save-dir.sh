#!/bin/sh

# mac のスクリーンショットの保存先を変更する

DIR="screenshot"

if [ ! -d "$HOME/$DIR" ]; then
	mkdir "$DIR"
fi

defaults write com.apple.screencapture location "$HOME/$DIR"

echo "スクリーンショットの保存先を変更しました。"
defaults read com.apple.screencapture location

