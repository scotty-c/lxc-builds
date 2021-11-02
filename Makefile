.PHONY: go rust node k8s ubuntu-vm ubuntu
go:
	lxc image rm go
	sudo distrobuilder build-lxd -o image.architecture=x86_64 -o image.release=impish -o image.variant=cloud --import-into-lxd="go"  go.yaml

rust:
	lxc image rm rust
	sudo distrobuilder build-lxd -o image.architecture=x86_64 -o image.release=impish -o image.variant=cloud --import-into-lxd="rust"  rust.yaml

node:
	lxc image rm node
	sudo distrobuilder build-lxd -o image.architecture=x86_64 -o image.release=impish -o image.variant=cloud --import-into-lxd="node"  node.yaml

k8s:
	lxc image rm k8s
	sudo distrobuilder build-lxd -o image.architecture=x86_64 -o image.release=focal -o image.variant=cloud --import-into-lxd="k8s"  k8s.yaml	

k8s-vm:
	lxc image rm k8s-vm
	sudo distrobuilder build-lxd -o image.architecture=x86_64 -o image.release=impish -o image.variant=cloud --import-into-lxd="k8s-vm" --vm  k8s.yaml

ubuntu-vm:
	lxc image rm ubuntu-vm
	sudo distrobuilder build-lxd -o image.architecture=x86_64 -o image.release=impish -o image.variant=cloud --import-into-lxd="21.04" --vm  ubuntu.yaml

ubuntu:
	lxc image rm ubuntu
	sudo distrobuilder build-lxd -o image.architecture=x86_64 -o image.release=impish -o image.variant=cloud --import-into-lxd="21.04" ubuntu.yaml
