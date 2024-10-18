#!/bin/bash

echo "За каждый правильный ответ, вы получаете 1 балл. Итоговую сумму баллов вы увидете в конце тестирвоания"

count=0

echo "1) Создайте новый каталог с названием "testing" в директории /home/user"

while true; do 
    read -p "Начать проверку? (1 - Начать проверку, 0 - Перейти к следующему заданию): " choice
    if [ "$choice" -eq 1 ]; then
    if [ -d "/home/user/testing" ]; then
        echo "Тестирование выполненно, директория создана."
        count=$(($count + 1))
        break
    else
        echo "Директория не создана. Пожалуйста, попробуйте ещё раз."
        echo "1) Создайте новый каталог с названием "testing" в директории /home/user"
        echo "Вот подсказка - mkdir."
        read -p "Нажмите Enter для повторной проверки."
    fi
    elif [ "$choice" -eq 0 ]; then
    echo "Проверка отменена."
    break
    else
    echo "Некорректный ввод. Пожайлуста, введите 1 или 0."
    fi
done

echo "2) Создайте файлы с расширением txt с названиями test и test1, в созданном каталоге "testing""

while true; do 
    read -p "Начать проверку? (1 - Начать првоерку, 0 - Перейти к следующему заданию): " choice
    if [ "$choice" -eq 1 ]; then
    if [ -f "/home/user/testing/test.txt" ] && [ -f "/home/user/testing/test1.txt" ]; then
        echo "Тестирование выполненно, файлы созданы."
        count=$(($count + 1))
        break
    else
        echo "Файлы не созданы. Пожалуйста, попробуйте ещё раз."
        echo "2) Создайте файлы с расширением txt с названиями test и test1, в созданном каталоге "testing""
        echo "Вот подсказка - touch."
        read -p "Нажмите Enter для повторной проверки."
    fi
    elif [ "$choice" -eq 0 ]; then
    echo "Проверка отменена."
    break
    else
    echo "Некорректный ввод. Пожайлуста, введите 1 или 0."
    fi
done

echo "3) Переместите созданный файл test1.txt в каталог /home/user/"

while true; do 
    read -p "Начать проверку? (1 - Начать првоерку, 0 - Перейти к селудющему заданию): " choice
    if [ "$choice" -eq 1 ]; then
    if [ ! -f "/home/user/testing/test1.txt" ] && [ -f "/home/user/test1.txt" ]; then
        echo "Тестирование выполненно, файл перемещён."
        count=$(($count + 1))
        break
    else
        echo "Файл не перемещён. Пожалуйста, попробуйте ещё раз."
        echo "3) Переместите созданный файл test1.txt в каталог /home/user/"
        echo "Вот подсказка - mv."
        read -p "Нажмите Enter для повторной проверки."
    fi
    elif [ "$choice" -eq 0 ]; then
    echo "Проверка отменена."
    break
    else
    echo "Некорректный ввод. Пожайлуста, введите 1 или 0."
    fi
done

echo "4) Скопируйте файл test.txt в каталог /home/user/"

while true; do 
    read -p "Начать проверку? (1 - Начать првоерку, 0 - Перейти к следующему заданию): " choice
    if [ "$choice" -eq 1 ]; then
    if [ -f "/home/user/testing/test.txt" ] && [ -f "/home/user/test.txt" ]; then
        echo "Тестирование выполненно, файл скопирован."
        count=$(($count + 1))
        break
    else
        echo "Файл не скопирован. Пожалуйста, попробуйте ещё раз."
        echo "4) Скопируйте файл test.txt в каталог /home/user/"
        echo "Вот подсказка - cp."
        read -p "Нажмите Enter для повторной проверки."
    fi
    elif [ "$choice" -eq 0 ]; then
    echo "Проверка отменена."
    break
    else
    echo "Некорректный ввод. Пожайлуста, введите 1 или 0."
    fi
done

echo "5) Удалите файл test.txt, оставшийся после копирования в каталоге /home/user/"

while true; do 
    read -p "Начать проверку? (1 - Начать проверку, 0 - Перейти к следующему заданию): " choice
    if [ "$choice" -eq 1 ]; then
    if [ -f "/home/user/testing/test.txt" ] && [ ! -f "/home/user/test.txt" ]; then
        echo "Тестирование выполненно, файл удалён."
        count=$(($count + 1))
        break
    else
        echo "Файл не удалён. Пожалуйста, попробуйте ещё раз."
        echo "5) Удалите файл test.txt, оставшийся после копирования в каталоге /home/user/"
        echo "Вот подсказка - rm."
        read -p "Нажмите Enter для повторной проверки."
    fi
    elif [ "$choice" -eq 0 ]; then
    echo "Проверка отменена."
    break
    else
    echo "Некорректный ввод. Пожайлуста, введите 1 или 0."
    fi
done

echo "6) Заархивируйте файл test.txt так, что бы расширение архива было tar, название archive и расположение в каталоге /home/user/testing/"

while true; do 
    read -p "Начать проверку? (1 - Начать проверку, 0 - Перейти к следующему заданию): " choice
    if [ "$choice" -eq 1 ]; then
    if [ -f "/home/user/testing/archive.tar" ] && tar -tf "/home/user/testing/archive.tar" | grep -q "test.txt"; then
        echo "Тестирование выполненно, архив создан."
        count=$(($count + 1))
        break
    else
        echo "Архив не создан. Пожалуйста, попробуйте ещё раз."
        echo "6) Заархивируйте файл test.txt так, что бы расширение архива было tar, название archive и расположение в каталоге /home/user/testing/"
        echo "Вот подсказка - tar."
        read -p "Нажмите Enter для повторной проверки."
    fi
    elif [ "$choice" -eq 0 ]; then
    echo "Проверка отменена."
    break
    else
    echo "Некорректный ввод. Пожайлуста, введите 1 или 0."
    fi
done

echo "7) Заархивируйте файл test1.txt так, что бы расширение архива было zip, название archive и расположение в каталоге /home/user/testing/"

while true; do 
    read -p "Начать проверку? (1 - Начать проверку, 0 - Перейти к следующему заданию): " choice
    if [ "$choice" -eq 1 ]; then
    if [ -f "/home/user/testing/archive.zip" ] && zip -sf "/home/user/testing/archive.zip" | grep -q "test1.txt"; then
        echo "Тестирование выполненно, архив создан."
        count=$(($count + 1))
        break
    else
        echo "Архив не создан. Пожалуйста, попробуйте ещё раз."
        echo "7) Заархивируйте файл test1.txt так, что бы расширение архива было zip, название archive и расположение в каталоге /home/user/testing/"
        echo "Вот подсказка - zip."
        read -p "Нажмите Enter для повторной проверки."
    fi
    elif [ "$choice" -eq 0 ]; then
    echo "Проверка отменена."
    break
    else
    echo "Некорректный ввод. Пожайлуста, введите 1 или 0."
    fi
done

echo "8) Создайте вложенный каталог из test3/test4/test5/.../test10 в директории /home/user/"

while true; do 
    read -p "Начать проверку? (1 - Начать проверку, 0 - Перейти к следующему заданию): " choice
    if [ "$choice" -eq 1 ]; then
    if [ -d "/home/user/test3/test4/test5/test6/test7/test8/test9/test10" ]; then
        echo "Тестирование выполненно, вложенный каталог создан."
        count=$(($count + 1))
        break
    else
        echo "Вложенный каталог не создан. Пожалуйста, попробуйте ещё раз."
        echo "8) Создайте вложенный каталог из test3/test4/test5/.../test10 в директории /home/user/"
        echo "Вот подсказка - mkdir -p."
        read -p "Нажмите Enter для повторной проверки."
    fi
    elif [ "$choice" -eq 0 ]; then
    echo "Проверка отменена."
    break
    else
    echo "Некорректный ввод. Пожайлуста, введите 1 или 0."
    fi
done

echo "9) Удалите вложенный каталог test3/test4/test5/.../test10 из директории /home/user/"

while true; do 
    read -p "Начать проверку? (1 - Начать проверку, 0 - Перейти к следующему заданию): " choice
    if [ "$choice" -eq 1 ]; then
    if [ ! -d "/home/user/test3" ]; then
        echo "Тестирование выполненно, вложенный каталог удалён."
        count=$(($count + 1))
        break
    else
        echo "Вложенный каталог не удалён. Пожалуйста, попробуйте ещё раз."
        echo "9) Удалите вложенный каталог test3/test4/test5/.../test10 из директории /home/user/"
        echo "Вот подсказка - rmdir -p."
        read -p "Нажмите Enter для повторной проверки."
    fi
    elif [ "$choice" -eq 0 ]; then
    echo "Проверка отменена."
    break
    else
    echo "Некорректный ввод. Пожайлуста, введите 1 или 0."
    fi
done

echo "10) Создайте 7 файлов с расширением txt одной командой. Шаблон названия файла file1.txt, file2.txt и т.д. в директории /home/user/testing/"

while true; do 
    read -p "Начать проверку? (1 - Начать проверку, 0 - Перейти к следующему заданию): " choice
    if [ "$choice" -eq 1 ]; then
    if [ -f "/home/user/testing/file1.txt" ] && [ -f "/home/user/testing/file2.txt" ] && [ -f "/home/user/testing/file3.txt" ] && [ -f "/home/user/testing/file4.txt" ] && [ -f "/home/user/testing/file5.txt" ] && [ -f "/home/user/testing/file6.txt" ] && [ -f "/home/user/testing/file7.txt" ]; then
        echo "Тестирование выполненно, файлы созданы."
        count=$(($count + 1))
        break
    else
        echo "Файлы не созданы. Пожалуйста, попробуйте ещё раз."
        echo "10) Создайте 7 файлов с расширением txt одной командой. Шаблон названия файла file1.txt, file2.txt и т.д. в директории /home/user/testing/"
        echo "Вот подсказка - touch (название){1..7} ."
        read -p "Нажмите Enter для повторной проверки."
    fi
    elif [ "$choice" -eq 0 ]; then
    echo "Проверка отменена."
    break
    else
    echo "Некорректный ввод. Пожайлуста, введите 1 или 0."
    fi
done

echo "11) В новые файлы (file1.txt,...,file7.txt) записать цифры от 10-17 через пробел одной командой. Отдельно создайте file17.txt"

while true; do 
    read -p "Начать проверку? (1 - Начать проверку, 0 - Перейти к следующему заданию): " choice
    if [ "$choice" -eq 1 ]; then
    if cat "/home/user/testing/file1.txt" | grep -q "10 11 12 13 14 15 16 17" && cat "/home/user/testing/file2.txt" | grep -q "10 11 12 13 14 15 16 17" && cat "/home/user/testing/file3.txt" | grep -q "10 11 12 13 14 15 16 17" && cat "/home/user/testing/file4.txt" | grep -q "10 11 12 13 14 15 16 17" && cat "/home/user/testing/file5.txt" | grep -q "10 11 12 13 14 15 16 17" && cat "/home/user/testing/file6.txt" | grep -q "10 11 12 13 14 15 16 17" && cat "/home/user/testing/file7.txt" | grep -q "10 11 12 13 14 15 16 17" ; then
        echo "Тестирование выполненно, запись в файл произведена."
        count=$(($count + 1))
        break
    else
        echo "Запись в файлы не произведена. Пожалуйста, попробуйте ещё раз."
        echo "11) В новые файлы (file1.txt,...,file7.txt) записать цифры от 10-17 через пробел одной командой."
        echo "Вот подсказка - попробуйте воспользоваться циклом for."
        read -p "Нажмите Enter для повторной проверки."
    fi
    elif [ "$choice" -eq 0 ]; then
    echo "Проверка отменена."
    break
    else
    echo "Некорректный ввод. Пожайлуста, введите 1 или 0."
    fi
done

echo "12) Содержимое файлов file1.txt,...,file7.txt с помощью одной команды записать в ранее созданный файл file17.txt"

while true; do 
    read -p "Начать проверку? (1 - Начать проверку, 0 - Перейти к следующему заданию): " choice
    if [ "$choice" -eq 1 ]; then
        tester1=`cat /home/user/testing/file17.txt`
        tester2=`cat /home/user/testing/file17.txt | grep "10 11 12 13 14 15 16 17"`
    if  [ "$tester1" = "$tester2" ]; then
        echo "Тестирование выполненно, запись в файл произведена."
        count=$(($count + 1))
        break
    else
        echo "Запись в файл не произведена. Пожалуйста, попробуйте ещё раз."
        echo "12) Содержимое файлов file1.txt,...,file7.txt с помощью одной команды записать в несуществующий файл file17.txt"
        echo "Вот подсказка - воспользуйтесь cat и стандартным потоком вывода >>."
        read -p "Нажмите Enter для повторной проверки."
    fi
    elif [ "$choice" -eq 0 ]; then
    echo "Проверка отменена."
    break
    else
    echo "Некорректный ввод. Пожайлуста, введите 1 или 0."
    fi
done

echo "13) Создайте файл red.txt в директории /home/user/testing и выдайте ему права только на чтение для всех пользователей"

while true; do 
    read -p "Начать проверку? (1 - Начать проверку, 0 - Перейти к следующему заданию): " choice
    if [ "$choice" -eq 1 ]; then
    if  ls -l /home/user/testing/red.txt | grep -q "r\-\-r\-\-r\-" || ls -l /home/user/testing/red.txt | grep -q "r\-\--\-\--\-" ; then
        echo "Тестирование выполненно, права выданы верно."
        count=$(($count + 1))
        break
    else
        echo "Права выданы не верно. Пожалуйста, попробуйте ещё раз."
        echo "13) Создайте файл red.txt в директории /home/user/testing и выдайте ему права только на четение"
        echo "Вот подсказка - chmod +r ."
        read -p "Нажмите Enter для повторной проверки."
    fi
    elif [ "$choice" -eq 0 ]; then
    echo "Проверка отменена."
    break
    else
    echo "Некорректный ввод. Пожайлуста, введите 1 или 0."
    fi
done

echo "14) Выдайте файлу red.txt права только на запись для всех пользователей"

while true; do 
    read -p "Начать проверку? (1 - Начать проверку, 0 - Перейти к следующему заданию): " choice
    if [ "$choice" -eq 1 ]; then
    if  ls -l /home/user/testing/red.txt | grep -q "w\-\-w\-\-w\-"; then
        echo "Тестирование выполненно, права выданы верно."
        count=$(($count + 1))
        break
    else
        echo "Права выданы не верно. Пожалуйста, попробуйте ещё раз."
        echo "14) Выдайте файлу red.txt права только на запись всех пользователей"
        echo "Вот подсказка - chmod +w."
        read -p "Нажмите Enter для повторной проверки."
    fi
    elif [ "$choice" -eq 0 ]; then
    echo "Проверка отменена."
    break
    else
    echo "Некорректный ввод. Пожайлуста, введите 1 или 0."
    fi
done

echo "15) Выдайте файлу red.txt дополнительно права на выполнение для всех пользователей"

while true; do 
    read -p "Начать проверку? (1 - Начать проверку, 0 - Перейти к следующему заданию): " choice
    if [ "$choice" -eq 1 ]; then
    if  ls -l /home/user/testing/red.txt | grep -q "w\x\-w\x\-w\x"; then
        echo "Тестирование выполненно, права выданы верно."
        count=$(($count + 1))
        break
    else
        echo "Права выданы не верно. Пожалуйста, попробуйте ещё раз."
        echo "15) Выдайте файлу red.txt дополнительно права на выполнение"
        echo "Вот подсказка - chmod +x."
        read -p "Нажмите Enter для повторной проверки."
    fi
    elif [ "$choice" -eq 0 ]; then
    echo "Проверка отменена."
    break
    else
    echo "Некорректный ввод. Пожайлуста, введите 1 или 0."
    fi
done

echo "16) Выдайте права на чтение и запись сразу владельцу файла и его группе пользователей для файла red.txt"

while true; do 
    read -p "Начать проверку? (1 - Начать проверку, 0 - Перейти к следующему заданию): " choice
    if [ "$choice" -eq 1 ]; then
    if  ls -l /home/user/testing/red.txt | grep -q "rw\-\rw\-\--\-"; then
        echo "Тестирование выполненно, права выданы верно."
        count=$(($count + 1))
        break
    else
        echo "Права выданы не верно. Пожалуйста, попробуйте ещё раз."
        echo "16) Выдайте права на чтение и запись сразу владельцу файла и его группе пользователей для файла red.txt"
        echo "Вот подсказка - chmod ug+rw."
        read -p "Нажмите Enter для повторной проверки."
    fi
    elif [ "$choice" -eq 0 ]; then
    echo "Проверка отменена."
    break
    else
    echo "Некорректный ввод. Пожайлуста, введите 1 или 0."
    fi
done

echo "17) Выдайте права на запись и выполнение только группе файла red.txt"

while true; do 
    read -p "Начать проверку? (1 - Начать проверку, 0 - Перейти к следующему заданию): " choice
    if [ "$choice" -eq 1 ]; then
    if  ls -l /home/user/testing/red.txt | grep -q "\--\-\-w\x\--\-"; then
        echo "Тестирование выполненно, права выданы верно."
        count=$(($count + 1))
        break
    else
        echo "Права выданы не верно. Пожалуйста, попробуйте ещё раз."
        echo "17) Выдайте права на запись и выполнение только группе файла red.txt"
        echo "Вот подсказка - chmod g+wx."
        read -p "Нажмите Enter для повторной проверки."
    fi
    elif [ "$choice" -eq 0 ]; then
    echo "Проверка отменена."
    break
    else
    echo "Некорректный ввод. Пожайлуста, введите 1 или 0."
    fi
done

echo "18) Выдайте все права всем пользователям для файла red.txt"

while true; do 
    read -p "Начать проверку? (1 - Начать проверку, 0 - Перейти к следующему заданию): " choice
    if [ "$choice" -eq 1 ]; then
    if  ls -l /home/user/testing/red.txt | grep -q "\rw\x\rw\x\rw\x"; then
        echo "Тестирование выполненно, права выданы верно."
        count=$(($count + 1))
        break
    else
        echo "Права выданы не верно. Пожалуйста, попробуйте ещё раз."
        echo "18) Выдайте все права всем пользователям для файла red.txt"
        echo "Вот подсказка - chmod a+rwx."
        read -p "Нажмите Enter для повторной проверки."
    fi
    elif [ "$choice" -eq 0 ]; then
    echo "Проверка отменена."
    break
    else
    echo "Некорректный ввод. Пожайлуста, введите 1 или 0."
    fi
done

echo "19) Создайте пользователя testuser c UID 1001"

while true; do 
    read -p "Начать проверку? (1 - Начать проверку, 0 - Перейти к следующему заданию): " choice
    if [ "$choice" -eq 1 ]; then
    if  cat "/etc/passwd" | grep -q "testuser"; then
        echo "Тестирование выполненно, пользователь создан."
        count=$(($count + 1))
        break
    else
        echo "Пользователь не создан. Пожалуйста, попробуйте ещё раз."
        echo "19) Создайте пользователя testuser c UID 1001"
        echo "Вот подсказка - adduser."
        read -p "Нажмите Enter для повторной проверки."
    fi
    elif [ "$choice" -eq 0 ]; then
    echo "Проверка отменена."
    break
    else
    echo "Некорректный ввод. Пожайлуста, введите 1 или 0."
    fi
done

echo "20) Создайте группу testgroup с GID 1052"

while true; do 
    read -p "Начать проверку? (1 - Начать проверку, 0 - Перейти к следующему заданию): " choice
    if [ "$choice" -eq 1 ]; then
    if  cat "/etc/group" | grep -q "testgroup"; then
        echo "Тестирование выполненно, группа создана."
        count=$(($count + 1))
        break
    else
        echo "Группа не создана. Пожалуйста, попробуйте ещё раз."
        echo "20) Создайте группу testgroup с GID 1052"
        echo "Вот подсказка - groupadd."
        read -p "Нажмите Enter для повторной проверки."
    fi
    elif [ "$choice" -eq 0 ]; then
    echo "Проверка отменена."
    break
    else
    echo "Некорректный ввод. Пожайлуста, введите 1 или 0."
    fi
done

echo "21) Измените группу пользователя testuser на группу testgroup"

while true; do 
    read -p "Начать проверку? (1 - Начать проверку, 0 - Перейти к следующему заданию): " choice
    if [ "$choice" -eq 1 ]; then
    if  cat "/etc/passwd" | grep -q ":1001:1052:"; then
        echo "Тестирование выполненно, группа изменена."
        count=$(($count + 1))
        break
    else
        echo "Группа не изменена. Пожалуйста, попробуйте ещё раз."
        echo "21) Измените группу пользователя testuser на группу testgroup"
        echo "Вот подсказка - usermod."
        read -p "Нажмите Enter для повторной проверки."
    fi
    elif [ "$choice" -eq 0 ]; then
    echo "Проверка отменена."
    break
    else
    echo "Некорректный ввод. Пожайлуста, введите 1 или 0."
    fi
done

echo "22) Измените владельца файла red.txt на testuser"

while true; do 
    read -p "Начать проверку? (1 - Начать проверку, 0 - Перейти к следующему заданию): " choice
    if [ "$choice" -eq 1 ]; then
    if  getfacl -p /home/user/testing/red.txt | grep -q "owner: testuser"; then
        echo "Тестирование выполненно, владелец изменён."
        count=$(($count + 1))
        break
    else
        echo "Владелец не изменён. Пожалуйста, попробуйте ещё раз."
        echo "22) Измените владельца файла red.txt на testuser"
        echo "Вот подсказка - chown."
        read -p "Нажмите Enter для повторной проверки."
    fi
    elif [ "$choice" -eq 0 ]; then
    echo "Проверка отменена."
    break
    else
    echo "Некорректный ввод. Пожайлуста, введите 1 или 0."
    fi
done

echo "23) Измените группу файла red.txt на testgroup"

while true; do 
    read -p "Начать проверку? (1 - Начать проверку, 0 - Перейти к следующему заданию): " choice
    if [ "$choice" -eq 1 ]; then
    if  getfacl -p /home/user/testing/red.txt | grep -q "group: testgroup"; then
        echo "Тестирование выполненно, группа изменена."
        count=$(($count + 1))
        break
    else
        echo "Группа не изменена. Пожалуйста, попробуйте ещё раз."
        echo "23) Измените группу файла red.txt на testgroup"
        echo "Вот подсказка - usermod."
        read -p "Нажмите Enter для повторной проверки."
    fi
    elif [ "$choice" -eq 0 ]; then
    echo "Проверка отменена."
    break
    else
    echo "Некорректный ввод. Пожайлуста, введите 1 или 0."
    fi
done

echo "24) Выведите в отдельный файл, под названием harddisk.txt в дирректории /home/user, информацию о жёстком диске, под названием \"sda1\"."

while true; do 
    read -p "Начать проверку? (1 - Начать проверку, 0 - Перейти к следующему заданию): " choice
    if [ "$choice" -eq 1 ]; then
	if  cat /home/user/harddisk.txt | grep -q "sda1"; then
	    echo "Тестирование выполненно, информаци выведена."
        count=$(($count + 1))
	    break
	else
	    echo "Информация не выведена. Пожалуйста, попробуйте ещё раз."
        echo "24) Выведите в отдельный файл, под названием harddisk.txt в дирректории /home/user, информацию о жёстком диске, под названием \"sda1\""
	    echo "Вот подсказка - df | grep "sda1" >> /home/user/harddisk.txt"
	    read -p "Нажмите Enter для повторной проверки."
	fi
    elif [ "$choice" -eq 0 ]; then
	echo "Проверка отменена."
	break
    else
	echo "Некорректный ввод. Пожайлуста, введите 1 или 0."
    fi
done

echo "25) Напишите полный путь до конфигурационного файла, в котором можно прописать диски для их автоматического монтирования."

while true; do
    read -p "Начать проверку? (1 - Начать проверку, 0 - Перейти к следующему заданию): " choice
    if [ "$choice" -eq 1 ]; then 
    read -p "Введите ваш ответ: " answer
    if [ "$answer" = "/etc/fstab" ]; then
	    echo "Ответ правильный!"
        count=$(($count + 1))
	    break
	else
	    echo "Ответ не правильный."
        echo "25) Напишите полный путь до конфигурационного файла, в котором можно прописать диски для их автоматического монтирования."
	    echo "Вот подсказка - проверьте содержимое дирректории /etc"
	    read -p "Нажмите Enter для повторного ответа"
    fi
    elif [ "$choice" -eq 0 ]; then
	echo "Проверка отменена."
	break
    else
	echo "Некорректный ввод. Пожайлуста, введите 1 или 0."
    fi
done

echo "26) Напишите команду для ручного монтирования диска."

while true; do
    read -p "Начать проверку? (1 - Начать проверку, 0 - Перейти к следующему заданию): " choice
    if [ "$choice" -eq 1 ]; then 
    read -p "Введите ваш ответ: " answer
    if [ "$answer" = "mount" ]; then
	    echo "Ответ правильный!"
        count=$(($count + 1))
	    break
	else
	    echo "Ответ не правильный."
        echo "26) Напишите команду для ручного монтирования диска."
	    echo "Вот подсказка - mou..."
	    read -p "Нажмите Enter для повторного ответа"
    fi
    elif [ "$choice" -eq 0 ]; then
	echo "Проверка отменена."
	break
    else
	echo "Некорректный ввод. Пожайлуста, введите 1 или 0."
    fi
done

echo "Вы набрали баллов в количестве - $count!"
