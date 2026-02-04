.PHONY: docker-build docker-run build clean

IMAGE_NAME = facile:latest
CONTAINER_NAME = builder

docker-build:
	docker build -t $(IMAGE_NAME) .

docker-run: docker-build
	docker run --name $(CONTAINER_NAME) -i $(IMAGE_NAME)

build:
	sh script/generate.sh

clean:
	rm -rf output tmp
	docker container rm $(CONTAINER_NAME) || true

inside: clean docker-run
	mkdir -p tmp
	docker cp $(CONTAINER_NAME):/work/output/main.pdf ./tmp/book.pdf
