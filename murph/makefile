COMPANY=damao

WORK_DIR=$(CURDIR)/..

start:
	docker run --rm -it --name dow-$(COMPANY) -p 35729:35729 -p 5000:3000 -e company=$(COMPANY) -v $(WORK_DIR)/work/$(COMPANY):/usr/murph/current murphyl/docsify