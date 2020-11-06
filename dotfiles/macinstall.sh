#!/bin/bash

# Install command-line tools using Homebrew.

# Install homebrew if it is not installed
which brew 1>&/dev/null
if [ ! "$?" -eq 0 ] ; then
	echo "Homebrew not installed. Attempting to install Homebrew"
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	if [ ! "$?" -eq 0 ] ; then
		echo "Something went wrong. Exiting..." && exit 1
	fi
fi

brew update
brew upgrade

# Core Utils
brew install coreutils


# ---------------------------------------------
# Programming Languages and Frameworks
# ---------------------------------------------
# React
# Express
# Socket.io

# NodeJS 
brew install node
# Python 3
brew install pyenv
# Golang
brew install go


# ---------------------------------------------
# Deployment
# ---------------------------------------------

# 
# Webpack

# Docker for containerization
brew install docker

# Kubernetes

# Azure
brew install azure.cli


# ---------------------------------------------
# Database Systems
# ---------------------------------------------
# Postgresql

# MongoDB :D
brew install mongo

# RedisDB
brew install redis


# ---------------------------------------------
# Useful tools
# ---------------------------------------------

# Make requests with awesome response formatting
brew install httpie

# gdb
brew install gdb


# ---------------------------------------------
# Misc
# ---------------------------------------------

# The Fire Code font
# https://github.com/tonsky/FiraCode
# This method of installation is
# not officially supported, might install outdated version
# Change font in terminal preferences
brew tap caskroom/fonts
brew cask install font-fira-code

# My favorite text editor
brew cask install visual-studio-code


# ---------------------------------------------
# Terminal gimmicks xD
# ---------------------------------------------
tmux
fzf
powerline
htop
tree


brew cleanup
