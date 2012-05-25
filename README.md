puppet-subsonic
===============

This module will install and configure Subsonic <http://www.subsonic.org>

=== Notes ===
* This module will work on Ubuntu **ONLY**. If you would like to contribute other O/S configuraions, please pull the Git project, modify and contact me at craig[at]cwatson[dot]org with a diff patch.

=== Dependencies ===
* My puppet-apt module (used for adding the GetDebs repo)

=== Usage ===
* Uncomment whicever protocol you don't want to use.
* You can use both, providing you specify different ports.

=== Example ===

subsonic::config { 'some-name':
  http_port  => '4040',
  https_port => '4044',
}
