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
					observers.remove_at(index),

		"notify": func(model: Dictionary):
			for observer in observers:
				if observer.get("name") == model.get("name"):
					observer.get("method").call(model.get("name"), model.get("age"))
					break,
	}

func get_instance() -> Dictionary:
	return instance.call()
