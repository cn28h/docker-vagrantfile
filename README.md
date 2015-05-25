# Docker Vagrantfile

This is a very basic Vagrantfile that gets you the latest version of Docker
(1.7.0-dev at the time of this writing) on an Ubuntu box. It also installs
emacs and a Dockerfile mode. Once it's up, you should be ready to launch
containers.

Since you'll be installing all your application dependencies through Docker
anyhow, this ought to be enough for basic usage.

To use it, you'll need to install [vagrant](https://www.vagrantup.com/).
Then, simply run:

```
 $ vagrant up
```

Then you can access your box using `vagrant ssh` and start playing with
Docker.

Why might you want this? Well, a few reasons:

* You are running an OS other than Linux and want to develop with Docker
* You don't want to install the development version of Docker locally
* Easy cleanup: just `vagrant destroy` and it's all gone

If you want to access the running services on your VM, the out of the box
comes with config that gives it an IP of 10.0.0.42.

Feel free to take this and use it as a starting point for your own
Vagrantfile that's more tailored to your needs. Contributions are also
welcome.