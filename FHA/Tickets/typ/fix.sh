
#!/bin/bash

# Путь к папке с главами. 
# Если запускаете прямо внутри папки chapters, измените на TARGET_DIR="."
TARGET_DIR="chapters"

echo "Начинаю исправление устаревших символов Typst..."

# 1. Замена sect на inter
# Используем границы слов (\b), чтобы случайно не испортить слова вроде intersection
find "$TARGET_DIR" -type f -name "*.typ" -exec sed -i -E 's/\bsect\b/inter/g' {} +
echo "✓ Символ sect успешно заменен на inter"

# 2. Замена angle.l на chevron.l
find "$TARGET_DIR" -type f -name "*.typ" -exec sed -i -E 's/\bangle\.l\b/chevron.l/g' {} +
echo "✓ Символ angle.l успешно заменен на chevron.l"

# 3. Замена angle.r на chevron.r
find "$TARGET_DIR" -type f -name "*.typ" -exec sed -i -E 's/\bangle\.r\b/chevron.r/g' {} +
echo "✓ Символ angle.r успешно заменен на chevron.r"

echo "Готово! Все основные предупреждения должны исчезнуть."
