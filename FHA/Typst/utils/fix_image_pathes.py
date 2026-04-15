import os
import re

def fix_paths():
    # Папка, где лежат наши разбитые файлы глав
    chapters_dir = "typ/chapters"
    
    # Регулярное выражение для поиска функции image("...")
    # Ищет всё, что внутри кавычек в функции image
    pattern = re.compile(r'image\((["\'])(.*?)(["\'])(.*?)\)')

    if not os.path.exists(chapters_dir):
        print(f"Ошибка: Папка {chapters_dir} не найдена.")
        return

    files_fixed = 0

    for root, dirs, files in os.walk(chapters_dir):
        for file in files:
            if file.endswith(".typ"):
                file_path = os.path.join(root, file)
                
                with open(file_path, 'r', encoding='utf-8') as f:
                    content = f.read()

                def path_replacer(match):
                    quote_start = match.group(1) # " или '
                    old_path = match.group(2)    # сам путь, например "src/01.svg" или "01.svg"
                    quote_end = match.group(3)   # " или '
                    extra_args = match.group(4)  # ширина, высота и т.д.

                    # Извлекаем только имя файла (01_vector.svg), игнорируя старые папки
                    filename = os.path.basename(old_path)
                    
                    # Новый путь относительно файла в typ/chapters/
                    new_path = f"../../assets/images/{filename}"
                    
                    return f'image({quote_start}{new_path}{quote_end}{extra_args})'

                # Заменяем пути
                new_content = pattern.sub(path_replacer, content)

                if new_content != content:
                    with open(file_path, 'w', encoding='utf-8') as f:
                        f.write(new_content)
                    print(f"✅ Исправлены пути в: {file}")
                    files_fixed += 1

    print(f"\nГотово! Обработано файлов: {files_fixed}")

if __name__ == "__main__":
    fix_paths()
