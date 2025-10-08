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
int stage=0;

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
    button();
    fill(0);
    text("wrong "+countdown+"/3",width*2/3,cell_size*9+space+cell_size/2);
    drawnum();
}

void drawnum(){
    int m = 0;
    int c = 0;
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
            if(board[m][n]==0){
                c+=1;
            }
            n+=1;
        }
        m+=1;
    }
    fill(0);
    text("Space = "+c,width/4,cell_size*9+space+cell_size/2);
    if(c==0){
        valid=false;
        fill(255);
        noStroke();
        rect(0,0,width,height);
        textSize(100);
        fill(0,255,0);
        text("You WIN",width/2,height/3);
        noLoop();
    }
}

void pressed(){
    if(mousePressed){
        x = mouseX;
        y = mouseY;
        x = (x-space)/cell_size;
        y = (y-space)/cell_size;
    }
}

void select(){
    if((x>=0)&&(y>=0)&&(x<row)&&(y<col)){
        stage=1;
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

void button(){
    stroke(0);
    strokeWeight(3);
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
        stage=2;
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
            if((board[a][b]!=0)){
                board[a][b]=0;  
            }
        }
        
    }
}

void checking_input(){
    int c=0;
    if((x>=0)&&(y>9)&&(a>=0)){
        stage=3;
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
        stage=4;
        valid=false;
        fill(255);
        noStroke();
        rect(0,0,width,height);
        fill(255,0,0);
        textSize(100);
        text("Gameover",width/2,height/3);
        noLoop();
    }
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

void flowchart(){
    stroke(0);
    strokeWeight(2);
    fill(255);
    ellipse(width/2-100,625,100,50);
    arrow(width/2-100,650,width/2-100,675);
    diamond(width/2-100,700,150,50);
    arrow(width/2-100,725,width/2-100,750);
    rect(width/3-100,750,width/3,50);
    arrow(width/2-100,800,width/2-100,825);
    rect(width/3-100,825,width/3,50);
    arrow(width/2-100,875,width/2-100,900);
    rect(width/3-100,900,width/3,50);
    line(width/2-100,950,width/2-100,975);
    line(width/2-100,975,width/4-100,975);
    line(width/4-100,975,width/4-100,700);
    line(width/4-100,700,75,700);
    line(60,690,75,700);
    line(60,710,75,700);
    line(width/2-25,700,width/2+25,700);
    line(width/2+10,690,width/2+25,700);
    line(width/2+10,710,width/2+25,700);
    rect(width/2+25,675,width/3,50);
    fill(0);
    textSize(20);
    text("Start",width/2-100,625);
    text("Wrong<3",width/2-100,700);
    text("Select box",width/2-100,775);
    text("Select button",width/2-100,850);
    text("Checking input",width/2-100,925);
    text("Gameover",width/2+110,700);
    if(stage==1){
        highlight();
        rect(width/3-100,750,width/3,50);
    }
    if(stage==2){
        highlight();
        rect(width/3-100,825,width/3,50);
    }
    if(stage==3){
        highlight();
        rect(width/3-100,900,width/3,50);
    }
    if(stage==4){
        highlight();
        rect(width/2+25,675,width/3,50);
    }
}
void setup() {
    size(displayWidth,displayHeight);
    textAlign(CENTER,CENTER);
    loadSudokuBoard("Tablenum.txt");
}

void draw() {
    textSize(40);
    background(255);
    sudokutable();
    pressed();
    select();
    input_num();
    checking_input();
    flowchart();
}
