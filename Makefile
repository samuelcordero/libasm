NAME = libasm.a
SRCS =	srcs/ft_strlen.s
OBJS = $(SRCS:.s=.o)
NASMFLAGS = -f elf64
NASM = nasm
TEST = srcs/test.c
TESTEXEC = test

all: $(NAME)

srcs/%.o: srcs/%.s
	$(NASM) $(NASMFLAGS) $< -o $@

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)

clean:
	$(RM) $(OBJS)

fclean: clean
	$(RM) $(NAME) $(TESTEXEC)

re: fclean all

test: $(NAME)
	$(CC) -Wall -Werror -Wextra -Iinc $(TEST) -o $(TESTEXEC) -L. -lasm

