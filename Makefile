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

tag:
	@git config --local user.email "builds@travis-ci.com"
	@git config --local user.name "Travis CI"
	git tag ${VERSION} -a -m "Generated tag from TravisCI for build ${TRAVIS_BUILD_NUMBER}"
	@git push -q https://${GH_TOKEN}@github.com/${REGISTRY}/${IDENTIFIER} --tags
	@git config --local --unset user.email
	@git config --local --unset user.name

deploy:
	package_cloud push --skip-errors rowancarr/rpm/el/7 src/*

clean:
	rm -rf src
