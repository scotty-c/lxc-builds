ARCH := $(shell uname -i)

ifeq ($(ARCH),x86_64)
        URL += http://archive.ubuntu.com/ubuntu
endif
ifeq ($(ARCH),aarch64)
        URL += http://ports.ubuntu.com/ubuntu-ports
endif

.PHONY: go rust k8s ubuntu-vm ubuntu python all vm
go:
	incus image rm go || true
	sudo distrobuilder build-incus -o image.architecture=$(ARCH) -o image.release=jammy -o image.variant=cloud -o source.url=$(URL) --import-into-incus="go"  go.yaml

rust:
	incus image rm rust || true
	sudo distrobuilder build-incus -o image.architecture=$(ARCH) -o image.release=jammy -o image.variant=cloud -o source.url=$(URL) --import-into-incus="rust"  rust.yaml

k8s:
	incus image rm k8s || true
	sudo distrobuilder build-incus -o image.architecture=$(ARCH) -o image.release=jammy -o image.variant=cloud -o source.url=$(URL) --import-into-incus="k8s"  k8s.yaml	

k8s-vm:
	incus image rm k8s-vm || true
	sudo distrobuilder build-incus -o image.architecture=$(ARCH) -o image.release=jammy -o image.variant=cloud -o source.url=$(URL) -o targets.incus.vm.size=8294967296  --import-into-incus="k8s-vm" --vm  k8s.yaml

ubuntu-vm:
	incus image rm ubuntu-vm || true
	sudo distrobuilder build-incus -o image.architecture=$(ARCH) -o image.release=jammy -o image.variant=cloud -o source.url=$(URL) --import-into-incus="ubuntu-vm" --vm  ubuntu.yaml

ubuntu:
	incus image rm ubuntu || true
	sudo distrobuilder build-incus -o image.architecture=$(ARCH) -o image.release=jammy -o image.variant=cloud -o source.url=$(URL) --import-into-incus="ubuntu" ubuntu.yaml

docker:
	incus image rm docker || true
	sudo distrobuilder build-incus -o image.architecture=$(ARCH) -o image.release=jammy -o image.variant=cloud -o source.url=$(URL) --import-into-incus="docker" docker.yaml

docker-vm:
	incus image rm docker-vm || true
	sudo distrobuilder build-incus -o image.architecture=$(ARCH) -o image.release=jammy -o image.variant=cloud -o source.url=$(URL) --import-into-incus="docker-vm" --vm  docker.yaml

python:
	incus image rm python || true
	sudo distrobuilder build-incus -o image.architecture=$(ARCH) -o image.release=jammy -o image.variant=cloud -o source.url=$(URL) --import-into-incus="python" python.yaml

ecs:
	incus image rm ecs || true
	sudo distrobuilder build-incus -o image.architecture=$(ARCH) -o image.release=jammy -o image.variant=cloud -o source.url=$(URL) --import-into-incus="ecs" ecs.yaml

ecs-vm:
	incus image rm ecs-vm || true
	sudo distrobuilder build-incus -o image.architecture=$(ARCH) -o image.release=jammy -o image.variant=cloud -o source.url=$(URL) --import-into-incus="ecs-vm" --vm ecs.yaml

nerd-vm:
	incus image rm nerd-vm || true
	sudo distrobuilder build-incus -o image.architecture=$(ARCH) -o image.release=jammy -o image.variant=cloud -o source.url=$(URL) --import-into-incus="nerd-vm" --vm nerdctl.yaml	

all: go rust k8s ubuntu python docker ecs

vm: k8s-vm ubuntu-vm docker-vm
