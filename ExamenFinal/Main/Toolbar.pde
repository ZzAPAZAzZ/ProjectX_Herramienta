class Toolbar{
  int windowX = 5;
  int windowY = 30;
  
  ArrayList<PImage> Tools = new ArrayList<PImage>();
  PImage ButtonImg;
  int IDTool; 
  
  public void Start(){
    ButtonImg = loadImage("01.png");
    Tools.add(ButtonImg);
    ButtonImg = loadImage("02.png");
    Tools.add(ButtonImg);
  }
  
  public void Update(){
    fill(129,206,15);
    rect(windowX ,windowY ,40,565);
    
    
    
    //botones
    
    CreateToolButton(5,5,1);
    CreateToolButton(5,50,2);
    
    fill(255);
    rect(10,125, 30, 30);
    
    fill(255);
    rect(10,170, 30, 30);
  }
  
  void CreateToolButton(int x , int y , int index){

    image(Tools.get(index - 1), windowX + x, windowY + y , 30 , 30);
    
    if(IDTool == index){
      fill(255,255,255,150);
      rect(windowX + x , windowY + y , 30, 30);
    }
    
    if(mouseButton == LEFT){
      
      if(overRect(windowX + x , windowY + y , 50, 50)){
        IDTool = index;
      }
    }
  }
  
}
