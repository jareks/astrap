Devstrap
========
An elegant way to setup your development environment.

AStrap is a collection of Ansible based roles to easy setup your machine. It's been designed for Ubuntu and at the moment it doesn't support any other distribution.
It is recommended to install AStrap into ~/astrap which generates all your local configs to ~/astrap/local

Warning
-------
This is Alpha version of software - it has not been thoroughly tested and might result in misconfiguration, data loss and other harm. 
You should review code before executing it and run ansible in check/diff mode first to identify changes.

Conventions
-----------
1. Auto source all bash files matching: ~/.bash_ext*
2. Dotfiles are installed into ~/astrap/local and symlinked to required location.
   It is recommended to use a source control software for ~/astrap/local dir to track changes.
3. You can configure installed software in `host_vars/localhost/main.yml` file  

Running
-------

```
ansible-playbook -i localhost development.yml --ask-sudo-pass -CD
```


License
-------
Copyright (C) 2016 Jarek Skrzypek

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

