class_name Observables
extends Node

var instance: Callable = func():
	var observers: Array = []
	
	return {
		"get_instance": observers,
		
		"subscribe": func(c: Dictionary):
			observers.append(c),
		
		"unsubscribe": func(c: Dictionary):
			for index in range(observers.size()):
				if observers[index].get("name") == c.get("name"):
					observers.remove_at(index)
					break,

		"notify": func(model: Dictionary):
			for observer in observers:
				if observer.get("name") == model.get("name"):
					# Formatação dos argumentos.
					var args: Dictionary = {}
					for arg in model:
						if arg == "method": continue
						
						args[arg] = model[arg]
					
					return observer.get("method").call(args),
	}

func get_instance() -> Dictionary:
	return instance.call()
