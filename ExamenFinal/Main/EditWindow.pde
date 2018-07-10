Data data = new Data(); 
//PrintWriter files = null;

class Editwindow{
  
  int windowX = 50;
  int windowY = 0;
  
  public void Ejecutar(){
    
    fill(68,173,254);
    drawGrid();
    
    switch(mylayer.IndexCapa){
      case 1:{
        drawDataFondos();
      }
      break;
      
      case 2:{
        drawDataProps();
      }
      break;
      
      case 3:{
        drawDataTiles();
      }
      break;
      
      case 4:{
        drawDataItems();
      }
      break;
      
      case 5:{
        drawDataFondos();
        drawDataProps();
        drawDataTiles();
        drawDataItems();
      }
      break;
    }
  }
  
  //Dibujamos la Grilla
  private void drawGrid(){
    for (int i = 0; i < 18; i++){
      for (int j = 0; j < 12; j++){
        rect( windowX + (50 * i), windowY + (50 * j), 50, 50);
      }
    }
  }
  
  //Guardamos los datos en sus listas
  public void updateData(int x, int y){
    
    if(mygameobjects.indexGamObj > 0){
      
      switch(mylayer.IndexCapa){
        case 1:{
          data.Fondos.add(x);
          data.Fondos.add(y);
          data.Fondos.add(mygameobjects.indexGamObj);
        }
        break;
        
        case 2:{
          data.Props.add(x);
          data.Props.add(y);
          data.Props.add(mygameobjects.indexGamObj);
        }
        break;
        
        case 3:{
          data.Tiles.add(x);
          data.Tiles.add(y);
          data.Tiles.add(mygameobjects.indexGamObj);
          println(x,y,mygameobjects.indexGamObj);
        }
        break;
        
        case 4:{
          data.Items.add(x);
          data.Items.add(y);
          data.Items.add(mygameobjects.indexGamObj);
        }
        break;
        
        case 5:{
        
        }
        break;
      }
      //println(x,y,mygameobjects.indexGamObj);
    }
  }
  
  private void drawDataFondos(){
    for(int i = 0; i < data.Fondos.size() ; i+=3){
      int x = data.Fondos.get(i);
      int y = data.Fondos.get(i+1);
      int num = data.Fondos.get(i+2);
      
      if(num > 0){
        image(mygameobjects.BackGrounds.get(num - 1) ,(50 * x),  (50 * y), 50 , 50);
      }
    }
  }
  
  private void drawDataProps(){
    for(int i = 0; i < data.Props.size() ; i+=3){
      int x = data.Props.get(i);
      int y = data.Props.get(i+1);
      int num = data.Props.get(i+2);
      
      if(num > 0){
        image(mygameobjects.Props.get(num - 1) ,(50 * x),  (50 * y), 50 , 50);
      }
    }
  }
  
  private void drawDataTiles(){
    for(int i = 0; i < data.Tiles.size() ; i+=3){
      int x = data.Tiles.get(i);
      int y = data.Tiles.get(i+1);
      int num = data.Tiles.get(i+2);
      
      if(num > 0){
        image(mygameobjects.GameObjects.get(num - 1) ,(50 * x),  (50 * y), 50 , 50);
      }
    }
  }
  
  private void drawDataItems(){
    for(int i = 0; i < data.Items.size() ; i+=3){
      int x = data.Items.get(i);
      int y = data.Items.get(i+1);
      int num = data.Items.get(i+2);
      
      if(num > 0){
        image(mygameobjects.Items.get(num - 1) ,(50 * x),  (50 * y), 50 , 50);
      }
    }
  }
  
  void saveData(){
    String Separate = System.getProperty("line.separator");
    
    for(int i = 0; i< data.Fondos.size();i++){
      if(i < data.Fondos.size()){
        file.print(data.Fondos.get(i));
        file.print("|");
      }
    }
    if(data.Fondos.size() < 1){
      file.print(-1);
    }
    file.print(Separate);
    
    for(int i = 0; i< data.Props.size();i++){
      if(i < data.Props.size()){
        file.print(data.Props.get(i));
        file.print("|");
      }
    }
    if(data.Props.size() < 1){
      file.print(-1);
    }
    file.print(Separate);
    
    for(int i = 0; i< data.Tiles.size();i++){
      if(i < data.Tiles.size()){
        file.print(data.Tiles.get(i));
        file.print("|");
      }
    }
    if(data.Tiles.size() < 1){
      file.print(-1);
    }
    file.print(Separate);
    
    for(int i = 0; i< data.Items.size();i++){
      if(i < data.Items.size()){
        file.print(data.Items.get(i));
        file.print("|");
      }
    }
    if(data.Items.size() < 1){
      file.print(-1);
    }
    file.flush();
    
    println("archivo guardado");
  }
  
  void removeData(int x, int y){
    
    switch(mylayer.IndexCapa){
        case 1:{
          RemoveDataCapa(x,y,data.Fondos);
        }
        break;
        
        case 2:{
           RemoveDataCapa(x,y,data.Props);
        }
        break;
        
        case 3:{
           RemoveDataCapa(x,y,data.Tiles);
        }
        break;
        
        case 4:{
           RemoveDataCapa(x,y,data.Items);
        }
        break;
        
        case 5:{
        
        }
        break;
      }
  }
  
  void RemoveDataCapa(int x, int y ,ArrayList<Integer> lista){
    for(int i = 0; i < lista.size(); i+=3){
      if(lista.get(i) == x){
        if(lista.get(i+1) == y){
          lista.set(i,-1);
          lista.set(i+1,-1);
          lista.set(i+2,-1);
        }
      }
    }
  }
  
  void removeDataHelper(){
    
      int x = mouseX / 50;
      int y = mouseY / 50;
      
      if(x > 0 && x < 19){
        fill(255,255,255,150);
        rect(x * 50 , y * 50 , 50, 50);
      }  
  }
  
}
