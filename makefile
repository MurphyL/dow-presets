WORK_DIR=$(CURDIR)

OFFICE?=damao

SERVE_PORT?=5000

start:
	docker run -i --name dow-$(OFFICE) -e OFFICE=$(OFFICE) -p $(SERVE_PORT):5000 -v $(WORK_DIR)/work/$(OFFICE):/usr/murph/$(OFFICE) murphyl/docsify

docs:
	docker run --rm -it -v $(WORK_DIR):/usr/murph alpine sh -x /usr/murph/build.sh

build:
	docker run --rm -it -v $(WORK_DIR)/serve:/usr/murph murphyl/nodejs npm run build

