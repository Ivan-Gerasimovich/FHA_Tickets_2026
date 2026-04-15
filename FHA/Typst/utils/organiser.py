import os

# Словарь маппинга: Номер -> Английское название
mapping = {
    "01": "vector_product",
    "02": "mixed_product",
    "03": "quadric_curves",
    "04": "line_equations_2d",
    "05": "lines_relative_pos_2d",
    "06": "half_plane",
    "07": "planes_3d",
    "08": "half_space",
    "09": "planes_relative_pos_3d",
    "10": "lines_3d",
    "11": "line_plane_relative_pos",
    "12": "lines_relative_pos_3d",
}

def organize():
    chapters_dir = "typ/chapters"
    main_file = "typ/main.typ"
    
    # 1. Переименование файлов
    new_files = []
    files = sorted([f for f in os.listdir(chapters_dir) if f.endswith(".typ")])
    
    for f in files:
        prefix = f.split('_')[0] # Берем "01", "02" и т.д.
        if prefix in mapping:
            new_name = f"{prefix}_{mapping[prefix]}.typ"
            old_path = os.path.join(chapters_dir, f)
            new_path = os.path.join(chapters_dir, new_name)
            
            os.rename(old_path, new_path)
            new_files.append(new_name)
            print(f"Renamed: {f} -> {new_name}")
        else:
            new_files.append(f)

    # 2. Генерация main.typ (Точка входа)
    main_content = [
        '#import "conf.typ": setup',
        '#show: setup',
        '',
        '// --- Chapters ---'
    ]
    
    for nf in sorted(new_files):
        main_content.append(f'#include "chapters/{nf}"')
        
    with open(main_file, "w", encoding="utf-8") as f:
        f.write("\n".join(main_content))
    
    print(f"\n✅ {main_file} updated!")

if __name__ == "__main__":
    organize()
