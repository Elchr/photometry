clc; clear;

data=xlsread('observations.xlsx');        %�������� ������ ��������� 
VarName1=data(:,1);                       %���������� column vectors ��� �� ��������
V=data(:,2);
B_V=data(:,3);
v=data(:,4);
V_v=data(:,5);
X=data(:,6);
[Names,text]=xlsread('starnames.xlsx');


%������� �������������� ��������� ��� ���������� ��� "���� �������"
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
format long
%�������� ��� ��� ������������ ���������� � �����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
scatter(X,V_v);                            %������� ��������� �������, x-������: � y-������: V-v
xlabel('Air mass X');                      %����� ����� x
ylabel('V - v');                           %����� ����� y
title('A����������� ����������');          %������ ������������
hl = lsline;                               %�������� ������� ��������� ����������
B = [ones(size(hl.XData(:))), hl.XData(:)]\hl.YData(:);
Slope = B(2);                              %����� �������-����������� ����������� �' �����
Intercept = B(1);                          %������ ����� �� ����� y
k=abs(Slope);                              %��������� ��� ������� ���� ��� ���������� ����������� k
v0=v-k.*X;                                 %Y���������� ��� ����������� ������� ��� ���� ������
fprintf('H ����� ��� ������� (V-v)=kX+ b ������ � ����������� ����������� k ����� %f.',k)

Dv=V-v0;                                   %Y���������� ��� �������� V-v0
Pinakas_2=[VarName1,V,v0,Dv,B_V];          %���������� ������ �� �� ��� ��������


%�������� ��� �o ������� �������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2)
scatter(B_V,Dv);                            %������� ��������� �������, x-������: B-V y-������: V-v0
xlabel('B-V');                              %����� ����� x
ylabel('V-v0');                             %����� ����� y
title('��������� ��� ������� �������');     %������ ������������
h2 = lsline;                                %�������� ������� ��������� ����������
C = [ones(size(h2.XData(:))), h2.XData(:)]\h2.YData(:);
Slope_2 = C(2);                             %����� �������-����������� 
Intercept_2 = C(1);                         %������ ����� �� ����� y
fprintf('\n H ����� ��� ������� (V-v0)=�(B-V)+� ������ � ����������� � ����� %f.',Slope_2);
fprintf('\n H ������� ��� ������� (V-v0)=�(B-V)+� ������ � ������� ��������� ������� � ����� %f. \n \n',Intercept_2)

format short

V_c=v0+Slope_2*B_V+Intercept_2;             %����������� �������� V ���������� ������� ��� ���� ������
Pinakas_3=[VarName1,V,v,v0,V_c,V-V_c,(V-V_c)./V];      %���������� ������ �� �� ���������� ������ ��� ��������
disp('������� �������');                    %�������� ������
disp('    star         V        v         v0       V_c      V-V_c     V-V_c/V');
disp(Pinakas_3);

diff=abs(V-V_c);         %������� ���� �������� V-V_c
figure(3)
histogram(diff)          %���������� �������� V-V_c  
xlabel('|V-V_c|');                              %����� ����� x
ylabel('N');                                  %����� ����� y
title('������� �������');       %������ ������������


data1=xlsread('unknown.xlsx');        %�������� ������ ��������� �������� �������(�-V, v, X)
B_V_un=data1(:,1);                       %���������� column vectors ��� �� ��������
v_un=data1(:,2);
X_un=data1(:,3);


v0_un=v_un-k.*X_un; 
Vc_un=v0_un+Slope_2*B_V_un+Intercept_2;
V_un=[2.87;3.87];
names=[19; 21];
Pinakas_4=[names,V_un,v_un,v0_un,Vc_un,V_un-Vc_un,(V_un-Vc_un)./V_un];      %���������� ������ �� �� ���������� ������ ��� ��������
disp('A����������� �������� �������');                    %�������� ������
disp('     star        V        v         v0        V_c     V-V_c    V-V_c/V');
disp(Pinakas_4);

format short

Vcc_un=v0_un+Intercept_2;
Pinakas_5=[names,V_un,Vc_un,Vcc_un,V_un-Vc_un,V_un-Vcc_un,(V_un-Vc_un)./V_un,(V_un-Vcc_un)./V_un ];
disp('�������� �������');                    %�������� ������
disp('     star      V         V_c       V_c2     V-V_c     V-V_c2    V-V_c/V  V-V_c2/V');
disp(Pinakas_5); 

%������� ������� �� ������ excel
Name={'Name','a/a', 'V','v','v0','V_c','V-V_c','V-V_c/V'};  
warning( 'off', 'MATLAB:xlswrite:AddSheet' ) ;
xlswrite('myfile1.xls', Name, 'Sheet 1', 'A1');
xlswrite('myfile1.xls', Pinakas_3, 'Sheet 1', 'B2');
xlswrite('myfile1.xls', text, 'Sheet 1', 'A2');
xlswrite('myfile2.xls', Name(2:8), 'Sheet 1', 'A1');
xlswrite('myfile2.xls', Pinakas_4, 'Sheet 1', 'A2');

%E������ ������� �� ������ .txt
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