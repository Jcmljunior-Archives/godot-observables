extends Node

var store = Observables.new().get_instance()
var model_01: Dictionary = {
	"name": "Amanda",
	"age": 17,
	"method": func(args: Dictionary):
		print("A %s tem %s" % [ args.get("name"), args.get("age") ])
}
var model_02: Dictionary = {
	"name": "Camila",
	"age": 22,
	"method": func(args: Dictionary):
		print("A %s tem %s" % [ args.get("name"), args.get("age") ])
}

func _ready():
	# Inscrição dos objetos.
	store.get("subscribe").call(model_01)
	store.get("subscribe").call(model_02)
	
	# Execução da instancia.
	store.get("notify").call(model_01)
	store.get("notify").call(model_02)
	
	# Eliminação da lista de observaveis.
	store.get("unsubscribe").call(model_02)
	
	print("---")
	
	store.get("notify").call(model_01)
	store.get("notify").call(model_02)
