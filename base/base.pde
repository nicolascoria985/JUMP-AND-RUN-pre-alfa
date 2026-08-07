// 1. Variables del Jugador
float jugadorX = 100;
float jugadorY = 200;
float jugadorAncho = 30;
float jugadorAlto = 40;

// 2. Variables de Física
float velocidadX = 0;
float velocidadY = 0;
float gravedad = 0.6;
float impulsoSalto = -12;
boolean enElSuelo = false;

// 3. Variables de la Cámara y Bucle (NUEVO)
float camaraX = 0; 
float anchoSuelo = 400; // Ancho de cada bloque de suelo

// 4. Variables de Control
boolean teclaIzquierda = false;
boolean teclaDerecha = false;

void setup() {
  size(800, 600);
}

void draw() {
  background(135, 206, 235); // Cielo
  
  // --- LÓGICA DE MOVIMIENTO HORIZONTAL ---
  velocidadX = 0;
  if (teclaIzquierda) velocidadX = -5;
  if (teclaDerecha)   velocidadX = 5;
  jugadorX += velocidadX;
  
  // --- SISTEMA DE CÁMARA (NUEVO) ---
  // La cámara sigue al jugador cuando pasa de la mitad de la pantalla
  if (jugadorX > width / 2) {
    camaraX = jugadorX - width / 2;
  }
  
  // --- LÓGICA DE GRAVEDAD ---
  velocidadY += gravedad;
  jugadorY += velocidadY;
  
  // --- DIBUJAR ESCENARIO EN BUCLE (NUEVO) ---
  // Calculamos qué bloques de suelo son visibles en base a la posición de la cámara
  int bloqueInicio = floor(camaraX / anchoSuelo);
  int bloquesVisibles = ceil(width / anchoSuelo) + 1;
  
  enElSuelo = false; // Asumimos que está en el aire hasta verificar colisión
  
  pushMatrix();
  translate(-camaraX, 0); // Mueve todo el dibujo en sentido contrario a la cámara
  
  fill(34, 139, 34); // Verde césped
  
  // Dibujamos solo los bloques que se necesitan ver en pantalla
  for (int i = bloqueInicio; i <= bloqueInicio + bloquesVisibles; i++) {
    float sueloX = i * anchoSuelo;
    float sueloY = 500;
    float sueloAlto = 100;
    
    rect(sueloX, sueloY, anchoSuelo, sueloAlto);
    
    // DETECCIÓN DE COLISIÓN (Adaptada a cada bloque)
    if (jugadorX + jugadorAncho > sueloX && jugadorX < sueloX + anchoSuelo) {
      if (jugadorY + jugadorAlto >= sueloY && jugadorY + jugadorAlto <= sueloY + velocidadY + 1) {
        jugadorY = sueloY - jugadorAlto;
        velocidadY = 0;
        enElSuelo = true;
      }
    }
  }
  
  // Dibujar Jugador dentro del espacio del mundo
  fill(255, 69, 0);
  rect(jugadorX, jugadorY, jugadorAncho, jugadorAlto);
  
  popMatrix();
}
