extends RangedWeapon

onready var famle_burn_particles = $"%BurningParticles"

func update_sprite(new_sprite: Texture) -> void :
	.update_sprite(new_sprite)

	if is_instance_valid(famle_burn_particles):
		famle_burn_particles.emitting = not famle_burn_particles.emitting
