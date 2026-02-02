.PHONY: docker-build docker-run build clean

IMAGE_NAME = latex-kdp:latest

docker-build:
	docker build -t $(IMAGE_NAME) .

docker-run: docker-build
	docker run --rm -v $$(pwd):/work $(IMAGE_NAME)

build:
	sh build_in_container.sh

clean:
	rm -rf output
