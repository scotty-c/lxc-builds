.PHONY: go rust node
go:
	sudo distrobuilder build-lxd -o image.architecture=x86_64 -o image.release=impish -o image.variant=cloud --import-into-lxd="go"  go.yaml

rust:
	sudo distrobuilder build-lxd -o image.architecture=x86_64 -o image.release=impish -o image.variant=cloud --import-into-lxd="rust"  rust.yaml

node:
	sudo distrobuilder build-lxd -o image.architecture=x86_64 -o image.release=impish -o image.variant=cloud --import-into-lxd="node"  node.yaml

ubuntu-vm:
	sudo distrobuilder build-lxd -o image.architecture=x86_64 -o image.release=focal -o image.variant=cloud --import-into-lxd="21.04" --vm  ubuntu.yaml

