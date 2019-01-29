# Makefile for Flask course: "build_sass_app_udemy"
# ... also see: Section 6, Lecture 25 (coding challenge)


WAIT_FOR = 5
DC = docker-compose
DCF = docker-compose -f docker/docker-compose-dev.yml

SVC = --force website
OPTS = # --force-rm --pull

## ---- DEV targets

run_app:
	python -m flask run --reload --host 0.0.0.0 --port 5000

# Copying, because '../' symlinks won't work
requirements.txt:
	cp -pav ../Makefile .
	cp -pav ../docker .
	cp -pav ../requirements.txt .

build_dev: requirements.txt
	${DCF} build ${OPTS} ${SVC}

up:
	${DCF} up -d
	sleep ${WAIT_FOR}; ${DCF} logs

stop:
	${DCF} stop

down:
	${DCF} down --volumes --remove-orphans

ps: status
status:
	${DCF} ps

LOGSF = # --follow
logs:
	${DCF} logs ${LOGSF}

clean_rmi:
	docker rmi $$(docker images -f "dangling=true" -q)

SVC = website
clean: stop
	${DCF} rm -v ${SVC}

# -------- 06-creating-a-base-flask-app
# FIX.me - why are app.config "values" of HOST, PORT not being used
VENV=${HOME}/.virtualenvs/build_sass_flask
run_06:
	. ${VENV}/bin/activate; \
	cd 06-creating-a-base-flask-app; \
	export FLASK_APP='snakeeyes.app'; \
	python -m flask run --reload --host 127.0.0.1 --port 5000

