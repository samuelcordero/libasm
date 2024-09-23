#include "libasm.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int main() {
    char *test = "42 Madrid";
    char *test2 = "asdfkjlñajksldñfjagjañfdkjafkjalñkdfjalskdfjalkfjakfjjghlkjfadksljfak";
    char *test3 = "";
    char *test4 = "\0";
    //strlen
    //printf("strlen NULL: %i\n", strlen(NULL));
    //printf("ft_strlen NULL: %i\n", ft_strlen(NULL));

    printf("strlen %s: %li\n", test, strlen(test));
    printf("ft_strlen %s: %li\n", test, ft_strlen(test));

    printf("strlen %s: %li\n", test2, strlen(test2));
    printf("ft_strlen %s: %li\n", test2, ft_strlen(test2));

    printf("strlen %s: %li\n", test3, strlen(test3));
    printf("ft_strlen %s: %li\n", test3, ft_strlen(test3));

    printf("strlen %s: %li\n", test4, strlen(test4));
    printf("ft_strlen %s: %li\n", test4, ft_strlen(test4));
    
    return 0;
}