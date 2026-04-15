import re
import os
import unicodedata

def slugify(value):
    """
    Превращает заголовок в имя файла: убирает спецсимволы, заменяет пробелы на подчёркивания.
    """
    # Удаляем символ параграфа и лишние точки
    value = value.replace('§', '').strip()
    # Нормализуем unicode (чтобы кириллица не ломалась)
    value = re.sub(r'[^\w\s-]', '', value).strip().lower()
    value = re.sub(r'[-\s]+', '_', value)
    return value

def split_typst_file(input_file, output_dir):
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    with open(input_file, 'r', encoding='utf-8') as f:
        content = f.read()

    # Регулярка ищет заголовок первого уровня: "=" в начале строки
    # Группа 1 — это текст заголовка
    pattern = re.compile(r'^==\s+(.+)$', re.MULTILINE)
    
    matches = list(pattern.finditer(content))
    
    if not matches:
        print("Заголовки уровня 1 (начинающиеся с '= ') не найдены.")
        return

    for i, match in enumerate(matches):
        title = match.group(1).strip()
        start_index = match.start()
        
        # Конец текущей главы — это начало следующей или конец файла
        end_index = matches[i+1].start() if i+1 < len(matches) else len(content)
        
        chapter_content = content[start_index:end_index].strip()
        
        # Формируем имя файла: 01_название_главы.typ
        file_name = f"{i+1:02d}_{slugify(title)}.typ"
        output_path = os.path.join(output_dir, file_name)
        
        with open(output_path, 'w', encoding='utf-8') as f:
            f.write(chapter_content)
        
        print(f"Создано: {file_name}")

if __name__ == "__main__":
    # Укажи путь к своему монолитному файлу и папку назначения
    INPUT = 'typ/fha.typ'
    OUTPUT = 'typ/chapters'
    
    split_typst_file(INPUT, OUTPUT)
