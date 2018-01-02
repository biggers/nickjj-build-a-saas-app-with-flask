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
