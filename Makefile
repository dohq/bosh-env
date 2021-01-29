REPOSITORY=
VERSION=
IMAGE_NAME=$(REPOSITORY):$(VERSION)
LATEST=$(REPOSITORY):latest
CACHE=$(REPOSITORY):cache-latest

build:
	docker build --cache-from=$(CACHE) \
		--build-arg=BUILDKIT_INLINE_CACHE=1 \
		-t $(IMAGE_NAME) \
		-t $(LATEST) .

push:
	docker push $(IMAGE_NAME)
	docker push $(LATEST)
	docker push $(CACHE)

# If necessary, add --target
cache:
	docker build \
		--build-arg=BUILDKIT_INLINE_CACHE=1 \
		-t $(CACHE) .
	docker push $(CACHE)
