Enemigo miEnemigo;


void setup(){
size(600, 600);
miEnemigo = new Enemigo (400, 300, 20);
}

void draw(){
background (0);

miEnemigo.actualizar();
miEnemigo.dibujar();
}
