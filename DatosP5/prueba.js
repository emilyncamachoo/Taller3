let yoff = 0.0; // 2nd dimension of perlin noise

let numero;

//variable de slider
let slider;
//variable que guarda el valor del slider
let valorSlider;
//variable del selector de opciones
let sel;
//variable que guarda la opción seleccionada por el usuario
let opcion = " ";

var Usaquen = false;
var Chapinero = false;
var Santa = false;
var Cristobal = false;
var Usme = false;
var Tunjuelito = false;
var Bosa = false;
var Kennedy = false;
var Fontibon = false;
var Engativa = false;
var Suba = false;
var Teusaquillo = false;
var Barrios = false;
var Martires = false;
var Antonio = false;
var Puente = false;
var Candelaria = false;
var Rafael = false;
var Bolivar = false;
var Sumapaz = false;
var Sin = false;

function setup() {
  createCanvas(710, 400);

  fill(255);

//variable del selector de opciones
  sel = createSelect();
  sel.position(40, 100);
  sel.option('Usaquen');
  sel.option('Chapinero');
  sel.option('Santa fe');
  sel.option('San cristobal');
  sel.option('Usme');
  sel.option('Tunjuelito');
  sel.option('Bosa');
  sel.option('Kennedy');
  sel.option('Fontibon');
  sel.option('Engativa');
  sel.option('Suba');
  sel.option('Teusaquillo');
  sel.option('Barrios unidos');
  sel.option('Martires');  
  sel.option('Antonio nariño'); 
  sel.option('Puente aranda'); 
  sel.option('Candelaria'); 
  sel.option('Rafael uribe'); 
  sel.option('Ciudad bolivar');
  sel.option('Sumapaz'); 
  sel.option('Sin datos');

  //cuando se selecciona una opción llama a la funcion mySelectEvent
  sel.changed(mySelectEvent);

  //variable de slider, el valor seleccionado por el usuario lo lee directamente en draw usando slider.value()
  slider = createSlider(0, 255, 100); //(min, max, start)
  slider.position(40, 150);
  slider.style('width', '100px');

}


//esta función lee la opción seleccionada por el usuario de los botones desplegables
function mySelectEvent() 
{
  //guarda la opción seleccionada en la variable opcion
  opcion = sel.value();
  if (opcion === "Usaquen"){
    Usaquen = true;
    Chapinero = false;
    Santa = false;
    Cristobal = false;
    Usme = false;
    Tunjuelito = false;
    Bosa = false;
    Kennedy = false;
    Fontibon = false;
    Engativa = false;
    Suba = false;
    Teusaquillo = false;
    Barrios = false;
    Martires = false;
    Antonio = false;
    Puente = false;
    Candelaria = false;
    Rafael = false;
    Bolivar = false;
    Sumapaz = false;
    Sin = false;
  }
  if (opcion === "Chapinero"){
    Usaquen = false;
    Chapinero = true;
    Santa = false;
    Cristobal = false;
    Usme = false;
    Tunjuelito = false;
    Bosa = false;
    Kennedy = false;
    Fontibon = false;
    Engativa = false;
    Suba = false;
    Teusaquillo = false;
    Barrios = false;
    Martires = false;
    Antonio = false;
    Puente = false;
    Candelaria = false;
    Rafael = false;
    Bolivar = false;
    Sumapaz = false;
    Sin = false;
  }
  if (opcion === "Santa fe"){
    Usaquen = false;
    Chapinero = false;
    Santa = true;
    Cristobal = false;
    Usme = false;
    Tunjuelito = false;
    Bosa = false;
    Kennedy = false;
    Fontibon = false;
    Engativa = false;
    Suba = false;
    Teusaquillo = false;
    Barrios = false;
    Martires = false;
    Antonio = false;
    Puente = false;
    Candelaria = false;
    Rafael = false;
    Bolivar = false;
    Sumapaz = false;
    Sin = false;
  }
  if (opcion === "San cristobal"){
    Usaquen = false;
    Chapinero = false;
    Santa = false;
    Cristobal = true;
    Usme = false;
    Tunjuelito = false;
    Bosa = false;
    Kennedy = false;
    Fontibon = false;
    Engativa = false;
    Suba = false;
    Teusaquillo = false;
    Barrios = false;
    Martires = false;
    Antonio = false;
    Puente = false;
    Candelaria = false;
    Rafael = false;
    Bolivar = false;
    Sumapaz = false;
    Sin = false;
  }
  if (opcion === "Usme"){
    Usaquen = false;
    Chapinero = false;
    Santa = false;
    Cristobal = false;
    Usme = true;
    Tunjuelito = false;
    Bosa = false;
    Kennedy = false;
    Fontibon = false;
    Engativa = false;
    Suba = false;
    Teusaquillo = false;
    Barrios = false;
    Martires = false;
    Antonio = false;
    Puente = false;
    Candelaria = false;
    Rafael = false;
    Bolivar = false;
    Sumapaz = false;
    Sin = false;
  }
  if (opcion === "Tunjuelito"){
    Usaquen = false;
    Chapinero = false;
    Santa = false;
    Cristobal = false;
    Usme = false;
    Tunjuelito = true;
    Bosa = false;
    Kennedy = false;
    Fontibon = false;
    Engativa = false;
    Suba = false;
    Teusaquillo = false;
    Barrios = false;
    Martires = false;
    Antonio = false;
    Puente = false;
    Candelaria = false;
    Rafael = false;
    Bolivar = false;
    Sumapaz = false;
    Sin = false;
  }
  if (opcion === "Bosa"){
    Usaquen = false;
    Chapinero = false;
    Santa = false;
    Cristobal = false;
    Usme = false;
    Tunjuelito = false;
    Bosa = true;
    Kennedy = false;
    Fontibon = false;
    Engativa = false;
    Suba = false;
    Teusaquillo = false;
    Barrios = false;
    Martires = false;
    Antonio = false;
    Puente = false;
    Candelaria = false;
    Rafael = false;
    Bolivar = false;
    Sumapaz = false;
    Sin = false;
  }
  if (opcion === "Kennedy"){
    Usaquen = false;
    Chapinero = false;
    Santa = false;
    Cristobal = false;
    Usme = false;
    Tunjuelito = false;
    Bosa = false;
    Kennedy = true;
    Fontibon = false;
    Engativa = false;
    Suba = false;
    Teusaquillo = false;
    Barrios = false;
    Martires = false;
    Antonio = false;
    Puente = false;
    Candelaria = false;
    Rafael = false;
    Bolivar = false;
    Sumapaz = false;
    Sin = false;
  }
  if (opcion === "Fontibon"){
    Usaquen = false;
    Chapinero = false;
    Santa = false;
    Cristobal = false;
    Usme = false;
    Tunjuelito = false;
    Bosa = false;
    Kennedy = false;
    Fontibon = true;
    Engativa = false;
    Suba = false;
    Teusaquillo = false;
    Barrios = false;
    Martires = false;
    Antonio = false;
    Puente = false;
    Candelaria = false;
    Rafael = false;
    Bolivar = false;
    Sumapaz = false;
    Sin = false;
  }
  if (opcion === "Engativa"){
    Usaquen = false;
    Chapinero = false;
    Santa = false;
    Cristobal = false;
    Usme = false;
    Tunjuelito = false;
    Bosa = false;
    Kennedy = false;
    Fontibon = false;
    Engativa = true;
    Suba = false;
    Teusaquillo = false;
    Barrios = false;
    Martires = false;
    Antonio = false;
    Puente = false;
    Candelaria = false;
    Rafael = false;
    Bolivar = false;
    Sumapaz = false;
    Sin = false;
  }
  if (opcion === "Suba"){
    Usaquen = false;
    Chapinero = false;
    Santa = false;
    Cristobal = false;
    Usme = false;
    Tunjuelito = false;
    Bosa = false;
    Kennedy = false;
    Fontibon = false;
    Engativa = false;
    Suba = true;
    Teusaquillo = false;
    Barrios = false;
    Martires = false;
    Antonio = false;
    Puente = false;
    Candelaria = false;
    Rafael = false;
    Bolivar = false;
    Sumapaz = false;
    Sin = false;
  }
  if (opcion === "Teusaquillo"){
    Usaquen = false;
    Chapinero = false;
    Santa = false;
    Cristobal = false;
    Usme = false;
    Tunjuelito = false;
    Bosa = false;
    Kennedy = false;
    Fontibon = false;
    Engativa = false;
    Suba = false;
    Teusaquillo = true;
    Barrios = false;
    Martires = false;
    Antonio = false;
    Puente = false;
    Candelaria = false;
    Rafael = false;
    Bolivar = false;
    Sumapaz = false;
    Sin = false;
  }
  if (opcion === "Barrios unidos"){
    Usaquen = false;
    Chapinero = false;
    Santa = false;
    Cristobal = false;
    Usme = false;
    Tunjuelito = false;
    Bosa = false;
    Kennedy = false;
    Fontibon = false;
    Engativa = false;
    Suba = false;
    Teusaquillo = false;
    Barrios = true;
    Martires = false;
    Antonio = false;
    Puente = false;
    Candelaria = false;
    Rafael = false;
    Bolivar = false;
    Sumapaz = false;
    Sin = false;
  }
  if (opcion === "Martires"){
    Usaquen = false;
    Chapinero = false;
    Santa = false;
    Cristobal = false;
    Usme = false;
    Tunjuelito = false;
    Bosa = false;
    Kennedy = false;
    Fontibon = false;
    Engativa = false;
    Suba = false;
    Teusaquillo = false;
    Barrios = false;
    Martires = true;
    Antonio = false;
    Puente = false;
    Candelaria = false;
    Rafael = false;
    Bolivar = false;
    Sumapaz = false;
    Sin = false;
  }
  if (opcion === "Antonio nariño"){
    Usaquen = false;
    Chapinero = false;
    Santa = false;
    Cristobal = false;
    Usme = false;
    Tunjuelito = false;
    Bosa = false;
    Kennedy = false;
    Fontibon = false;
    Engativa = false;
    Suba = false;
    Teusaquillo = false;
    Barrios = false;
    Martires = false;
    Antonio = true;
    Puente = false;
    Candelaria = false;
    Rafael = false;
    Bolivar = false;
    Sumapaz = false;
    Sin = false;
  }
  if (opcion === "Puente aranda"){
    Usaquen = false;
    Chapinero = false;
    Santa = false;
    Cristobal = false;
    Usme = false;
    Tunjuelito = false;
    Bosa = false;
    Kennedy = false;
    Fontibon = false;
    Engativa = false;
    Suba = false;
    Teusaquillo = false;
    Barrios = false;
    Martires = false;
    Antonio = false;
    Puente = true;
    Candelaria = false;
    Rafael = false;
    Bolivar = false;
    Sumapaz = false;
    Sin = false;
  }
  if (opcion === "Candelaria"){
    Usaquen = false;
    Chapinero = false;
    Santa = false;
    Cristobal = false;
    Usme = false;
    Tunjuelito = false;
    Bosa = false;
    Kennedy = false;
    Fontibon = false;
    Engativa = false;
    Suba = false;
    Teusaquillo = false;
    Barrios = false;
    Martires = false;
    Antonio = false;
    Puente = false;
    Candelaria = true;
    Rafael = false;
    Bolivar = false;
    Sumapaz = false;
    Sin = false;
  }
  if (opcion === "Rafael uribe"){
    Usaquen = false;
    Chapinero = false;
    Santa = false;
    Cristobal = false;
    Usme = false;
    Tunjuelito = false;
    Bosa = false;
    Kennedy = false;
    Fontibon = false;
    Engativa = false;
    Suba = false;
    Teusaquillo = false;
    Barrios = false;
    Martires = false;
    Antonio = false;
    Puente = false;
    Candelaria = false;
    Rafael = true;
    Bolivar = false;
    Sumapaz = false;
    Sin = false;
  }
  if (opcion === "Ciudad bolivar"){
    Usaquen = false;
    Chapinero = false;
    Santa = false;
    Cristobal = false;
    Usme = false;
    Tunjuelito = false;
    Bosa = false;
    Kennedy = false;
    Fontibon = false;
    Engativa = false;
    Suba = false;
    Teusaquillo = false;
    Barrios = false;
    Martires = false;
    Antonio = false;
    Puente = false;
    Candelaria = false;
    Rafael = false;
    Bolivar = true;
    Sumapaz = false;
    Sin = false;
  }
  if (opcion === "Sumapaz"){
    Usaquen = false;
    Chapinero = false;
    Santa = false;
    Cristobal = false;
    Usme = false;
    Tunjuelito = false;
    Bosa = false;
    Kennedy = false;
    Fontibon = false;
    Engativa = false;
    Suba = false;
    Teusaquillo = false;
    Barrios = false;
    Martires = false;
    Antonio = false;
    Puente = false;
    Candelaria = false;
    Rafael = false;
    Bolivar = false;
    Sumapaz = true;
    Sin = false;
  }
  if (opcion === "Sin datos"){
    Usaquen = false;
    Chapinero = false;
    Santa = false;
    Cristobal = false;
    Usme = false;
    Tunjuelito = false;
    Bosa = false;
    Kennedy = false;
    Fontibon = false;
    Engativa = false;
    Suba = false;
    Teusaquillo = false;
    Barrios = false;
    Martires = false;
    Antonio = false;
    Puente = false;
    Candelaria = false;
    Rafael = false;
    Bolivar = false;
    Sumapaz = false;
    Sin = true;
  }

}


function draw() {
  background(51);

  textSize(32);
  textAlign(CENTER);
  text("CASOS 2018", 350, 100);

  
  // We are going to draw a polygon out of the wave points
  beginShape();

  //let xoff = 0; // Option #1: 2D Noise
  let xoff = yoff; // Option #2: 1D Noise

  // Iterate over horizontal pixels
  for (let x = 0; x <= width; x += 10) {
    // Calculate a y value according to noise, map to

    // Option #1: 2D Noise
    //let y = map(noise(xoff, yoff), 0, 1, 200, 300);

    // Option #2: 1D Noise
    let y = map(noise(xoff), 0, 1, 200,300);

    // Set the vertex
    vertex(x, y);
    // Increment x dimension for noise
    xoff += numero;
  }
  // increment y dimension for noise
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);

  //el valor seleccionado del slider lo lee directamente en draw y se guarda en la variable valorSlider
  valorSlider = slider.value();
  //el valor del slider es el background
  fill(valorSlider);

  if(Usaquen == true){
    numero = 0.28;
  }
  if(Chapinero == true){
    numero = 0.22;
  }
  if(Santa == true){
    numero = 0.12;
  }
  if(Cristobal== true){
    numero = 0.23;
  }
  if(Usme== true){
    numero = 0.17;
  }
  if(Tunjuelito== true){
    numero = 0.10;
  }
  if(Bosa== true){
    numero = 0.32;
  }
  if(Kennedy== true){
    numero = 0.50;
  }
  if(Fontibon== true){
    numero = 0.17;
  }
  if(Engativa== true){
    numero = 0.33;
  }
  if(Suba== true){
    numero = 0.41;
  }
  if(Teusaquillo== true){
    numero = 0.11;
  }
  if(Barrios== true){
    numero = 0.04;
  }
  if(Martires== true){
    numero = 0.06;
  }
  if(Antonio== true){
    numero = 0.03;
  }
  if(Puente== true){
    numero = 0.10;
  }
  if(Candelaria== true){
    numero = 0.02;
  }
  if(Rafael== true){
    numero = 0.18;
  }
  if(Bolivar== true){
    numero = 0.23;
  }
  if(Sumapaz== true){
    numero = 0.0;
  }
  if(Sin== true){
    numero = 0.11;
  }

}
