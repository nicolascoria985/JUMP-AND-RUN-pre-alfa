class Enemigo {
  // Propiedades de posición y tamaño
  float x;
  float y;
  float radio; // Para la lógica de colisión matemática
  
  // Propiedades de movimiento
  float velocidadX;
  float velocidadY;
  
  // Variable para almacenar la imagen del enemigo
  PImage sprite;
  
  // Constructor simplificado: ya no necesita recibir el texto del nombre
  Enemigo(float xInicial, float yInicial, float radioInicial) {
    x = xInicial;
    y = yInicial;
    radio = radioInicial;
    
    velocidadX = 3; 
    velocidadY = 0; 
    
    // CAMBIO AQUÍ: Cargamos directamente tu archivo PNG
    // Recordá que "images(1).png" debe estar en la carpeta 'data'
    sprite = loadImage("enemigo(2).png");
  }
  
  // Método para actualizar la física y posición
  void actualizar() {
    x += velocidadX;
    y += velocidadY;
    
    // Rebote en los bordes de la pantalla
    if (x - radio < 0 || x + radio > width) {
      velocidadX *= -1; 
    }
    if (y - radio < 0 || y + radio > height) {
      velocidadY *= -1; 
    }
  }
  
  // Método para renderizar la imagen en pantalla
  void dibujar() {
    // Centramos el dibujo en los ejes X e Y del objeto
    imageMode(CENTER);
    
    // Dibujamos tu PNG escalado al diámetro (radio * 2)
    image(sprite, x, y, radio * 2, radio * 2);
  }
}
