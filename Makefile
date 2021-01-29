IMAGE=
VERSION=

build:
	docker build --cache-from=$(IMAGE):latest \
		--build-arg=BUILDKIT_INLINE_CACHE=1 \
		-t $(IMAGE):$(VERSION) \
		-t $(IMAGE):latest .

push:
	docker push $(IMAGE):$(VERSION)
	docker push $(IMAGE):latest
