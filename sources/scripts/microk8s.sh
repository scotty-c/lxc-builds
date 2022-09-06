 #!/bin/sh
    set -eux
    
    echo "# microk8s..."
    sudo snap install microk8s --classic --channel=1.25
    mkdir -p /home/scott/.kube/
    sudo usermod -a -G microk8s scott
    sudo chown -f -R scott ~/.kube
    sudo microk8s config > /home/scott/.kube/config
    chmod 600 /home/scott/.kube/config
    sudo microk8s.enable dns storage
