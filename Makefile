# Makefile for Flask course: "build_sass_app_udemy"
# ... also see: Section 6, Lecture 25 (coding challenge)


WAIT_FOR = 5
DC = docker-compose
up:
	${DC} up -d
	sleep ${WAIT_FOR}; ${DC} ps

stop:
	${DC} stop

down:
	${DC} down --volumes --remove-orphans

ps: status
status:
	${DC} ps

LOGS = # --follow
logs:
	${DC} logs ${LOGS}

SVC = --force website
OPTS = # --force-rm --pull
web_build:
	${DC} build ${OPTS} ${SVC}

clean_rmi:
	docker rmi $(docker images -f "dangling=true" -q)

SVC = website
clean: stop
	${DC} rm -v ${SVC}

# -------- 06-creating-a-base-flask-app
# FIX.me - why are app.config "values" of HOST, PORT not being used
run_06:
	workon build_sass_flask; \
	cd 06-creating-a-base-flask-app; \
	export FLASK_APP='snakeeyes.app'; \
	python -m flask run --reload --host 127.0.0.1 --port 5000
