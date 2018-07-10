Menubar mymenu = new Menubar();
Toolbar mytool = new Toolbar();
Editwindow myedition = new Editwindow();
Layerswindow mylayer = new Layerswindow();
Gameobjectswindow mygameobjects = new Gameobjectswindow(); 


PrintWriter file = null;
JSONObject json;

void setup(){
  size(1200,600);
  //onCreateJson();
  mytool.Start();
  mygameobjects.Start();
}

void draw(){
  background(255);
  
  //barra de menus
  mymenu.Ejecutar();
  
  //barra de herramientas
  mytool.Update();
  
  //ventana de edicion
  myedition.Ejecutar();
  
  //ventana de Capas
  mylayer.Ejecutar();
  
  //ventana de GameObjects
  mygameobjects.Update();
  
  
  switch(mytool.IDTool){
    case 1:{
      mygameobjects.GameObjectHelper();
    }
    break;
    
    case 2:{
      myedition.removeDataHelper();
    }
    break;
    
    default:{
      
    }
    break;
  
  }
  
  
}

void mouseClicked(){
    if(mouseButton == LEFT){
      int x = mouseX / 50;
      int y = mouseY / 50;
      
      if(x > 0 && x < 19 && mytool.IDTool == 1){
        myedition.updateData(x,y);
      }
        
      if(x > 0 && x < 19 && mytool.IDTool == 2){
        myedition.removeData(x,y);
      }
    }
}

  
  void keyPressed(){
    if(key == 's'){
      if(file != null){
        myedition.saveData();
      }else{
       selectOutput("Seleccione una ruta","onOutputSelected");
      }
    }
  }
  
   void onOutputSelected(File path){
    file = createWriter(path);
    myedition.saveData();
  }
  
  boolean overRect(int x, int y, int width , int height)  {
    if (mouseX >= x && mouseX <= x+width && mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }
