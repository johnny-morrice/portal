# Portal

This is a wrapper round ssh.  It enables a user to forward ports inside another
network into her own machine.

It deals with the case that the remote network gateway only allows access to
certain machines.

## Download

```
git clone https://github.com/johnnymorrice/portal.git
```

## Accessing hidden machines

```

# Forward a port on the gateway to your own machine
you@home$ ./portal/forward.sh gateway.foo.org 36525

Welcome to Foo Gateway!

# Assuming there is a copy of portal installed on the gateway, forward SSH on a
# LAN machine to a port on the gateway machine.  This creates a chain back to your
# local machine.

you@foo$ ./portal/gateway-forward.sh protected.machine.foo.org 36525
```

In another terminal window on your machine

```
ssh localhost -p36525

Welcome to protected.machine.foo.org
```

## Mounting remote filesystems

Assuming your local machine is on the correct network already, `portal/mount.sh`
and `portal/refresh.sh` provide an easy idiom for mounting remote filesystems
over ssh.

```
mkdir another.system.on.lan
./portal/mount.sh another.system.on.lan

ls another.system.on.lan # All your precious remote files!

# If for any reason your connection becomes flaky (although there is probably a
# software cause for the flakiness)
./portal/refresh.sh another.system.on.lan
```

## Requirements for mounting remote filesystems

You will need `sshfs`.

Mac OSX users will need to disable System Integrity Protection before installing
the FUSE driver necessary for `sshfs`.

## Gateway configuration

`portal/gateway-forward.sh expects a usable address to be written into
`$HOME/.dev_machine.txt.

The idea being that developers should forward connections through their own
machine.
