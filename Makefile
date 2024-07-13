name = Inception

all:
	@printf "Launch configuration ${name}...\n"
	@mkdir -p /home/mbelouar/data/wordpress
	@mkdir -p /home/mbelouar/data/mariadb
	@docker-compose -f ./srcs/docker-compose.yml up -d


build:
	@printf "Building configuration ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	@printf "Stopping configuration ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml down

re:	down
	@printf "Rebuild configuration ${name}...\n"
	@mkdir -p /home/mbelouar/data/wordpress
	@mkdir -p /home/mbelouar/data/mariadb
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

clean: down
	@printf "Cleaning configuration ${name}...\n"
	@docker system prune -a
	@sudo rm -rf /home/mbelouar/data/*

fclean:
	@printf "Total clean of all configurations docker\n"
	@docker-compose -f ./srcs/docker-compose.yml down
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@sudo rm -rf /home/mbelouar/data/*

.PHONY : all build down re clean fclean