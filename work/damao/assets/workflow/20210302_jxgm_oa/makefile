# wsl debian
GOODS=return_so_goods so_shipment_notice_goods

so_shipment_notice: prepare
	awk '{ print "\"" $1 "\", \"" $NF "\"" }' csv/target/so_shipment_notice.bo.txt

return_so: prepare
	awk '{ print $1 ", " $NF }' $(@).txt | awk '{ gsub(/(\/)*/, ""); gsub(/(\*)/, ""); gsub(/\*/, ""); gsub(/;/, ""); gsub(/\,/, "，"); print }' >> $(@).csv
	iconv $(@).csv -f utf-8 -t GBK > csv/target/$(@).gbk.csv

goods: $(GOODS)
	@echo $(GOODS)

$(GOODS):
	iconv csv/target/$(@)/$(@).table.csv -f utf-8 -t GBK > csv/target/$(@)/$(@).table.gbk.csv
	awk '/private/{ if(NF > 1) { print } }' $(wildcard csv/target/$(@)/*.java) | awk 'NR>1{ print }' > csv/target/$(@)/$(@).bo.temp.txt
	./convert.sh  csv/target/$(@)/$(@).bo.temp.txt
	iconv csv/target/$(@)/$(@).bo.temp.txt.x -f utf-8 -t GBK > csv/target/$(@)/$(@).bo.temp.txt.csv
	
prepare:
	mkdir -p  csv/target