#!/bin/sh

setxkbmap -option ctrl:nocaps
dconf write /org/compiz/integrated/show-hud '["&lt;Alt&gt;"]'
