# Redmine Skype Link Plugin

[![Build Status](https://travis-ci.org/Undev/redmine_skype_link.png)](https://travis-ci.org/Undev/redmine_skype_link)
[![Code Climate](https://codeclimate.com/github/Undev/redmine_skype_link.png)](https://codeclimate.com/github/Undev/redmine_skype_link)

This plugin allows using Skype URIs in Redmine. 

Skype URIs provide a simple way of initiating Skype calls and chats directly from Redmine. For a Skype URI to work, the Skype client must be installed on the user's device. Clicking a Skype URI launches the Skype client and initiates a call to or a chat with the selected contact.

## Installation

*These installation instructions are based on Redmine 2.x. For instructions for Redmine 1.x, see [Redmine wiki](http://www.redmine.org/projects/redmine/wiki/Plugins).*

1. To install the plugin
    * Download the .ZIP archive, extract files and copy the plugin directory into *#{REDMINE_ROOT}/plugins*.
    
    Or

    * Change you current directory to your Redmine root directory:  

            cd {REDMINE_ROOT}
 
      Copy the plugin from GitHub using the following command:

            git clone https://github.com/Undev/redmine_skype_link.git plugins/redmine_skype_link

2. Update the Gemfile.lock file by running the following commands:  

         rm Gemfile.lock  
         bundle install

3. Restart Redmine.

Now you should be able to see the plugin in **Administration > Plugins**.

## Usage

To add a Skype URI to Redmine, specify the link text and the Skype contact using the following syntax:

    "Link text":skype:<skype_contact> 

The plugin enables you to add Skype URIs to initiate:

* Implicit call  
  Type **"Implicit call":skype:skype.test.user.1** into a field where you want to add a Skype URI.  
  This command will be transformed into the following link: \<a href="skype:skype.test.user.1">Implicit call\</a>.  
  Clicking the link will start a Skype call without additional parameters.
* Explicit call  
  Type **"Explicit call":skype:skype.test.user.1?call** into a field where you want to add a Skype URI.  
  This command will be transformed into the following link: \<a href="skype:skype.test.user.1?call">Explicit call\</a>.  
  You can also specify additional parameters for explicit calls, e.g. a conference topic. For details, see [Skype URI API reference](http://msdn.microsoft.com/en-us/library/office/dn745882).
* Video call  
  Type **"Video call":skype:skype.test.user.1?call&video=true** into a field where you want to add a Skype URI.  
  This command will be transformed into the following link: \<a href="skype:skype.test.user.1?call&video=true">Video call\</a>.  
  Clicking the link will start a video call, if a local webcam is available.
* Chat  
  Type **"Chat":skype:skype.test.user.1?chat** into a field where you want to add a Skype URI.  
  This command will be transformed into the following link: \<a href="skype:skype.test.user.1?chat">Chat\</a>.  
  Clicking the link will start a chat with the selected contact.

Clicking a Skype link in Redmine will:

* Prompt the user about launching the Skype client.
* Launch or switch focus to the Skype client.
* Open a confirmation dialog to authorize a call.
* Initiate an audio call, a video call or a chat with the specified Skype user.

For more information about functionality, options, and syntax of each supported Skype URI, see [Skype URI API reference](http://msdn.microsoft.com/en-us/library/office/dn745882).

## License

Copyright (c) 2014 Undev

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
