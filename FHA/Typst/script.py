import os
import re

# Настройки
INPUT_FILE = "fha.typ"
OUTPUT_FILE = "conspect_final.typ"
IMG_DIR = "src"

if not os.path.exists(IMG_DIR):
    os.makedirs(IMG_DIR)

COLORS = {
    "blue": "#58C4DD", "red": "#FF7063", "green": "#A6E22E",
    "yellow": "#F92672", "axis": "#999999", "grid": "#F5F5F5", "text": "#333333"
}

# --- ТАБЛИЦА КОНФИГУРАЦИИ (Ключ в тексте : Файл, Ширина) ---
# Я уменьшил проценты для компактности
CONFIG = {
    "разнонаправленные": ("01_collinear_opp.svg", "25%"),
    "одну сторону": ("02_collinear_same.svg", "25%"),
    "Параллелограмм": ("03_parallelogram.svg", "45%"),
    "lambda a": ("04_scaling_pos.svg", "30%"),
    "противоположную сторону": ("05_scaling_neg.svg", "35%"),
    "истинное направление": ("06_cross_product_detailed.svg", "55%"),
    "правая тройка": ("07_right_left_triple.svg", "45%"),
    "Оси e": ("08_basis.svg", "30%"),
    "Параллелепипед": ("09_parallelepiped.svg", "60%"),
    "Эллипс": ("10_ellipse.svg", "40%"),
    "Гипербола": ("11_hyperbola.svg", "40%"),
    "Парабола": ("15_parabola.svg", "40%"),
    "начальная": ("12_line_basic.svg", "45%"),
    "Ax + By + C": ("13_line_normal_vec.svg", "45%"),
    "Плоскость П": ("14_plane_full.svg", "55%"),
    "пересекаются": ("16_planes_intersection.svg", "55%"),
    "скрещиваются": ("17_skew_lines.svg", "55%")
}

def lbl(x, y, t, c="text", s=18): return f'<text x="{x}" y="{y}" fill="{COLORS[c]}" filter="url(#halo)" font-size="{s}">{t}</text>'

def create_svg(name, content, width=400, height=300):
    markers = "".join([f'<marker id="arrow-{k}" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="6" markerHeight="6" orient="auto-start-reverse"><path d="M 0 0 L 10 5 L 0 10 L 2 5 z" fill="{v}" /></marker>' for k,v in COLORS.items()])
    filter_halo = '<filter id="halo" x="-30%" y="-30%" width="160%" height="160%"><feMorphology operator="dilate" radius="2" in="SourceGraphic" result="thicker" /><feGaussianBlur stdDeviation="1" in="thicker" result="blurred" /><feFlood flood-color="white" result="white" /><feComposite in="white" in2="blurred" operator="in" result="halo" /><feMerge><feMergeNode in="halo" /><feMergeNode in="SourceGraphic" /></feMerge></filter>'
    svg = f'<svg width="{width}" height="{height}" viewBox="0 0 {width} {height}" xmlns="http://www.w3.org/2000/svg"><defs><pattern id="g" width="40" height="40" patternUnits="userSpaceOnUse"><path d="M 40 0 L 0 0 0 40" fill="none" stroke="{COLORS["grid"]}" stroke-width="1"/></pattern>{markers}{filter_halo}</defs><rect width="100%" height="100%" fill="white"/><rect width="100%" height="100%" fill="url(#g)"/><g font-family="serif" font-style="italic" font-size="19">{content}</g></svg>'
    with open(f"{IMG_DIR}/{name}.svg", "w", encoding="utf-8") as f: f.write(svg)

def generate_images():
    # 01-05 Векторы и масштабирование
    create_svg("01_collinear_opp", f'<line x1="80" y1="60" x2="220" y2="60" stroke="{COLORS["blue"]}" stroke-width="3" marker-end="url(#arrow-blue)"/>{lbl(140,50,"a","blue")}<line x1="220" y1="100" x2="80" y2="100" stroke="{COLORS["red"]}" stroke-width="3" marker-end="url(#arrow-red)"/>{lbl(140,125,"b","red")}', 300, 160)
    create_svg("02_collinear_same", f'<line x1="60" y1="60" x2="240" y2="60" stroke="{COLORS["blue"]}" stroke-width="3" marker-end="url(#arrow-blue)"/>{lbl(140,50,"a","blue")}<line x1="60" y1="100" x2="180" y2="100" stroke="{COLORS["red"]}" stroke-width="3" marker-end="url(#arrow-red)"/>{lbl(120,125,"b","red")}', 300, 160)
    create_svg("03_parallelogram", f'<path d="M 80,180 L 280,180 L 330,90 L 130,90 Z" fill="{COLORS["blue"]}" fill-opacity="0.1" stroke="{COLORS["axis"]}" stroke-dasharray="4"/><line x1="80" y1="180" x2="280" y2="180" stroke="{COLORS["blue"]}" stroke-width="3" marker-end="url(#arrow-blue)"/><line x1="80" y1="180" x2="130" y2="90" stroke="{COLORS["red"]}" stroke-width="3" marker-end="url(#arrow-red)"/>{lbl(180,205,"a","blue")}{lbl(70,130,"b","red")}{lbl(200,140,"S","text",24)}', 400, 240)
    create_svg("04_scaling_pos", f'<line x1="50" y1="100" x2="150" y2="100" stroke="{COLORS["blue"]}" stroke-width="3" marker-end="url(#arrow-blue)"/><line x1="50" y1="60" x2="350" y2="60" stroke="{COLORS["green"]}" stroke-width="3" marker-end="url(#arrow-green)"/>{lbl(200,50,"λa","green")}', 400, 150)
    create_svg("05_scaling_neg", f'<line x1="200" y1="120" x2="320" y2="120" stroke="{COLORS["blue"]}" stroke-width="3" marker-end="url(#arrow-blue)"/><line x1="200" y1="120" x2="60" y2="120" stroke="{COLORS["red"]}" stroke-width="3" marker-end="url(#arrow-red)"/><path d="M 240,120 A 40,40 0 0 0 160,120" fill="none" stroke="black" stroke-width="2"/>{lbl(185,80,"π - φ")}', 400, 200)

    # 06-09 3D
    create_svg("06_cross_product_detailed", f'<path d="M 50,200 L 250,220 L 350,140 L 150,120 Z" fill-opacity="0.1" fill="gray" stroke="gray"/><line x1="180" y1="165" x2="300" y2="180" stroke="{COLORS["blue"]}" stroke-width="3" marker-end="url(#arrow-blue)"/><line x1="180" y1="165" x2="250" y2="140" stroke="{COLORS["red"]}" stroke-width="3" marker-end="url(#arrow-red)"/><line x1="180" y1="165" x2="180" y2="40" stroke="{COLORS["green"]}" stroke-width="4" marker-end="url(#arrow-green)"/>{lbl(190,55,"c","green")}', 400, 250)
    create_svg("07_right_left_triple", f'<path d="M 50,150 L 250,150 L 300,100 L 100,100 Z" fill="#eee" stroke="#ccc"/><line x1="150" y1="125" x2="150" y2="40" stroke="{COLORS["green"]}" marker-end="url(#arrow-green)"/><line x1="150" y1="125" x2="150" y2="210" stroke="{COLORS["yellow"]}" marker-end="url(#arrow-yellow)"/>', 400, 250)
    create_svg("08_basis", f'<line x1="150" y1="150" x2="300" y2="150" stroke="{COLORS["blue"]}" marker-end="url(#arrow-blue)"/><line x1="150" y1="150" x2="70" y2="220" stroke="{COLORS["red"]}" marker-end="url(#arrow-red)"/><line x1="150" y1="150" x2="150" y2="30" stroke="{COLORS["green"]}" marker-end="url(#arrow-green)"/>', 350, 250)
    create_svg("09_parallelepiped", f'<path d="M 80,220 L 200,220 L 240,180 L 120,180 Z" fill-opacity="0.05" fill="blue" stroke="#ccc"/><line x1="80" y1="220" x2="200" y2="220" stroke="{COLORS["blue"]}" stroke-width="3" marker-end="url(#arrow-blue)"/><line x1="80" y1="220" x2="120" y2="180" stroke="{COLORS["red"]}" stroke-width="3" marker-end="url(#arrow-red)"/><line x1="80" y1="220" x2="80" y2="80" stroke="{COLORS["green"]}" stroke-width="3" marker-end="url(#arrow-green)"/><path d="M 80,80 L 200,80 L 240,40 L 120,40 Z" fill="none" stroke="#ccc"/><line x1="200" y1="220" x2="200" y2="80" stroke="#ccc" stroke-dasharray="3"/>', 350, 260)

    # 10-11 Кривые
    create_svg("10_ellipse", f'<ellipse cx="200" cy="150" rx="100" ry="60" fill="none" stroke="{COLORS["blue"]}" stroke-width="3"/><line x1="200" y1="150" x2="300" y2="150" stroke="{COLORS["red"]}"/><line x1="200" y1="150" x2="200" y2="90" stroke="{COLORS["green"]}"/>', 400, 300)
    create_svg("11_hyperbola", f'<line x1="50" y1="150" x2="350" y2="150" stroke="{COLORS["axis"]}"/><line x1="200" y1="50" x2="200" y2="250" stroke="{COLORS["axis"]}"/><path d="M 330,80 Q 230,150 330,220" fill="none" stroke="{COLORS["red"]}" stroke-width="3"/><path d="M 70,80 Q 170,150 70,220" fill="none" stroke="{COLORS["red"]}" stroke-width="3"/><line x1="200" y1="155" x2="255" y2="155" stroke="black" stroke-width="2"/><line x1="200" y1="150" x2="200" y2="160" stroke="black"/><line x1="255" y1="150" x2="255" y2="160" stroke="black"/>{lbl(220,185,"a")}', 400, 300)

    # 12-14 Линии и плоскости
    create_svg("12_line_basic", f'<line x1="50" y1="200" x2="350" y2="50" stroke="gray"/><circle cx="150" cy="150" r="4"/><circle cx="250" cy="100" r="4"/><line x1="150" y1="150" x2="300" y2="75" stroke="{COLORS["blue"]}" marker-end="url(#arrow-blue)"/>', 400, 250)
    cx, cy = 180, 150
    create_svg("13_line_normal_vec", f'<line x1="50" y1="280" x2="330" y2="0" stroke="{COLORS["blue"]}" stroke-width="2" opacity="0.5" stroke-dasharray="4,4"/><path d="M {cx+14},{cy-14} L {cx+28},{cy} L {cx+14},{cy+14}" fill="none" stroke="{COLORS["axis"]}" stroke-width="1.5"/><line x1="{cx}" y1="{cy}" x2="{cx+90}" y2="{cy-90}" stroke="{COLORS["red"]}" stroke-width="3" marker-end="url(#arrow-red)"/>{lbl(cx+95,cy-95,"a","red")}<line x1="{cx}" y1="{cy}" x2="{cx+90}" y2="{cy+90}" stroke="{COLORS["green"]}" stroke-width="3" marker-end="url(#arrow-green)"/>{lbl(cx+95,cy+105,"n","green")}', 450, 320)
    create_svg("14_plane_full", f'<path d="M 50,180 L 300,210 L 380,100 L 130,70 Z" fill="{COLORS["yellow"]}" fill-opacity="0.1" stroke="{COLORS["yellow"]}"/><circle cx="180" cy="140" r="4"/><line x1="180" y1="140" x2="300" y2="160" stroke="{COLORS["blue"]}" marker-end="url(#arrow-blue)"/><line x1="180" y1="140" x2="220" y2="90" stroke="{COLORS["red"]}" marker-end="url(#arrow-red)"/>', 400, 250)

    # 15-17 Новинки
    create_svg("15_parabola", f'<line x1="50" y1="150" x2="350" y2="150" stroke="{COLORS["axis"]}"/><line x1="120" y1="50" x2="120" y2="250" stroke="{COLORS["axis"]}"/><path d="M 330,50 Q 120,150 330,250" fill="none" stroke="{COLORS["blue"]}" stroke-width="3"/><circle cx="170" cy="150" r="4" fill="{COLORS["red"]}" />{lbl(175,145,"F","red")}', 400, 300)
    create_svg("16_planes_intersection", f'<path d="M 50,100 L 250,150 L 250,250 L 50,200 Z" fill="{COLORS["blue"]}" fill-opacity="0.1" stroke="{COLORS["blue"]}" /><path d="M 100,250 L 300,200 L 300,100 L 100,150 Z" fill="{COLORS["red"]}" fill-opacity="0.1" stroke="{COLORS["red"]}" /><line x1="150" y1="125" x2="185" y2="215" stroke="{COLORS["green"]}" stroke-width="4" marker-end="url(#arrow-green)" />', 400, 300)
    create_svg("17_skew_lines", f'<path d="M 50,100 L 300,100 L 350,50 L 100,50 Z" fill="#eee" stroke="#ccc" /><path d="M 50,250 L 300,250 L 350,200 L 100,200 Z" fill="#eee" stroke="#ccc" /><line x1="80" y1="75" x2="320" y2="75" stroke="{COLORS["blue"]}" stroke-width="3" marker-end="url(#arrow-blue)" /><line x1="120" y1="210" x2="280" y2="240" stroke="{COLORS["red"]}" stroke-width="3" marker-end="url(#arrow-red)" />', 400, 300)

def patch_typst():
    if not os.path.exists(INPUT_FILE): return print(f"File {INPUT_FILE} not found!")
    with open(INPUT_FILE, "r", encoding="utf-8") as f: content = f.read()
    
    # Регулярка для поиска _Рисунок..._ учитывая математику внутри
    def replacer(match):
        line = match.group(0).strip("_")
        clean_text = re.sub(r'Рисунок\s*\d*[:.]?\s*', '', line)
        
        # Поиск совпадения по ключам
        for key, (fname, fwidth) in CONFIG.items():
            if key.lower() in clean_text.lower():
                return f'\n#figure(image("{IMG_DIR}/{fname}", width: {fwidth}), caption: [{clean_text.strip()}]) <fig-{fname.split(".")[0]}>\n'
        return match.group(0) # Если не нашли, оставляем как было

    new_content = re.sub(r'_Рисунок.*?_', replacer, content, flags=re.DOTALL)
    
    with open(OUTPUT_FILE, "w", encoding="utf-8") as f: f.write(new_content)
    print(f"Success! Saved to {OUTPUT_FILE}")

if __name__ == "__main__":
    generate_images()
    patch_typst()