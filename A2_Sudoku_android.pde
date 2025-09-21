boolean valid = true;
int row = 9;
int col = 9;
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
int cell_size = 50;
int board[][] =  {
    {5, 3, 0, 0, 7, 0, 0, 0, 0},
    {6, 0, 0, 1, 9, 5, 0, 0, 0},
    {0, 9, 8, 0, 0, 0, 0, 6, 0},
    {8, 0, 0, 0, 6, 0, 0, 0, 3},
    {4, 0, 0, 8, 0, 3, 0, 0, 1},
    {7, 0, 0, 0, 2, 0, 0, 0, 6},
    {0, 6, 0, 0, 0, 0, 2, 8, 0},
    {0, 0, 0, 4, 1, 9, 0, 0, 5},
    {0, 0, 0, 0, 8, 0, 0, 7, 9}
};

void setup() {
    fullScreen();
    textAlign(CENTER,CENTER);
    textSize(15);
}

void draw() {
    background(255);
    sudokutable();
    drawnum();
}
void sudokutable(){
    fill(255);
    int i = 0;
    while(i < 9){
        int j=0;
        while(j < 9){
            strokeWeight(2);
            rect(j*cell_size+20, i* cell_size+20, cell_size, cell_size);
            j+=1;
        }
        i+=1;
    }
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
                text(int(num), n*cell_size + cell_size/2+20, m*cell_size + cell_size/2+20);
            }
            else if(user_input[m][n] != 0){
                num = user_input[m][n];
                text(int(num), n*cell_size + cell_size/2+20, m*cell_size + cell_size/2+20);
            }
            n+=1;
        }
        m+=1;
    }
}
