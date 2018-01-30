#******************************************************************************#
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nbrucker <nbrucker@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/12/03 10:24:15 by nbrucker          #+#    #+#              #
#    Updated: 2017/12/03 10:24:15 by nbrucker         ###   ########.fr        #
#                                                                              #
#******************************************************************************#

NAME = ft_ls

LIBFTDIR = libft/

INCSDIR = includes/

SRCSDIR = srcs/

OBJSDIR = objs/

CC = gcc

CFLAGS = -Wall -Wextra -Werror

SRCS = main.c \
		ft_get_options.c \
		order.c \
		print.c \
		print_next.c \
		add.c \
		free.c \
		last_print.c \
		lied.c

OBJS = $(addprefix $(OBJSDIR),$(SRCS:.c=.o))

$(OBJSDIR)%.o: $(SRCSDIR)%.c
	@mkdir -p $(OBJSDIR)
	$(CC) $(CFLAGS) -I $(INCSDIR) -I $(LIBFTDIR)$(INCSDIR) -o $@ -c $<

all: $(NAME)

$(NAME): $(OBJS)
	make -C $(LIBFTDIR)
	$(CC) $(CFLAGS) -o $(NAME) $(OBJS) -L./libft -lft

clean:
	rm -rf $(OBJSDIR)
	make -C $(LIBFTDIR) clean

fclean: clean
	rm -rf $(NAME)
	make -C $(LIBFTDIR) fclean

re: fclean all

.PHONY: all clean fclean re
