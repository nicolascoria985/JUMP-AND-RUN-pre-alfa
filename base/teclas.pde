// --- CAPTURA DE TECLADO ---
void keyPressed() {
  if (keyCode == LEFT || key == 'a')  teclaIzquierda = true;
  if (keyCode == RIGHT || key == 'd') teclaDerecha = true;
  if ((keyCode == UP || key == 'w') && enElSuelo) {
    velocidadY = impulsoSalto;
    enElSuelo = false;
  }
}

void keyReleased() {
  if (keyCode == LEFT || key == 'a')  teclaIzquierda = false;
  if (keyCode == RIGHT || key == 'd') teclaDerecha = false;
}
