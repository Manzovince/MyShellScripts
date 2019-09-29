#include "../inc/include.h"

int		main(int ac, char **av)
{
	if (ac > 1)
	{
		while (*av[1])
			write(1, av[1]++, 1);
	}
	else
		write(1, "Hello World!", 12);
	write(1, "\n", 1);
	return (0);
}
