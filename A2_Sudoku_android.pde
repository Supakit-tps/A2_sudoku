boolean valid = true;
int row = 9;
int col = 9;
int cell_size = 50;
int space=20;
int x=-1;
int y=-1;
int a=-1;
int b=-1;
int board[][] = new int[9][9];
int ran=int(random(0,8));
int countdown=0;

void loadSudokuBoard(String filename) {
    String[] lines = loadStrings(filename); 
    int i=0;
    int n=10;
    n=n*ran;
    while(i < 9){
        String line = lines[n].trim(); 
        int j=0;
        while(j < 9){
            board[i][j] = line.charAt(j) - '0'; 
            j+=1;
        }
        i+=1;
        n+=1;
    }
  }


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
    fill(0);
        text("wrong"+countdown+"/3",width/2,cell_size*9+space+cell_size/2);
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
            if((x>=0)&&(y>9)&&(a>=0)){
                if(board[a][b]!=0){
                    num = board[a][b];
                    if(valid==true){
                        fill(0,255,0);
                        text(int(num), b*cell_size + cell_size/2+space, a*cell_size + cell_size/2+space);
                    }
                    if(valid==false){
                        fill(255,0,0);
                        text(int(num), b*cell_size + cell_size/2+space, a*cell_size + cell_size/2+space);
                    }
                }
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
            valid = true;
            a=y;
            b=x; 
        }
    }
    if((x>=0)&&(y>=10)&&(x<row)&&(y<11)&&(a>=0)){
        if(board[a][b]==0){
            board[a][b]=x+1;
        }
        if(valid==false){
            board[a][b]=x+1;  
            if((board[a][b]!=0)){
                board[a][b]=0;     
            }
        }
        
    }
}

void checking_input(){
    int c=0;
    if((x>=0)&&(y>9)&&(a>=0)){
        if(board[a][b]!=0){
            int j = 0;
            while(j<9){
                if(board[a][b]==board[a][j]){
                    c+=1;
                }
                j+=1;
            }
            int i=0;
            while(i<9){
                if(board[a][b]==board[i][b]){
                    c+=1;
                }
                i+=1;
            }
            i=0;
            int aa=(a/3)*3;
            int bb=(b/3)*3;
            while(i<3){
                j=0;
                while(j<3){
                    if(board[a][b]==board[aa+i][bb+j]){
                        c+=1;
                    }
                    j+=1;
                }
                i+=1;
            } 
        }
    }
    if(c>3){
        valid = false;
        countdown+=1;
    }
    if(countdown>=3){
        valid=false;
        fill(255);
        rect(0,0,width,height);
        fill(255,0,0);
        textSize(100);
        text("Gameover",width/2,height/3);
    }
}

void setup() {
    size(displayWidth,displayHeight);
    textAlign(CENTER,CENTER);
    textSize(40);
    loadSudokuBoard("Tablenum.txt");
}

void draw() {
    background(255);
    sudokutable();
    pressed();
    select();
    botton();
    input_num();
    checking_input();
}
