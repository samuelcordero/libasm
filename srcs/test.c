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

    //ft_atoi_base
    printf("Str: %s, base %s, atoi res: %i\n", "", "", ft_atoi_base("", ""));
    printf("Str: %s, base %s, atoi res: %i\n", "0", "0123456789", ft_atoi_base("0", "0123456789"));
    printf("Str: %s, base %s, atoi res: %i\n", "2147483647", "0123456789", ft_atoi_base("2147483647", "0123456789"));
    printf("Str: %s, base %s, atoi res: %i\n", "-2147483648", "0123456789", ft_atoi_base("-2147483648", "0123456789"));
    printf("Str: %s, base %s, atoi res: %i\n", "42", "0123456789", ft_atoi_base("42", "0123456789"));
    printf("Str: %s, base %s, atoi res: %i\n", "101010", "01", ft_atoi_base("101010", "01"));
    printf("Str: %s, base %s, atoi res: %i\n", "42", "+-0123", ft_atoi_base("42", "+-0123"));
    printf("Str: %s, base %s, atoi res: %i\n", "   42", "0123456789", ft_atoi_base("   42", "0123456789"));
    printf("Str: %s, base %s, atoi res: %i\n", "   101010", "01", ft_atoi_base("   101010", "01"));
    printf("Str: %s, base %s, atoi res: %i\n", "   -42", "0123456789", ft_atoi_base("   -42", "0123456789"));
    printf("Str: %s, base %s, atoi res: %i\n", "   -101010", "01", ft_atoi_base("   -101010", "01"));
    printf("Str: %s, base %s, atoi res: %i\n", "   +-42", "0123456789", ft_atoi_base("   +-42", "0123456789"));
    printf("Str: %s, base %s, atoi res: %i\n", "   -+101010", "01", ft_atoi_base("   -+101010", "01"));
    printf("Str: %s, base %s, atoi res: %i\n", "   --42", "0123456789", ft_atoi_base("   --42", "0123456789"));
    printf("Str: %s, base %s, atoi res: %i\n", "   --101010", "01", ft_atoi_base("   --101010", "01"));
    printf("Str: %s, base %s, atoi res: %i\n", "   --42a", "0123456789", ft_atoi_base("   --42a", "0123456789"));
    printf("Str: %s, base %s, atoi res: %i\n", "   --101010a", "01", ft_atoi_base("   --101010a", "01"));
    printf("Str: %s, base %s, atoi res: %i\n", "   --42  ", "0123456789", ft_atoi_base("   --42  ", "0123456789"));
    printf("Str: %s, base %s, atoi res: %i\n", "   --101010  ", "01", ft_atoi_base("   --101010  ", "01"));
    printf("Str: %s, base %s, atoi res: %i\n", "7fffffff", "0123456789abcdef", ft_atoi_base("7fffffff", "0123456789abcdef"));
    printf("Str: %s, base %s, atoi res: %i\n", "80000000", "0123456789abcdef", ft_atoi_base("80000000", "0123456789abcdef"));
    printf("Str: %s, base %s, atoi res: %i\n", " \t\r\n\b\v\f  \t-7fffffff", "0123456789abcdef", ft_atoi_base(" \t\r\n\b\v\f  \t-7fffffff", "0123456789abcdef"));
    printf("Str: %s, base %s, atoi res: %i\n", " \t\r\n\b\v\f  \t-7fffffff", "\t\n\r0123456789abcdef", ft_atoi_base(" \t\r\n\b\v\f  \t-7fffffff", "\t\n\r0123456789abcdef"));
    printf("Str: %p, base %s, atoi res: %i\n", NULL, "0123456789abcdef", ft_atoi_base(NULL, "0123456789abcdef"));
    printf("Str: %s, base %p, atoi res: %i\n", "7fffffff", NULL, ft_atoi_base("7fffffff", NULL));

    //ft_list_push_front

    t_list  *list = NULL;
    t_list  *elem;

    elem = malloc(sizeof(t_list));
    ft_list_push_front(&list, elem);
    elem = malloc(sizeof(t_list));
    ft_list_push_front(&list, elem);
    elem = malloc(sizeof(t_list));
    ft_list_push_front(&list, elem);

    //ft_list_size

    printf("List size: %i (should be 3)\n", ft_list_size(list));

    return 0;
}