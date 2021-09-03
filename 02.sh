#!/bin/bash

#Изменить скрипт мониторинга лога, используя утилиту tailf, чтобы он выводил сообщения при попытке неудачной аутентификации пользователя /var/log/auth.log, 
#отслеживая сообщения примерно такого вида:

#May 16 19:45:52 vlamp login[102782]: FAILED LOGIN (1) on '/dev/tty3' FOR 'user', Authentication failure

#Проверить скрипт, выполнив ошибочную регистрацию с виртуального терминала.
err_log=err.log
if test -f "$err_log"; then
# if [ -f "$err_log" ]; then
    rm $err_log
fi
tail -f /var/log/auth.log | grep --line-buffered "authentication failure" >> $err_log