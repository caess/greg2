This is a complete rewrite of Greg, the loot handling addon used by the 
Avarice Alliance on Stormrage-US.  None of the original code has been used (or
at least used intentionally).

The original version was written by Psybie of Carpe Aurum, then maintained 
by Arshes of House Harpell, and then maintained by me since September 2008 
with some contributions from Turquoise of Emeritus.

This addon is tied heavily to ARP (Avarice Raid Points), the DKP-like system
used by the Avarice Alliance.  It will not work for any other system out of
the box and will require some (probably significant) adaptation to make it
work with other point systems.

Usage
-----
See a separate document I haven't written yet.

Testing
-------
Where possible, I have developed this addon using test-driven development
(TDD).  You can find the unit tests in the test/ directory.  To run the
unit tests, you will need lunit (http://www.mroth.net/lunit/ ) and the
lua-wow (http://luaforge.net/projects/lua-wow/ ) version of Lua.  From a
command line, run something like: lunit -i ~/bin/lua-wow test/*.lua

(This expects that lunit's binary is on your path, that you have installed
lua-wow as lua-wow in your user's home directory, that you're currently in the
top-level directory for the addon, and that you're on a unix-like system, e.g.
OS X or Linux.)