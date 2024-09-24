/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: sacorder <sacorder@student.42madrid.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/09/23 23:59:42 by sacorder          #+#    #+#             */
/*   Updated: 2024/09/24 23:15:32 by sacorder         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef __LIBASM_H__
# define __LIBASM_H__
# include <unistd.h>

typedef __SIZE_TYPE__ size_t;

extern size_t   ft_strlen(const char *s);
extern char     *ft_strcpy(char *restrict dst, const char *restrict src);
extern int      ft_strcmp(const char *s1, const char *s2);
extern ssize_t  ft_write(int fd, const void *buf, size_t count);
extern ssize_t  ft_read(int fd, void *buf, size_t count);
extern char     *ft_strdup(const char *s);

//bonus
extern int      ft_atoi_base(char *str, char *base);

typedef struct s_list {
    void            *data;
    struct s_list   *next;
}   t_list;

extern void     ft_list_push_front(t_list **begin_list, void *data);
extern int      ft_list_size(t_list *begin_list);
extern void     ft_list_sort(t_list **begin_list, int (*cmp)());
extern void     ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));

#endif
