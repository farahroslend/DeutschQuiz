%% Deutsch Quiz

clc
clear all
close all

%% MCQ

disp('************************* EXAM SETTINGS *****************************************') 
fprintf('\n')
fprintf('\n')

% extracting data

global raw_index deutsch english

[~,~, numberandtext] = xlsread('DeutschWortschatz.xlsx' , 'DW' , 'B2:D1001');

raw_index=numberandtext(1:end,1);
deutsch=numberandtext(1:end,2);
english=numberandtext(1:end,3);


% full plate (automatically reads from excel file the total words present)


global full_plate
TF = isstrprop(deutsch,'alpha');
for e=1:1000
 f=sum(cell2mat(TF(e,1)));
 collectf(e,:)=[f];
end
collectf=collectf<0.5;
full_plate= 1000-sum(collectf)


% ask user test length

disp('How many words do you want to be tested?')
disp('a. 50')
disp('b. 100')
disp('c. 200')
disp('d. 500')
disp('e. FULL PLATE BABY!')
fprintf('\n')
str=input('','s');

% Prep test sheet

global j
if str=='a'
    j=50; %50
    pts
elseif str=='b'
    j=100;
    pts
elseif str=='c'
    j=200;
    pts
elseif str=='d'  
     j=500;
     pts
elseif str=='e'
    j=full_plate;
    pts
end
fprintf('\n')
disp('Test begins. Select the right answer. Best of luck! :)')
fprintf('\n')
fprintf('\n')
fprintf('\n')

disp('*************************** EXAM TIME ***************************************')
fprintf('\n')
fprintf('\n')

% Conduct test

h=1;
g=1;

for p=1
    
     disp(collect_deutsch{p,1})
     
     scrambler=randperm(3)';
     options= {collect_english{j,1};collect_english{p,1};collect_english{p+1,1}};
     
A='a';
a=string(options( scrambler(1,1) , 1));
B='b';
b=string(options( scrambler(2,1) , 1));
C='c';
c=string(options( scrambler(3,1) , 1));

formatSpec=' ( %s ) %s ';
fprintf(formatSpec, A, a, B,b, C,c) 

fprintf('\n')
answer=input('');

if answer==string(collect_english{p,1})
    
    fprintf('\n')
    disp('CORRECT! :)')
    fprintf('\n')
    
   
    collect_correctG{h,1}={collect_deutsch{p,1}};
    collect_correctE{h,1}={collect_english{p,1}};
    h=h+1;
    
else 
    
    fprintf('\n')
    disp('NOPE!')
    ANSWER=string(collect_english{p,1});
    formatSpec= 'ANSWER = %s';
    fprintf(formatSpec, ANSWER)
    fprintf('\n')
    fprintf('\n')
    
    collect_wrongG{g,1}={collect_deutsch{p,1}};
    collect_wrongE{g,1}={collect_english{p,1}};
    g=g+1;
    
end
   
end


for p=2:j-1 %j-1 
    
     disp(collect_deutsch{p,1})
     
     scrambler=randperm(3)';
     options= {collect_english{p-1,1};collect_english{p,1};collect_english{p+1,1}};
     
A='a';
a=string(options( scrambler(1,1) , 1));
B='b';
b=string(options( scrambler(2,1) , 1));
C='c';
c=string(options( scrambler(3,1) , 1));

formatSpec=' ( %s ) %s ';
fprintf(formatSpec, A, a, B,b, C,c) 

fprintf('\n')
answer=input('');

if answer==string(collect_english{p,1})
    
    
    fprintf('\n')
    disp('CORRECT! :)')
    fprintf('\n')
    
    %collect_correct{h,1}={collect_deutsch{p,1}, collect_english{p,1}};
    collect_correctG{h,1}={collect_deutsch{p,1}};
    collect_correctE{h,1}={collect_english{p,1}};
    h=h+1;
    
else 
    
    fprintf('\n')
    disp('NOPE!')
    ANSWER=string(collect_english{p,1});
    formatSpec= 'ANSWER = %s';
    fprintf(formatSpec, ANSWER)
    fprintf('\n')
    fprintf('\n')
    
    %collect_wrong{g,1}={collect_deutsch{p,1}, collect_english{p,1}};
    collect_wrongG{g,1}={collect_deutsch{p,1}};
    collect_wrongE{g,1}={collect_english{p,1}};
    g=g+1;
    
    
end
    
end
    
 for p=j  %j 
    
     disp(collect_deutsch{p,1})
     
     scrambler=randperm(3)';
     options= {collect_english{p-1,1};collect_english{p,1};collect_english{1,1}};
     
A='a';
a=string(options( scrambler(1,1) , 1));
B='b';
b=string(options( scrambler(2,1) , 1));
C='c';
c=string(options( scrambler(3,1) , 1));

formatSpec=' ( %s ) %s ';
fprintf(formatSpec, A, a, B,b, C,c) 

fprintf('\n')
answer=input('');

if answer==string(collect_english{p,1})
    
    fprintf('\n')
    disp('CORRECT! :)')
    fprintf('\n')
    
    collect_correctG{h,1}={collect_deutsch{p,1}};
    collect_correctE{h,1}={collect_english{p,1}};
    
    
else 
    
    fprintf('\n')
    disp('NOPE!')
    ANSWER=string(collect_english{p,1});
    formatSpec= 'ANSWER = %s';
    fprintf(formatSpec, ANSWER)
    fprintf('\n')
    fprintf('\n')
    
    collect_wrongG{g,1}={collect_deutsch{p,1}};
    collect_wrongE{g,1}={collect_english{p,1}};
    
    
end
   
 end
 
fprintf('\n')

disp('************************* REPORT CARD *****************************************') 
fprintf('\n')
fprintf('\n')
 
% AX={'HELLO'; 'MEOW'};
% disp(AX)
 

%% Report Card

scs=size(collect_correctG);

formatSpec=' Raw score = %d / %d';
fprintf(formatSpec, scs(1,1), j )

fprintf('\n')
fprintf('\n')

score=(scs(1,1)/ j)*100;

if  score > 90
    
    disp('SEHR GUT')
    img1 = imread('keep-moving-forward.jpg');
    image(img1)
    
elseif 70 < score < 90
    
   disp('GUT')
   img2 = imread('gut.jpg');
   image(img2)

elseif score < 70
    
    disp('SOMEBODY NEEDS TO HIT THE BOOKS HARDER')
    img2 = imread('wow.jpg');
    image(img2)
end

fprintf('\n')
fprintf('\n')


%STRONG

disp('STRONG')

scs=size(collect_correctG);
 
for s=1:scs(1,1)
    
%     single_row=collect_correct(s,1);
%     
%     collect_correctG(s,1)=single_row(1,1);
%     collect_correctE(s,1)=single_row(1,2); %string function cannot read a cell with a 1x2 cell

    read_collect_correct(1,1:2)={ 'DEUTSCH', 'ENGLISH' };
    read_collect_correct(s+1,1:2)={string(collect_correctG(s,1)), string(collect_correctE(s,1)) };
    
end

disp(read_collect_correct)


%WEAK

disp('SHAKY')

sws=size(collect_wrongG);
 
for s=1:sws(1,1)
    
%     single_row=collect_correct(s,1);
%     
%     collect_correctG(s,1)=single_row(1,1);
%     collect_correctE(s,1)=single_row(1,2); %string function cannot read a cell with a 1x2 cell

    read_collect_wrong(1,1:2)={ 'DEUTSCH', 'ENGLISH' };
    read_collect_wrong(s+1,1:2)={string(collect_wrongG(s,1)), string(collect_wrongE(s,1)) };
    
end

disp(read_collect_wrong)




