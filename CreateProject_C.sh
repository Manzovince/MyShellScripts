#!/bin/bash

################################################################################
# CreateProject_C
#
# This shell provide an operational folder for a 42 project.
# To make it work with your libft, you need to change LIBFT_PATH.
################################################################################

# Check for arg and display usage
[ $# -eq 0 ] && { echo "Usage: ./$0 project_name [description] [-options]"; exit 1; }

################################################################################
# VARIABLES
################################################################################

LIBFT_PATH="/Users/manzovince/Documents/Computer_Science/42HolyGraph/1_Global/42-libft"

################################################################################
# CREATE FOLDERS
################################################################################

echo "Creating folders..."
sleep 0.5

mkdir $1 # Create Project folder
cd $1
mkdir src obj inc lib doc # Create basic folders
ln -s $LIBFT_PATH lib/libft # Symlink of libft
echo "# $1" > README.md # README file added
[ $# -eq 2 ] && { echo "## $2" >> README.md; } # Description for README (optional)

################################################################################
# CREATING FILES
################################################################################

echo "Creating files..."
sleep 0.5

MAIN_PATH="/Users/manzovince/Documents/Computer_Science/42HolyGraph/Project_Model/main.c"
INCLUDE_PATH="/Users/manzovince/Documents/Computer_Science/42HolyGraph/Project_Model/include.h"
MAKEFILE_PATH="/Users/manzovince/Documents/Computer_Science/42HolyGraph/Project_Model/Makefile"

#cp MAIN_PATH ./src/
#cp INCLUDE_PATH ./inc/
#cp MAKEFILE_PATH .

################################################################################
# MAIN
################################################################################

echo $'#include "../inc/include.h"

int		main(int ac, char **av)
{
	ft_putendl("Hello World!");
	if (ac > 1)
	{
		ft_putstr("The number of argument is ");
		ft_putnbr(ac);
		ft_putendl(av[1]);
	}
	return (0);
}' > src/main.c

################################################################################
# INCLUDE
################################################################################

echo $'#ifndef LIB_NAME
# define LIB_NAME

/*
** -------------------------------- LIBRAIRIES ---------------------------------
*/

#include <unistd.h>
#include <stdarg.h>
#include <errno.h>
#include <stdint.h>
#include <stdio.h>
#include "../lib/libft/includes/libft.h"

/*
** --------------------------------- DEFINES -----------------------------------
*/

# define PF_BUFFSIZE		2048
# define MASK(value, mask)	((value & mask) == mask)


/*
** ------------------------------- FLAGS MASK ----------------------------------
*/



/*
** --------------------------------- STRUCTURES --------------------------------
*/



/*
** ------------------------------- MAIN FUNCTIONS ------------------------------
*/



/*
** ------------------------------ BUFFER FUNCTIONS -----------------------------
*/



/*
** ------------------------------- FLAGS FUNCTIONS -----------------------------
*/



/*
** ------------------------------- ERROR FUNCTIONS -----------------------------
*/


#endif
' > inc/include.h

################################################################################
# MAKEFILE
################################################################################

echo $'NAME		=	MyProgram

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
	$(CC) -I. -L./lib/libft/ -lft $(SRC) -o $(NAME)
	mv *.o $(OBJ_PATH)

libft:
	@make -C./lib/libft/

clean:
	$(RM) $(OBJ)

fclean:	clean
	$(RM) $(NAME)

re:	fclean all

norme:
	norminette $(SRC)

.PHONY: all clean fclean re norme
' > Makefile

################################################################################
# END
################################################################################

echo "$1 is ready to launch!"
