NAME = libasm.a
SRCS =	srcs/ft_strlen.s \
		srcs/ft_strcpy.s \
		srcs/ft_strcmp.s \
		srcs/ft_write.s \
		srcs/ft_read.s \
		srcs/ft_strdup.s
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

re:: fclean
re:: all

test: $(NAME)
	$(CC) -Wall -Werror -Wextra -no-pie -Iinc $(TEST) -o $(TESTEXEC) -L. -lasm

