#include "../inc/include.h"

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
}
