NAME		=	MyProgram

SRC_PATH	=	./src
OBJ_PATH	=	./obj
INC_PATH	=	-I./inc
LIB_DIR		=	./lib

SRC_NAME	=	main.c
OBJ_NAME	=	$(SRCS:.c=.o)
LIB_NAME	=	include.h

SRC		=	$(addprefix $(SRC_PATH)/, $(SRC_NAME))
OBJ		=	$(addprefix $(OBJ_PATH), $(OBJ_NAME))

LDFLAGS		=	-L./libft/
LFT			=	-lft
CFLAGS		=	-Wall -Wextra -Werror
CC			=	gcc $(CFLAGS)

all:	$(NAME)

$(NAME):
	$(CC) -I. $(SRC) -o $(NAME)
	mv *.o $(OBJ_PATH)

clean:
	$(RM) $(OBJ)

fclean:	clean
	$(RM) $(NAME)

re:	fclean all

norme:
	norminette $(SRC)

.PHONY: all clean fclean re norme

