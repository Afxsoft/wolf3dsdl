# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aouloube <aouloube@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/10/19 15:09:15 by aouloube          #+#    #+#              #
#    Updated: 2016/10/20 12:00:26 by aouloube         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


.PHONY: all, fclean, clean, re

NAME = wolf3d

CC = gcc

LIB = libft/libft.a

FLAG = -Wall -Wextra -Werror -O3

LIBGRPH = /Users/aouloube/.brew/lib -lSDL2

INCLUDE = /Users/aouloube/.brew/include/SDL2

INC = wolf3dl.h

OBJ =  wolf3d.o

all: $(NAME)

$(NAME): $(LIB) $(OBJ)
	@$(CC) $(FLAG) $(OBJ) $(LIB) -o $(NAME) $(addprefix -I ,$(INCLUDE)) -L $(LIBGRPH)

$(LIB):
	@make -C libft/
	@echo "\033[33;34m |*******************************| \033[33;0m"
	@echo "\033[33;34m |*            WOLF3D           *| \033[33;0m"
	@echo "\033[33;34m |*******************************| \033[33;0m"
	@echo "\033[33;34m |*            GCC       OK [✓] *| \033[33;0m"
	@echo "\033[33;34m |*            AR RC     OK [✓] *| \033[33;0m"
	@echo "\033[33;34m |*                            	*| \033[33;0m"
	@echo "\033[33;34m |* =======  COMPLETED 😎 ====  *| \033[33;0m"
	@echo "\033[33;34m |*                             *| \033[33;0m"
	@echo "\033[33;34m |*******************************| \033[33;0m \n"

%.o : %.c $(INC)
	@$(CC) -c $(FLAG) $< -o $@

clean:
	@rm -f $(OBJ)
	@echo "\033[33;34m |*******************************| \033[33;0m"
	@echo "\033[33;34m |*       WOLF3D - CLEAN        *| \033[33;0m"
	@echo "\033[33;34m |*******************************| \033[33;0m"
	@echo "\033[33;34m |*                             *| \033[33;0m"
	@echo "\033[33;34m |* =======  ALL CLEAN  🚮 == = *| \033[33;0m"
	@echo "\033[33;34m |*                             *| \033[33;0m"
	@echo "\033[33;34m |*******************************| \033[33;0m \n"

fclean: clean
	@make fclean -C libft/
	@rm -rf $(NAME)

re: fclean all
