# dotfiles

Repo for my dotfiles.

## Requirements

Requires installation of [Golang](https://go.dev).

## Mouseless

Requires adding the keyboard /dev/input locations, to do this, check
```
ls /dev/input/by-id/*kbd*
ls /dev/input/by-path/*kbd*
```
and add to `mouseless/config.yaml` under devices.

## Installation

Install simply using 
```
sh install.sh
```
