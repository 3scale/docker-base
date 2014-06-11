REPO=base
TAG=$(shell git rev-parse --abbrev-ref HEAD)
IMAGE=$(REPO):$(TAG)
REGISTRY=3scale/

build:
	docker build -t $(IMAGE) --rm .
release: build push

push:
	docker tag $(TAG) $(REGISTRY)$(IMAGE)
	docker push $(REGISTRY)$(IMAGE)
