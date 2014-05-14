REPO=base
TAG=trusty
IMAGE=$(REPO):$(TAG)
REGISTRY=3scale/

build:
	docker build -t $(IMAGE) --rm .
release: build push

push:
	docker tag $(TAG) $(REGISTRY)$(IMAGE)
	docker push $(REGISTRY)$(IMAGE)
