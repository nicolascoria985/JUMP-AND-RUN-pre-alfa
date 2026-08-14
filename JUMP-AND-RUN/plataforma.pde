class Plataforma {
PVector pos;
float alto = random(50, 110);
float ancho = random(50, 110);
color c = color(139, 69,19);

Plataforma(float x, float y){
pos = new PVector (x, y);
}


void mostrar(){
fill(c);
rect(pos.x, pos.y, ancho, alto);
}
}
