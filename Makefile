NAME = libasm.a
SRCS =	srcs/ft_strlen.s \
		srcs/ft_strcpy.s \
		srcs/ft_strcmp.s \
		srcs/ft_write.s \
		srcs/ft_read.s \
		srcs/ft_strdup.s \
		srcs/ft_atoi_base.s \
		srcs/ft_list_push_front.s \
		srcs/ft_list_size.s \
		srcs/ft_list_sort.s \
		srcs/ft_list_remove_if.s
OBJS = $(SRCS:.s=.o)
NASMFLAGS = -f elf64
NASM = nasm
TEST = srcs/test.c
TESTEXEC = test
CC = gcc

all: $(NAME)

srcs/%.o: srcs/%.s
	$(NASM) $(NASMFLAGS) $< -o $@

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)

clean:
	$(RM) $(OBJS)

fclean: clean
	$(RM) $(NAME) $(TESTEXEC)

re:: fclean
re:: all

test: $(NAME)
	$(CC) -Wall -Werror -Wextra -Iinc $(TEST) -o $(TESTEXEC) -L. -lasm

