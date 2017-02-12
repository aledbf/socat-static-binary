
IMAGE := socat-static-build

all: build run

build:
	docker build -t ${IMAGE} .

run:
	docker run -v ${PWD}/bin:/output ${IMAGE}
