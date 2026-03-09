extends Node2D

@export var enemy_scene : PackedScene
@export var spawn_time = 2.0
@export var spawn_radius = 400

func _ready():
    spawn_loop()

func spawn_loop():

    while true:

        await get_tree().create_timer(spawn_time).timeout

        var enemy = enemy_scene.instantiate()

        var angle = randf() * TAU

        var position_offset = Vector2(
            cos(angle),
            sin(angle)
        ) * spawn_radius

        enemy.global_position = position_offset

        get_parent().add_child(enemy)
