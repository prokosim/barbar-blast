extends CanvasLayer

@onready var start_1: TextureRect = %Start1
@onready var start_2: TextureRect = %Start2
@onready var start_3: TextureRect = %Start3
@onready var health_label: Label = %HealthLabel
@onready var money_label: Label = %MoneyLabel

@onready var base = get_tree().get_first_node_in_group("base")
@onready var bank = get_tree().get_first_node_in_group("bank")

func victory() -> void:
	visible = true
	if base.current_health == base.max_health:
		start_2.modulate = Color.WHITE
		health_label.visible = true
		if bank.gold > 500:
			start_3.modulate = Color.WHITE_SMOKE
			money_label.visible = true
		

func _on_retry_button_pressed() -> void:
	get_tree().reload_current_scene()

func _on_quit_button_pressed() -> void:
	get_tree().quit()
