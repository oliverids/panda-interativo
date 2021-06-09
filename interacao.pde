Panda[] pandas = new Panda[10];
int apaga_panda = -1;

void setup() {
  size(720, 600);
  colorMode(HSB, 360, 100, 100);
  for (int i = 0; i < pandas.length; i++) {
    float dd = random(50, 100);
    pandas[i] = new Panda(random(dd/2, width-dd/2), random(dd/2, height-dd/2), dd);
  }
}

void draw() {
  background(50);
  for (int i = 0; i < pandas.length; i++) {
    pandas[i].display(); 
    pandas[i].move();
  }
  if (apaga_panda > -1) { 
    pandas[apaga_panda].visibility = false;
    apaga_panda = -1; 
  }
  
 
}


void mousePressed() { 
  for (int i = 0; i < pandas.length; i++) { //percorro todo o array de pandas
    if (pandas[i].click()) { //verifico se o clique do mouse foi em algum panda
      apaga_panda = i; //armazeno na variavel apaga_panda o nº do panda no array que devera' ser apagado 
    }
  }
  if (apaga_panda == -1) {//so' vai executar isso se nenhum panda estiver marcado para apagar
    float dd = random(50, 100);
    float posX = constrain(mouseX, dd/2, width-dd/2); //para evitar que crie um panda 'preso' nas bordas
    float posY = constrain(mouseY, dd/2, height-dd/2);//para evitar que crie um panda 'preso' nas bordas
    pandas = (Panda[]) expand(pandas, pandas.length + 1);//aumento o tamanho do array em +1
    pandas[pandas.length-1] = new Panda(posX, posY, dd);//crio um novo panda
  }
  
   println(apaga_panda);
}
