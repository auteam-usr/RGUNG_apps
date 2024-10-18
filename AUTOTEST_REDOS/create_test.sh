#!/bin/bash

echo "#!/bin/bash" > test_data.sh
echo "declare -A questions answers correct_answers" >> test_data.sh

index=1
while true; do
    echo "Введите вопрос $index (или 'end' для завершения ввода):"
    read question
    if [ "$question" == "end" ]; then
        break
    fi
    echo "questions[$index]='$question'" >> test_data.sh

    answer_index=1
    echo "Введите ответы для вопроса $index (для завершения введите 'end'):"
    while true; do
        echo "Ответ $answer_index:"
        read answer
        if [ "$answer" == "end" ]; then
            break
        fi
        echo "answers[$index,$answer_index]='$answer'" >> test_data.sh
        ((answer_index++))
    done
    echo "Введите номер правильного ответа для вопроса $index:"
    read correct_answer
    echo "correct_answers[$index]=$correct_answer" >> test_data.sh
    ((index++))
done

echo "total_questions=$(($index - 1))" >> test_data.sh
