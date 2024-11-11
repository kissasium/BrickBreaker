   ; -----------------------------------------------------------------
   ; -----------------------------------------------------------------
   ;                          Member 1

   ;                       Kalsoom Tariq
   ;                         i21-2487
   ;                           CS_Z


   ;                          Member 2

   ;                       Kissa Zahra Shah
   ;                          i21-0572
   ;                           CS_Z

   ; -----------------------------------------------------------------
   ; -----------------------------------------------------------------

.model small
.stack 100h
Bricks STRUCT
   
   x_cor word 0
   y_cor word 0
   hits word 0
   color word 0 ; american
   
Bricks ENDS
.data

     ; -----------------------------------------------------------------
   ; -----------------------------------------------------------------
   ;                          Level  # 1 Bricks
   ; -----------------------------------------------------------------
   ; -----------------------------------------------------------------
   B_1_a Bricks 6 dup(<,,1,34>)
   B_1_b Bricks 6 dup(<,,1,43>)
   B_1_c Bricks 6 dup(<,,1,34>)
   B_1_d Bricks 6 dup(<,,1,43>)

   ; -----------------------------------------------------------------
   ; -----------------------------------------------------------------
   ;                          Level  # 2 Bricks
   ; -----------------------------------------------------------------
   ; -----------------------------------------------------------------
   B_2_a Bricks 6 dup(<,,1,34>)
   B_2_b Bricks 6 dup(<,,1,43>)
   B_2_c Bricks 6 dup(<,,1,43>)
   B_2_d Bricks 6 dup(<,,1,34>)
   B_2_e Bricks 6 dup(<,,2,55h>)
   B_2_f Bricks 6 dup(<,,2,55h>)

   ; -----------------------------------------------------------------
   ; -----------------------------------------------------------------
   ;                          Level  # 3 Bricks
   ; -----------------------------------------------------------------
   ; -----------------------------------------------------------------
   B_3_a Bricks 6 dup(<,,1,34>)
   B_3_b Bricks 6 dup(<,,2,55h>)
   B_3_c Bricks 6 dup(<,,1,34>)
   B_3_d Bricks 6 dup(<,,2,55h>)
   B_3_e Bricks 6 dup(<,,3,4>)
                     ;Fixed Bricks
   B_3_f Bricks 6 dup(<,,5,233>)
                     ;temp brick for initialization
   brick Bricks 6 dup(<>)
   colour WORD 0 

   ; -----------------------------------------------------------------
   ; -----------------------------------------------------------------
   ;                          Display Variables
   ; -----------------------------------------------------------------
   ; -----------------------------------------------------------------


   window_width WORD 300
   window_height WORD 170
   aux_time BYTE 0 ; var to store prev time
   color BYTE 0
   key_inp BYTE 0
   num WORD 0
   count WORD 0
   store BYTE 0

   ; strings
   Score BYTE "Score: $"
   Lives BYTE "Lives: $"
   Level BYTE "Level: $"
   Names BYTE "Name: $"
   disp_heart BYTE 3,3,3,'$'
   score_str BYTE "0$$"
   level_val BYTE "1$"
   ; Axis
   S_x BYTE 92
   S_y BYTE 23
   L_x BYTE 92
   L_y BYTE 1
   Score_x BYTE 85
   Score_y BYTE 23
   Lives_x BYTE 104
   Lives_y BYTE 23
   Level_x BYTE 85
   Level_y BYTE 1
   Name_x BYTE 104
   Name_y BYTE 1
   N_x BYTE 110
   N_y BYTE 1
   heart_x dw 250,260,270
   heart_y dw 190,190,190

   coloor db 4,4,4

   ; Values
   Scores WORD 120
   ind WORD 2
   
   ; -----------------------------------------------------------------
   ; -----------------------------------------------------------------
   ;                          Paddle & Ball Variables
   ; -----------------------------------------------------------------
   ; -----------------------------------------------------------------

   ;boundary
   paddle_lb WORD 20
   paddle_rb WORD 250

   ;paddle
   Paddle_x WORD 100
   Paddle_y WORD 170

   P_prev WORD 100
   P_length WORD 50

   ;ball
   Ball_x WORD 0
   Ball_y WORD 0

   Bp_x WORD 45
   Bp_y WORD 95

   BBorg_x WORD 50
   BBorg_y WORD 100

   Bx_speed WORD 1
   By_speed WORD 2

   current_level dw 1

   ; -----------------------------------------------------------------
   ; -----------------------------------------------------------------
   ;                         Menu Page variables
   ; -----------------------------------------------------------------
   ; -----------------------------------------------------------------

   Welcomemsg db 1," WELCOME TO BRICK BREAKER ", 1,'$'
   Start_Button db "Press 'S' -> Start",'$'
   HS_Button db "Press 'H' -> Scores",'$'
   Inst_Button db "Press 'I' -> How to?",'$'
   Exit_Button db "Press 'E' -> Exit",'$'

   instmsg_x db  12
   instmsg_y db  4

   How_to_play db 1," How to Play ",1,'$'
   inst1msg db "Use paddle to Bounce the ball",'$'
   inst2msg db "Break the bricks to Get Scores",'$'
   inst3msg db "You have 3 Lives to play 3 Levels",'$'
   inst4msg db "Game Over if all Lives are lost",'$'
   inst5msg db "BEST OF LUCK :)  ",'$'
   Inp_name db 1," Input Your Name: ",1,'$'
   array db 30 dup('$')

   x dw 0
   y dw 0 

   ; Start game button
   st_y dw 80
   st_x dw 45

   ; Instructions button
   inst_y dw 80
   inst_x dw 77

   ; Exit button
   ex_x dw 140
   ex_y dw 80

   ; HighScore button
   HS_x dw 110
   HS_y dw 80


  ;color db 0
   msg db "Game over :(", '$'
   msg1  db "Name: ", '$'
   msg2 db "Score: ", '$'
   msg3  db "level: ", '$'
   
    ; msg
   msg_x db 14
   msg_y db 4
   msg1_x db 12
   msg1_y db 8
   nm_x db 18
   nm_y db 8
   msg2_x db 12
   msg2_y db 10
   msg3_x db 12
   msg3_y db 12
    ; Start game button
   str_x db 12
   str_y db 16 

   ; Exit button
   exx_x db 12
   exx_y db 20

   
   score_str_x db 19
   score_str_y db 10
   
    level_val_x db 19
    level_val_y db 12
   
   ins_x dw 77
   ins_y dw 157
   inst1_x dw 77
   inst1_y dw  125
   wonn db 1," ",3," YOU WON ",3," ",1,'$'

   f1 db "file.txt",0
   handle dw 0
   SCR db 1," SCORES ",1,'$'
   x_v db 10
   y_v db 10

   sss db "Score$"
   nn db "Names$"
   ll db "Level$"

.code

mov ax,@data
mov ds,ax
mov ax,0

main PROC

   Vmode:
   mov ah,00h
   mov al,13h  ;320 X 200
   int 10h

  ;call Page_1_Graphics
  
  P1:
  
  call Page_1_Graphics
  mov ah,1
  int 16h
  JZ P1
  mov ah,0
  int 16h
  mov store,ah
  
   
   ;Check Keys
   .if(ah==31)
   ;Start
      JMP start_game
   .elseif(ah==18)
   ;exit
      JMP exit
   .elseif(ah==23)
   ;instructions
      JMP instructions
   .elseif(ah==35)
   ;high scores
      JMP dispScore
   .endif

   call Page_1_Graphics
  
  mov ah,store
  cmp ah,28
  JNE P1
  JMP exit

  instructions:
   mov ah,0  ; shyshtem eclear
   mov al,13h
   int 10h 
   
   Inst:
   Call Draw_Boundary
   Call page_instruction_Graphics
   mov ah,1
   int 16h
   JZ Inst
   mov ah,0
   int 16h

  .if(ah>0 && ah<84)
      JMP Vmode
  .endif
  JMP Inst
   
  start_game:

   mov ah,0  ; shyshtem eclear
   mov al,13h
   int 10h 

   call Draw_Boundary
  mov dl,10
  mov dh,7
  mov cx,lengthof Inp_name
  dec cx
  mov color,100
  mov si,offset Inp_name
  call Write_Info

  mov dl,15;x
  mov dh,10;y
  mov cx,20
  mov di,0
  L1:
  push cx
  mov cx,0
  mov  bh, 0    ;Display page
  mov  ah, 02h  ;Set cursor position
  int  10h

   mov ah,01h
   int 21h
   cmp al,13
   JE dn
   mov BYTE ptr array[di],al
   mov ah,09h  ; shyshtem eclear
   int 10h 
   pop cx
   inc dl
   inc di
   loop L1
   dn:

   mov ah,0
   mov bh,1
   mov al,13h
   int 10h
   
   call Initialize_bricks
   call Graphics
   JMP CheckTime
   reset:

   call reset_game
   jmp start_game


   CheckTime:
   ; Get system time
  mov ah,2ch
  int 21h   ;ch = hour, cl = min , dh sec

  cmp dl,aux_time
  JE CheckTime
  mov aux_time,dl

  mov ax,ind
  .if(ax==6)

   mov ah,00h
   mov al,13h  ;320 X 200
   int 10h
   call write_file
   con:
      call Game_over
      mov ah,1
      int 16h
   JZ con
      mov ah,0
      int 16h
      mov store,ah
      call Game_over
      mov ah,store
      cmp ah,31 
      je reset
      cmp ah,18 
      je exit
      cmp ah,28
      JNE con
      jmp exit

  .endif
    
  mov ax,Scores
  .if(ax==24)
      mov ah,00h
      mov al,13h  ;320 X 200
      int 10h
      mov paddle_lb,10
      mov paddle_rb,270
      mov level_val[0],'2'
      mov color,0
      call Draw_Ball
      mov color,0
      call Draw_Paddle
      mov current_level,2
      mov P_length,30
      mov Bx_speed,2
      mov By_speed,3
      mov BBorg_x,50
      mov BBorg_y,100
      mov Paddle_x,100
      mov Paddle_y,170
   continue:
      mov ah,1
      int 16h
      JZ continue
  .endif

   mov ax,Scores
  .if(ax==72)
      mov ah,00h
      mov al,13h  ;320 X 200
      int 10h
      mov paddle_lb,10
      mov paddle_rb,270
      mov level_val[0],'3'
      mov color,0
      call Draw_Ball
      mov color,0
      call Draw_Paddle
      mov current_level,3
      mov P_length,30
      mov Bx_speed,2
      mov By_speed,3
      mov BBorg_x,50
      mov BBorg_y,100
      mov Paddle_x,100
      mov Paddle_y,170
   contin:
      mov ah,1
      int 16h
      JZ contin
  .endif

  mov ax,Scores
  .if(ax==126)

     call write_file
     mov ah,00h
     mov al,13h
     int 10h
   WON:
      call win_screen
      mov ah,1
      int 16h
      JZ won
      mov ah,0
      int 16h
      mov store,ah
      call win_screen
      mov ah,store
      cmp ah,31 
      je reset
      cmp ah,18 
      je exit
      cmp ah,28
      JNE won
      jmp exit

  .endif

  mov ax,BBorg_x
  mov Bp_x,ax
  mov ax,BBorg_y
  mov Bp_y,ax

  call Mov_ball 


  call Graphics
  ; Re-draw ball
  mov color,14
  call Draw_Ball
  mov color,0
  call Draw_Ball

  mov color,43
  call Draw_Paddle

  mov ah,1
  int 16h
  JZ CheckTime
  mov ah,0
  int 16h
  mov store,ah
  call Graphics
  mov ah,store
  cmp ah,77 ; right key
  je rightt
  cmp ah, 75 ; left key
  je leftt
  cmp ah,25
  je paus
  cmp ah,28
  JNE CheckTime
  JMP exit

  paus:
  mov ah,1
  int 16h
  JZ paus
  JMP CheckTime

  rightt:

  mov bx,paddle_rb
  cmp Paddle_x,bx
  JAE CheckTime

  mov color,0
  call draw_paddle

  add Paddle_x,10
  mov bx, Paddle_x
  mov P_prev,bx

  mov color,43
  call Draw_Paddle

  JMP CheckTime

  leftt:

  mov bx,paddle_lb
  cmp Paddle_x,bx
  JBE CheckTime

  mov color,0
  call draw_paddle

  sub Paddle_x,10
  mov bx, Paddle_x
  mov P_prev,bx

  mov color,43
  call Draw_Paddle

  JMP CheckTime


  dispScore: 

   mov ah,00h
   mov al,13h  ;320 X 200
   int 10h

   read:

   call score_scr
   call read_file
   mov x_v,10
   mov y_v,10
   mov ah,1
   int 16h
   JZ read
   .if(ah>0 && ah<84)
      JMP Vmode
   .endif
   JMP read

  exit:
  mov ah, 4ch
  int 21h

main ENDP

   ; -----------------------------------------------------------------
   ; -----------------------------------------------------------------
   ;                         Paddle & Ball functions
   ; -----------------------------------------------------------------
   ; -----------------------------------------------------------------
Draw_Paddle PROC uses ax bx cx dx

  mov ax,0  ; padle length
  mov dx,Paddle_y
loop3:
push ax

  mov cx,Paddle_x

  mov ax,0
  loop2:
  push ax

      mov ah, 0ch ; draw pixel
      mov al, color
      mov bh, 0
      int 10h
    
    inc cx

    pop ax
    inc ax
    cmp ax,P_length
    JNE loop2

inc dx
pop ax
inc ax
cmp ax,5
JNE loop3
  
  ret

Draw_Paddle ENDP

Draw_Ball PROC 


   cmp color,0
   JE erase
   mov bx,BBorg_x
   mov dx,BBorg_y
   JMP cont

   erase:
   mov bx,Bp_x
   mov dx,Bp_y

   cont:
mov Ball_x, bx
mov Ball_y, dx

mov cx,3

   L1:
      push cx

      mov cx,bx
      mov ah,0ch
      mov al,color
      int 10h

      inc dx
      dec bx

      pop cx
   loop L1

   inc Ball_x
   mov bx,Ball_x   
   mov dx,Ball_y   

   mov cx,bx
   mov ah,0ch
   mov al,color
   int 10h

   inc Ball_x  
   mov bx,Ball_x   
   mov dx,Ball_y   

   mov cx,3

   L2:
      push cx

      mov cx,bx
      mov ah,0ch
      mov al,color
      int 10h

      inc dx
      inc bx

      pop cx
   loop L2

   add Ball_x,2  
   add Ball_y,3  

   mov bx,Ball_x   
   mov dx,Ball_y   

   
   inc Ball_y   
   mov dx,Ball_y
   mov cx,3

   L4:
      push cx

      mov cx,bx
      mov ah,0ch
      mov al,color
      int 10h

      inc dx
      dec bx

      pop cx
   loop L4


   sub Ball_x,3   
   add Ball_y,2
   mov bx,Ball_x   
   mov dx,Ball_y

   mov cx,bx
   mov ah,0ch
   mov al,color
   int 10h

   dec bx
   mov cx,3

   L5:
      push cx

      mov cx,bx
      mov ah,0ch
      mov al,color
      int 10h

      dec dx
      dec bx

      pop cx
   loop L5
   ret

Draw_Ball ENDP

Mov_ball PROC uses ax

   mov color,14
   call Draw_Ball

   mov ax,Bx_speed 
   add BBorg_x,ax  ; ball moving horizontally (to right)

   ; check collision left
   .if(current_level==1)
      call l1_col_left
   .elseif(current_level==2)
      call l2_col_left
   .elseif(current_level==3)
      call l3_col_left
   .endif

   cmp BBorg_x,10   ; BBorg_x < 10 (collision with left)
   JL neg_vel_x

   mov ax,window_width
   cmp BBorg_x,ax   ; BBorg_x > width (collision with right)
   JG neg_vel_x
                  
   mov ax,By_speed
   add BBorg_y,ax   ; ball moving vertically (down)

   ; check collision with brick bottom
   .if(current_level==1)
      call l1_col_b
   .elseif(current_level==2)
      call l2_col_b
   .elseif(current_level==3)
      call l3_col_b
   .endif

   cmp BBorg_y,20   ; BBorg_y < 20 (collision with top)
   JL neg_vel_y

   ;Check for paddle collision
   call paddle_collision


   mov ax,window_height   ; BBorg_y > height (collision with bottom)
   cmp BBorg_y,ax   
   JL cont
   ;live_loss:
   mov di,ind
   mov coloor[di],0
   dec ind
   cmp ind,0
   JL exit

   mov color,0
   call Draw_Ball
   stp:
   call Graphics
   mov BBorg_x,50
   mov BBorg_y,100

   mov color,14
   call Draw_Ball
   mov ah,1
   int 16h
   JZ stp

   .if(Bx_speed<0)
      neg Bx_speed
   .endif
   .if(By_speed<0)
      neg By_speed
   .endif

   cont:
   ret

   neg_vel_x:
   neg Bx_speed
   ret

   neg_vel_y:
   neg By_speed
   ret

   exit:
   mov ind,6
   ret

Mov_ball ENDP

   ; -----------------------------------------------------------------
   ; -----------------------------------------------------------------
   ;                          Brick functions
   ; -----------------------------------------------------------------
   ; -----------------------------------------------------------------

Initialize_bricks PROC

   mov di,0

   mov cx,6
   mov ax,50
   mov dx,30
   L1:
      mov (Bricks ptr B_1_a[di]).x_cor,ax
      mov (Bricks ptr B_1_a[di]).y_cor,dx
      mov (Bricks ptr B_1_a[di]).color,34
      mov (Bricks ptr B_1_a[di]).hits,1

      mov (Bricks ptr B_2_a[di]).x_cor,ax
      mov (Bricks ptr B_2_a[di]).y_cor,dx
      mov (Bricks ptr B_2_a[di]).color,34
      mov (Bricks ptr B_2_a[di]).hits,1

      mov (Bricks ptr B_3_a[di]).x_cor,ax
      mov (Bricks ptr B_3_a[di]).y_cor,dx
      mov (Bricks ptr B_3_a[di]).color,34
      mov (Bricks ptr B_3_a[di]).hits,1
      add di,type Bricks
      add ax, 40
   loop L1

   mov di,0

   mov cx,6
   mov ax,30
   mov dx,42
   L2:
      mov (Bricks ptr B_1_b[di]).x_cor,ax
      mov (Bricks ptr B_1_b[di]).y_cor,dx
      mov (Bricks ptr B_1_b[di]).color,43
      mov (Bricks ptr B_1_b[di]).hits,1

      mov (Bricks ptr B_2_b[di]).x_cor,ax
      mov (Bricks ptr B_2_b[di]).y_cor,dx
      mov (Bricks ptr B_2_b[di]).color,43
      mov (Bricks ptr B_2_b[di]).hits,1


      mov (Bricks ptr B_3_b[di]).x_cor,ax
      mov (Bricks ptr B_3_b[di]).y_cor,dx
      mov (Bricks ptr B_3_b[di]).color,55h
      mov (Bricks ptr B_3_b[di]).hits,2
   
      add di,type Bricks
      add ax, 40
   loop L2

   mov di,0

   mov cx,6
   mov ax,50
   mov dx,54
   L3:
      mov (Bricks ptr B_1_c[di]).x_cor,ax
      mov (Bricks ptr B_1_c[di]).y_cor,dx
      mov (Bricks ptr B_1_c[di]).color,34
      mov (Bricks ptr B_1_c[di]).hits,1

      mov bx,24
      mov (Bricks ptr B_2_c[di]).x_cor,ax
      mov (Bricks ptr B_2_c[di]).y_cor,dx
      add (Bricks ptr B_2_c[di]).y_cor,bx
      mov (Bricks ptr B_2_c[di]).color,34
      mov (Bricks ptr B_2_c[di]).hits,1


      mov bx,24
      mov (Bricks ptr B_3_c[di]).x_cor,ax
      mov (Bricks ptr B_3_c[di]).y_cor,dx
      add (Bricks ptr B_3_c[di]).y_cor,bx
      mov (Bricks ptr B_3_c[di]).color,34
      mov (Bricks ptr B_3_c[di]).hits,1

  
      add di,type Bricks
      add ax, 40
   loop L3

   mov di,0

   mov cx,6
   mov ax,30
   mov dx,66
   L4:
      mov (Bricks ptr B_1_d[di]).x_cor,ax
      mov (Bricks ptr B_1_d[di]).y_cor,dx
      mov (Bricks ptr B_1_d[di]).color,43
      mov (Bricks ptr B_1_d[di]).hits,1

      mov bx,24
      mov (Bricks ptr B_2_d[di]).x_cor,ax
      mov (Bricks ptr B_2_d[di]).y_cor,dx
      add (Bricks ptr B_2_d[di]).y_cor,bx
      mov (Bricks ptr B_2_d[di]).color,43
      mov (Bricks ptr B_2_d[di]).hits,1


      mov bx,24
      mov (Bricks ptr B_3_d[di]).x_cor,ax
      mov (Bricks ptr B_3_d[di]).y_cor,dx
      add (Bricks ptr B_3_d[di]).y_cor,bx
      mov (Bricks ptr B_3_d[di]).color,55h
      mov (Bricks ptr B_3_d[di]).hits,2

      
      add di,type Bricks
      add ax, 40
   loop L4

   mov di,0

   mov cx,6
   mov ax,50
   mov dx,54
   L5:

      mov (Bricks ptr B_2_e[di]).x_cor,ax
      mov (Bricks ptr B_2_e[di]).y_cor,dx
      mov (Bricks ptr B_2_e[di]).color,55h
      mov (Bricks ptr B_2_e[di]).hits,2


      mov (Bricks ptr B_3_e[di]).x_cor,ax
      mov (Bricks ptr B_3_e[di]).y_cor,dx
      mov (Bricks ptr B_3_e[di]).color,4
      mov (Bricks ptr B_3_e[di]).hits,3
     
      add di,type Bricks
      add ax, 40
   loop L5

   mov di,0

   mov cx,6
   mov ax,30
   mov dx,66
   L6:

      mov (Bricks ptr B_2_f[di]).x_cor,ax
      mov (Bricks ptr B_2_f[di]).y_cor,dx
      mov (Bricks ptr B_2_f[di]).color,55h
      mov (Bricks ptr B_2_f[di]).hits,2

      mov (Bricks ptr B_3_f[di]).x_cor,ax
      mov (Bricks ptr B_3_f[di]).y_cor,dx
      mov (Bricks ptr B_3_f[di]).color,233
      mov (Bricks ptr B_3_f[di]).hits,5
     
      add di,type Bricks
      add ax, 40
   loop L6

    
   ret
Initialize_bricks ENDP

Level_1_Bricks PROC


   mov si,offset B_1_a.x_cor
   mov di,offset brick.x_cor
   call to_brick

   mov si,offset B_1_a.y_cor
   mov di,offset brick.y_cor
   call to_brick

   mov si,offset B_1_a.color
   mov di,offset brick.color
   call to_brick

   mov si,offset B_1_a.hits
   mov di,offset brick.hits
   call to_brick

   call makingBrick 

   mov si,offset B_1_b.x_cor
   mov di,offset brick.x_cor
   call to_brick

   mov si,offset B_1_b.y_cor
   mov di,offset brick.y_cor
   call to_brick

   mov si,offset B_1_b.color
   mov di,offset brick.color
   call to_brick

   mov si,offset B_1_b.hits
   mov di,offset brick.hits
   call to_brick
   call makingBrick

   mov si,offset B_1_c.x_cor
   mov di,offset brick.x_cor
   call to_brick

   mov si,offset B_1_c.y_cor
   mov di,offset brick.y_cor
   call to_brick

   mov si,offset B_1_c.color
   mov di,offset brick.color
   call to_brick

   mov si,offset B_1_c.hits
   mov di,offset brick.hits
   call to_brick
   call makingBrick 

   mov si,offset B_1_d.x_cor
   mov di,offset brick.x_cor
   call to_brick

   mov si,offset B_1_d.y_cor
   mov di,offset brick.y_cor
   call to_brick

   mov si,offset B_1_d.color
   mov di,offset brick.color
   call to_brick

   mov si,offset B_1_d.hits
   mov di,offset brick.hits
   call to_brick

   call makingBrick
   ret

Level_1_Bricks ENDP


Level_2_Bricks PROC


   mov si,offset B_2_a.x_cor
   mov di,offset brick.x_cor
   call to_brick

   mov si,offset B_2_a.y_cor
   mov di,offset brick.y_cor
   call to_brick

   mov si,offset B_2_a.color
   mov di,offset brick.color
   call to_brick

   mov si,offset B_2_a.hits
   mov di,offset brick.hits
   call to_brick

   call makingBrick 

   mov si,offset B_2_b.x_cor
   mov di,offset brick.x_cor
   call to_brick

   mov si,offset B_2_b.y_cor
   mov di,offset brick.y_cor
   call to_brick

   mov si,offset B_2_b.color
   mov di,offset brick.color
   call to_brick

   mov si,offset B_2_b.hits
   mov di,offset brick.hits
   call to_brick
   call makingBrick

   mov si,offset B_2_c.x_cor
   mov di,offset brick.x_cor
   call to_brick

   mov si,offset B_2_c.y_cor
   mov di,offset brick.y_cor
   call to_brick

   mov si,offset B_2_c.color
   mov di,offset brick.color
   call to_brick

   mov si,offset B_2_c.hits
   mov di,offset brick.hits
   call to_brick

   call makingBrick 

   mov si,offset B_2_d.x_cor
   mov di,offset brick.x_cor
   call to_brick

   mov si,offset B_2_d.y_cor
   mov di,offset brick.y_cor
   call to_brick

   mov si,offset B_2_d.color
   mov di,offset brick.color
   call to_brick

   mov si,offset B_2_d.hits
   mov di,offset brick.hits
   call to_brick
   call makingBrick

   mov si,offset B_2_e.x_cor
   mov di,offset brick.x_cor
   call to_brick

   mov si,offset B_2_e.y_cor
   mov di,offset brick.y_cor
   call to_brick

   mov si,offset B_2_e.color
   mov di,offset brick.color
   call to_brick

   mov si,offset B_2_e.hits
   mov di,offset brick.hits
   call to_brick
   call makingBrick

   mov si,offset B_2_f.x_cor
   mov di,offset brick.x_cor
   call to_brick

   mov si,offset B_2_f.y_cor
   mov di,offset brick.y_cor
   call to_brick

   mov si,offset B_2_f.color
   mov di,offset brick.color
   call to_brick

   mov si,offset B_2_f.hits
   mov di,offset brick.hits
   call to_brick
   call makingBrick


   ret

Level_2_Bricks ENDP

Level_3_Bricks PROC


   mov si,offset B_3_a.x_cor
   mov di,offset brick.x_cor
   call to_brick

   mov si,offset B_3_a.y_cor
   mov di,offset brick.y_cor
   call to_brick

   mov si,offset B_3_a.color
   mov di,offset brick.color
   call to_brick

   mov si,offset B_3_a.hits
   mov di,offset brick.hits
   call to_brick

   call makingBrick 

   mov si,offset B_3_b.x_cor
   mov di,offset brick.x_cor
   call to_brick

   mov si,offset B_3_b.y_cor
   mov di,offset brick.y_cor
   call to_brick

   mov si,offset B_3_b.color
   mov di,offset brick.color
   call to_brick

   mov si,offset B_3_b.hits
   mov di,offset brick.hits
   call to_brick
   call makingBrick

   mov si,offset B_3_c.x_cor
   mov di,offset brick.x_cor
   call to_brick

   mov si,offset B_3_c.y_cor
   mov di,offset brick.y_cor
   call to_brick

   mov si,offset B_3_c.color
   mov di,offset brick.color
   call to_brick

   mov si,offset B_3_c.hits
   mov di,offset brick.hits
   call to_brick

   call makingBrick 

   mov si,offset B_3_d.x_cor
   mov di,offset brick.x_cor
   call to_brick

   mov si,offset B_3_d.y_cor
   mov di,offset brick.y_cor
   call to_brick

   mov si,offset B_3_d.color
   mov di,offset brick.color
   call to_brick

   mov si,offset B_3_d.hits
   mov di,offset brick.hits
   call to_brick

   call makingBrick

   mov si,offset B_3_e.x_cor
   mov di,offset brick.x_cor
   call to_brick

   mov si,offset B_3_e.y_cor
   mov di,offset brick.y_cor
   call to_brick

   mov si,offset B_3_e.color
   mov di,offset brick.color
   call to_brick

   mov si,offset B_3_e.hits
   mov di,offset brick.hits
   call to_brick
   call makingBrick


   mov si,offset B_3_f.x_cor
   mov di,offset brick.x_cor
   call to_brick

   mov si,offset B_3_f.y_cor
   mov di,offset brick.y_cor
   call to_brick

   mov si,offset B_3_f.color
   mov di,offset brick.color
   call to_brick

   mov si,offset B_3_f.hits
   mov di,offset brick.hits
   call to_brick
   call makingBrick

   ret

Level_3_Bricks ENDP

to_brick PROC

   mov cx,6
   L1:
      mov ax,[si]
      mov [di],ax
      add si,type Bricks 
      add di,type Bricks
   loop L1
   
   ret
to_brick ENDP

MakingBrick PROC 
   mov cx,6
   mov di,0
   Ln:
      
      push cx
      mov ax,(Bricks ptr brick[di]).color
      mov colour, ax
      mov ax,(Bricks ptr brick[di]).x_cor
      mov bx,(Bricks ptr brick[di]).y_cor
      call drawbrick
      add di,type Bricks

       pop cx 
   loop Ln

    ret 
MakingBrick ENDP

drawbrick proc USES di si ax bx cx dx

   mov di, bx 
   mov cx, 10 

   l3:
   push cx
   mov cx,20
   mov si,ax
   push ax
      loop2:
      push cx

         mov ax,colour
         mov ah, 0ch ; draw pixel
         mov bh, 0
         mov cx, si
         mov dx, di
         int 10h
         inc si
      pop cx
      loop loop2
   pop ax
   inc di
   pop cx

   loop l3

   ret 
drawbrick endp

   ; -----------------------------------------------------------------
   ; -----------------------------------------------------------------
   ;                          Collision functions
   ; -----------------------------------------------------------------
   ; -----------------------------------------------------------------

paddle_collision PROC

   mov ax,Paddle_y
   sub ax,10
   .if(BBorg_y>=ax)
      mov ax,Paddle_x
      mov bx,ax
      sub ax,2
      add bx,P_length
      add bx,2
      .if(BBorg_x>=ax && BBorg_x<=bx)
            neg By_speed
      .endif

   .endif
   ret

paddle_collision ENDP

l1_col_left PROC uses ax bx cx dx si di

   mov di,0
   mov cx,6
   Lnn:
      ;brickless area
      mov ax,(Bricks ptr B_1_a[di]).color
      cmp ax,0
      JE nocolli
      ;match x_cor
      mov ax,(Bricks ptr B_1_a[di]).x_cor
      sub ax,5
      cmp BBorg_x,ax
      JL nocolli
      add ax,25
      cmp BBorg_x,ax
      JG nocolli
      ;match y_cor
      mov ax,(Bricks ptr B_1_a[di]).y_cor
      sub ax,5
      cmp BBorg_y,ax
      JL nocolli
      add ax,15
      cmp BBorg_y,ax
      JG nocolli
      ;collision filtered
      sub (Bricks ptr B_1_a[di]).hits,1
      mov ax,(Bricks ptr B_1_a[di]).hits
      neg Bx_speed
      .if(ax<=0)
      mov (Bricks ptr B_1_a[di]).color,0
      .endif
      inc Scores
      ret
      nocolli:
 
      add di,type Bricks

   loop Lnn

   mov di,0
   mov cx,6
   Lnp:
      ;brickless area
      mov ax,(Bricks ptr B_1_b[di]).color
      cmp ax,0
      JE nocoll
      ;match x_cor
      mov ax,(Bricks ptr B_1_b[di]).x_cor
      sub ax,5
      cmp BBorg_x,ax
      JL nocoll
      add ax,25
      cmp BBorg_x,ax
      JG nocoll
      ;match y_cor
      mov ax,(Bricks ptr B_1_b[di]).y_cor
      sub ax,5
      cmp BBorg_y,ax
      JL nocoll
      add ax,15
      cmp BBorg_y,ax
      JG nocoll
      ;collision filtered
      sub (Bricks ptr B_1_b[di]).hits,1
      mov ax,(Bricks ptr B_1_b[di]).hits
      neg Bx_speed
      .if(ax<=0)
      mov (Bricks ptr B_1_b[di]).color,0
      .endif
      inc Scores
      ret
      nocoll:
 
      add di,type Bricks

   loop Lnp

   mov di,0
   mov cx,6
   Let:
      ;brickless area
      mov ax,(Bricks ptr B_1_c[di]).color
      cmp ax,0
      JE nocol
      ;match x_cor
      mov ax,(Bricks ptr B_1_c[di]).x_cor
      sub ax,5
      cmp BBorg_x,ax
      JL nocol
      add ax,25
      cmp BBorg_x,ax
      JG nocol
      ;match y_cor
      mov ax,(Bricks ptr B_1_c[di]).y_cor
      sub ax,5
      cmp BBorg_y,ax
      JL nocol
      add ax,15
      cmp BBorg_y,ax
      JG nocol
      ;collision filtered
      sub (Bricks ptr B_1_c[di]).hits,1
      mov ax,(Bricks ptr B_1_c[di]).hits
      neg Bx_speed
      .if(ax<=0)
      mov (Bricks ptr B_1_c[di]).color,0
      .endif
      inc Scores
      ret
      nocol:
 
      add di,type Bricks

   loop Let

   mov di,0
   mov cx,6
   Lte:
      ;brickless area
      mov ax,(Bricks ptr B_1_d[di]).color
      cmp ax,0
      JE noco
      ;match x_cor
      mov ax,(Bricks ptr B_1_d[di]).x_cor
      sub ax,5
      cmp BBorg_x,ax
      JL noco
      add ax,25
      cmp BBorg_x,ax
      JG noco
      ;match y_cor
      mov ax,(Bricks ptr B_1_d[di]).y_cor
      sub ax,5
      cmp BBorg_y,ax
      JL noco
      add ax,15
      cmp BBorg_y,ax
      JG noco
      ;collision filtered
      sub (Bricks ptr B_1_d[di]).hits,1
      mov ax,(Bricks ptr B_1_d[di]).hits
      neg Bx_speed
      .if(ax<=0)
      mov (Bricks ptr B_1_d[di]).color,0
      .endif
      inc Scores
      ret
      noco:
 
      add di,type Bricks

   loop Lte
   ret  

l1_col_left ENDP

l2_col_left PROC uses ax bx cx dx si di

   mov di,0
   mov cx,6
   Lnn:
      ;brickless area
      mov ax,(Bricks ptr B_2_a[di]).color
      cmp ax,0
      JE nocolli
      ;match x_cor
      mov ax,(Bricks ptr B_2_a[di]).x_cor
      sub ax,5
      cmp BBorg_x,ax
      JL nocolli
      add ax,25
      cmp BBorg_x,ax
      JG nocolli
      ;match y_cor
      mov ax,(Bricks ptr B_2_a[di]).y_cor
      sub ax,5
      cmp BBorg_y,ax
      JL nocolli
      add ax,15
      cmp BBorg_y,ax
      JG nocolli
      ;collision filtered
      sub (Bricks ptr B_2_a[di]).hits,1
      mov ax,(Bricks ptr B_2_a[di]).hits
      neg Bx_speed
      .if(ax<=0)
      mov (Bricks ptr B_2_a[di]).color,0
      .endif
      inc Scores
      ret
      nocolli:
 
      add di,type Bricks

   loop Lnn

   mov di,0
   mov cx,6
   Lnp:
      ;brickless area
      mov ax,(Bricks ptr B_2_b[di]).color
      cmp ax,0
      JE nocoll
      ;match x_cor
      mov ax,(Bricks ptr B_2_b[di]).x_cor
      sub ax,5
      cmp BBorg_x,ax
      JL nocoll
      add ax,25
      cmp BBorg_x,ax
      JG nocoll
      ;match y_cor
      mov ax,(Bricks ptr B_2_b[di]).y_cor
      sub ax,5
      cmp BBorg_y,ax
      JL nocoll
      add ax,15
      cmp BBorg_y,ax
      JG nocoll
      ;collision filtered
      sub (Bricks ptr B_2_b[di]).hits,1
      mov ax,(Bricks ptr B_2_b[di]).hits
      neg Bx_speed
      .if(ax<=0)
      mov (Bricks ptr B_2_b[di]).color,0
      .endif
      inc Scores
      ret
      nocoll:
 
      add di,type Bricks

   loop Lnp

   mov di,0
   mov cx,6
   Let:
      ;brickless area
      mov ax,(Bricks ptr B_2_c[di]).color
      cmp ax,0
      JE nocol
      ;match x_cor
      mov ax,(Bricks ptr B_2_c[di]).x_cor
      sub ax,5
      cmp BBorg_x,ax
      JL nocol
      add ax,25
      cmp BBorg_x,ax
      JG nocol
      ;match y_cor
      mov ax,(Bricks ptr B_2_c[di]).y_cor
      sub ax,5
      cmp BBorg_y,ax
      JL nocol
      add ax,15
      cmp BBorg_y,ax
      JG nocol
      ;collision filtered
      sub (Bricks ptr B_2_c[di]).hits,1
      mov ax,(Bricks ptr B_2_c[di]).hits
      neg Bx_speed
      .if(ax<=0)
      mov (Bricks ptr B_2_c[di]).color,0
      .endif
      inc Scores
      ret
      nocol:
 
      add di,type Bricks

   loop Let

   mov di,0
   mov cx,6
   Lte:
      ;brickless area
      mov ax,(Bricks ptr B_2_d[di]).color
      cmp ax,0
      JE noco
      ;match x_cor
      mov ax,(Bricks ptr B_2_d[di]).x_cor
      sub ax,5
      cmp BBorg_x,ax
      JL noco
      add ax,25
      cmp BBorg_x,ax
      JG noco
      ;match y_cor
      mov ax,(Bricks ptr B_2_d[di]).y_cor
      sub ax,5
      cmp BBorg_y,ax
      JL noco
      add ax,15
      cmp BBorg_y,ax
      JG noco
      ;collision filtered
      sub (Bricks ptr B_2_d[di]).hits,1
      mov ax,(Bricks ptr B_2_d[di]).hits
      neg Bx_speed
      .if(ax<=0)
      mov (Bricks ptr B_2_d[di]).color,0
      .endif
      inc Scores
      ret
      noco:
 
      add di,type Bricks

   loop Lte

   mov di,0
   mov cx,6
   Lep:
      ;brickless area
      mov ax,(Bricks ptr B_2_e[di]).color
      cmp ax,0
      JE noc
      ;match x_cor
      mov ax,(Bricks ptr B_2_e[di]).x_cor
      sub ax,5
      cmp BBorg_x,ax
      JL noc
      add ax,25
      cmp BBorg_x,ax
      JG noc
      ;match y_cor
      mov ax,(Bricks ptr B_2_e[di]).y_cor
      sub ax,5
      cmp BBorg_y,ax
      JL noc
      add ax,15
      cmp BBorg_y,ax
      JG noc
      ;collision filtered
      sub (Bricks ptr B_2_e[di]).hits,1
      mov ax,(Bricks ptr B_2_e[di]).hits
      neg Bx_speed
      .if(ax<=0)
      mov (Bricks ptr B_2_e[di]).color,0
      .endif
      .if(ax==1)
      mov (Bricks ptr B_2_e[di]).color,43
      .endif
      inc Scores
      ret
      noc:
 
      add di,type Bricks

   loop Lep
    mov di,0
   mov cx,6
   Lec:
      ;brickless area
      mov ax,(Bricks ptr B_2_f[di]).color
      cmp ax,0
      JE no
      ;match x_cor
      mov ax,(Bricks ptr B_2_f[di]).x_cor
      sub ax,5
      cmp BBorg_x,ax
      JL no
      add ax,25
      cmp BBorg_x,ax
      JG no
      ;match y_cor
      mov ax,(Bricks ptr B_2_f[di]).y_cor
      sub ax,5
      cmp BBorg_y,ax
      JL no
      add ax,15
      cmp BBorg_y,ax
      JG no
      ;collision filtered
      sub (Bricks ptr B_2_f[di]).hits,1
      mov ax,(Bricks ptr B_2_f[di]).hits
      neg Bx_speed
      .if(ax<=0)
      mov (Bricks ptr B_2_f[di]).color,0
      .endif
      .if(ax==1)
      mov (Bricks ptr B_2_f[di]).color,34
      .endif
      inc Scores
      ret
      no:
 
      add di,type Bricks

   loop Lec
   ret  

l2_col_left ENDP

l3_col_left PROC uses ax bx cx dx si di

   mov di,0
   mov cx,6
   Lnn:
      ;brickless area
      mov ax,(Bricks ptr B_3_a[di]).color
      cmp ax,0
      JE nocolli
      ;match x_cor
      mov ax,(Bricks ptr B_3_a[di]).x_cor
      sub ax,5
      cmp BBorg_x,ax
      JL nocolli
      add ax,25
      cmp BBorg_x,ax
      JG nocolli
      ;match y_cor
      mov ax,(Bricks ptr B_3_a[di]).y_cor
      sub ax,5
      cmp BBorg_y,ax
      JL nocolli
      add ax,15
      cmp BBorg_y,ax
      JG nocolli
      ;collision filtered
      sub (Bricks ptr B_3_a[di]).hits,1
      mov ax,(Bricks ptr B_3_a[di]).hits
      neg Bx_speed
      .if(ax<=0)
      mov (Bricks ptr B_3_a[di]).color,0
      .endif
      inc Scores
      ret
      nocolli:
 
      add di,type Bricks

   loop Lnn

   mov di,0
   mov cx,6
   Lnp:
      ;brickless area
      mov ax,(Bricks ptr B_3_b[di]).color
      cmp ax,0
      JE nocoll
      ;match x_cor
      mov ax,(Bricks ptr B_3_b[di]).x_cor
      sub ax,5
      cmp BBorg_x,ax
      JL nocoll
      add ax,25
      cmp BBorg_x,ax
      JG nocoll
      ;match y_cor
      mov ax,(Bricks ptr B_3_b[di]).y_cor
      sub ax,5
      cmp BBorg_y,ax
      JL nocoll
      add ax,15
      cmp BBorg_y,ax
      JG nocoll
      ;collision filtered
      sub (Bricks ptr B_3_b[di]).hits,1
      mov ax,(Bricks ptr B_3_b[di]).hits
      neg Bx_speed
      .if(ax<=0)
      mov (Bricks ptr B_3_b[di]).color,0
      .endif
      .if(ax==1)
      mov (Bricks ptr B_3_b[di]).color,43
      .endif
      inc Scores
      ret
      nocoll:
 
      add di,type Bricks

   loop Lnp

   mov di,0
   mov cx,6
   Let:
      ;brickless area
      mov ax,(Bricks ptr B_3_c[di]).color
      cmp ax,0
      JE nocol
      ;match x_cor
      mov ax,(Bricks ptr B_3_c[di]).x_cor
      sub ax,5
      cmp BBorg_x,ax
      JL nocol
      add ax,25
      cmp BBorg_x,ax
      JG nocol
      ;match y_cor
      mov ax,(Bricks ptr B_3_c[di]).y_cor
      sub ax,5
      cmp BBorg_y,ax
      JL nocol
      add ax,15
      cmp BBorg_y,ax
      JG nocol
      ;collision filtered
      sub (Bricks ptr B_3_c[di]).hits,1
      mov ax,(Bricks ptr B_3_c[di]).hits
      neg Bx_speed
      .if(ax<=0)
      mov (Bricks ptr B_3_c[di]).color,0
      .endif
      inc Scores
      ret
      nocol:
 
      add di,type Bricks

   loop Let

   mov di,0
   mov cx,6
   Lte:
      ;brickless area
      mov ax,(Bricks ptr B_3_d[di]).color
      cmp ax,0
      JE noco
      ;match x_cor
      mov ax,(Bricks ptr B_3_d[di]).x_cor
      sub ax,5
      cmp BBorg_x,ax
      JL noco
      add ax,25
      cmp BBorg_x,ax
      JG noco
      ;match y_cor
      mov ax,(Bricks ptr B_3_d[di]).y_cor
      sub ax,5
      cmp BBorg_y,ax
      JL noco
      add ax,15
      cmp BBorg_y,ax
      JG noco
      ;collision filtered
      sub (Bricks ptr B_3_d[di]).hits,1
      mov ax,(Bricks ptr B_3_d[di]).hits
      neg Bx_speed
      .if(ax<=0)
      mov (Bricks ptr B_3_d[di]).color,0
      .endif
      .if(ax==1)
      mov (Bricks ptr B_3_d[di]).color,34
      .endif
      inc Scores
      ret
      noco:
 
      add di,type Bricks

   loop Lte

   mov di,0
   mov cx,6
   Lep:
      ;brickless area
      mov ax,(Bricks ptr B_3_e[di]).color
      cmp ax,0
      JE noc
      ;match x_cor
      mov ax,(Bricks ptr B_3_e[di]).x_cor
      sub ax,5
      cmp BBorg_x,ax
      JL noc
      add ax,25
      cmp BBorg_x,ax
      JG noc
      ;match y_cor
      mov ax,(Bricks ptr B_3_e[di]).y_cor
      sub ax,5
      cmp BBorg_y,ax
      JL noc
      add ax,15
      cmp BBorg_y,ax
      JG noc
      ;collision filtered
      sub (Bricks ptr B_3_e[di]).hits,1
      mov ax,(Bricks ptr B_3_e[di]).hits
      neg Bx_speed
      .if(ax<=0)
      mov (Bricks ptr B_3_e[di]).color,0
      .endif
      .if(ax==1)
      mov (Bricks ptr B_3_e[di]).color,43
      .endif
      .if(ax==2)
      mov (Bricks ptr B_3_e[di]).color,55h
      .endif
      inc Scores
      ret
      noc:
 
      add di,type Bricks

   loop Lep
    mov di,0
   mov cx,6
   Lec:
      ;brickless area
      mov ax,(Bricks ptr B_3_f[di]).color
      cmp ax,0
      JE no
      ;match x_cor
      mov ax,(Bricks ptr B_3_f[di]).x_cor
      sub ax,5
      cmp BBorg_x,ax
      JL no
      add ax,25
      cmp BBorg_x,ax
      JG no
      ;match y_cor
      mov ax,(Bricks ptr B_3_f[di]).y_cor
      sub ax,5
      cmp BBorg_y,ax
      JL no
      add ax,15
      cmp BBorg_y,ax
      JG no
      ;collision filtered
      neg Bx_speed      
      ret
      no:
 
      add di,type Bricks

   loop Lec
   ret  

l3_col_left ENDP

l1_col_b PROC uses ax bx si di cx

   mov di,0
   mov cx,6
   Lnn:
      ;brickless area
      mov ax,(Bricks ptr B_1_a[di]).color
      cmp ax,0
      JE nocolli
      ;match y_cor
      mov ax,(Bricks ptr B_1_a[di]).y_cor
      sub ax,5
      cmp BBorg_y,ax
      JL nocolli
      add ax,20
      cmp BBorg_y,ax
      JG nocolli
      ;match x_cor
      mov ax,(Bricks ptr B_1_a[di]).x_cor
      sub ax,5
      cmp BBorg_x,ax
      JL nocolli
      add ax,30
      cmp BBorg_x,ax
      JG nocolli
      ;collision filtered
      sub (Bricks ptr B_1_a[di]).hits,1
      mov ax,(Bricks ptr B_1_a[di]).hits
      neg By_speed
      .if(ax<=0)
      mov (Bricks ptr B_1_a[di]).color,0
      .endif
      inc Scores
      ret

      nocolli:
      add di,type Bricks
   loop Lnn

    mov di,0
   mov cx,6
   Lne:
      ;brickless area
      mov ax,(Bricks ptr B_1_b[di]).color
      cmp ax,0
      JE nocoll
      ;match y_cor
      mov ax,(Bricks ptr B_1_b[di]).y_cor
      sub ax,5
      cmp BBorg_y,ax
      JL nocoll
      add ax,20
      cmp BBorg_y,ax
      JG nocoll
      ;match x_cor
      mov ax,(Bricks ptr B_1_b[di]).x_cor
      sub ax,5
      cmp BBorg_x,ax
      JL nocoll
      add ax,30
      cmp BBorg_x,ax
      JG nocoll
      ;collision filtered
      sub (Bricks ptr B_1_b[di]).hits,1
      mov ax,(Bricks ptr B_1_b[di]).hits
      neg By_speed
      .if(ax<=0)
      mov (Bricks ptr B_1_b[di]).color,0
      .endif
      inc Scores
      ret

      nocoll:
      add di,type Bricks
   loop Lne

   mov di,0
   mov cx,6
   Let:
      ;brickless area
      mov ax,(Bricks ptr B_1_c[di]).color
      cmp ax,0
      JE nocol
      ;match y_cor
      mov ax,(Bricks ptr B_1_c[di]).y_cor
      sub ax,5
      cmp BBorg_y,ax
      JL nocol
      add ax,20
      cmp BBorg_y,ax
      JG nocol
      ;match x_cor
      mov ax,(Bricks ptr B_1_c[di]).x_cor
      sub ax,5
      cmp BBorg_x,ax
      JL nocol
      add ax,30
      cmp BBorg_x,ax
      JG nocol
      ;collision filtered
      sub (Bricks ptr B_1_c[di]).hits,1
      mov ax,(Bricks ptr B_1_c[di]).hits
      neg By_speed
      .if(ax<=0)
      mov (Bricks ptr B_1_c[di]).color,0
      .endif
      inc Scores
      ret

      nocol:
      add di,type Bricks
   loop Let

   mov di,0
   mov cx,6
   Lnp:
      ;brickless area
      mov ax,(Bricks ptr B_1_d[di]).color
      cmp ax,0
      JE noco
      ;match y_cor
      mov ax,(Bricks ptr B_1_d[di]).y_cor
      sub ax,5
      cmp BBorg_y,ax
      JL noco
      add ax,20
      cmp BBorg_y,ax
      JG noco
      ;match x_cor
      mov ax,(Bricks ptr B_1_d[di]).x_cor
      sub ax,5
      cmp BBorg_x,ax
      JL noco
      add ax,30
      cmp BBorg_x,ax
      JG noco
      ;collision filtered
      sub (Bricks ptr B_1_d[di]).hits,1
      mov ax,(Bricks ptr B_1_d[di]).hits
      neg By_speed
      .if(ax<=0)
      mov (Bricks ptr B_1_d[di]).color,0
      .endif
      inc Scores
      ret

      noco:
      add di,type Bricks
   loop Lnp
   ret  

l1_col_b ENDP

l2_col_b PROC uses ax bx si di cx

   mov di,0
   mov cx,6
   Lnn:
      ;brickless area
      mov ax,(Bricks ptr B_2_a[di]).color
      cmp ax,0
      JE nocolli
      ;match y_cor
      mov ax,(Bricks ptr B_2_a[di]).y_cor
      sub ax,5
      cmp BBorg_y,ax
      JL nocolli
      add ax,20
      cmp BBorg_y,ax
      JG nocolli
      ;match x_cor
      mov ax,(Bricks ptr B_2_a[di]).x_cor
      sub ax,5
      cmp BBorg_x,ax
      JL nocolli
      add ax,30
      cmp BBorg_x,ax
      JG nocolli
      ;collision filtered
      sub (Bricks ptr B_2_a[di]).hits,1
      mov ax,(Bricks ptr B_2_a[di]).hits
      neg By_speed
      .if(ax<=0)
      mov (Bricks ptr B_2_a[di]).color,0
      .endif
      inc Scores
      ret

      nocolli:
      add di,type Bricks
   loop Lnn

    mov di,0
   mov cx,6
   Lne:
      ;brickless area
      mov ax,(Bricks ptr B_2_b[di]).color
      cmp ax,0
      JE nocoll
      ;match y_cor
      mov ax,(Bricks ptr B_2_b[di]).y_cor
      sub ax,5
      cmp BBorg_y,ax
      JL nocoll
      add ax,20
      cmp BBorg_y,ax
      JG nocoll
      ;match x_cor
      mov ax,(Bricks ptr B_2_b[di]).x_cor
      sub ax,5
      cmp BBorg_x,ax
      JL nocoll
      add ax,30
      cmp BBorg_x,ax
      JG nocoll
      ;collision filtered
      sub (Bricks ptr B_2_b[di]).hits,1
      mov ax,(Bricks ptr B_2_b[di]).hits
      neg By_speed
      .if(ax<=0)
      mov (Bricks ptr B_2_b[di]).color,0
      .endif
      inc Scores
      ret

      nocoll:
      add di,type Bricks
   loop Lne

   mov di,0
   mov cx,6
   Let:
      ;brickless area
      mov ax,(Bricks ptr B_2_c[di]).color
      cmp ax,0
      JE nocol
      ;match y_cor
      mov ax,(Bricks ptr B_2_c[di]).y_cor
      sub ax,5
      cmp BBorg_y,ax
      JL nocol
      add ax,20
      cmp BBorg_y,ax
      JG nocol
      ;match x_cor
      mov ax,(Bricks ptr B_2_c[di]).x_cor
      sub ax,5
      cmp BBorg_x,ax
      JL nocol
      add ax,30
      cmp BBorg_x,ax
      JG nocol
      ;collision filtered
      sub (Bricks ptr B_2_c[di]).hits,1
      mov ax,(Bricks ptr B_2_c[di]).hits
      neg By_speed
      .if(ax<=0)
      mov (Bricks ptr B_2_c[di]).color,0
      .endif
      inc Scores
      ret

      nocol:
      add di,type Bricks
   loop Let

   mov di,0
   mov cx,6
   Lnp:
      ;brickless area
      mov ax,(Bricks ptr B_2_d[di]).color
      cmp ax,0
      JE noco
      ;match y_cor
      mov ax,(Bricks ptr B_2_d[di]).y_cor
      sub ax,5
      cmp BBorg_y,ax
      JL noco
      add ax,20
      cmp BBorg_y,ax
      JG noco
      ;match x_cor
      mov ax,(Bricks ptr B_2_d[di]).x_cor
      sub ax,5
      cmp BBorg_x,ax
      JL noco
      add ax,30
      cmp BBorg_x,ax
      JG noco
      ;collision filtered
      sub (Bricks ptr B_2_d[di]).hits,1
      mov ax,(Bricks ptr B_2_d[di]).hits
      neg By_speed
      .if(ax<=0)
      mov (Bricks ptr B_2_d[di]).color,0
      .endif
      inc Scores
      ret

      noco:
      add di,type Bricks
   loop Lnp

   mov di,0
   mov cx,6
   Lek:
      ;brickless area
      mov ax,(Bricks ptr B_2_e[di]).color
      cmp ax,0
      JE noc
      ;match y_cor
      mov ax,(Bricks ptr B_2_e[di]).y_cor
      sub ax,5
      cmp BBorg_y,ax
      JL noc
      add ax,20
      cmp BBorg_y,ax
      JG noc
      ;match x_cor
      mov ax,(Bricks ptr B_2_e[di]).x_cor
      sub ax,5
      cmp BBorg_x,ax
      JL noc
      add ax,30
      cmp BBorg_x,ax
      JG noc
      ;collision filtered
      sub (Bricks ptr B_2_e[di]).hits,1
      mov ax,(Bricks ptr B_2_e[di]).hits
      neg By_speed
      .if(ax<=0)
      mov (Bricks ptr B_2_e[di]).color,0
      .endif
      .if(ax==1)
      mov (Bricks ptr B_2_e[di]).color,34
      .endif
      inc Scores
      ret

      noc:
      add di,type Bricks
   loop Lek

   mov di,0
   mov cx,6
   Lec:
      ;brickless area
      mov ax,(Bricks ptr B_2_f[di]).color
      cmp ax,0
      JE no
      ;match y_cor
      mov ax,(Bricks ptr B_2_f[di]).y_cor
      sub ax,5
      cmp BBorg_y,ax
      JL no
      add ax,20
      cmp BBorg_y,ax
      JG no
      ;match x_cor
      mov ax,(Bricks ptr B_2_f[di]).x_cor
      sub ax,5
      cmp BBorg_x,ax
      JL no
      add ax,30
      cmp BBorg_x,ax
      JG no
      ;collision filtered
      sub (Bricks ptr B_2_f[di]).hits,1
      mov ax,(Bricks ptr B_2_f[di]).hits
      neg By_speed
      .if(ax<=0)
      mov (Bricks ptr B_2_f[di]).color,0
      .endif
      .if(ax==1)
      mov (Bricks ptr B_2_f[di]).color,43
      .endif
      inc Scores
      ret

      no:
      add di,type Bricks
   loop Lec
   ret  

l2_col_b ENDP

l3_col_b PROC uses ax bx si di cx

   mov di,0
   mov cx,6
   Lnn:
      ;brickless area
      mov ax,(Bricks ptr B_3_a[di]).color
      cmp ax,0
      JE nocolli
      ;match y_cor
      mov ax,(Bricks ptr B_3_a[di]).y_cor
      sub ax,5
      cmp BBorg_y,ax
      JL nocolli
      add ax,20
      cmp BBorg_y,ax
      JG nocolli
      ;match x_cor
      mov ax,(Bricks ptr B_3_a[di]).x_cor
      sub ax,5
      cmp BBorg_x,ax
      JL nocolli
      add ax,30
      cmp BBorg_x,ax
      JG nocolli
      ;collision filtered
      sub (Bricks ptr B_3_a[di]).hits,1
      mov ax,(Bricks ptr B_3_a[di]).hits
      neg By_speed
      .if(ax<=0)
      mov (Bricks ptr B_3_a[di]).color,0
      .endif
      inc Scores
      ret

      nocolli:
      add di,type Bricks
   loop Lnn

    mov di,0
   mov cx,6
   Lne:
      ;brickless area
      mov ax,(Bricks ptr B_3_b[di]).color
      cmp ax,0
      JE nocoll
      ;match y_cor
      mov ax,(Bricks ptr B_3_b[di]).y_cor
      sub ax,5
      cmp BBorg_y,ax
      JL nocoll
      add ax,20
      cmp BBorg_y,ax
      JG nocoll
      ;match x_cor
      mov ax,(Bricks ptr B_3_b[di]).x_cor
      sub ax,5
      cmp BBorg_x,ax
      JL nocoll
      add ax,30
      cmp BBorg_x,ax
      JG nocoll
      ;collision filtered
      sub (Bricks ptr B_3_b[di]).hits,1
      mov ax,(Bricks ptr B_3_b[di]).hits
      neg By_speed
      .if(ax<=0)
      mov (Bricks ptr B_3_b[di]).color,0
      .endif
      .if(ax==1)
      mov (Bricks ptr B_3_b[di]).color,43
      .endif
      inc Scores
      ret

      nocoll:
      add di,type Bricks
   loop Lne

   mov di,0
   mov cx,6
   Let:
      ;brickless area
      mov ax,(Bricks ptr B_3_c[di]).color
      cmp ax,0
      JE nocol
      ;match y_cor
      mov ax,(Bricks ptr B_3_c[di]).y_cor
      sub ax,5
      cmp BBorg_y,ax
      JL nocol
      add ax,20
      cmp BBorg_y,ax
      JG nocol
      ;match x_cor
      mov ax,(Bricks ptr B_3_c[di]).x_cor
      sub ax,5
      cmp BBorg_x,ax
      JL nocol
      add ax,30
      cmp BBorg_x,ax
      JG nocol
      ;collision filtered
      sub (Bricks ptr B_3_c[di]).hits,1
      mov ax,(Bricks ptr B_3_c[di]).hits
      neg By_speed
      .if(ax<=0)
      mov (Bricks ptr B_3_c[di]).color,0
      .endif
      inc Scores
      ret

      nocol:
      add di,type Bricks
   loop Let

   mov di,0
   mov cx,6
   Lnp:
      ;brickless area
      mov ax,(Bricks ptr B_3_d[di]).color
      cmp ax,0
      JE noco
      ;match y_cor
      mov ax,(Bricks ptr B_3_d[di]).y_cor
      sub ax,5
      cmp BBorg_y,ax
      JL noco
      add ax,20
      cmp BBorg_y,ax
      JG noco
      ;match x_cor
      mov ax,(Bricks ptr B_3_d[di]).x_cor
      sub ax,5
      cmp BBorg_x,ax
      JL noco
      add ax,30
      cmp BBorg_x,ax
      JG noco
      ;collision filtered
      sub (Bricks ptr B_3_d[di]).hits,1
      mov ax,(Bricks ptr B_3_d[di]).hits
      neg By_speed
      .if(ax<=0)
      mov (Bricks ptr B_3_d[di]).color,0
      .endif
      .if(ax==1)
      mov (Bricks ptr B_3_d[di]).color,34
      .endif
      inc Scores
      ret

      noco:
      add di,type Bricks
   loop Lnp

   mov di,0
   mov cx,6
   Lek:
      ;brickless area
      mov ax,(Bricks ptr B_3_e[di]).color
      cmp ax,0
      JE noc
      ;match y_cor
      mov ax,(Bricks ptr B_3_e[di]).y_cor
      sub ax,5
      cmp BBorg_y,ax
      JL noc
      add ax,20
      cmp BBorg_y,ax
      JG noc
      ;match x_cor
      mov ax,(Bricks ptr B_3_e[di]).x_cor
      sub ax,5
      cmp BBorg_x,ax
      JL noc
      add ax,30
      cmp BBorg_x,ax
      JG noc
      ;collision filtered
      sub (Bricks ptr B_3_e[di]).hits,1
      mov ax,(Bricks ptr B_3_e[di]).hits
      neg By_speed
      .if(ax<=0)
      mov (Bricks ptr B_3_e[di]).color,0
      .endif
      .if(ax==1)
      mov (Bricks ptr B_3_e[di]).color,34
      .endif
      .if(ax==2)
      mov (Bricks ptr B_3_e[di]).color,55h
      .endif
      inc Scores
      ret

      noc:
      add di,type Bricks
   loop Lek

   mov di,0
   mov cx,6
   Lec:
      ;brickless area
      mov ax,(Bricks ptr B_3_f[di]).color
      cmp ax,0
      JE no
      ;match y_cor
      mov ax,(Bricks ptr B_3_f[di]).y_cor
      sub ax,5
      cmp BBorg_y,ax
      JL no
      add ax,20
      cmp BBorg_y,ax
      JG no
      ;match x_cor
      mov ax,(Bricks ptr B_3_f[di]).x_cor
      sub ax,5
      cmp BBorg_x,ax
      JL no
      add ax,30
      cmp BBorg_x,ax
      JG no
      ;collision filtered    
      neg By_speed
      ret

      no:
      add di,type Bricks
   loop Lec
   ret  

l3_col_b ENDP

   ; -----------------------------------------------------------------
   ; -----------------------------------------------------------------
   ;                          Graphics Functions
   ; -----------------------------------------------------------------
   ; -----------------------------------------------------------------

win_screen PROC

   call Draw_Boundary
   
   
   mov si,offset wonn
   mov cx,lengthof wonn
   mov dl,msg_x
   mov dh,msg_y
   mov color,15
   call Write_Info
   
   
   mov si,offset  Start_Button
   mov cx,lengthof  Start_Button
   mov dl, str_x
   mov dh, str_y
   mov color,15
   call Write_Info

   
   mov si,offset  Exit_Button
   mov cx,lengthof Exit_Button
   mov dl,exx_x
   mov dh,exx_y
   mov color,15
   call Write_Info
   
   ; name output 
   mov si,offset  array
   mov cx,lengthof array
   mov dl,nm_x
   mov dh,nm_y
   mov color,55h
   call Write_Info
 
   mov si,offset score_str
   mov cx,lengthof score_str
   mov dl,score_str_x
   mov dh,score_str_y
   mov color,55h
   call Write_Info
   
  mov dx,ins_y
  mov cx,ins_x
  mov color,55h
  call Draw_Button
  
  mov dx,inst1_y
  mov cx,inst1_x
  mov color,55h
  call Draw_Button
ret

win_screen ENDP

reset_game PROC

      mov paddle_lb,20
      mov paddle_rb,250
      mov level_val[0],'1'
      mov current_level,1
      mov P_length,50
      mov Bx_speed,1
      mov By_speed,2
      mov BBorg_x,50
      mov BBorg_y,100
      mov Paddle_x,100
      mov Paddle_y,170

      mov Scores,0

      mov si,offset array
      mov cx,lengthof array
      Lee:
         mov BYTE ptr [si],'$'
         inc si
      loop Lee

      mov si,offset coloor
      mov cx,lengthof coloor
      Let:
         mov BYTE ptr [si],4
         inc si
      loop Let

      mov si,offset score_str
      mov cx,lengthof score_str
      dec cx
      mov BYTE ptr[si],'0'
      inc si
      Lete:
         mov BYTE ptr [si],'$'
         inc si
      loop Lete

      mov ind,2

   ret
reset_game ENDP

Game_over PROC

   call Draw_Boundary
   
   
   mov si,offset msg
   mov cx,lengthof msg
   mov dl,msg_x
   mov dh,msg_y
   mov color,100
   call Write_Info
   
   mov si,offset msg1
   mov cx,lengthof msg1
   mov dl,msg1_x
   mov dh,msg1_y
   mov color,34
   call Write_Info
   
   mov si,offset msg2
   mov cx,lengthof msg2
   mov dl,msg2_x
   mov dh,msg2_y
   mov color,34
   call Write_Info
   
   mov si,offset msg3
   mov cx,lengthof msg3
   mov dl,msg3_x
   mov dh,msg3_y
   mov color,34
   call Write_Info
   
   mov si,offset  Start_Button
   mov cx,lengthof  Start_Button
   mov dl, str_x
   mov dh, str_y
   mov color,100
   call Write_Info

   
   mov si,offset  Exit_Button
   mov cx,lengthof Exit_Button
   mov dl,exx_x
   mov dh,exx_y
   mov color,100
   call Write_Info
   
   ; name output 
   mov si,offset  array
   mov cx,lengthof array
   mov dl,nm_x
   mov dh,nm_y
   mov color,43
   call Write_Info
 
   mov si,offset score_str
   mov cx,lengthof score_str
   mov dl,score_str_x
   mov dh,score_str_y
   mov color,43
   call Write_Info
   
   mov si,offset  level_val
   mov cx,lengthof level_val
   mov dl,level_val_x
   mov dh,level_val_y
   mov color,43
   call Write_Info
   
   
  mov dx,ins_y
  mov cx,ins_x
  mov color,105
  call Draw_Button
  
  mov dx,inst1_y
  mov cx,inst1_x
  mov color,105
  call Draw_Button
ret

Game_over ENDP


Page_1_Graphics PROC

  call Draw_Boundary

  ; Display welcome msg
  mov dl,6
  mov dh,2
  mov cx,lengthof Welcomemsg
  dec cx
  mov color,100
  mov si,offset Welcomemsg
  call Write_Info

  ;Draw Buttons
  mov dx,st_x
  mov cx,st_y
  mov color,107
  call Draw_Button

  ; Display welcome msg
  mov dl,12
  mov dh,6
  mov cx,lengthof Start_Button
  dec cx
  mov color,55h
  mov si,offset Start_Button
  call Write_Info

  mov dx,inst_x
  mov cx,inst_y
  mov color,105
  call Draw_Button

  mov dl,12
  mov dh,10
  mov cx,lengthof Inst_Button
  dec cx
  mov color,55h
  mov si,offset Inst_Button
  call Write_Info

  mov dx,hs_x
  mov cx,hs_y
  mov color,107
  call Draw_Button

  mov dl,12
  mov dh,14
  mov cx,lengthof HS_Button
  dec cx
  mov color,55h
  mov si,offset HS_Button
  call Write_Info

  mov dx,ex_x
  mov cx,ex_y
  mov color,105
  call Draw_Button

  mov dl,12
  mov dh,18
  mov cx,lengthof Exit_Button
  dec cx
  mov color,55h
  mov si,offset Exit_Button
  call Write_Info
  
  mov cx, 100
  mov dx, 130
  mov  bh, 0    ;Display page
   mov  ah, 02h  ;Set cursor position
   int  10h

   ret
Page_1_Graphics ENDP

Draw_Button PROC uses ax bx cx dx

   ; cx,y dx,x
   mov si,20
   mov bx,1
   L1:
   mov ah,0ch
   mov al,color
   int 10h

   inc dx
   inc bx
   cmp bx,15
   JNE l1

   mov bx,1
   L2:
   mov ah,0ch
   mov al,color
   int 10h

   inc cx
   inc bx
   cmp bx,180
   JNE L2

   mov bx,1
   L3:
   mov ah,0ch
   mov al,color
   int 10h

   dec dx
   inc bx
   cmp bx,15
   JNE L3

   mov bx,1
   L4:
   mov ah,0ch
   mov al,color
   int 10h

   dec cx
   inc bx
   cmp bx,180
   JNE L4

  ret

Draw_Button ENDP


page_instruction_Graphics PROC
    
  mov cx,lengthof How_to_play
   mov si,offset How_to_play
   mov dl,instmsg_x
   mov dh,instmsg_y
   mov color,100
  call Write_Info

  sub instmsg_x,8
  add instmsg_y,4
  mov color,34

  mov cx,lengthof inst1msg
   mov dl,instmsg_x
   mov dh,instmsg_y
   mov si,offset inst1msg
  call Write_Info

  add instmsg_y,2
  mov cx,lengthof inst2msg
   mov dl,instmsg_x
   mov dh,instmsg_y
   mov si,offset inst2msg
  call Write_Info

  add instmsg_y,2
  mov cx,lengthof inst3msg
   mov dl,instmsg_x
   mov dh,instmsg_y
   mov si,offset inst3msg
  call Write_Info

  add instmsg_y,2
  mov cx,lengthof inst4msg
   mov dl,instmsg_x
   mov dh,instmsg_y
   mov si,offset inst4msg
  call Write_Info

  add instmsg_x,8
  add instmsg_y,4
  mov cx,lengthof inst5msg
   mov dl,instmsg_x
   mov dh,instmsg_y
   mov si,offset inst5msg
   mov color,100
  call Write_Info

  mov instmsg_x,12
  mov instmsg_y,4

  ret
page_instruction_Graphics ENDP

Graphics PROC uses ax bx cx dx

   call Draw_Boundary

   mov ax,Scores
   mov num,ax
   call Output

   mov si,offset level_val
   mov cx,lengthof level_val
   mov dl,L_x
   mov dh,L_y
   mov color,55h

   call Write_Info

   mov si,offset array
   mov cx,lengthof array
   mov dl,N_x
   mov dh,N_y
   mov color,55h

   call Write_Info

   mov si,offset score_str
   mov cx,lengthof score_str
   mov dl,S_x
   mov dh,S_y
   mov color,55h

   call Write_Info

   mov si,offset Score
   mov cx,lengthof Score
   mov dl,Score_x
   mov dh,Score_y

   mov color,34
   call Write_Info

   mov si,offset Names
   mov cx,lengthof Names
   mov dl,Name_x
   mov dh,Name_y

   mov color,34
   call Write_Info

   mov si,offset Level
   mov cx,lengthof Level
   mov dl,Level_x
   mov dh,Level_y

   mov color,34
   call Write_Info

   mov si,offset Lives
   mov cx,lengthof Lives
   mov dl,Lives_x
   mov dh,Lives_y
   mov color,34
   call Write_Info

   mov ax,current_level
   .if(ax==1)
      call Level_1_bricks
   .elseif(ax==2)
      call Level_2_Bricks
   .elseif(ax==3)
      call Level_3_Bricks
   .endif

   mov di,0
   mov cx,3
   mov si,0
   L1:
   push cx

   mov cx,heart_x[di]
   mov dx,heart_y[di]
   mov bh,0
   mov bl,coloor[si]
   mov color,bl

   call draw_heart

   inc di
   inc di
   inc si
   pop cx
   loop L1

   ret

Graphics ENDP

draw_heart PROC uses ax bx cx dx

   mov al,color
   mov ah, 0ch ; draw pixel
   int 10h

   inc cx
   mov al,color
   mov ah, 0ch ; draw pixel
   int 10h

   dec dx
   mov al,color
   mov ah, 0ch ; draw pixel
   int 10h

   dec dx
   inc dx

   mov bx,0
   .while(bx<3)

      mov al,color
      mov ah, 0ch ; draw pixel
      int 10h

      inc dx
      inc bx
   .endw

   sub dx,bx
   inc cx
   mov bx,0
   .while(bx<4)

      mov al,color
      mov ah, 0ch ; draw pixel
      int 10h

      inc dx
      inc bx
   .endw
   sub dx,bx
   inc dx
   inc cx
   mov bx,0
   .while(bx<4)

      mov al,color
      mov ah, 0ch ; draw pixel
      int 10h

      inc dx
      inc bx
   .endw
   sub dx,bx
   inc cx
   mov bx,0
   .while(bx<4)

      mov al,color
      mov ah, 0ch ; draw pixel
      int 10h

      inc dx
      inc bx
   .endw
   sub dx,bx
   dec dx
   inc cx
   mov bx,0
   .while(bx<4)

      mov al,color
      mov ah, 0ch ; draw pixel
      int 10h

      inc dx
      inc bx
   .endw

   sub dx,bx
   inc cx
   mov bx,0
   .while(bx<3)

      mov al,color
      mov ah, 0ch ; draw pixel
      int 10h

      inc dx
      inc bx
   .endw
   
   sub dx,bx
   inc dx
   inc cx
   mov al,color
   mov ah, 0ch ; draw pixel
   int 10h
   

   ret
draw_heart ENDP

Draw_Boundary PROC

   mov cx,10
   mov dx,20
   
   mov bx,1
   L1:
   mov ah,0ch
   mov al,34
   int 10h

   add dx,4
   inc bx
   cmp bx,40
   JNE l1

   mov bx,1
   L2:
   mov ah,0ch
   mov al,34
   int 10h

   add cx,4
   inc bx
   cmp bx,75
   JNE L2

   mov bx,1
   L3:
   mov ah,0ch
   mov al,34
   int 10h

   sub dx,4
   inc bx
   cmp bx,40
   JNE L3

   

   mov bx,1
   L4:
   mov ah,0ch
   mov al,34
   int 10h

   sub cx,4
   inc bx
   cmp bx,75
   JNE L4

   ret

Draw_Boundary ENDP

Write_Info PROC 

   L1:

   mov  bh, 0    ;Display page
   mov  ah, 02h  ;Set cursor position
   int  10h

   mov  al, BYTE ptr[si]
   cmp al,'$'
   JE cont
   mov bl,color
   mov  bh, 0    ;Display page
   mov  ah, 0Eh  
   int  10h

   inc si
   inc dl

   loop L1
   cont:

   ret

Write_Info ENDP


Output Proc 

   outp:
   mov ax,num
   mov dx,0

   here:
   cmp ax,0
   je disp

   mov bl,10
   div bl

   mov dl,ah
   mov dh,0
   push dx
   mov cl,al
   mov ch,0
   mov ax,cx
   inc count
   jmp here

   disp:

   mov di,0

   contt:
   cmp count,0
   jbe ex2
   pop dx
   add dl,48

   mov BYTE ptr score_str[di],dl
   inc di

   dec count
   jmp contt
   ex2:
   ret
Output endp

   ; -----------------------------------------------------------------
   ; -----------------------------------------------------------------
   ;                          File Handling
   ; -----------------------------------------------------------------
   ; -----------------------------------------------------------------

write_file PROC
   
   mov dx,offset f1
   mov ah,3dh
   mov al,1  ;0 -> read , 1->write, 2->read/write
   int 21h
   mov handle,ax
   ;append mode
   mov bx,handle
   mov cx,0
   mov dx,0
   mov ah,42h
   mov al,2
   int 21h
   
   ;write name to file

   mov ah,40h
   mov cx,lengthof array
   mov dx,offset array
   int 21h

   ;write score to file
   mov  ah, 40h ; service to write to a file
   mov  cx, lengthof score_str  ;string length.
   mov  dx, offset score_str
   int  21h

   ;write level to file
   mov  ah, 40h ; service to write to a file
   mov  cx, lengthof level_val  ;string length.
   mov  dx, offset level_val
   int  21h

   mov  ah, 3eh          
   mov  bx, handle 
   int  21h

   ret
write_file ENDP

read_file PROC
   
   mov dx,offset f1
   mov ah,3dh
   mov al,0   ;0 -> read , 1->write, 2->read/write
   int 21h
   mov handle,ax

   mov x_v,10
   mov y_v,10

   mov cx,5
   Lee:
   push cx
   ;read
   mov ah,3fh
   mov bx,handle
   mov cx,lengthof array ; char to read from file
   mov dx,offset array
   int 21h

   mov ah,3fh
   mov bx,handle
   mov cx,lengthof score_str ; char to read from file
   mov dx,offset score_str
   int 21h

   mov ah,3fh
   mov bx,handle
   mov cx,lengthof level_val ; char to read from file
   mov dx,offset level_val
   int 21h
 
   call Display_score
   add y_v,2

   pop cx
   loop Lee

   mov  ah, 3eh          
   mov  bx, handle 
   int  21h

   ret
read_file ENDP

Display_score PROC uses ax bx cx dx si di

   mov si,offset array
   mov cx,lengthof array
   mov dl,x_v
   mov dh,y_v
   mov color,55h

   call Write_Info

   add x_v,12
   mov si,offset level_val
   mov cx,lengthof level_val
   mov dl,x_v
   mov dh,y_v
   mov color,15

   call Write_Info
   add x_v,8
   mov si,offset score_str
   mov cx,lengthof score_str
   mov dl,x_v
   mov dh,y_v
   mov color,55h

   call Write_Info

   mov x_v,10

   ret
Display_score ENDP

score_scr PROC

   call Draw_Boundary

   mov si,offset SCR
   mov cx,lengthof SCR
   mov dl,15
   mov dh,5
   mov color,100

   call Write_Info

   mov si,offset nn
   mov cx,lengthof nn
   mov dl,9
   mov dh,8
   mov color,34

   call Write_Info

   mov si,offset ll
   mov cx,lengthof ll
   mov dl,20
   mov dh,8
   mov color,34

   call Write_Info

   mov si,offset sss
   mov cx,lengthof sss
   mov dl,30
   mov dh,8
   mov color,34

   call Write_Info


   ret
score_scr ENDP

end
