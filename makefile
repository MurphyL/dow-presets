# 仅支持 Windows 版本的 make

dev:
	docker run --rm -it -p 3000:3000 -v "%cd%/serve":/usr/murph murphyl/nodejs npm run dev

init:
	docker run --rm -it -v "%cd%":/usr/murph murphyl/nodejs npx create-next-app serve

docs:
	docker run --rm -it -v "%cd%":/usr/murph alpine sh -x /usr/murph/build.sh

build:
	docker run --rm -it -p 3000:3000 -v "%cd%/serve":/usr/murph murphyl/nodejs npm run build