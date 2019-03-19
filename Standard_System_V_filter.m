clc; clear;

data=xlsread('observations.xlsx');        %Insert data matrix 
VarName1=data(:,1);                       %Create column vectors from data
V=data(:,2);
B_V=data(:,3);
v=data(:,4);
V_v=data(:,5);
X=data(:,6);
[Names,text]=xlsread('starnames.xlsx');


%PHOTO ELECTRICAL DATA PROCESSING FOR "WHOLE SKY" PHOTOMETRY
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
format long
%Correction for Class A Atmospheric Deterioration
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
scatter(X,V_v);                            %Graph, x-axis: Χ y-axis: V-v
xlabel('Air mass X');                      
ylabel('V - v');                          
title('Aτμοσφαιρική εξασθένιση');          
hl = lsline;                               %Least Square Line
B = [ones(size(hl.XData(:))), hl.XData(:)]\hl.YData(:);
Slope = B(2);                              %Slope
Intercept = B(1);                          %Intercept
k=abs(Slope);                              
v0=v-k.*X;                                 %Corrected magnitude
fprintf('H κλίση της ευθείας (V-v)=kX+ b δηλαδή ο συντελεστής εξασθένισης k είναι %f.',k)

Dv=V-v0;                                   %V-v0
Pinakas_2=[VarName1,V,v0,Dv,B_V];          %New data matrix


%Correction for the standard system
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2)
scatter(B_V,Dv);                            
xlabel('B-V');                              
ylabel('V-v0');                             
title('Μετατροπή στο πρότυπο σύστημα');     
h2 = lsline;                                
C = [ones(size(h2.XData(:))), h2.XData(:)]\h2.YData(:);
Slope_2 = C(2);                             
Intercept_2 = C(1);                        
fprintf('\n H κλίση της ευθείας (V-v0)=ε(B-V)+ζ δηλαδή ο συντελεστής ε είναι %f.',Slope_2);
fprintf('\n H σταθερά της ευθείας (V-v0)=ε(B-V)+ζ δηλαδή η σταθερά μηδενικού σημείου ζ είναι %f. \n \n',Intercept_2)

format short

V_c=v0+Slope_2*B_V+Intercept_2;             %V standard system
Pinakas_3=[VarName1,V,v,v0,V_c,V-V_c,(V-V_c)./V];      
disp('Τελικός πίνακας');                   
disp('    star         V        v         v0       V_c      V-V_c     V-V_c/V');
disp(Pinakas_3);

diff=abs(V-V_c);         
figure(3)
histogram(diff)          
xlabel('|V-V_c|');                             
ylabel('N');                                 
title('Διαφορά μεγεθών');      


data1=xlsread('unknown.xlsx');        
B_V_un=data1(:,1);                      
v_un=data1(:,2);
X_un=data1(:,3);


v0_un=v_un-k.*X_un; 
Vc_un=v0_un+Slope_2*B_V_un+Intercept_2;
V_un=[2.87;3.87];
names=[19; 21];
Pinakas_4=[names,V_un,v_un,v0_un,Vc_un,V_un-Vc_un,(V_un-Vc_un)./V_un];     
disp('Aποτελέσματα αγνώστων αστέρων');                
disp('     star        V        v         v0        V_c     V-V_c    V-V_c/V');
disp(Pinakas_4);

format short

Vcc_un=v0_un+Intercept_2;
Pinakas_5=[names,V_un,Vc_un,Vcc_un,V_un-Vc_un,V_un-Vcc_un,(V_un-Vc_un)./V_un,(V_un-Vcc_un)./V_un ];
disp('Σύγκριση σχέσεων');                   
disp('     star      V         V_c       V_c2     V-V_c     V-V_c2    V-V_c/V  V-V_c2/V');
disp(Pinakas_5); 

%Output as .xls file
Name={'Name','a/a', 'V','v','v0','V_c','V-V_c','V-V_c/V'};  
warning( 'off', 'MATLAB:xlswrite:AddSheet' ) ;
xlswrite('myfile1.xls', Name, 'Sheet 1', 'A1');
xlswrite('myfile1.xls', Pinakas_3, 'Sheet 1', 'B2');
xlswrite('myfile1.xls', text, 'Sheet 1', 'A2');
xlswrite('myfile2.xls', Name(2:8), 'Sheet 1', 'A1');
xlswrite('myfile2.xls', Pinakas_4, 'Sheet 1', 'A2');

%Output as .txt file
AA=Pinakas_3(:,1);
starnames=text;
V=Pinakas_3(:,2);
v=Pinakas_3(:,3);
vo=Pinakas_3(:,4);
Vc=Pinakas_3(:,5);
DV=Pinakas_3(:,6);
ERR=Pinakas_3(:,7);
T1=table(AA,starnames,V,v,vo,Vc,DV,ERR);
writetable(T1,'data1.txt')

AA=Pinakas_4(:,1);
V=Pinakas_4(:,2);
v=Pinakas_4(:,3);
vo=Pinakas_4(:,4);
Vc=Pinakas_4(:,5);
DV=Pinakas_4(:,6);
ERR=Pinakas_4(:,7);
T2=table(AA,V,v,vo,Vc,DV,ERR);
writetable(T2,'data2.txt')
