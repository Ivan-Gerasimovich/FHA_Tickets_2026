import os

def promote_headings():
    path = "typ/chapters"
    for f in os.listdir(path):
        if f.endswith(".typ"):
            p = os.path.join(path, f)
            with open(p, 'r', encoding='utf-8') as file:
                content = file.read()
            
            # Заменяем '== ' на '= ' (повышаем уровень)
            # Мы используем replace, так как заголовки обычно в начале строк
            new_content = content.replace('\n== ', '\n= ').replace('== ', '= ', 1)
            
            with open(p, 'w', encoding='utf-8') as file:
                file.write(new_content)
            print(f"Promoted headings in {f}")

if __name__ == "__main__":
    promote_headings()
