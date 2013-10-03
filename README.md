# Redmine Skype Link Plugin

[![Build Status](https://travis-ci.org/Undev/redmine_skype_link.png)](https://travis-ci.org/Undev/redmine_skype_link)
[![Code Climate](https://codeclimate.com/github/Undev/redmine_skype_link.png)](https://codeclimate.com/github/Undev/redmine_skype_link)

This plugin allows using skype links in redmine

## Install

Follow the plugin installation procedure at http://www.redmine.org/wiki/redmine/Plugins.

## Usage

    "Implicit call":skype:skype.test.user.1 => <a href="skype:skype.test.user.1">Implicit call</a>
    "Explicit call":skype:skype.test.user.1?call => <a href="skype:skype.test.user.1?call">Explicit call</a>
    "Chat":skype:skype.test.user.1?chat => <a href="skype:skype.test.user.1?chat">Chat</a>

[Read more about skype links](https://dev.skype.com/skype-uri/reference)
