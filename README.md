mean-vagrant
============

My own version of a vagrant machine with nodejs, npm & mongodb installed. [Why vagrant?](http://docs.vagrantup.com/v2/why-vagrant/index.html).

Index
-----

* [Project Structure](#structure)
* [Requirements](#requirements)
* [Installation](#instructions)
* [Contributions](#contributions)
* [Changelog](#changelog)

<a name="structure">Project Structure</a>
---------------------------------------
* **puppet/** - Puppet workspace
	* **hieradata/**
		* **common.yaml** - configuration file
	* **manifests/**
		* **default.pp** - start point for the provisioner
	* **modules/**
		* [**git/**](https://github.com/puppetlabs/puppetlabs-git)
		* [**mongodb/**](https://github.com/puppetlabs/puppetlabs-mongodb)
		* [**nodejs/**](https://github.com/willdurand/puppet-nodejs)
		* [**ohmyzsh/**](https://github.com/acme/puppet-acme-oh-my-zsh)
		* **setup/**
			* **manifests/**
				* **init.pp** - routine to follow
		* [**stdlib/**](https://github.com/puppetlabs/puppetlabs-stdlib)
		* [**wget/**](https://github.com/maestrodev/puppet-wget)
		* **hiera.yaml** - Start point for hiera
* **setup/** - Shell scripts
	* **cachefilesd.sh**
* **.editorconfig**
* **.gitignore**
* **LICENSE.md**
* **README.md**
* **Vagrantfile**

<a name="requirements">Requirements</a>
---------------------------------------

1. First of all, clone the repo recursively.
```bash
$ git clone --recursive https://github.com/TonyMtz/mean-vagrant.git
```

2. In case you haven't already, you will need to setup both [Vagrant](http://www.vagrantup.com/downloads.html) and [Virtualbox](https://www.virtualbox.org/wiki/Downloads). The installer will automatically add `vagrant` to your system path so that it is available in terminals.

3. Add the vagrant box ubuntu trusty. This will take a few minutes.
```bash
$ vagrant box add ubuntu/trusty64
```

4. If you haven't already, [Generate your SSH key](http://git-scm.com/book/es/v2/Git-on-the-Server-Generating-Your-SSH-Public-Key).

At the end your project structure must match with the one [described in this guide](#structure).

<a name="instructions">Instructions</a>
---------------------------------------

1. Boot your vagrant environment for the first time. This will take a few minutes more. The script will provision the machine automatically.
```bash
mean-vagrant$ vagrant up
```

2. Log in. If it asks for a password, you didn't set your ssh key well.
```bash
mean-vagrant$ vagrant ssh
```

3. You're done! **Start hacking!**

<a name="contributions">Contributions</a>
-----------------------------------------
Anyone can contribute to this project adding code, reporting issues, using it in your projects, etc.

**Rules to add code:**

- Fork this project
- Make your changes
- Pull fork request

If you want to make a favor, please let me know if you use this for your project :smile:

<a name="changelog">Changelog</a>
---------------------------------

## v0.1 - 04/26/2015
- Software included: git, mongodb, nodejs, npm, stdlib & wget.
- Packages: bower, node-gyp, nodemon
