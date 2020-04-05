FORCE_REBUILD ?= 0
BUILD ?= latest
JITSI_REPO ?= jitsi
PUBLISH_REPO ?= tellifon

BUILD_ARGS := --build-arg JITSI_REPO=$(JITSI_REPO)
ifeq ($(FORCE_REBUILD), 1)
  BUILD_ARGS := $(BUILD_ARGS) --no-cache
endif

release: tag push

build:
	docker build $(BUILD_ARGS) -t $(PUBLISH_REPO)/web .

tag:
	docker tag $(PUBLISH_REPO)/web:latest $(PUBLISH_REPO)/web:$(BUILD)

push:
	docker push $(PUBLISH_REPO)/web:latest
	docker push $(PUBLISH_REPO)/web:$(BUILD)

.PHONY: build tag push release
