REPO=base
TAG=$(REPO):precise
REGISTRY=3scale/

release: build push

push:
	docker tag $(TAG) $(REGISTRY)$(TAG)
	docker push $(REGISTRY)$(REPO)

build:
	docker build -t $(TAG) -rm .
