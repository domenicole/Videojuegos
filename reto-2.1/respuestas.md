# Respuestas

1. Al mantener D, el contador de sondeo aumenta más porque registra cada cuadro de física mientras la tecla permanece pulsada, por otro lado, el contador de eventos aumenta únicamente al pulsar y soltar la tecla.
2. Al mantener A, get_axis muestra -1.00 y get_action_strength("move_right") muestra 0.00, debido a que se detecta la dirección izquierda, mientras que la fuerza de move_right mide el desplazamiento a la derecha.
3. Al girar la rueda del ratón aparece un evento de rueda (arriba o abajo); y su rama va antes porque debe comprobarse antes que la del clic, ya que ambos utilizan InputEventMouseButton y es necesario distinguirlos mediante button_index.
