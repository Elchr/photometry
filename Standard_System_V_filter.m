clc; clear;

data=xlsread('observations.xlsx');        %Εισαγωγή πίνακα δεδομένων 
VarName1=data(:,1);                       %Δημιουργία column vectors από τα δεδομένα
V=data(:,2);
B_V=data(:,3);
v=data(:,4);
V_v=data(:,5);
X=data(:,6);
[Names,text]=xlsread('starnames.xlsx');


%ΑΝΑΓΩΓΗ ΦΩΤΟΗΛΕΚΤΡΙΚΩΝ ΔΕΔΟΜΕΝΩΝ ΓΙΑ ΦΩΤΟΜΕΤΡΙΑ ΤΟΥ "ΟΛΟΥ ΟΥΡΑΝΟΥ"
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
format long
%Διόρθωση για την ατμοσφαιρική εξασθένιση α τάξης
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
scatter(X,V_v);                            %Γραφική παράσταση σημείων, x-άξονας: Χ y-άξονας: V-v
xlabel('Air mass X');                      %Όνομα άξονα x
ylabel('V - v');                           %Όνομα άξονα y
title('Aτμοσφαιρική εξασθένιση');          %Τίτλος διαγράμματος
hl = lsline;                               %Εφαρμογή ευθείας ελαχίστων τετραγώνων
B = [ones(size(hl.XData(:))), hl.XData(:)]\hl.YData(:);
Slope = B(2);                              %Κλίση ευθείας-συντελεστής εξασθένισης α' τάξης
Intercept = B(1);                          %Σημείο τομής με άξονα y
k=abs(Slope);                              %Βρίσκουμε την απόλυτη τιμή του συντελεστή εξασθένισης k
v0=v-k.*X;                                 %Yπολογισμός των διορθωμένων μεγεθών για κάθε αστέρα
fprintf('H κλίση της ευθείας (V-v)=kX+ b δηλαδή ο συντελεστής εξασθένισης k είναι %f.',k)

Dv=V-v0;                                   %Yπολογσιμός της διαφοράς V-v0
Pinakas_2=[VarName1,V,v0,Dv,B_V];          %Φτιάχνουμε πίνακα με τα νέα δεδομένα


%Διόρθωση για τo πρότυπο σύστημα
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2)
scatter(B_V,Dv);                            %Γραφική παράσταση σημείων, x-άξονας: B-V y-άξονας: V-v0
xlabel('B-V');                              %Όνομα άξονα x
ylabel('V-v0');                             %Όνομα άξονα y
title('Μετατροπή στο πρότυπο σύστημα');     %Τίτλος διαγράμματος
h2 = lsline;                                %Εφαρμογή ευθείας ελαχίστων τετραγώνων
C = [ones(size(h2.XData(:))), h2.XData(:)]\h2.YData(:);
Slope_2 = C(2);                             %Κλίση ευθείας-συντελεστής 
Intercept_2 = C(1);                         %Σημείο τομής με άξονα y
fprintf('\n H κλίση της ευθείας (V-v0)=ε(B-V)+ζ δηλαδή ο συντελεστής ε είναι %f.',Slope_2);
fprintf('\n H σταθερά της ευθείας (V-v0)=ε(B-V)+ζ δηλαδή η σταθερά μηδενικού σημείου ζ είναι %f. \n \n',Intercept_2)

format short

V_c=v0+Slope_2*B_V+Intercept_2;             %Υπολογισμός μεγέθους V στοπρότυπο σύστημα για κάθε αστέρα
Pinakas_3=[VarName1,V,v,v0,V_c,V-V_c,(V-V_c)./V];      %Δημιουργία πίνακα με τα διορθωμένα μεγέθη για σύγκριση
disp('Τελικός πίνακας');                    %Εμφάνιση πίνακα
disp('    star         V        v         v0       V_c      V-V_c     V-V_c/V');
disp(Pinakas_3);

diff=abs(V-V_c);         %Απόλυτη τιμή διαφοράς V-V_c
figure(3)
histogram(diff)          %Ιστόγραμμα διαφοράς V-V_c  
xlabel('|V-V_c|');                              %Όνομα άξονα x
ylabel('N');                                  %Όνομα άξονα y
title('Διαφορά μεγεθών');       %Τίτλος διαγράμματος


data1=xlsread('unknown.xlsx');        %Εισαγωγή πίνακα δεδομένων αγνώστων αστέρων(Β-V, v, X)
B_V_un=data1(:,1);                       %Δημιουργία column vectors από τα δεδομένα
v_un=data1(:,2);
X_un=data1(:,3);


v0_un=v_un-k.*X_un; 
Vc_un=v0_un+Slope_2*B_V_un+Intercept_2;
V_un=[2.87;3.87];
names=[19; 21];
Pinakas_4=[names,V_un,v_un,v0_un,Vc_un,V_un-Vc_un,(V_un-Vc_un)./V_un];      %Δημιουργία πίνακα με τα διορθωμένα μεγέθη για σύγκριση
disp('Aποτελέσματα αγνώστων αστέρων');                    %Εμφάνιση πίνακα
disp('     star        V        v         v0        V_c     V-V_c    V-V_c/V');
disp(Pinakas_4);

format short

Vcc_un=v0_un+Intercept_2;
Pinakas_5=[names,V_un,Vc_un,Vcc_un,V_un-Vc_un,V_un-Vcc_un,(V_un-Vc_un)./V_un,(V_un-Vcc_un)./V_un ];
disp('Σύγκριση σχέσεων');                    %Εμφάνιση πίνακα
disp('     star      V         V_c       V_c2     V-V_c     V-V_c2    V-V_c/V  V-V_c2/V');
disp(Pinakas_5); 

%Εξαγωγή πινάκων σε αρχεία excel
Name={'Name','a/a', 'V','v','v0','V_c','V-V_c','V-V_c/V'};  
warning( 'off', 'MATLAB:xlswrite:AddSheet' ) ;
xlswrite('myfile1.xls', Name, 'Sheet 1', 'A1');
xlswrite('myfile1.xls', Pinakas_3, 'Sheet 1', 'B2');
xlswrite('myfile1.xls', text, 'Sheet 1', 'A2');
xlswrite('myfile2.xls', Name(2:8), 'Sheet 1', 'A1');
xlswrite('myfile2.xls', Pinakas_4, 'Sheet 1', 'A2');

%Eξαγωγή πινάκων σε αρχείο .txt
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