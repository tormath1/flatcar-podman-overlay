TAG = dev:latest
FLATCAR_VERSION = 3510.2.4
OVERLAY_DIR = /var/lib/portage/podman-overlay
INCLUDE_PASST?=false
DISABLE_PODMAN_SOCKET?=false

podman.raw: container
	docker run --rm -v $(CURDIR):/out $(TAG)

.PHONY: container
container:
	docker build -t $(TAG) --build-arg FLATCAR_VERSION=$(FLATCAR_VERSION) --build-arg DISABLE_PODMAN_SOCKET=$(DISABLE_PODMAN_SOCKET) --build-arg INCLUDE_PASST=$(INCLUDE_PASST) $(TARGET) .


base: TARGET=--target base
base: container
