# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: llefranc <llefranc@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/04 11:24:58 by llefranc          #+#    #+#              #
#    Updated: 2021/01/27 12:40:01 by llefranc         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		=	containers_test
CC			=	clang++
FLAGS		=	-g -fsanitize=address -Wall -Wextra -Werror -std=c++98

SRCS		=	main.cpp includes_and_utils/utils.cpp

HEADER_INC	=	Bob_test.hpp print_type.hpp tester.hpp stl_like.hpp
PATH_INC	=	includes_and_utils/

HEADER_TEST	=	ContainerCreate.hpp vector_tests.hpp list_tests.hpp
PATH_TEST	=	each_tests/
				
OBJS		=	$(SRCS:.cpp=.o)

all		: 	$(NAME)

$(NAME)	:	$(OBJS)
			@$(CC) -o $(NAME) $(FLAGS) $(OBJS)

$(OBJS)	:	$(addprefix $(PATH_CON), $(HEADER_CON)) $(addprefix $(PATH_TEM), $(HEADER_TEM)) \
			$(addprefix $(PATH_ITE), $(HEADER_ITE)) $(addprefix $(PATH_TEST), $(HEADER_TEST)) \
			$(addprefix $(PATH_INC), $(HEADER_INC))

clean	:	
				@rm -rf $(OBJS)

fclean	:	clean
				@rm -rf $(NAME)

re		:	fclean all

.PHONY	:	all clean fclean re

%.o		:	%.cpp
			@$(CC) $(FLAGS) -o $@ -c $<
# for creating .o with flags