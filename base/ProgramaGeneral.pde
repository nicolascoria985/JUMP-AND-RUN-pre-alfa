
float jugadorX = 100;
float jugadorY = 200;
float jugadorAncho = 30;
float jugadorAlto = 40;


float velocidadX = 0;
float velocidadY = 0;
float gravedad = 0.6;
float impulsoSalto = -12;
boolean enElSuelo = false;


float camaraX = 0; 
float anchoSuelo = 400; 


boolean teclaIzquierda = false;
boolean teclaDerecha = false;

void setup() {
  size(800, 600);
}

void draw() {
  background(135, 206, 235); 
  

  velocidadX = 0;
  if (teclaIzquierda) velocidadX = -5;
  if (teclaDerecha)   velocidadX = 5;
  jugadorX += velocidadX;
  


  if (jugadorX > width / 2) {
    camaraX = jugadorX - width / 2;
  }
  

  velocidadY += gravedad;
  jugadorY += velocidadY;
  
  
  int bloqueInicio = floor(camaraX / anchoSuelo);
  int bloquesVisibles = ceil(width / anchoSuelo) + 1;
  
  enElSuelo = false; 
  
  pushMatrix();
  translate(-camaraX, 0); 
  
  fill(34, 139, 34); 
  

  for (int i = bloqueInicio; i <= bloqueInicio + bloquesVisibles; i++) {
    float sueloX = i * anchoSuelo;
    float sueloY = 500;
    float sueloAlto = 100;
    
    rect(sueloX, sueloY, anchoSuelo, sueloAlto);
    
   
    if (jugadorX + jugadorAncho > sueloX && jugadorX < sueloX + anchoSuelo) {
      if (jugadorY + jugadorAlto >= sueloY && jugadorY + jugadorAlto <= sueloY + velocidadY + 1) {
        jugadorY = sueloY - jugadorAlto;
        velocidadY = 0;
        enElSuelo = true;
      }
    }
  }
  
  fill(255, 69, 0);
  rect(jugadorX, jugadorY, jugadorAncho, jugadorAlto);
  
  popMatrix();
}
