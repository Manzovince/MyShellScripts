#!/bin/bash

################################################################################
# CreateProject42
#
# This shell provide an operational folder for a 42 project.
# To make it work with your libft, you need to change LIBFT_PATH.
#
# vmanzoni
################################################################################

################################################################################
# BASIC CHECKS
################################################################################

[ $# -eq 0 ] && { echo -e "################################################################################
#                               CreateProject42                                #
#        This shell provide an operational folder for a 42 project.            #
################################################################################

		\033[1;37mUsage: ./CreateProject42 project_name [-options]\033[0m

project_name:
	Name of your project (used for foldername).

[-options]:
	[-model /your/template/file/path/]: Use your Project Template.
	[-libft /your/libft/file/path/]: Use your Libft.
	[-desc 'Your description of the project here']: Added to README.md

More details in the code..."; exit 1; }

################################################################################
# VARIABLES
################################################################################

PROJECT_NAME=$1

LIBFT=0
MODEL=0
DESC=0

LIBFT_PATH="EMPTY"
MODEL_PATH="EMPTY"

for arg in "$@"
do
	[ $MODEL -eq 1 ] && { MODEL_PATH=$arg; MODEL=0; }
	[ $LIBFT -eq 1 ] && { LIBFT_PATH=$arg; LIBFT=0; }
	[ $DESC -eq 1 ] && { echo "## $arg" >> README.md; DESC=0; } # Description for README (optional)
	[ $arg = "-model" ] && MODEL=1;
	[ $arg = "-libft" ] && LIBFT=1;
	[ $arg = "-desc" ] && DESC=1;
done

################################################################################
# CREATE FOLDERS
################################################################################

echo "Creating folders..."
sleep 0.5

[ $MODEL_PATH != "EMPTY" ] && { echo "Duplicating model $MODEL_PATH...";
							sleep 0.5; cp -r $MODEL_PATH $1;
							echo -e "\033[1;32m$PROJECT_NAME is ready to launch!\033[0m"; exit 0; }

# THE ABOVE PART IS ONLY IN CASE OF NO MODEL PROVIDED
#
# If you already have a template for the project folder,
# you can replace MODEL_PATH="EMPTY" with the absolute path
# of your folder.
# You can also edit at your convenience the template provided
# by default.

mkdir $PROJECT_NAME # Create Project folder
cd $PROJECT_NAME
mkdir src obj inc lib doc # Create basic folders
[ $LIBFT_PATH != "EMPTY" ] && ln -s $LIBFT_PATH lib/libft # Symlink of libft
echo "# $PROJECT_NAME" > README.md # README file added

################################################################################
# CREATING FILES
################################################################################

echo "Creating files..."
sleep 0.5

################################################################################
# MAIN
################################################################################

echo $'#include "../inc/include.h"

int		main(int ac, char **av)
{
	if (ac > 1)
	{
		while (*av[1])
			write(1, av[1]++, 1);
	}
	else
		write(1, "Hello World!", 12);
	write(1, "\\n", 1);
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
' > Makefile

################################################################################
# END
################################################################################

echo -e "\033[1;32m$PROJECT_NAME is ready to launch!\033[0m"
