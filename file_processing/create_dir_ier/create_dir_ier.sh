#! /bin/sh

#---------------------------------------------------------------------
# Параметры:
# @amountIer - общее количество вложенных друг в друга каталогов;
# @nameFiles - схема наименования создаваемых каталогов;
# @pathDir   - начальный каталог, в котором создаются вложенные каталоги.
#---------------------------------------------------------------------

# --- Инициализируем константы ---
amountIer=10
nameFiles="test"
pathDir="/media/hdd/"

# --- Функции ---
# Обработка ошибок
function printError {
  # Вывод сообщения об ошибке
  echo "[$(date)] Ошибка!. Входе выполнения операции произошла ошибка. Выполнение скрипта прервано"
  exit -1
}

# --- Исполняемая часть ---
# Вывод сообщения о назначении скрипта
echo "------------------------------------------------------------------"
echo "create_dir_ier.sh: Создание каталогов заданной глубины вложенности"
echo "------------------------------------------------------------------"

# Вывод сообщения о начале работы скрипта
echo "[$(date)] Процесс создания каталогов начат"

# --- Удаляем "старый" набор каталогов, если есть ---
pathNowDir="$pathDir$nameFiles""1/"
if [ -d "$pathNowDir" ]
then
  rm -R "$pathNowDir" || printError
fi

# Создание файлов
for ((i=1; i<=amountIer; i++))
do
  mkdir "$pathNowDir" || printError
  pathNowDir="$pathNowDir$nameFiles$(($i+1))/"
done

# Вывод сообщения о завершении работы скрипта
echo "[$(date)] Процесс создания каталогов успешно завершен"
