class Jugador {
  // Propiedades básicas
  float x, y;
  float ancho, alto;
  float velX, velY;
  float impulsoSalto;
  boolean enElSuelo;
  
  // Estados de control (El "cerebro" interno que escucha a la pestaña principal)
  boolean teclaIzquierda = false;
  boolean teclaDerecha = false;
  
  // Constructor
  Jugador(float xInicial, float yInicial) {
    x = xInicial;
    y = yInicial;
    ancho = 30;
    alto = 40;
    velX = 0;
    velY = 0;
    impulsoSalto = -12;
    enElSuelo = false;
  }
  
  // Procesa movimiento y físicas
  void actualizar(float gravedad) {
    // Calculamos velocidad según las variables booleanas que activa el teclado
    velX = 0;
    if (teclaIzquierda) velX = -5;
    if (teclaDerecha)   velX = 5;
    
    x += velX;
    
    // Aplicamos gravedad
    velY += gravedad;
    y += velY;
  }
  
  // Se encarga de su propia representación visual
  void dibujar() {
    fill(255, 69, 0); // Rojo anaranjado
    ellipse(x, y, ancho, alto);
  }
  
  // Lógica interna para ejecutar el salto
  void saltar() {
    if (enElSuelo) {
      velY = impulsoSalto;
      enElSuelo = false;
    }
  }
  
  // El jugador procesa si está tocando la plataforma actual del bucle
  void verificarColisionSuelo(float sueloX, float sueloY, float sueloAncho) {
    if (x + ancho > sueloX && x < sueloX + sueloAncho) {
      if (y + alto >= sueloY && y + alto <= sueloY + velY + 1) {
        y = sueloY - alto; // Reposicionar arriba del suelo
        velY = 0;
        enElSuelo = true;
      }
    }
  }
}
