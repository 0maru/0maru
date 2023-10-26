#!/bin/sh

# mac のスクリーンショットの保存先を変更する

DIR="$HOME/screenshot"

if [ ! -d "$DIR" ]; then
	mkdir "$DIR"
	echo "ディレクトリを作成しました"
fi

defaults write com.apple.screencapture location "$DIR"

echo "スクリーンショットの保存先を変更しました。"
defaults read com.apple.screencapture location

