import os

def prepend_import():
    chapters_dir = "typ/chapters"
    import_line = '#import "../conf.typ": *\n'
    
    for root, dirs, files in os.walk(chapters_dir):
        for file in files:
            if file.endswith(".typ"):
                path = os.path.join(root, file)
                with open(path, 'r', encoding='utf-8') as f:
                    content = f.read()
                
                # Проверяем, нет ли уже импорта, чтобы не дублировать
                if not content.startswith('#import "../conf.typ"'):
                    with open(path, 'w', encoding='utf-8') as f:
                        f.write(import_line + content)
                    print(f"✅ Added import to {file}")

if __name__ == "__main__":
    prepend_import()
