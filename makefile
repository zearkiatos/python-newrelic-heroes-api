activate:
	source run.sh; activate

install:
	source run.sh; install

run:
	source run.sh; run $(port)

docker-local-up:
	docker compose -f docker-compose.local.yml up -d --build

docker-local-down:
	docker compose -f docker-compose.local.yml down

podman-local-up:
	podman compose -f docker-compose.local.yml up -d

podman-local-down:
	podman compose -f docker-compose.local.yml down