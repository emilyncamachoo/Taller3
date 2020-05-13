let table;

let rowCount;

let localidades = [];

let casos = [];

let yoff = 0.0; // 2nd dimension of perlin noise
let yoff2 = 0.0;

let numero;
let numero2;

let colora;
let colorb;

//variable de slider
let slider;
let slider2;
//variable que guarda el valor del slider
//let valorSlider;
//let valorSlider2;
//variable del selector de opciones
let sel;
let sel1;
//variable que guarda la opción seleccionada por el usuario
let opcion = " ";
let opcion1 = " ";


function preload() 
{
  //inconsolata = loadFont('assets/Futura.otf');
  fuente = loadFont('assets/NEUROPOL.ttf');
  table = loadTable("assets/2018.csv", "header");

}

function setup() {
  createCanvas(710, 400);

  //fill(255);

  textFont(fuente);

  rowCount = table.getRowCount();

  const row = table.getRows();

   for (let i = 0; i < rowCount; i++) {
    const nombreLocalidad = row[i].getString("localidad");
    const numeroCasos = row[i].getString("casos");
    let mapCasos = map(numeroCasos,0,50,0,1);
    localidades.push(nombreLocalidad);
    casos.push(mapCasos);
    console.log(casos);
   }

//variable del selector de opciones
  sel = createSelect();
  sel.position(139, 319);
  sel1 = createSelect();
  sel1.position(474, 317);

  for (let i = 0; i < rowCount; i++) {
    sel.option(localidades[i]);
    sel1.option(localidades[i]);
    console.log(localidades[i]);
  }

  //cuando se selecciona una opción llama a la funcion mySelectEvent
  sel.changed(mySelectEvent);
  sel1.changed(mySelectEvent);
  //variable de slider, el valor seleccionado por el usuario lo lee directamente en draw usando slider.value()
  slider = createSlider(0, 255, 100); //(min, max, start)
  slider.position(139, 355);
  slider.style('width', '100px');
  slider2 = createSlider(0, 255, 100); //(min, max, start)
  slider2.position(473, 355);
  slider2.style('width', '100px');

}


//esta función lee la opción seleccionada por el usuario de los botones desplegables
function mySelectEvent() 
{
  //guarda la opción seleccionada en la variable opcion
  opcion = sel.value();
  opcion1 = sel1.value();

  if (opcion == "Usaquen"){
    //Usaquen = true;
    for(let i = 0; i < rowCount; i++){
      cambioNumero(casos[0]);
      console.log(casos[0]);
    }
  }
  if (opcion == "Chapinero"){
    for(let i = 0; i < rowCount; i++){
      cambioNumero(casos[1]);
      console.log(casos[1]);
    }
  }
  if (opcion == "Santa Fe"){
    for(let i = 0; i < rowCount; i++){
      cambioNumero(casos[2]);
      console.log(casos[2]);
    }
  }
  if (opcion == "San Cristobal"){
    for(let i = 0; i < rowCount; i++){
      cambioNumero(casos[3]);
      console.log(casos[3]);
    }
  }
  if (opcion == "Usme"){
    for(let i = 0; i < rowCount; i++){
      cambioNumero(casos[4]);
      console.log(casos[4]);
    }
  }
  if (opcion == "Tunjuelito"){
    for(let i = 0; i < rowCount; i++){
      cambioNumero(casos[5]);
      console.log(casos[5]);
    }
  }
  if (opcion == "Bosa"){
    for(let i = 0; i < rowCount; i++){
      cambioNumero(casos[6]);
      console.log(casos[6]);
    }
  }
  if (opcion == "Kennedy"){
    for(let i = 0; i < rowCount; i++){
      cambioNumero(casos[7]);
      console.log(casos[7]);
    }
  }
  if (opcion == "Fontibon"){
    for(let i = 0; i < rowCount; i++){
      cambioNumero(casos[8]);
      console.log(casos[8]);
    }
  }
  if (opcion == "Engativa"){
    for(let i = 0; i < rowCount; i++){
      cambioNumero(casos[9]);
      console.log(casos[9]);
    }
  }
  if (opcion == "Suba"){
    for(let i = 0; i < rowCount; i++){
      cambioNumero(casos[10]);
      console.log(casos[10]);
    }
  }
  if (opcion == "Teusaquillo"){
    for(let i = 0; i < rowCount; i++){
      cambioNumero(casos[11]);
      console.log(casos[11]);
    }
  }
  if (opcion == "Barrios Unidos"){
    for(let i = 0; i < rowCount; i++){
      cambioNumero(casos[12]);
      console.log(casos[12]);
    }
  }
  if (opcion == "Los martires"){
    for(let i = 0; i < rowCount; i++){
      cambioNumero(casos[13]);
      console.log(casos[13]);
    }
  }
  if (opcion == "Antonio Nariño"){
    for(let i = 0; i < rowCount; i++){
      cambioNumero(casos[14]);
      console.log(casos[14]);
    }
  }
  if (opcion == "Puente Aranda"){
    for(let i = 0; i < rowCount; i++){
      cambioNumero(casos[15]);
      console.log(casos[15]);
    }
  }
  if (opcion == "Candelaria"){
    for(let i = 0; i < rowCount; i++){
      cambioNumero(casos[16]);
      console.log(casos[16]);
    }
  }
  if (opcion == "Rafael uribe"){
    for(let i = 0; i < rowCount; i++){
      cambioNumero(casos[17]);
      console.log(casos[17]);
    }
  }
  if (opcion == "Ciudad Bolivar"){
    for(let i = 0; i < rowCount; i++){
      cambioNumero(casos[18]);
      console.log(casos[18]);
    }
  }
  if (opcion == "Sumapaz"){
    for(let i = 0; i < rowCount; i++){
      cambioNumero(casos[19]);
      console.log(casos[19]);
    }
  }
  if (opcion == "sin Datos"){
    for(let i = 0; i < rowCount; i++){
      cambioNumero(casos[20]);
      console.log(casos[20]);
    }
  }

if (opcion1 == "Usaquen"){
    //Usaquen = true;
    for(let i = 0; i < rowCount; i++){
      cambioNumero2(casos[0]);
      console.log(casos[0]);
    }
  }
  if (opcion1 == "Chapinero"){
    for(let i = 0; i < rowCount; i++){
      cambioNumero2(casos[1]);
      console.log(casos[1]);
    }
  }
  if (opcion1 == "Santa Fe"){
    for(let i = 0; i < rowCount; i++){
      cambioNumero2(casos[2]);
      console.log(casos[2]);
    }
  }
  if (opcion1 == "San Cristobal"){
    for(let i = 0; i < rowCount; i++){
      cambioNumero2(casos[3]);
      console.log(casos[3]);
    }
  }
  if (opcion1 == "Usme"){
    for(let i = 0; i < rowCount; i++){
      cambioNumero2(casos[4]);
      console.log(casos[4]);
    }
  }
  if (opcion1 == "Tunjuelito"){
    for(let i = 0; i < rowCount; i++){
      cambioNumero2(casos[5]);
      console.log(casos[5]);
    }
  }
  if (opcion1 == "Bosa"){
    for(let i = 0; i < rowCount; i++){
      cambioNumero2(casos[6]);
      console.log(casos[6]);
    }
  }
  if (opcion1 == "Kennedy"){
    for(let i = 0; i < rowCount; i++){
      cambioNumero2(casos[7]);
      console.log(casos[7]);
    }
  }
  if (opcion1 == "Fontibon"){
    for(let i = 0; i < rowCount; i++){
      cambioNumero2(casos[8]);
      console.log(casos[8]);
    }
  }
  if (opcion1 == "Engativa"){
    for(let i = 0; i < rowCount; i++){
      cambioNumero2(casos[9]);
      console.log(casos[9]);
    }
  }
  if (opcion1 == "Suba"){
    for(let i = 0; i < rowCount; i++){
      cambioNumero2(casos[10]);
      console.log(casos[10]);
    }
  }
  if (opcion1 == "Teusaquillo"){
    for(let i = 0; i < rowCount; i++){
      cambioNumero2(casos[11]);
      console.log(casos[11]);
    }
  }
  if (opcion1 == "Barrios Unidos"){
    for(let i = 0; i < rowCount; i++){
      cambioNumero2(casos[12]);
      console.log(casos[12]);
    }
  }
  if (opcion1 == "Los martires"){
    for(let i = 0; i < rowCount; i++){
      cambioNumero2(casos[13]);
      console.log(casos[13]);
    }
  }
  if (opcion1 == "Antonio Nariño"){
    for(let i = 0; i < rowCount; i++){
      cambioNumero2(casos[14]);
      console.log(casos[14]);
    }
  }
  if (opcion1 == "Puente Aranda"){
    for(let i = 0; i < rowCount; i++){
      cambioNumero2(casos[15]);
      console.log(casos[15]);
    }
  }
  if (opcion1 == "Candelaria"){
    for(let i = 0; i < rowCount; i++){
      cambioNumero2(casos[16]);
      console.log(casos[16]);
    }
  }
  if (opcion1 == "Rafael uribe"){
    for(let i = 0; i < rowCount; i++){
      cambioNumero2(casos[17]);
      console.log(casos[17]);
    }
  }
  if (opcion1 == "Ciudad Bolivar"){
    for(let i = 0; i < rowCount; i++){
      cambioNumero2(casos[18]);
      console.log(casos[18]);
    }
  }
  if (opcion1 == "Sumapaz"){
    for(let i = 0; i < rowCount; i++){
      cambioNumero2(casos[19]);
      console.log(casos[19]);
    }
  }
  if (opcion1 == "sin Datos"){
    for(let i = 0; i < rowCount; i++){
      cambioNumero2(casos[20]);
      console.log(casos[20]);
    }
  }

}

function cambioNumero(valor){
  numero = valor;
}

function cambioNumero2(valor){
  numero2 = valor;
}

function draw() {
  background(51);
  fill(255);
  textSize(32);
  textAlign(CENTER);
  text("CASOS 2018", 350, 60);

  //el valor seleccionado del slider lo lee directamente en draw y se guarda en la variable valorSlider
  colora = slider.value();
  colorb = slider2.value();

  // We are going to draw a polygon out of the wave points
  beginShape();
  fill(colora);
  //let xoff = 0; // Option #1: 2D Noise
  let xoff = yoff; // Option #2: 1D Noise

  // Iterate over horizontal pixels
  for (let x = 59; x <= 319; x += 10) {
    // Calculate a y value according to noise, map to

    // Option #1: 2D Noise
    //let y = map(noise(xoff, yoff), 0, 1, 200, 300);

    // Option #2: 1D Noise
    let y = map(noise(xoff), 0, 1, 142,286);

    // Set the vertex
    vertex(x, y);
    // Increment x dimension for noise
    xoff += numero;
    //xoff += 0.05;
  }
  // increment y dimension for noise
  yoff += 0.01;
  vertex(319, 286);
  vertex(59, 286);
  endShape(CLOSE);

  // We are going to draw a polygon out of the wave points
  beginShape();
  fill(colorb);
  //let xoff = 0; // Option #1: 2D Noise
  let xoff2 = yoff2; // Option #2: 1D Noise

  // Iterate over horizontal pixels
  for (let a = 393; a <= 653; a += 10) {
    // Calculate a y value according to noise, map to

    // Option #1: 2D Noise
    //let y = map(noise(xoff, yoff), 0, 1, 200, 300);

    // Option #2: 1D Noise
    let b = map(noise(xoff2), 0, 1, 142,286);

    // Set the vertex
    vertex(a, b);
    // Increment x dimension for noise
    xoff2 += numero2;
  }
  // increment y dimension for noise
  yoff2 += 0.01;
  vertex(653, 286);
  vertex(393, 286);
  endShape(CLOSE);

  
}
