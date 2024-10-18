#!/bin/bash

# Загрузка данных теста
source test_data.sh

score=0

# Проведение теста
for q in $(seq 1 $total_questions); do
    question=${questions[$q]}
    echo "$question"
    for a in $(seq 1 10); do
        if [ -z "${answers[$q,$a]}" ]; then
            break
        fi
        echo "$a. ${answers[$q,$a]}"
    done
    echo "Выберите номер правильного ответа:"
    read user_choice

    if [ "$user_choice" -eq "${correct_answers[$q]}" ]; then
        echo "Правильно!"
        ((score++))
    else
        echo "Неправильно. Правильный ответ: ${correct_answers[$q]}"
    fi
    echo
done

echo "Ваш итоговый результат: $score из $total_questions"
