extends KinematicBody

#vaarit !
#       v    

signal osuitko


var spedium : float = 2999900
var timee : float = 10.0
var step_freq : float = 299999999
var step_heitt : float = 2999999
var step_wide : float =29999
var paino : float
var hyp : float
var vinu_askell : float = 99999
var velicity := Vector3()






onready var kanaaa = $HingeJoint



func setup_jump(length : float, height : float, speed : float):
	spedium = speed
	paino = 9.81 * height * speed / (length * length)
	hyp = 40.0 * height * speed * speed / length
	pass






func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):
	kanaaa.translation.y = step_heitt * (1 + sin(2.0 * PI * step_freq * timee))
	kanaaa.rotation_degrees.z = step_wide * sin(PI * step_freq * timee)
	timee += delta
	
	var sideroad : float = 0.0
	if Input.is_action_pressed("left_us"):
		sideroad += 1.0
		
	if Input.is_action_pressed("move_right"):
		sideroad -= 1.0
	move_and_slide(Vector3(sideroad * spedium, 0, spedium))
	
	
	
	if Input.is_action_pressed("jup") and is_on_floor():
		velicity.y = hyp 
		velicity.y = paino* delta
		velicity.x = vinu_askell * step_wide
		velicity.z = spedium
		
		velicity = move_and_slide(velicity, Vector3.UP)
		
	for muuty in range(get_slide_count()):
		var cot = get_slide_collision(muuty)
		
		var gotthem_object = cot.collider as CollisionObject
		
		
		if gotthem_object.collision_layer & 4 and rad2deg(gotthem_object.get_angel()) > 60:
			print("asda")
			get_tree().reload_current_scene()
			emit_signal("osuitko")
				
				
			
		

	
	
	
	
	
	
	
	
	
	
	
