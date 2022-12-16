#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2018 yqiu <yqiu@f24-suntzu>
#
# Distributed under terms of the MIT license.

# load from autoconfig.yaml
config.load_autoconfig()

# c.tabs.position = "left"
c.completion.shrink = True
c.tabs.padding = {"top": 10, "bottom": 10, "left": 5, "right":5}

# List of URLs of lists which contain hosts to block.  The file can be
# in one of the following formats:  - An `/etc/hosts`-like file - One
# host per line - A zip-file of any of the above, with either only one
# file, or a file   named `hosts` (with any extension).
# Type: List of Url
c.content.blocking.hosts.lists = ['http://someonewhocares.org/hosts/hosts',
        'http://winhelp2002.mvps.org/hosts.txt',
        'https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&mimetype=plaintext',
        'http://www.malwaredomainlist.com/hostslist/hosts.txt',
        'https://raw.githubusercontent.com/ZeroDot1/CoinBlockerLists/master/hosts_browser',]

c.content.headers.user_agent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36"

# set user agent to latest chrome version so I don't get chrome out of date warnings/blockers

c.url.searchengines = {
    "go": "go.robot.car/{}",
    "wiki":  "https://wiki.robot.car/dosearchsite.action?queryString={}",
    "DEFAULT":"https://www.google.com/search?hl=en&q={}"}
# c.url.searchengines = {"DEFAULT":"https://cn.bing.com/search?q={}"}
# c.content.user_stylesheets=['/home/yqiu/sources/solarized-everything-css/css/solarized-all-sites-dark.css']
# c.content.user_stylesheets=['/home/yqiu/.config/qutebrowser/global-dark.css']

config.bind(',f', 'open --tab {primary}', mode='normal')
config.bind("O", "set-cmd-text :open {url:pretty}")
config.bind("T", "set-cmd-text :open -t {url:pretty}")
config.bind("t", "set-cmd-text -s :open -t")
config.bind("J", "tab-prev")
config.bind("K", "tab-next")
config.bind("zi", "zoom-in")
config.bind("zo", "zoom-out")
config.bind("+", "zoom-in")
config.bind("-", "zoom-out")

# Foreground and background color of selected and unselected tabs.
c.colors.tabs.selected.even.fg = "white"
c.colors.tabs.selected.odd.fg = "white"
c.colors.tabs.selected.even.bg = "#253f3f"
c.colors.tabs.selected.odd.bg = "#253f3f"
c.colors.tabs.even.fg = "silver"
c.colors.tabs.odd.fg = "silver"
c.colors.tabs.even.bg = "black"
c.colors.tabs.odd.bg = "black"

# Whether quitting the application requires a confirmation.
# Valid values:
#   - always: Always show a confirmation.
#   - multiple-tabs: Show a confirmation if multiple tabs are opened.
#   - downloads: Show a confirmation if downloads are running
#   - never: Never show a confirmation.
c.confirm_quit = ["downloads"]

# The editor (and arguments) to use for the `open-editor` command. `{}`
# gets replaced by the filename of the file to be edited.
#c.editor.command = ["gnome-terminal", "-e", "nvim '{}'"]

# Enable smooth scrolling for web pages. Note smooth scrolling does not
# work with the `:scroll-px` command.
#c.scrolling.smooth = True

# open new tabs in background (don't auto-follow)
c.tabs.background = True
c.tabs.close_mouse_button = "right"

# default zoom
c.zoom.default = "110%"

c.backend = "webengine"

# additions
config.bind("j", "run-with-count 2 scroll down")
config.bind("k", "run-with-count 2 scroll up")

# tab moving
config.bind(">", "tab-move +")
config.bind("<", "tab-move -")

