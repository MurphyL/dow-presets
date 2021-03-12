OFFICE?=damao

SERVE_PORT?=5000

IMAGE_PATH=/usr/murph

DOCSIFY_FILES=$(foreach file, $(wildcard $(CURDIR)/docsify/*), -v $(file):$(IMAGE_PATH)/docs/$(notdir $(file)))

ROUTERS=$(foreach name, work murph, -v $(CURDIR)/$(name):$(IMAGE_PATH)/docs/$(name))

start:
	docker run -i --name dow-$(OFFICE) -p $(SERVE_PORT):5000 $(DOCSIFY_FILES) $(ROUTERS) murphyl/docsify

restart:
	@docker restart dow-$(OFFICE)
	@echo restart successed!
