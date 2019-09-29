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

[ $# -eq 0 ] && { echo "Usage: $0 [-help] project_name [...]"; exit 1; }
[ $1 = "-help" ] && { echo "################################################################################
#                               CreateProject42                                #
#        This shell provide an operational folder for a 42 project.
################################################################################

project_name:	Name of your project (used for foldername).
[-option]:
		[-model /your/template/file/path/]: Use your Project Template.
		[-libft /your/libft/file/path/]: Use your Libft.
		[-desc 'Your description of the project here']: Added to README.md"; exit 1; }

################################################################################
# VARIABLES
################################################################################

LIBFT=0
MODEL=0
DESC=0

LIBFT_PATH="/Users/manzovince/Documents/Computer_Science/42HolyGraph/1_Global/42-libft"

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

[ MODEL_PATH != "" ] && { echo "Duplicating model $MODEL_PATH...";
							sleep 0.5; cp -r $MODEL_PATH $1;
							echo "$1 is ready to launch!"; exit 0; }
mkdir $1 # Create Project folder
cd $1
mkdir src obj inc lib doc # Create basic folders
[ LIBFT_PATH != "" ] && ln -s $LIBFT_PATH lib/libft # Symlink of libft
echo "# $1" > README.md # README file added

################################################################################
# CREATING FILES
################################################################################

echo "Creating files..."
sleep 0.5

################################################################################
# MAIN
################################################################################

echo $'#include "../inc/include.h"

int		main()
{
	write(1, "Hello World!\n", 13);
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
