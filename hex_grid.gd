extends Control

@export var rows: int = 10
@export var cols: int = 10
@export var hex_size: float = 30.0

func _ready():
    update()

func _draw():
    var w = hex_size * sqrt(3)
    var h = hex_size * 2
    var vert = h * 0.75
    for r in range(rows):
        for c in range(cols):
            var x = c * w + (r % 2) * (w / 2) + hex_size
            var y = r * vert + hex_size
            _draw_hex(Vector2(x, y))

func _draw_hex(center: Vector2) -> void:
    var points : PackedVector2Array = []
    for i in range(6):
        var angle = PI / 3 * i + PI / 6
        var point = center + Vector2(hex_size * cos(angle), hex_size * sin(angle))
        points.append(point)
    points.append(points[0])
    for i in range(points.size() - 1):
        draw_line(points[i], points[i + 1], Color(0.2, 0.2, 0.2), 1.0)
