extends Turret

var distance = 200
var rotation_speed

var _players: = []
var _angle = rand_range(0, 2 * PI)
var _player_index

func init(zone_min_pos: Vector2, zone_max_pos: Vector2, players_ref: Array = [], _entity_spawner_ref = null) -> void :
	.init(zone_min_pos, zone_max_pos, players_ref, _entity_spawner_ref)
	_players = players_ref
	_player_index = player_index  # 保存玩家索引


func _physics_process(delta: float) -> void :
	var attack_speed_value = RunData.get_player_effects(player_index)["stat_attack_speed"]
	if attack_speed_value >= 800:
		rotation_speed = 10 * PI
	else:
		rotation_speed = (1 + attack_speed_value/ 100) * PI 
	_angle += delta * rotation_speed
	var player_position = _players[player_index].global_position
	global_position = Vector2(player_position.x + cos(_angle) * distance, player_position.y + sin(_angle) * distance)

