
K8S_VERSION=v1.3.0
MINIKUBE_VERSION=v0.24.1
DOCKER_MACHINE_KVM_VERSION=v0.7.0

BINS=bin/kubectl bin/minikube bin/docker-machine-driver-kvm2

.PHONY: all
all: snap

.PHONY: snap
snap: $(BINS)
	snapcraft

bin/kubectl: | bin
	curl -Lo $@ https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
	chmod +x $@

bin/minikube: | bin
	curl -Lo $@ https://storage.googleapis.com/minikube/releases/$(MINIKUBE_VERSION)/minikube-linux-amd64
	chmod +x $@

bin/docker-machine-driver-kvm2: | bin
	curl -Lo $@ https://storage.googleapis.com/minikube/releases/latest/docker-machine-driver-kvm2
	chmod +x $@

bin:
	mkdir $@

.PHONY: clean
clean:
	snapcraft clean

.PHONY: bin-clean
bin-clean:
	$(RM) $(BINS)

