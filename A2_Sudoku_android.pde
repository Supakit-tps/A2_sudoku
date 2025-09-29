boolean valid = true;
int row = 9;
int col = 9;
int cell_size = 50;
int space=20;
int x=-1;
int y=-1;
int a=0;
int b=0;
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
    stroke(0);
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
    int m = 0;
    while (m < row){
        int n = 0;
        while (n < col){
            int num = 0;
            if(board[m][n] != 0){
                num = board[m][n];
                fill(0);
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
}

void select(){
    if((x>=0)&&(y>=0)&&(x<row)&&(y<col)){
        highlight();
        rect(x*cell_size+space,y*cell_size+space,cell_size,cell_size);
        int i = 0;
        while(i<9){
            int j = 0;
            while(j<9){
                if((board[i][j]==board[y][x])&&(board[i][j]!=0)){
                    highlight();
                    rect(j*cell_size+space,i*cell_size+space,cell_size,cell_size);
                }
                j+=1;
            }
            i+=1;
        }
    }
    
}

void highlight(){
    noStroke();
    fill(255,230,120,120);   
}

void botton(){
    stroke(0);
    strokeWeight(2);
    int i=0;
    while(i<9){
        fill(255);
        rect(i*cell_size+space,10*cell_size+space,cell_size,cell_size);
        fill(0);
        text(i+1,i*cell_size+space+cell_size/2,10*cell_size+cell_size/2+space);
        i+=1;
    }
    if((x>=0)&&(y>=10)&&(x<row)&&(y<11)){
        fill(255,200,200,150);
        rect(x*cell_size+space,y*cell_size+space,cell_size,cell_size);
    }
}

void input_num(){
    if((x>=0)&&(y>=0)&&(x<row)&&(y<col)){
        if(board[y][x]==0){
            a=y;
            b=x; 
        }
    }
    if((x>=0)&&(y>=10)&&(x<row)&&(y<11)){
        if(board[a][b]==0){
            board[a][b]=x+1;
        }
    }
}

void setup() {
    size(displayWidth,displayHeight);
    textAlign(CENTER,CENTER);
    textSize(40);
}

void draw() {
    background(255);
    sudokutable();
    pressed();
    select();
    botton();
    input_num();
}
