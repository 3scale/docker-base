REPO=base
TAG=$(shell git rev-parse --abbrev-ref HEAD)
IMAGE=$(REGISTRY)/$(REPO):$(TAG)
REGISTRY=quay.io/3scale

build:
	docker build -t $(IMAGE) --rm .
release: build push

push:
	docker tag $(TAG) $(IMAGE)
	docker push $(IMAGE)
