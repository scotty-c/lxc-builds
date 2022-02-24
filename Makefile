.PHONY: go rust node k8s ubuntu-vm ubuntu python all
go:
	lxc image rm go || true
	sudo distrobuilder build-lxd -o image.architecture=x86_64 -o image.release=impish -o image.variant=cloud --import-into-lxd="go"  go.yaml

rust:
	lxc image rm rust || true
	sudo distrobuilder build-lxd -o image.architecture=x86_64 -o image.release=impish -o image.variant=cloud --import-into-lxd="rust"  rust.yaml

node:
	lxc image rm node || true
	sudo distrobuilder build-lxd -o image.architecture=x86_64 -o image.release=impish -o image.variant=cloud --import-into-lxd="node"  node.yaml

k8s:
	lxc image rm k8s || true
	sudo distrobuilder build-lxd -o image.architecture=x86_64 -o image.release=focal -o image.variant=cloud --import-into-lxd="k8s"  k8s.yaml	

k8s-vm:
	lxc image rm k8s-vm || true
	sudo distrobuilder build-lxd -o image.architecture=x86_64 -o image.release=impish -o image.variant=cloud --import-into-lxd="k8s-vm" --vm  k8s.yaml

ubuntu-vm:
	lxc image rm ubuntu-vm || true
	sudo distrobuilder build-lxd -o image.architecture=x86_64 -o image.release=impish -o image.variant=cloud --import-into-lxd="ubuntu-vm" --vm  ubuntu.yaml

ubuntu:
	lxc image rm ubuntu || true
	sudo distrobuilder build-lxd -o image.architecture=x86_64 -o image.release=impish -o image.variant=cloud --import-into-lxd="ubuntu" ubuntu.yaml

docker:
	lxc image rm docker || true
	sudo distrobuilder build-lxd -o image.architecture=x86_64 -o image.release=impish -o image.variant=cloud --import-into-lxd="docker" docker.yaml

python:
	lxc image rm python || true
	sudo distrobuilder build-lxd -o image.architecture=x86_64 -o image.release=impish -o image.variant=cloud --import-into-lxd="python" python.yaml

all: go rust node k8s k8s-vm ubuntu-vm ubuntu python
