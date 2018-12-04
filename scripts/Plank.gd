extends Area


export var is_first = false
export(PackedScene) var nail

const MIN_SPAWN_INTERVAL = 5
const MAX_SPAWN_INTERVAL = 7.5

export var speed = 5

var last_spawn_position
var nails_and_bombs = []



func _ready():
	if !is_first:
		spawn_nails_and_bombs()


func _process(delta):
	translation.x += speed * delta
	if translation.x >= 75:
		translation.x = -25 + speed * delta
		spawn_nails_and_bombs()


func spawn_nails_and_bombs():
	randomize()

	for item in nails_and_bombs:
		item.queue_free()
	nails_and_bombs = []
	
	last_spawn_position = 0
	while last_spawn_position > -50:
		last_spawn_position -= rand_range(MIN_SPAWN_INTERVAL, MAX_SPAWN_INTERVAL)
		if last_spawn_position < -50:
			last_spawn_position = -50
		
		var new_item = nail.instance()
		add_child(new_item)
		new_item.translation = Vector3(last_spawn_position, 0.5, 1)
		
		nails_and_bombs.append(new_item)
