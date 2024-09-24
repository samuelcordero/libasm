#include "libasm.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int main() {
    char *test = "42 Madrid";
    char *test2 = "asdfkjlñajksldñfjagjañtrwiotwjalkfjakfjvbcnk";
    char *test3 = "";

    char dest[100];
    char dest2[100];

    //strlen

    printf("strlen %s: %li\n", test, strlen(test));
    printf("ft_strlen %s: %li\n", test, ft_strlen(test));

    printf("strlen %s: %li\n", test2, strlen(test2));
    printf("ft_strlen %s: %li\n", test2, ft_strlen(test2));

    printf("strlen %s: %li\n", test3, strlen(test3));
    printf("ft_strlen %s: %li\n", test3, ft_strlen(test3));

    //strcpy

    printf("strcpy %s: dest: %s\n", test2, strcpy(dest, test2));
    printf("ft_strcpy %s: dest2: %s\n", test2, ft_strcpy(dest2, test2));
    
    //strcmp

    printf("strcmp s1:%s s2:%s res: %i\n", test, test2, strcmp(test, test2));
    printf("ft_strcmp s1:%s s2:%s res: %i\n", test, test2, ft_strcmp(test, test2));
    
    printf("strcmp s1:%s s2:%s res: %i\n", test2, test, strcmp(test2, test));
    printf("ft_strcmp s1:%s s2:%s res: %i\n", test2, test, ft_strcmp(test2, test));

    printf("strcmp s1:%s s2:%s res: %i\n", test, test, strcmp(test, test));
    printf("ft_strcmp s1:%s s2:%s res: %i\n", test, test, ft_strcmp(test, test));

    //write

    write(1, test, 9);
    write(1, "\n", 1);

    ft_write(1, test, 9);
    ft_write(1, "\n", 1);

    write(2, test, 9);
    write(2, "\n", 1);

    ft_write(2, test, 9);
    ft_write(2, "\n", 1);

    //read
    *(dest + read(0, dest, 10)) = 0;
    printf("read with read: %s\n", dest);
    *(dest2 + ft_read(0, dest2, 10)) = 0;
    printf("read with ft_read: %s\n", dest2);

    //strdup
    char *dup = strdup(test);
    printf("res with strdup: %s in addr %p\n", dup, dup);
    char *dup2 = ft_strdup(test);
    printf("res with ft_strdup: %s in addr %p\n", dup2, dup2);

    free(dup);
    free(dup2);

    return 0;
}