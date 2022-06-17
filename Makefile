ARCH := $(shell uname -i)

ifeq ($(ARCH),x86_64)
        URL += http://archive.ubuntu.com/ubuntu
endif
ifeq ($(ARCH),aarch64)
        URL += http://ports.ubuntu.com/ubuntu-ports
endif

.PHONY: go rust node k8s ubuntu-vm ubuntu python spin nomad all vm
go:
	lxc image rm go || true
	sudo distrobuilder build-lxd -o image.architecture=$(ARCH) -o image.release=jammy -o image.variant=cloud -o source.url=$(URL) --import-into-lxd="go"  go.yaml

rust:
	lxc image rm rust || true
	sudo distrobuilder build-lxd -o image.architecture=$(ARCH) -o image.release=jammy -o image.variant=cloud -o source.url=$(URL) --import-into-lxd="rust"  rust.yaml

node:
	lxc image rm node || true
	sudo distrobuilder build-lxd -o image.architecture=$(ARCH) -o image.release=jammy -o image.variant=cloud -o source.url=$(URL) --import-into-lxd="node"  node.yaml

k8s:
	lxc image rm k8s || true
	sudo distrobuilder build-lxd -o image.architecture=$(ARCH) -o image.release=jammy -o image.variant=cloud -o source.url=$(URL) --import-into-lxd="k8s"  k8s.yaml	

k8s-vm:
	lxc image rm k8s-vm || true
	sudo distrobuilder build-lxd -o image.architecture=$(ARCH) -o image.release=jammy -o image.variant=cloud -o source.url=$(URL) --import-into-lxd="k8s-vm" --vm  k8s.yaml

ubuntu-vm:
	lxc image rm ubuntu-vm || true
	sudo distrobuilder build-lxd -o image.architecture=$(ARCH) -o image.release=jammy -o image.variant=cloud -o source.url=$(URL) --import-into-lxd="ubuntu-vm" --vm  ubuntu.yaml

ubuntu:
	lxc image rm ubuntu || true
	sudo distrobuilder build-lxd -o image.architecture=$(ARCH) -o image.release=jammy -o image.variant=cloud -o source.url=$(URL) --import-into-lxd="ubuntu" ubuntu.yaml

docker:
	lxc image rm docker || true
	sudo distrobuilder build-lxd -o image.architecture=$(ARCH) -o image.release=jammy -o image.variant=cloud -o source.url=$(URL) --import-into-lxd="docker" docker.yaml

docker-vm:
	lxc image rm docker-vm || true
	sudo distrobuilder build-lxd -o image.architecture=$(ARCH) -o image.release=jammy -o image.variant=cloud -o source.url=$(URL) --import-into-lxd="docker-vm" --vm  docker.yaml

python:
	lxc image rm python || true
	sudo distrobuilder build-lxd -o image.architecture=$(ARCH) -o image.release=jammy -o image.variant=cloud -o source.url=$(URL) --import-into-lxd="python" python.yaml

spin:
	lxc image rm spin || true
	sudo distrobuilder build-lxd -o image.architecture=$(ARCH) -o image.release=jammy -o image.variant=cloud -o source.url=$(URL) --import-into-lxd="spin" spin.yaml

nomad:
	lxc image rm nomad || true
	sudo distrobuilder build-lxd -o image.architecture=$(ARCH) -o image.release=jammy -o image.variant=cloud -o source.url=$(URL) --import-into-lxd="nomad" nomad.yaml



all: go rust node k8s ubuntu python docker spin

vm: k8s-vm ubuntu-vm docker-vm
