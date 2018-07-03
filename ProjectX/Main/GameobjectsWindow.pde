class Gameobjectswindow{
  
  int windowX = 960; 
  int windowY = 235;
  
  ArrayList<PImage> BackGrounds = new ArrayList<PImage>();
  ArrayList<PImage> Props = new ArrayList<PImage>();
  ArrayList<PImage> GameObjects = new ArrayList<PImage>();
  ArrayList<PImage> Items = new ArrayList<PImage>();
  
  PImage img;
  int indexGamObj;
  int intPressed; 
  
  public void Update(){
    fill(0,0,255);
    rect(windowX,windowY,230,360);
    
    dibujar();
  }
  
  public void Start(){
    img = loadImage("Gustman/piso.png");
    GameObjects.add(img);
    img = loadImage("Gustman/stair.png");
    GameObjects.add(img);
    img = loadImage("Gustman/background.png");
    GameObjects.add(img);
    img = loadImage("Gustman/spikes.png");
    GameObjects.add(img);
    img = loadImage("Gustman/wall1.png");
    GameObjects.add(img);
    img = loadImage("Gustman/wall2.png");
    GameObjects.add(img);
    img = loadImage("pisoStorm.png");
    GameObjects.add(img);
    
    //Load Background
    img = loadImage("background/bg1.png");
    BackGrounds.add(img);
    img = loadImage("background/bg2.png");
    BackGrounds.add(img);
    img = loadImage("background/bg3.png");
    BackGrounds.add(img);
    img = loadImage("background/bg4.png");
    BackGrounds.add(img);
    img = loadImage("background/bg5.png");
    BackGrounds.add(img);
    img = loadImage("background/bg6.png");
    BackGrounds.add(img);
    img = loadImage("background/bg7.png");
    BackGrounds.add(img);
    img = loadImage("background/bg8.png");
    BackGrounds.add(img);
    img = loadImage("background/bg9.png");
    BackGrounds.add(img);
    img = loadImage("background/bg10.png");
    BackGrounds.add(img);
    
    //Load Props
    img = loadImage("Gustman/p1.png");
    Props.add(img);
    img = loadImage("Gustman/p2.png");
    Props.add(img);
    img = loadImage("Gustman/p3.png");
    Props.add(img);
    img = loadImage("Gustman/p4.png");
    Props.add(img);
    img = loadImage("Gustman/p5.png");
    Props.add(img);
    img = loadImage("Gustman/p6.png");
    Props.add(img);
    img = loadImage("Gustman/p7.png");
    Props.add(img);
    img = loadImage("Gustman/p8.png");
    Props.add(img);
    img = loadImage("Gustman/p9.png");
    Props.add(img);
    
  }
  
  void dibujar(){
    
    switch(mylayer.IndexCapa){
      case 1:{
        GrupoDeBackGrounds();
      }
      break;
      
      case 2:{
        GrupoDeProps();
      }
      break;
      
      case 3:{
        GrupoDeTiles();
      }
      break;
      
      case 4:{
        
      }
      break;
      
      case 5:{
        
      }
      break;
    }
    
  }
  // Se crea el Grupo de Fondos
  void GrupoDeBackGrounds(){
    CreateButtonObject(10 , 10 , 1 ,BackGrounds);
    CreateButtonObject(90 , 10 , 2 ,BackGrounds);
    CreateButtonObject(170 , 10 , 3 ,BackGrounds);
    CreateButtonObject(10 , 80 , 4 ,BackGrounds);
    CreateButtonObject(90 , 80 , 5 ,BackGrounds);
    CreateButtonObject(170 , 80 , 6 ,BackGrounds);
    CreateButtonObject(10 , 150 , 7 ,BackGrounds);
    CreateButtonObject(90 , 150 , 8 ,BackGrounds);
    CreateButtonObject(170 , 150 , 9 ,BackGrounds);
    CreateButtonObject(10 , 220 , 10 ,BackGrounds);
  }
  
  // Se crea el Grupo de Props
  void GrupoDeProps(){
    CreateButtonObject(10,10,1,Props);
    CreateButtonObject(90,10,2,Props);
    CreateButtonObject(170,10,3,Props);
    CreateButtonObject(10,80,4,Props);
    CreateButtonObject(90,80,5,Props);
    CreateButtonObject(170,80,6,Props);
    CreateButtonObject(10,150,7,Props);
    CreateButtonObject(90,150,8,Props);
    CreateButtonObject(170,150,9,Props);
  }
  
  // Se crea el Grupo de Tiles
  void GrupoDeTiles(){
    CreateButtonObject(10,10,1 , GameObjects);
    CreateButtonObject(90,10,2 , GameObjects);
    CreateButtonObject(170,10,3, GameObjects);
    CreateButtonObject(10,80,4, GameObjects);
    CreateButtonObject(90,80,5, GameObjects);
    CreateButtonObject(170,80,6, GameObjects);
  }
 
  void CreateButtonObject(int x , int y , int index, ArrayList<PImage> Lista){

    image(Lista.get(index-1), windowX + x, windowY + y , 50 , 50);
    
    if(intPressed == index && mytool.IDTool == 1){
      fill(255,255,255,150);
      rect(windowX + x , windowY + y , 50, 50);
    }
    
    if(mouseButton == LEFT){
      
      if(overRect(windowX + x , windowY + y , 50, 50)){
        
        indexGamObj = index;
        intPressed = index;
      }
    
    }
  }
  
  void GameObjectHelper(){
    
    if(intPressed > 0){
      int x = mouseX / 50;
      int y = mouseY / 50;
      
      if(x > 0 && x < 19){
        tint(255, 126);
        switch(mylayer.IndexCapa){
          case 1:{
            image(BackGrounds.get(intPressed - 1),x * 50, y * 50 , 50 , 50);
          }
          break;
          
          case 2:{
            image(Props.get(intPressed - 1),x * 50, y * 50 , 50 , 50);
          }
          break;
          
          case 3:{
            image(GameObjects.get(intPressed - 1),x * 50, y * 50 , 50 , 50);
          }
          break;
          
          case 4:{
            image(Items.get(intPressed - 1),x * 50, y * 50 , 50 , 50);
          }
          break;
        }
        tint(255);
      }
      
    }
    
  }
  
}
