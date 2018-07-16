# UNMAINTAINED

This project is no longer being maintained and is now read-only (archived). Use [microk8s](https://snapcraft.io/microk8s) for a much lighter, faster development kubernetes in-a-snap.

---

# minikube snap packaging

This project builds a [snap](http://snapcraft.io/) package of
[minikube](https://github.com/kubernetes/minikube).

_Note that for strict confinement, this snap depends on a `libvirt` interface,
which is currently proposed into `snapd`, but has not released yet. Until it
has, I'm afraid this isn't quite ready for general consumption._

# Install

## Requirements

- snap and snapd

See [installation instructions](http://snapcraft.io/docs/core/install) for your
platform. snap and snapd come installed on Ubuntu 16.04.

_However, see note above. The necessary libvirt support isn't released yet._

- libvirtd & QEMU/KVM

The snap currently only supports minikube with the KVM driver, which will be
used by default when starting a new VM. Other drivers may be added later.

## Steps

    $ sudo snap install minikube

Will install `minikube` as `/snap/bin/minikube` and `kubectl` as
`/snap/bin/minikube.ctl`.

# Usage

`minikube` and `minikube.ctl` should work as you'd expect.

Note that minikube and kubectl are snap-confined, so will store configuration,
image and state files under `/snap/minikube/...`.

# Known Issues

Some scripts expect `kubectl` in your `$PATH`. It may be helpful to create a
symbolic link called `kubectl` to `/snap/bin/minikube.ctl`.

With `confinement: strict`:
- `minikube dashboard` can't currently open a browser. `minikube dashboard --url` works, however.
- `minikube delete` will remove the VM, but fails to clean up files under `/snap/minikube/...` owned by root.
