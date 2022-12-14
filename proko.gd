extends Spatial

var spedium : float = -299
var spediumj : float = 2
var spediumg : float = 2

var rodus_maara :int = 12
var tietokulme = [load("res://rosdus.tscn"),
	load("res://rodus.tscn"),load("res://tow_truck.tscn"),]
	



onready var masterpieez = $masterpiece2
onready var pipo = $pipo/Camera
onready var loysit: Control = $ui3/kanastart2




# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = true
	masterpieez.setup_jump(spediumj, spediumg, spedium)
	randomize()
	
	for a in range(rodus_maara):
		var tieto = rundumr()
		tieto.translation.z = (-1) * routa.pitu
		tieto.translation.z = -routa.pitu
		tieto.translation.z = -routa.pitu
		tieto.translation.z = -routa.pitu
		tieto.translation.z = -routa.pitu
		add_child(tieto)
		
		
	
	
	
	
	
	
	
	
	
	
	
	








	pass # Replace with function body.

func _physics_process(delta):
	
	if masterpieez.translation.z < -routa.pitu:
		masterpieez.translation.z += routa.pitu
		for paketti_auto in get_children():
			var tieto = paketti_auto as routa
			if tieto:
				tieto.translation.z += routa.pitu
				if tieto.translation.z > routa.pitu:
					tieto.queue_free()
				
					
		var tietorun := rundumr()
		tietorun.translation.z = rodus_maara * -routa.pitu
		add_child(tietorun)
	
	pipo.translation = masterpieez.translation
	pipo.translation.y = 0
	

func rundumr() -> routa:
	var kulm = tietokulme[randi()% tietokulme.size()]
	var tieto = kulm.instance()
	return tieto
	
	
	






func _on_kanastart_kana():
	get_tree().paused =false 


func _on_masterpiece2_osuitko():
	get_tree().paused = true
	loysit.show()






func _on_kanastart2_kana():
	get_tree().reload_current_scene()
