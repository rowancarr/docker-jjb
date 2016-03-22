IDENTIFIER=docker-jjb
VERSION=latest
REGISTRY=rowancarr
VOLUME = `pwd`

build: clean
	docker run --rm -v ${VOLUME}/src:/src -i rowancarr/docker-fpm:latest -s python -t rpm jenkins-job-builder
	docker run --rm -v ${VOLUME}/src:/src -i rowancarr/docker-fpm:latest -s python -t rpm pyyaml
	docker build -t  ${REGISTRY}/${IDENTIFIER}:${VERSION} .

test:
	docker run --rm -i ${REGISTRY}/${IDENTIFIER}:${VERSION} sh -c 'which jenkins-jobs || echo "[FAIL] - ${IDENTIFIER} not installed" && echo "[PASS] - ${IDENTIFIER} installed"'

deploy:
	docker tag -f ${REGISTRY}/${IDENTIFIER}:${VERSION} ${REGISTRY}/${IDENTIFIER}:latest
	docker push ${REGISTRY}/${IDENTIFIER}:${VERSION}
	docker push ${REGISTRY}/${IDENTIFIER}:latest

clean:
	rm -rf src
