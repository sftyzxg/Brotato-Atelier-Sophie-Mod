extends 'res://items/global/effect.gd'

export (String) var item_id
export (String) var stat_to_check
export (int) var threshold

static func get_id() -> String:
	return "gain_item_based_on_stat"

func apply(player_index: int) -> void:
# 获取当前玩家的 `stat_attack_speed`
	var stat_value = Utils.get_stat(stat_to_check, player_index)
	print("当前角色的属性为：",stat_value)

	# 获取玩家当前拥有的所有道具
	var current_items = Utils.brotils_get_current_items()

	# 获取 `plachta` 道具的数量（如果没有，则默认为 0）
	var plachta_count = 0
	if current_items.has(item_id):
		plachta_count = current_items[item_id]

	# 计算攻速除以 100 的结果（向下取整）
	var required_count = int(stat_value / threshold)

	# 如果 `stat_attack_speed / 100` 比 `plachta` 数量多，就给予道具
	if required_count > plachta_count:
		RunData.add_item(item_id, player_index)
		print("玩家", player_index, "获得了新道具！当前攻速:", stat_value, "当前plachta数量:", plachta_count)


func get_args(player_index: int) -> Array:
	var stat_text = tr(stat_to_check.to_upper())
	var item_text = tr(item_id.to_upper())
	return [stat_text, str(threshold), item_text]

func serialize() -> Dictionary:
	var serialized = .serialize()
	serialized["stat_to_check"] = stat_to_check
	serialized["threshold"] = threshold
	serialized["item_id"] = item_id
	return serialized

func deserialize_and_merge(serialized: Dictionary) -> void:
	.deserialize_and_merge(serialized)
	stat_to_check = serialized.stat_to_check
	threshold = serialized.threshold as int
	item_id = serialized.item_id

