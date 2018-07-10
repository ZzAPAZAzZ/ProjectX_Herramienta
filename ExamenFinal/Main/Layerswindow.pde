class Layerswindow{
  int windowX = 960;
  int windowY = 5;
  
  int IndexCapa = 5;
  
  public void Ejecutar(){
    fill(255,0,0);
    rect(windowX,windowY,230,225);
    
    ButtonLayer(5,  5,"Capa De Fondo",1);
    ButtonLayer(5, 40,"Capa De Props",2);
    ButtonLayer(5, 75,"Capa De Tiles",3);
    ButtonLayer(5,110,"Capa De Items",4);
    ButtonLayer(5,145,"Todas Las Capas",5);
  };
  
  void ButtonLayer(int x,int y, String text , int indexBtn){
    
    if(IndexCapa == indexBtn){
      fill(255);
    }else  fill(155,0,0);
    
    rect(windowX + x,windowY + y, 220 , 30);
    
    if(IndexCapa == indexBtn){
      fill(0);
    }else fill(255);
    
    text(text , 1040 + x , 20 + y);
    
    if(mouseButton == LEFT){
      
      if(overRect(windowX + x , windowY + y , 220, 30)){
        IndexCapa = indexBtn;
      }
      
    }
  }
  
}
