build:
	cd ./srcs/ && docker-compose build

up:
	cd ./srcs/ && docker-compose up

stop:
	cd ./srcs/ && docker-compose stop 

down:
	cd ./srcs/ && docker-compose down 


clean: down
	sudo rm -rf /home/bouchra/data/wordpress/*
	sudo rm -rf /home/bouchra/data/mariadb/*
	sudo docker volume rm srcs_database
	sudo docker volume rm srcs_website

fclean:
	docker system prune -af

