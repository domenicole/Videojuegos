extends Node2D

@onready var hud: Label = $Hud

# Contadores de move_right
var cuadro_pulsado: int = 0
var eventos_recibidos: int = 0

# Información del último evento
var ultima_clase: String = "Ninguno"
var ultimo_dispositivo: String = "Ninguno"
var ultima_senal: String = "Ninguna"


func _physics_process(delta: float) -> void:

	# SONDEO: contar los cuadros donde D está pulsada
	if Input.is_action_pressed("move_right"):
		cuadro_pulsado += 1

	# Valores de las acciones
	var jump_pulsado = Input.is_action_pressed("jump")
	var eje = Input.get_axis("move_left", "move_right")
	var fuerza_derecha = Input.get_action_strength("move_right")

	# Actualizar HUD
	hud.text = """
	=== PANEL DE CONTROL ===

	Jump: %s

	Get Axis: %.2f
	Fuerza move_right: %.2f

	=== ULTIMO EVENTO ===

	Clase: %s
	Dispositivo: %s
	Tipo de señal: %s

	=== CONTADORES move_right ===

	Sondeo: %d cuadros
	Eventos: %d eventos
	""" % [
		str(jump_pulsado),
		eje,
		fuerza_derecha,
		ultima_clase,
		ultimo_dispositivo,
		ultima_senal,
		cuadro_pulsado,
		eventos_recibidos
	]


func _input(event: InputEvent) -> void:

	# Ignorar el eco de las teclas
	if event is InputEventKey and event.is_echo():
		return

	# Contar eventos de move_right (pulsar y soltar)
	if event.is_action("move_right"):
		eventos_recibidos += 1

	# Identificar la clase del evento
	ultima_clase = event.get_class()

	# Identificar el dispositivo
	ultimo_dispositivo = "Dispositivo ID: " + str(event.device)

	# Identificar el tipo de señal
	# Primero comprobamos la rueda del ratón
	if event is InputEventMouseButton:

		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			ultima_clase = "Rueda del raton arriba"
			ultima_senal = "Digital"

		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			ultima_clase = "Rueda del raton abajo"
			ultima_senal = "Digital"

		else:
			ultima_senal = "Digital (clic)"

	elif event is InputEventMouseMotion:
		ultima_senal = "Posicion"

	elif event is InputEventKey:
		ultima_senal = "Digital"

	else:
		ultima_senal = "Digital"
