import controlP5.*;

//Tabla --------------------------------------
Table tabla; //guarda los datos del mapa
Table tablaDos; 
Table tablaTres; 
Table tablaCuatro; 
Table tablaCinco; 
int rowCount; //cuenta el numero de filas
int filasDos;
int filasTres;
int filasCuatro;
int filasCinco;

//dinamico --------------------------------------
ControlP5 cp5;
int valSlider; //el valor en donde se encuentra el slider
int [] anio; //variable que guarda toda la información de la columna del año

//variables que guardan toda la información de las localidades
int [] usaquen;
int [] chapinero;
int [] santaFe;
int [] sanCristobal;
int [] usme;
int [] tunjuelito;
int [] bosa;
int [] kennedy;
int [] fontibon;
int [] engativa;
int [] suba;
int [] teusaquillo;
int [] barriosUnidos;
int [] martires;
int [] antoniNarino;
int [] puenteAranda;
int [] candelaria;
int [] rafaelUribe;
int [] ciudadBolivar;
int [] sumapaz;

//octavo
Slider2D sliderPunto;

//mapa -----------------------------------------
PImage mapaImage; // mapa imagen
// ubicacion de los circulos
float x = 0;
float y = 0;
float diametro = 9; //diametro de los circulos
float dataMinColumna2 = 0; //minimo
float dataMaxColumna2 = 0; //maximo

//barras -----------------------------------------
int maxDato;
String [] localidades;

int [] hombres;
int datoHombres = 0;

int [] mujeres;
int datoMujeres = 0;

//circulos -----------------------------------------
String [] edades;
int maxDatoEdad;
String datoEdades;

int [] edadK;
int datoEdadk = 0;

int [] edadS;
int datoEdadS = 0;

int [] edadCB;
int datoEdadCB = 0;

boolean ken = false;
boolean sub = false;
boolean cbo = false;

//vertex -----------------------------------------
String [] anioDes;
float maxDatoDes;

float [] desempleo;
float datoDes = 0;

void setup() {
  size(1280, 768);  
  mapaImage = loadImage("mapa.png");
  tabla = loadTable("localidades.csv");
  tablaDos = loadTable("localidadesDos.csv", "header");
  tablaTres = loadTable("suicidioHoM.csv", "header");
  tablaCuatro = loadTable("edad.csv", "header");
  tablaCinco = loadTable("desempleo.csv", "header");


  // da el numero de filas del archivo
  rowCount = tabla.getRowCount();
  filasDos = tablaDos.getRowCount();
  filasTres = tablaTres.getRowCount();
  filasCuatro = tablaCuatro.getRowCount();
  filasCinco = tablaCinco.getRowCount();

  cp5 = new ControlP5(this); 
  gui();

  anio = new int [filasDos];

  usaquen = new int [filasDos]; 
  chapinero = new int [filasDos];
  santaFe= new int [filasDos];
  sanCristobal= new int [filasDos];
  usme= new int [filasDos];
  tunjuelito = new int [filasDos];
  bosa= new int [filasDos];
  kennedy = new int [filasDos];
  fontibon= new int [filasDos];
  engativa= new int [filasDos];
  suba= new int [filasDos];
  teusaquillo= new int [filasDos];
  barriosUnidos = new int [filasDos];
  martires= new int [filasDos];
  antoniNarino= new int [filasDos];
  puenteAranda= new int [filasDos];
  candelaria= new int [filasDos];
  rafaelUribe= new int [filasDos];
  ciudadBolivar= new int [filasDos];
  sumapaz= new int [filasDos];

  //recorre el archivo Localidades DOS
  for (int i = 0; i < filasDos; i++) 
  {
    TableRow row = tablaDos.getRow(i);

    anio[i] = row.getInt("año");
    usaquen[i] = row.getInt("Usaquén");
    chapinero[i] = row.getInt("Chapinero");
    santaFe[i] = row.getInt("Santa Fe");
    sanCristobal[i] = row.getInt("San Cristobal");
    usme[i] = row.getInt("Usme");
    tunjuelito[i] = row.getInt("Tunjuelito");
    bosa[i] = row.getInt("Bosa");
    kennedy[i] = row.getInt("Kennedy");
    fontibon[i] = row.getInt("Fontibón");
    engativa[i] = row.getInt("Engativá");
    suba[i] = row.getInt("Suba");
    teusaquillo[i] = row.getInt("Teusaquillo");
    barriosUnidos[i] = row.getInt("Barrios Unidos");
    martires[i] = row.getInt("Los Mártires");
    antoniNarino[i] = row.getInt("Antonio Nariño");
    puenteAranda[i] = row.getInt("Puente Aranda");
    candelaria[i] = row.getInt("Candelaria");
    rafaelUribe[i] = row.getInt("Rafael Uribe Uribe");
    ciudadBolivar[i] = row.getInt("Ciudad Bolívar");
    sumapaz[i] = row.getInt("Sumapaz");
  }

  //barras
  localidades = new String [filasTres]; 
  hombres = new int [filasTres];
  mujeres = new int [filasTres];

  //recorre el archivo Localidades TRES -HYM
  for (int i = 0; i < filasTres; i++) 
  {
    TableRow row = tablaTres.getRow(i);

    localidades[i]= row.getString("localidad");
    hombres[i]= row.getInt("hombre");
    mujeres[i]= row.getInt("mujeres");

    datoHombres = hombres[i];
    if (datoHombres > maxDato) 
    {
      maxDato = datoHombres;
    }

    datoMujeres = mujeres[i];
    if (datoMujeres > maxDato) 
    {
      maxDato = datoMujeres;
    }
  }
  //recorre el archivo Localidades edades

  edades = new String [filasCuatro]; 
  edadK = new int [filasCuatro];
  edadS = new int [filasCuatro];
  edadCB = new int [filasCuatro];

  for (int i = 0; i < filasCuatro; i++) 
  {
    TableRow row = tablaCuatro.getRow(i);

    edades[i]= row.getString("edad");
    edadK[i]= row.getInt("kennedy");
    edadS[i]= row.getInt("suba");
    edadCB[i]= row.getInt("ciudadBolivar");

    datoEdadk = edadK[i];
    if (datoEdadk> maxDatoEdad) 
    {
      maxDatoEdad =  datoEdadk;
    }

    datoEdadS = edadS[i];
    if (datoEdadS> maxDatoEdad) 
    {
      maxDatoEdad =  datoEdadS;
    }

    datoEdadCB = edadCB[i];
    if (datoEdadCB> maxDatoEdad) 
    {
      maxDatoEdad =  datoEdadCB;
    }
  }

  anioDes = new String [filasCinco];
  desempleo = new float [filasCinco];

  for (int i = 0; i < filasCinco; i++)
  {
    TableRow row = tablaCinco.getRow(i);

    anioDes[i]= row.getString("año");
    desempleo[i]= row.getFloat("dato");

    datoDes = desempleo[i];
    if (datoDes > maxDatoDes) 
    {
      maxDatoDes = datoDes;
    }
  }
}

void draw() {

  background(255); 
  
  fill(#b1c4d8);
  stroke(#55a1c0);
  strokeWeight(3);
  rect(25, 25, 1220,768);
  image(mapaImage, 109, 150);

  fill(#002b5a);
  textSize(30);
  text("SUICIDIO EN BOGOTÁ", 100, 100);


  textSize(15);
  text("Kennedy es la localidad", 1050, 160);
  textSize(12);
  text("con más casos de", 1050, 180);
  text("suicidio en el 2018", 1050, 200);

  textSize(15);
  text("Hombres ", 1050, 370);
  textSize(12);
  text("entre los 30 a 34 años", 1050, 390);
  text("Los que comenten suicidio", 1050, 410);

  textSize(15);
  text("El desempleo ", 1050, 580);
  textSize(12);
  text("Puede no estar relacionado", 1050, 600);
  text("con las causas del suicidio", 1050, 620);

  graficaBarras();
  porcentaje();
}


void porcentaje() 
{
  //println(valSlider); 
  for (int i = 0; i < filasDos; i++)
  { 
    float x = map(i, 0, filasDos-1, 103, 600);
    fill(0);
    textSize(12); 
    pushMatrix();
    translate(x, 610);
    rotate(PI/2);
    text(anio[i], 0, 0);
    popMatrix();
  }
  fill(#ffcba6);
  ellipse(200, 197, usaquen[valSlider], usaquen[valSlider]);
  ellipse(320, 249, chapinero[valSlider], chapinero[valSlider]);
  ellipse(408, 294, santaFe[valSlider], santaFe[valSlider]);
  ellipse(467, 323, sanCristobal[valSlider], sanCristobal[valSlider]);
  ellipse(533, 371, usme[valSlider], usme[valSlider]);
  ellipse(428, 404, tunjuelito[valSlider], tunjuelito[valSlider]);
  ellipse(374, 494, bosa[valSlider], bosa[valSlider]);
  ellipse(353, 411, kennedy[valSlider], kennedy[valSlider]);
  ellipse(258, 391, fontibon[valSlider], fontibon[valSlider]);
  ellipse(252, 324, engativa[valSlider], engativa[valSlider]);
  ellipse(203, 272, suba[valSlider], suba[valSlider]);
  ellipse(334, 301, teusaquillo[valSlider], teusaquillo[valSlider]);
  ellipse(286, 279, barriosUnidos[valSlider], barriosUnidos[valSlider]);
  ellipse(394, 317, martires[valSlider], martires[valSlider]);
  ellipse(422, 336, antoniNarino[valSlider], antoniNarino[valSlider]);
  ellipse(374, 351, puenteAranda[valSlider], puenteAranda[valSlider]);
  ellipse(422, 272, candelaria[valSlider], candelaria[valSlider]);
  ellipse(447, 366, rafaelUribe[valSlider], rafaelUribe[valSlider]);
  ellipse(484, 420, ciudadBolivar[valSlider], ciudadBolivar[valSlider]);
  ellipse(593, 336, sumapaz[valSlider], sumapaz[valSlider]);

  textSize(16); 
  //Condición USAQUEN
  if (sliderPunto.getArrayValue()[0] <=47) // X
  {
    if (sliderPunto.getArrayValue()[1] <=26 )// Y
    {
      fill(0);
      text("Nº de Casos en usaquen : " + usaquen[valSlider], 330, 160);
      fill(#3377a4);
      ellipse(200, 197, usaquen[valSlider], usaquen[valSlider]);
    }
  } else {
    fill(#ffcba6);
    ellipse(200, 197, usaquen[valSlider], usaquen[valSlider]);
  }

  //Condición CHAPINERO
  if (sliderPunto.getArrayValue()[0] <=70 && sliderPunto.getArrayValue()[0] >=47) // X
  {
    if (sliderPunto.getArrayValue()[1] <=36 && sliderPunto.getArrayValue()[1] >= 26 )// Y
    {
      fill(0);
      text("Nº de Casos en Chapinero : " + chapinero[valSlider], 330, 160);
      fill(#3377a4);
      ellipse(320, 249, chapinero[valSlider], chapinero[valSlider]);
    }
  } else {
    fill(#ffcba6);
    ellipse(320, 249, chapinero[valSlider], chapinero[valSlider]);
  }

  //Condición SANTAFE
  if (sliderPunto.getArrayValue()[0] <=91 && sliderPunto.getArrayValue()[0] >=70) // X
  {
    if (sliderPunto.getArrayValue()[1] <=47 && sliderPunto.getArrayValue()[1] >= 36)// Y
    {
      fill(0);
      text("Nº de Casos en Santa fé : " + santaFe[valSlider], 330, 140);
      fill(#3377a4);
      ellipse(408, 294, santaFe[valSlider], santaFe[valSlider]);
    }
  } else {
    fill(#ffcba6);
    ellipse(408, 294, santaFe[valSlider], santaFe[valSlider]);
  }

  //Condición CANDELARIA
  if (sliderPunto.getArrayValue()[0] <=79 && sliderPunto.getArrayValue()[0] >=91) // X
  {
    if (sliderPunto.getArrayValue()[1] <=23 && sliderPunto.getArrayValue()[1] >= 47)// Y
    {
      fill(0);
      text("Nº de Casos en Candelaria : " + candelaria[valSlider], 330, 160);
      fill(#3377a4);
      ellipse(422, 272, candelaria[valSlider], candelaria[valSlider]);
    }
  } else {
    fill(#ffcba6);
    ellipse(422, 272, candelaria[valSlider], candelaria[valSlider]);
  }

  //Condición SUBA
  if (sliderPunto.getArrayValue()[0] <=39 && sliderPunto.getArrayValue()[0] >=20) // X
  {
    if (sliderPunto.getArrayValue()[1] <=53 && sliderPunto.getArrayValue()[1] >= 20)// Y
    {
      fill(0);
      text("Nº de Casos en Suba : " + suba[valSlider], 330, 180);
      fill(#3377a4);
      ellipse(203, 272, suba[valSlider], suba[valSlider]);
    }
  } else {
    fill(#ffcba6);
    ellipse(203, 272, suba[valSlider], suba[valSlider]);
  }

  //Condición ENGATIVA
  if (sliderPunto.getArrayValue()[0] <=52 && sliderPunto.getArrayValue()[0] >=40) // X
  {
    if (sliderPunto.getArrayValue()[1] <=73 && sliderPunto.getArrayValue()[1] >= 60)// Y
    {
      fill(0);
      text("Nº de Casos en Engativá : " + engativa[valSlider], 330, 160);
      fill(#3377a4);
      ellipse(252, 324, engativa[valSlider], engativa[valSlider]);
    }
  } else {
    fill(#ffcba6);
    ellipse(252, 324, engativa[valSlider], engativa[valSlider]);
  }

  //Condición FONTIBON
  if (sliderPunto.getArrayValue()[0] <=55 && sliderPunto.getArrayValue()[0] >=45) // X
  {
    if (sliderPunto.getArrayValue()[1] <=83 && sliderPunto.getArrayValue()[1] >= 73)// Y
    {
      fill(0);
      text("Nº de Casos en  Fontibón : " + fontibon[valSlider], 330, 160);
      fill(#3377a4);
      ellipse(258, 391, fontibon[valSlider], fontibon[valSlider]);
    }
  } else {
    fill(#ffcba6);
    ellipse(258, 391, fontibon[valSlider], fontibon[valSlider]);
  }

  //Condición BARRIOS UNIDOS
  if (sliderPunto.getArrayValue()[0] <=48 && sliderPunto.getArrayValue()[0] >=38) // X
  {
    if (sliderPunto.getArrayValue()[1] <=44 && sliderPunto.getArrayValue()[1] >= 33)// Y
    {
      fill(0);
      text("Nº de Casos en  Barrios Unidos : " + barriosUnidos[valSlider], 330, 160);
      fill(#3377a4);
      ellipse(286, 279, barriosUnidos[valSlider], barriosUnidos[valSlider]);
    }
  } else {
    fill(#ffcba6);
    ellipse(286, 279, barriosUnidos[valSlider], barriosUnidos[valSlider]);
  }

  //Condición TEUSAQUILLO
  if (sliderPunto.getArrayValue()[0] <=57 && sliderPunto.getArrayValue()[0] >=47) // X
  {
    if (sliderPunto.getArrayValue()[1] <=52 && sliderPunto.getArrayValue()[1] >= 42)// Y
    {
      fill(0);
      text("Nº de Casos en  Teusaquillo : " + teusaquillo[valSlider], 330, 180);
      fill(#3377a4);
      ellipse(334, 301, teusaquillo[valSlider], teusaquillo[valSlider]);
    }
  } else {
    fill(#ffcba6);
    ellipse(334, 301, teusaquillo[valSlider], teusaquillo[valSlider]);
  }

  //Condición MARTIRES
  if (sliderPunto.getArrayValue()[0] <=71 && sliderPunto.getArrayValue()[0] >=55) // X
  {
    if (sliderPunto.getArrayValue()[1] <=55 && sliderPunto.getArrayValue()[1] >= 45)// Y
    {
      fill(0);
      text("Nº de Casos en  Mártires : " + martires[valSlider], 330, 160);
      fill(#3377a4);

      ellipse(394, 317, martires[valSlider], martires[valSlider]);
    }
  } else {
    fill(#ffcba6);
    ellipse(394, 317, martires[valSlider], martires[valSlider]);
  }

  //Condición PUENTE ARANDA
  if (sliderPunto.getArrayValue()[0] <=73 && sliderPunto.getArrayValue()[0] >=63) // X
  {
    if (sliderPunto.getArrayValue()[1] <=67 && sliderPunto.getArrayValue()[1] >= 57)// Y
    {
      fill(0);
      text("Nº de Casos en  Puente Aranda : " + puenteAranda[valSlider], 330, 160);
      fill(#3377a4);
      ellipse(374, 351, puenteAranda[valSlider], puenteAranda[valSlider]);
    }
  } else {
    fill(#ffcba6);
    ellipse(374, 351, puenteAranda[valSlider], puenteAranda[valSlider]);
  }

  //Condición KENNEDY
  if (sliderPunto.getArrayValue()[0] <=69 && sliderPunto.getArrayValue()[0] >=59) // X
  {
    if (sliderPunto.getArrayValue()[1] <=82 && sliderPunto.getArrayValue()[1] >= 72)// Y
    {
      fill(0);
      text("Nº de Casos en  Kennedy : " + kennedy[valSlider], 330, 160);
      fill(#3377a4);
      ellipse(353, 411, kennedy[valSlider], kennedy[valSlider]);
    }
  } else {
    fill(#ffcba6);
    ellipse(353, 411, kennedy[valSlider], kennedy[valSlider]);
  }

  //Condición BOSA
  if (sliderPunto.getArrayValue()[0] <=78 && sliderPunto.getArrayValue()[0] >=68) // X
  {
    if (sliderPunto.getArrayValue()[1] <=93 && sliderPunto.getArrayValue()[1] >= 83)// Y
    {
      fill(0);
      text("Nº de Casos en  Bosa: " + bosa[valSlider], 330, 160);
      fill(#3377a4);
      ellipse(374, 494, bosa[valSlider], bosa[valSlider]);
    }
  } else {
    fill(#ffcba6);
    ellipse(374, 494, bosa[valSlider], bosa[valSlider]);
  }

  //Condición ANTONIO NARIÑO
  if (sliderPunto.getArrayValue()[0] <=84 && sliderPunto.getArrayValue()[0] >=74) // X
  {
    if (sliderPunto.getArrayValue()[1] <=52 && sliderPunto.getArrayValue()[1] >= 42)// Y
    {
      fill(0);
      text("Nº de Casos en Antonio Nariño: " + antoniNarino[valSlider], 330, 180);
      fill(#3377a4);
      ellipse(422, 336, antoniNarino[valSlider], antoniNarino[valSlider]);
    }
  } else {
    fill(#ffcba6);
    ellipse(422, 336, antoniNarino[valSlider], antoniNarino[valSlider]);
  }

  //Condición SAN CRISTOBAL
  if (sliderPunto.getArrayValue()[0] <=86 && sliderPunto.getArrayValue()[0] >=76) // X
  {
    if (sliderPunto.getArrayValue()[1] <=34 && sliderPunto.getArrayValue()[1] >= 24)// Y
    {
      fill(0);
      text("Nº de Casos en San cristobal: " + sanCristobal[valSlider], 330, 190);
      fill(#3377a4);
      ellipse(467, 323, sanCristobal[valSlider], sanCristobal[valSlider]);
    }
  } else {
    fill(#ffcba6);
    ellipse(467, 323, sanCristobal[valSlider], sanCristobal[valSlider]);
  }

  //Condición RAFAEL URIBE
  if (sliderPunto.getArrayValue()[0] <=86 && sliderPunto.getArrayValue()[0] >=76) // X
  {
    if (sliderPunto.getArrayValue()[1] <=55 && sliderPunto.getArrayValue()[1] >= 44)// Y
    {
      fill(0);
      text("Nº de Casos en Rafael Uribe: " + rafaelUribe[valSlider], 330, 160);
      fill(#3377a4);
      ellipse(447, 366, rafaelUribe[valSlider], rafaelUribe[valSlider]);
    }
  } else {
    fill(#ffcba6);
    ellipse(447, 366, rafaelUribe[valSlider], rafaelUribe[valSlider]);
  }
  //Condición TUNJUELITO
  if (sliderPunto.getArrayValue()[0] <=87 && sliderPunto.getArrayValue()[0] >=77) // X
  {
    if (sliderPunto.getArrayValue()[1] <=68 && sliderPunto.getArrayValue()[1] >= 58)// Y
    {
      fill(0);
      text("Nº de Casos en Tunjuelito: " + tunjuelito[valSlider], 330, 190);
      fill(#3377a4);
      ellipse(428, 404, tunjuelito[valSlider], tunjuelito[valSlider]);
    }
  } else {
    fill(#ffcba6);
    ellipse(428, 404, tunjuelito[valSlider], tunjuelito[valSlider]);
  }

  //Condición USME
  if (sliderPunto.getArrayValue()[0] <=98 && sliderPunto.getArrayValue()[0] >=88) // X
  {
    if (sliderPunto.getArrayValue()[1] <=52 && sliderPunto.getArrayValue()[1] >= 42)// Y
    {
      fill(0);
      text("Nº de Casos en Usme: " + usme[valSlider], 330, 190);
      fill(#3377a4);
      ellipse(533, 371, usme[valSlider], usme[valSlider]);
    }
  } else {
    fill(#ffcba6);
    ellipse(533, 371, usme[valSlider], usme[valSlider]);
  }

  //Condición Ciudad Bolivar
  if (sliderPunto.getArrayValue()[0] <=95 && sliderPunto.getArrayValue()[0] >=85) // X
  {
    if (sliderPunto.getArrayValue()[1] <=76 && sliderPunto.getArrayValue()[1] >= 66)// Y
    {
      fill(0);
      text("Nº de Casos en Ciudad Bolivar: " + ciudadBolivar[valSlider], 330, 220);
      fill(#3377a4);
      ellipse(484, 420, ciudadBolivar[valSlider], ciudadBolivar[valSlider]);
    }
  } else {
    fill(#ffcba6);
    ellipse(484, 420, ciudadBolivar[valSlider], ciudadBolivar[valSlider]);
  }

  if (ken==true) 
  {
    noStroke();
    fill(#D6A63F);
    //grafica 2 edades KENNEDY
    for (int i = 0; i < filasCuatro; i++)  
    {
      float x = map(i, 0, filasTres-1, 740, 920); 
      float y = map(edadK[i], 0, maxDatoEdad, 487, 340);
      ellipse(x, y, 20, 20);
    }
  }

  if (sub==true) 
  {
    noStroke();
    fill(#1533D3);
    //grafica 2 edades SUBA
    for (int i = 0; i < filasCuatro; i++)  
    {
      float x = map(i, 0, filasTres-1, 740, 920); 
      float y = map(edadS[i], 0, maxDatoEdad, 487, 340);
      ellipse(x, y, 20, 20);
    }
  }


  if (cbo==true) 
  {
    noStroke();
    fill(#0A8E1A);
    //grafica 2 edades CIUDAD BOLIVAR
    for (int i = 0; i < filasCuatro; i++)  
    {
      float x = map(i, 0, filasTres-1, 740, 920); 
      float y = map(edadCB[i], 0, maxDatoEdad, 487, 340);
      ellipse(x, y, 20, 20);
    }
  }
}

void gui()
{
  //slider 
  cp5.addSlider("valSlider")
    .setPosition(100, 650) // punto en el que inicia un slider
    .setWidth(510) //tamaño
    .setRange(0, filasDos-1) // valor de cada  linea  ---|----|----|
    .setValue(0)// valor en la que empieza la visualizacion
    .setNumberOfTickMarks(filasDos) // numero de divisiones ---|----|----|
    .setSliderMode(Slider.FLEXIBLE) // tipo de visualizacion otra es FIX
    ;

  fill(#002b5a);
  //PUNTO
  sliderPunto = cp5.addSlider2D("punto")
    .setPosition(100, 470)
    .setSize(137, 102)
    .setMinMax(20, 10, 100, 100)
    .setValue(50, 50)
    ;
  //TOGGLE
  cp5.addToggle("ken") // gracias a libreria se puede usar toggle como un boton
    .setPosition(700, 290)
    .setSize(50, 20)
    ;

  cp5.addToggle("sub") // gracias a libreria se puede usar toggle como un boton
    .setPosition(790, 290)
    .setSize(50, 20)
    ;

  cp5.addToggle("cbo") // gracias a libreria se puede usar toggle como un boton
    .setPosition(880, 290)
    .setSize(50, 20)
    ;
}

void graficaBarras()
{
  noStroke();
  //grafica 1
  fill(255);
  rect(700, 97, 296, 159);

  //grafica 2
  fill(255);
  rect(700, 330, 296, 159);

  //grafica 3
  fill(255);
  rect(700, 530, 296, 159);

  strokeWeight(1);
  stroke(#DBD7D4);

  textSize(12); 

  //grafica 1 lineas verticales
  for (int i = 0; i < filasTres; i++) 
  {
    float x = map(i, 0, filasTres-1, 900, 740 ); 
    line(x, 97, x, 255);

    fill(#002b5a);

    pushMatrix(); 
    translate(x, 280); 
    text(localidades[i], 0, 0);
    popMatrix();
  }

  //grafica 1 lineas horizontales
  for (int i = 0; i < maxDato; i+=8) 
  {
    float y = map(i, 0, maxDato, 255, 110);
    line(700, y, 995, y);
    fill(#002b5a);
    text(i, 670, y);
  }
  noStroke();
  fill(10, 7, 240);    

  //grafica 1 hombres
  for (int i = 0; i < filasTres; i++)  
  {
    float x = map(i, 0, filasTres-1, 900, 740  ); 
    float y = map(hombres[i], 0, maxDato, 340, 95);
    rect(x, y, 10, 256-y);
  }

  //grafica 1 mujeres
  fill(#A5775C);
  for (int i = 0; i < filasTres; i++)  
  {
    float x = map(i, 0, filasTres-1, 930, 760  ); 
    float y = map(mujeres[i], 0, maxDato, 250, 95);
    rect(x, y, 10, 256-y);
  }

  strokeWeight(1);
  stroke(#DBD7D4);

  //grafica 2 lineas verticales
  for (int i = 0; i < filasTres; i++) 
  {
    float x = map(i, 0, filasTres-1, 740, 920 ); 
    line(x, 330, x, 489);

    fill(#002b5a);

    pushMatrix(); 
    translate(x, 510); 
    text(edades[i], 0, 0);
    popMatrix();
  }

  //grafica 2 lineas horizontales
  for (int i = 0; i < maxDatoEdad; i+=3) 
  {
    float y = map(i, 0, maxDatoEdad, 487, 335);
    line(700, y, 996, y);
    fill(#002b5a);
    text(i, 670, y);
  }


  //grafica 3 lineas verticales
  for (int i = 0; i < filasCinco; i++) 
  {
    float x = map(i, 0, filasCinco-1, 700, 980 ); 
    line(x, 530, x, 689);

    fill(#002b5a);

    pushMatrix(); 
    translate(x, 708); 
    rotate(PI/2); 
    text(anioDes[i], 0, 0);
    popMatrix();
  }

  //grafica 3 lineas horizontales
  for (int i = 0; i < 15; i+=3) 
  {
    float y = map(i, 0, 15, 689, 535);
    line(700, y, 995, y);
    fill(#002b5a);
    text(i, 680, y);
  }

  noStroke();
  fill(10, 7, 240);

  beginShape();
  for (int i = 0; i < filasCinco; i++)  
  {
    float x = map(i, 0, filasCinco-1, 700, 997); 
    float y = map(desempleo[i], 0, 15, 689, 535); 
    vertex(x, y);
  }
  vertex(997, 690);
  vertex(700, 690);
  endShape(CLOSE);
}
