pkgname = presto-fetcher
configname = presto.toml
build: 
	@rm -rf bin
	mkdir bin
	go build  -o ./bin/$(pkgname) ./cmd/$(pkgname)/
debug-build:
	@rm -rf bin
	mkdir bin
	go build  -gcflags "all=-N -l"  -o ./bin/$(pkgname) ./cmd/$(pkgname)/
debug:debug-build
	dlv --listen=:2345 --headless=true --api-version=2 --accept-multiclient exec bin/$(pkgname) -- -c configs/$(configname)
reload:
	ps aux|grep $(pkgname) |grep -v grep |grep -v tail|awk '{print $$2}' |xargs kill -SIGHUP
start: build
	./bin/$(pkgname) -c ./configs/$(configname)
stop:
	ps aux|grep $(pkgname) |grep -v grep |grep -v tail|awk '{print $$2}' |xargs kill -9
pack: build
	@rm -rf build
	mkdir build
	tar zcf build/$(pkgname).tar.gz bin/$(pkgname) configs
.PHONY: help
help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
