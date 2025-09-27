boolean valid = true;
int select[] = {0,0};
int row = 9;
int col = 9;
int cell_size = 50;
int space=20;
int x = -1;
int y = -1;
int user_input[][] = {
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0}
};
int board[][] =  {
    {5,3,0,0,7,0,0,0,0},
    {6,0,0,1,9,5,0,0,0},
    {0,9,8,0,0,0,0,6,0},
    {8,0,0,0,6,0,0,0,3},
    {4,0,0,8,0,3,0,0,1},
    {7,0,0,0,2,0,0,0,6},
    {0,6,0,0,0,0,2,8,0},
    {0,0,0,4,1,9,0,0,5},
    {0,0,0,0,8,0,0,7,9}
};

void sudokutable(){
    stroke(1);
    fill(255);
    int i = 0;
    while(i < 9){
        int j=0;
        while(j < 9){
            strokeWeight(2);
            rect(j*cell_size+space, i* cell_size+space, cell_size, cell_size);
            j+=1;
        }
        i+=1;
    }
    i=0;
    while(i<=3){
        strokeWeight(5);
        line(i*cell_size*3+space,space,i*cell_size*3+space,cell_size*9+space);
        i+=1;
    }
    i=0;
    while(i<=3){
        strokeWeight(5);
        line(space,i*cell_size*3+space,cell_size*9+space,i*cell_size*3+space);
        i+=1;
    }
    drawnum();
}
void drawnum(){
    textSize(15);
    fill(0);
    int m = 0;
    while (m < row){
        int n = 0;
        while (n < col){
            int num = 0;
            if(board[m][n] != 0){
                num = board[m][n];
                text(int(num), n*cell_size + cell_size/2+space, m*cell_size + cell_size/2+space);
            }
            else if(user_input[m][n] != 0){
                num = user_input[m][n];
                text(int(num), n*cell_size + cell_size/2+space, m*cell_size + cell_size/2+space);
            }
            n+=1;
        }
        m+=1;
    }
}

void pressed(){
    if(mousePressed){
    x = mouseX;
    y = mouseY;
    x=(x-space)/cell_size;
    y=(y-space)/cell_size;
    }
    if((x>=0)&&(y>=0)&&(x<row)&&(y<col)){
        highlight();
        rect(x*cell_size+space,y*cell_size+space,cell_size,cell_size);
    }
}
void highlight(){
    noStroke();
    fill(255,230,120,120);   
}
void setup() {
    fullScreen();
    textAlign(CENTER,CENTER);
    textSize(15);
}

void draw() {
    background(255);
    sudokutable();
    drawnum();
    pressed();
}
