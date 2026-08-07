//plataforma objeto; anda mal xd
Jugador heroe;
float gravedad = 0.6;

// Variables de la Cámara y Bucle
float camaraX = 0; 
float anchoSuelo = 400;
float anchoNubeBucle = 300;

void setup() {
  size(800, 600);
  // Inicializamos al jugador en la posición X:100, Y:200
  heroe = new Jugador(100, 200); 
}

void draw() {
  background(135, 206, 235); // Cielo
  
  // --- ACTUALIZACIÓN DEL JUGADOR ---
  heroe.actualizar(gravedad);
  
  // --- SISTEMA DE CÁMARA ---
  if (heroe.x > width / 2) {
    camaraX = heroe.x - width / 2;
  }
  
  // --- NUBES EN BUCLE (PARALLAX) ---
  float camaraNubes = camaraX * 0.3;
  int nubeInicio = floor(camaraNubes / anchoNubeBucle);
  int nubesVisibles = ceil(width / anchoNubeBucle) + 1;
  
  pushMatrix();
  translate(-camaraNubes, 0);
  fill(255, 255, 255, 200);
  noStroke();
  for (int i = nubeInicio; i <= nubeInicio + nubesVisibles; i++) {
    float nubeX = i * anchoNubeBucle;
    ellipse(nubeX + 50,  100, 60, 50);
    ellipse(nubeX + 80,  90,  80, 60);
    ellipse(nubeX + 110, 100, 60, 50);
    ellipse(nubeX + 200, 150, 70, 45);
    ellipse(nubeX + 230, 145, 90, 55);
  }
  popMatrix();
  stroke(0);
  
  // --- ESCENARIO Y JUGADOR (MUNDO REAL) ---
  heroe.enElSuelo = false; // Reseteamos estado antes de verificar colisiones
  int bloqueInicio = floor(camaraX / anchoSuelo);
  int bloquesVisibles = ceil(width / anchoSuelo) + 1;
  
  pushMatrix();
  translate(-camaraX, 0);
  
  fill(34, 139, 34); // Suelo verde
  for (int i = bloqueInicio; i <= bloqueInicio + bloquesVisibles; i++) {
    float sueloX = i * anchoSuelo;
    float sueloY = 500;
    float sueloAlto = 100;
    
    rect(sueloX, sueloY, anchoSuelo, sueloAlto);
    
    // DETECCIÓN DE COLISIÓN (Enviamos los datos del suelo al jugador)
    heroe.verificarColisionSuelo(sueloX, sueloY, anchoSuelo);
  }
  
  // Dibujamos al jugador en el espacio del mundo
  heroe.dibujar();
 //objeto.mostrar();
  popMatrix();
}
