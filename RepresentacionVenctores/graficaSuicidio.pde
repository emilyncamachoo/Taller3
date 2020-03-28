Table table;

int maxDato;

int rowCount;

String [] edad;

int [] kennedy;
int datoKennedy = 0;

int [] bolivar;
int datoBolivar = 0;

int [] suba;
int datoSuba = 0;

void setup() 
{
  size(600,400);
  
  table = loadTable("suicidio.csv", "header");
  
  rowCount = table.getRowCount();
  println(rowCount + " filas en la tabla");
  
  edad = new String [rowCount];
  
  kennedy = new int [rowCount];
  bolivar = new int [rowCount];
  suba = new int [rowCount];
  
  for(int i = 0; i < rowCount; i++)
  {
    TableRow row = table.getRow(i);
    
    edad[i]= row.getString("Edad");
    
    kennedy[i]= row.getInt("kennedy");
    bolivar[i]= row.getInt("ciudad bolivar");
    suba[i]= row.getInt("suba");
    
    datoKennedy = kennedy[i];
    if (datoKennedy > maxDato) 
    {
      maxDato = datoKennedy;
    }
    
    datoBolivar = bolivar[i];
    if (datoBolivar > maxDato) 
    {
      maxDato = datoBolivar;
    }
    
    datoSuba = suba[i];
    if (datoSuba > maxDato) 
    {
      maxDato = datoSuba;
    }
    
  }
  
  println(maxDato + " es el valor maximo de todas las columnas");
  
}

void draw()
{
    drawScatter();
    
}

void drawScatter()
{
  noStroke();
  
  fill(#000000);
  rect(0, 70, 560, 242);
  
  fill(#DEDEDE);
  rect(55, 80, 420, 220);
  
  strokeWeight(1);
  stroke(0);
  
  for (int i = 0; i < rowCount; i++)
  {
    float x = map(i, 0, rowCount-1, 55, 475);
    line(x, 80, x, 300);
    
    fill(0);
    
    pushMatrix();
    translate(x,320);
    rotate(PI/2);
    text(edad[i], 0, 0);
    popMatrix();
    
  }
  
  for (int i = 0; i < maxDato; i+=1) 
  {
    float y = map(i, 0, maxDato, 300, 80);
    line(55, y, 475, y);
    
    fill(255);
    text(i, 0, y);
  }
  
  noStroke();
  fill(#FAD962);
  
  for (int i = 0; i < rowCount; i++)
  {
    float x = map(i, 0, rowCount-1, 55, 475);
    float y = map(kennedy[i], 0, maxDato, 300, 100);
  }
  
  beginShape();
  for (int i = 0; i < rowCount; i++)
  {
      float x = map(i, 0, rowCount-1, 55, 475);
      float y = map(kennedy[i], 0, maxDato, 300, 100); 
      vertex(x, y); 
  }
  vertex(475, 300);
  vertex(55, 300);
  endShape(CLOSE);
  
  fill(#D18108);
  for (int i = 0; i < rowCount; i++)
  {
    float x = map(i, 0, rowCount-1, 55, 475);
    float y = map(bolivar[i], 0, maxDato, 300, 100);
  }

  beginShape();
  for (int i = 0; i < rowCount; i++)
  {
      float x = map(i , 0, rowCount-1, 55, 475);
      float y = map(bolivar[i], 0, maxDato, 300, 100);
      vertex(x, y); 
  }
  vertex(475, 300);
  vertex(55, 300);
  endShape(CLOSE);
  
  fill(#C11212);
  for (int i = 0; i < rowCount; i++)
  {
    float x = map(i, 0, rowCount-1, 55, 475);
    float y = map(suba[i], 0, maxDato, 300, 100);
  }

  beginShape();
  for (int i = 0; i < rowCount; i++)
  {
      float x = map(i , 0, rowCount-1, 55, 475);
      float y = map(suba[i], 0, maxDato, 300, 100);
      vertex(x, y); 
  }
  vertex(475, 300);
  vertex(55, 300);
  endShape(CLOSE);
  
}
