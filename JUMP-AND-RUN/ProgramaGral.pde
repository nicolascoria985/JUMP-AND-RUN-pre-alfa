ArrayList<Plataforma> listaPlataformas = new ArrayList<Plataforma>(); //esta es una lista dinamica que solo guarda objetos de tipo "plataforma"
float proximaPlataformaX = 400; // desde aca empieza la primera 

Jugador heroe;
PImage imgMario;
float gravedad = 0.4;

// Variables de la Cámara y Bucle
float camaraX = 0; 
float anchoSuelo = 400;
float anchoNubeBucle = 300;

void setup() {
  size(800, 600);
  
//se carga la imagen del Mario para el pj
  imgMario = loadImage("mario sprite.png");

  heroe = new Jugador(100, 300); 
  
// con esto fabricamos almenos 5 plataformas iniciales 
  for(int i = 0; i < 5; i++) {
    crearNuevaPlataforma();
  }
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
  heroe.enElSuelo = false; 
  int bloqueInicio = floor(camaraX / anchoSuelo);
  int bloquesVisibles = ceil(width / anchoSuelo) + 1;
  
  pushMatrix();
  translate(-camaraX, 0);
  
  // A. Dibujar Suelo verde continuo
  fill(34, 139, 34); 
  for (int i = bloqueInicio; i <= bloqueInicio + bloquesVisibles; i++) {
    float sueloX = i * anchoSuelo;
    float sueloY = 500;
    float sueloAlto = 100;
    
    rect(sueloX, sueloY, anchoSuelo, sueloAlto);
    heroe.verificarColisionSuelo(sueloX, sueloY, anchoSuelo);
  }
  
  // B. NUEVO: Controlar, dibujar y hacer chocar la lista de plataformas flotantes
  for (int i = listaPlataformas.size() - 1; i >= 0; i--) {
    Plataforma plat = listaPlataformas.get(i);
    plat.mostrar(); // Dibuja la plataforma actual
    
    // si las cordenas de las plataformas coinciden con las nuestras, rebotamos en ellas
    heroe.verificarColisionSuelo(plat.pos.x, plat.pos.y, plat.ancho);
    
    // si nos quedamos muy lejos de una plataforma, esta se borra
    if (plat.pos.x < camaraX - 200) {
      listaPlataformas.remove(i);
    }
  }
  
  // si nos  acercamos mucho al otro extremo se farbrica una nueva plataforma 
  if (proximaPlataformaX < camaraX + width + 400) {
    crearNuevaPlataforma();
  }
  
  // nuestro personaje se superpone ante todo
  heroe.dibujar(imgMario);
  
  popMatrix();
}

// con esto creamos las plataformas en posiciones aleatorias
void crearNuevaPlataforma() {
  float aleatorioY = random(300, 450); // alturas (accesibles para el jugador)
  listaPlataformas.add(new Plataforma(proximaPlataformaX, aleatorioY));
  
  // esta bandera de constructor crea mas plataformas a partir de un rango aleatorio 
  proximaPlataformaX += random(250, 350); 
}
