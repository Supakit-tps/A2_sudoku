void rectangle(int x,int y,int z1,int z2){
    line(x-z1/2,y+z2/2,x+z1/2,y+z2/2);
    line(x-z1/2,y+z2/2,x-z1/2,y-z2/2);
    line(x+z1/2,y+z2/2,x+z1/2,y-z2/2);
    line(x-z1/2,y-z2/2,x+z1/2,y-z2/2);
}
void diamond(int x,int y,int z1,int z2){
    line(x,y+z2/2,x+z1/2,y);
    line(x,y-z2/2,x+z1/2,y);
    line(x,y+z2/2,x-z1/2,y);
    line(x,y-z2/2,x-z1/2,y);
}
void arrow(int x1,int y1,int x2,int y2){
    line(x1,y1,x2,y2);
    line(x2,y2,x2+10,y2-15);
    line(x2,y2,x2-10,y2-15);
}

void setup(){
    size(1000,1000);
    ellipse(500,200,200,100);
    arrow(500,250,500,300);
    diamond(500,350,200,100);
    arrow(500,400,500,450);
    rectangle(500,500,200,100);
    
    
}
