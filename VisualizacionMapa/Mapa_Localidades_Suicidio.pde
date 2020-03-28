PImage mapImage;
Table dataTable;
int rowCount;
// ubicacion de los circulos
float x = 0;
float y = 0;
float diametro = 9;

//guarda el valor de la columna 3
float columna3 = 0;
//valor maximo y minimo de la columna 3 del archivo
float dataMinColumna3 = 0;
float dataMaxColumna3 = 0;

String nombreEstado;


void setup() 
{
  size(1000, 597);  
  
  mapImage = loadImage("mapa.png");
  
  dataTable = loadTable("locations.tsv");
 
  // da el numero de filas del archivo
  rowCount = dataTable.getRowCount();
  println(rowCount);
  
  
   for (int i = 0; i < rowCount; i++) 
  {
    
    //segundo
    
    columna3 = dataTable.getFloat(i, 3); // column 3
    //determina el valor max y minimo de la columna 3
    if (columna3 > dataMaxColumna3) 
    {
      dataMaxColumna3 = columna3;
    }
    if (columna3 < dataMinColumna3) 
    {
      dataMinColumna3 = columna3;
    }
  }
 
}


void draw() 
{  
  background(255);
  image(mapImage, 0, 0);

  //suaviza el borde del circulo  
  smooth();
  
   for (int i = 0; i < rowCount; i++) 
  {
    x = dataTable.getFloat(i, 1);  // column 1
    y = dataTable.getFloat(i, 2);  // column 2
    
    //segundo
    
    columna3 = dataTable.getFloat(i, 3);  // column 3
  diametro = map(columna3, dataMinColumna3, dataMaxColumna3, 10, 50);
  //diametro = columna3;
   noStroke();
    //fill(192, 0, 0);
    
    ellipse(x, y, diametro, diametro);
    
   nombreEstado = dataTable.getString(i, 0);
   
   println(nombreEstado);
   
   if(dist(x,y,mouseX,mouseY)<diametro)
 {
   fill(0);
   textAlign(CENTER);
   text(nombreEstado + ":" + columna3, x, y);
   
 }
   
  }
 
}
