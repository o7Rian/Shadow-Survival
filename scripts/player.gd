extends CharacterBody2D

@export var speed = 200
var health = 100

func _ready():
    add_to_group("player")

func _physics_process(delta):

    var direction = Vector2.ZERO

    direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
    direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")

    velocity = direction.normalized() * speed

    move_and_slide()

func take_damage(amount):

    health -= amount

    if health <= 0:
        queue_free()
