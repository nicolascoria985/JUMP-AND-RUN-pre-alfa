// --- CAPTURA DE TECLADO (Pestaña Principal) ---
void keyPressed() {
  if (keyCode == LEFT || key == 'a')  heroe.teclaIzquierda = true;
  if (keyCode == RIGHT || key == 'd') heroe.teclaDerecha = true;
  if (keyCode == UP || key == 'w')    heroe.saltar();
}

void keyReleased() {
  if (keyCode == LEFT || key == 'a')  heroe.teclaIzquierda = false;
  if (keyCode == RIGHT || key == 'd') heroe.teclaDerecha = false;
}
