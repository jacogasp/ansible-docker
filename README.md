# Ansible Control Plane with Docker

This repository provides a minimal Alpine Docker container with Ansible.

## Build

To build the image run

```bash
docker build . -t ansible
```

## Configure

Configure your `ansible` directory with `ansible.cfg` and `hosts` as you need, for example:

```bash
$ vi ansible/hosts

[linux]
192.168.64.[2:3]

[linux:vars]
ansible_user=ubuntu
```

## Run

Run the container interactively mounting your `ansible` dir to `/etc/ansible` withith the container:

```bash
docker run -it --rm -v /path/to/your/ansible_dir:/etc/ansible ansible
```

Copy the container public SSH key to your hosts. The public key is located at

```bash
/root/.ssh/id_rsa.pub
```

**WARNING**: A new public/private keys pair is generate each time you build the docker image.

## Test

To test your setup, run inside the `ansible` container

```bash
ansible linux -m ping
```
