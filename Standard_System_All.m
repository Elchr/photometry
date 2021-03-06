clear; clc;
%%������� �������������� ��������� ��� ���������� ��� "���� �������" 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%����������� ������� ������� ��� ������� �� ���� ������ 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%U-filter
%%%%%%%%%%%%%
t_u=10; Klimaka_u=10;

palmoi_star_u=xlsread('u_filter.xlsx');        %�������� ������ ��������� ��� ��������� ������ ��� ������
palmoi_sky_u=xlsread('u_fil.xlsx');            %�������� ������ ��������� ��� ��������� ������ ��� ������

i_u=size(palmoi_star_u,1);    %������� ��������� ������ ������
j_u=size(palmoi_sky_u,1);     %������� ��������� ������ �������
h_u=size(palmoi_star_u,2);    %������� ������� ��� ������ �������
z_u=size(palmoi_sky_u,2);     
palmoi_u(1,h_u)=0; 
palmoi_2_u(1,z_u)=0;

for n=1:1:h_u                              %������������� ������ ��� ����� ���� �������
for k=1:i_u                                %�������� ������ ���� ������
    palmoi_u(1,n)=palmoi_u(1,n)+palmoi_star_u(k,n);
    k=k+1; 
end
end

for n=1:1:z_u                              %������������� ������ ��� ���� ��� ���������
for k=1:j_u                                %�������� ������ �������
    palmoi_2_u(1,n)=palmoi_2_u(1,n)+palmoi_sky_u(k,n);
    k=k+1;
 end
end
real_palmoi_u=(palmoi_u/i_u)-(palmoi_2_u/j_u);     %���������� ���� ������ ���� ������
S_u=real_palmoi_u/t_u/Klimaka_u;           %��������� ������ ���� ������
m_u=-2.5*log10(S_u);                       %������� ��� ������ U
u=m_u';                                    %���������� ������� �� ������-�����                                       

%B-filter
%%%%%%%%%%%%%
t_b=10; Klimaka_b=10;

palmoi_star_b=xlsread('b_filter.xlsx');        %�������� ������ ��������� ��� ��������� ������ ��� ������
palmoi_sky_b=xlsread('b_fil.xlsx');            %�������� ������ ��������� ��� ��������� ������ ��� ������

i_b=size(palmoi_star_b,1);    %������� ��������� ������ ������
j_b=size(palmoi_sky_b,1);     %������� ��������� ������ �������
h_b=size(palmoi_star_b,2);    %������� ������� ��� ������ �������
z_b=size(palmoi_sky_b,2);     
palmoi_b(1,h_b)=0; 
palmoi_2_b(1,z_b)=0;

for n=1:1:h_b                              %������������� ������ ��� ����� ���� �������
for k=1:i_b                                %�������� ������ ���� ������
    palmoi_b(1,n)=palmoi_b(1,n)+palmoi_star_b(k,n);
    k=k+1; 
end
end

for n=1:1:z_b                              %������������� ������ ��� ���� ��� ���������
for k=1:j_b                                %�������� ������ �������
    palmoi_2_b(1,n)=palmoi_2_b(1,n)+palmoi_sky_b(k,n);
    k=k+1;
  end
end
real_palmoi_b=(palmoi_b/i_b)-(palmoi_2_b/j_b);     %���������� ���� ������ ���� ������
S_b=real_palmoi_b/t_b/Klimaka_b;           %��������� ������ ���� ������
m_b=-2.5*log10(S_b);                       %������� ��� ������ B
b=m_b';                                    %���������� ������� �� ������-�����     


%V-filter
%%%%%%%%%%%%%
t_v=10; Klimaka_v=10;

palmoi_star_v=xlsread('v_filter.xlsx');        %�������� ������ ��������� ��� ��������� ������ ��� ������
palmoi_sky_v=xlsread('v_fil.xlsx');            %�������� ������ ��������� ��� ��������� ������ ��� ������

i_v=size(palmoi_star_v,1);    %������� ��������� ������ ������
j_v=size(palmoi_sky_v,1);     %������� ��������� ������ �������
h_v=size(palmoi_star_v,2);    %������� ������� ��� ������ �������
z_v=size(palmoi_sky_v,2);     
palmoi_v(1,h_v)=0; 
palmoi_2_v(1,z_v)=0;

for n=1:1:h_v                              %������������� ������ ��� ����� ���� �������
for k=1:i_v                                %�������� ������ ���� ������
    palmoi_v(1,n)=palmoi_v(1,n)+palmoi_star_v(k,n);
    k=k+1; 
end
end

for n=1:1:z_v                              %������������� ������ ��� ���� ��� ���������
for k=1:j_v                                %�������� ������ �������
    palmoi_2_v(1,n)=palmoi_2_v(1,n)+palmoi_sky_v(k,n);
    k=k+1;
   end
end
real_palmoi_v=(palmoi_v/i_v)-(palmoi_2_v/j_v);     %���������� ���� ������ ���� ������
S_v=real_palmoi_v/t_v/Klimaka_v;           %��������� ������ ���� ������
m_v=-2.5*log10(S_v);                       %������� ��� ������ V
v=m_v';                                    %���������� ������� �� ������-�����   


%R-filter
%%%%%%%%%%%%%
t_r=10; Klimaka_r=10;

palmoi_star_r=xlsread('r_filter.xlsx');        %�������� ������ ��������� ��� ��������� ������ ��� ������
palmoi_sky_r=xlsread('r_fil.xlsx');            %�������� ������ ��������� ��� ��������� ������ ��� ������

i_r=size(palmoi_star_r,1);    %������� ��������� ������ ������
j_r=size(palmoi_sky_r,1);     %������� ��������� ������ �������
h_r=size(palmoi_star_r,2);    %������� ������� ��� ������ �������
z_r=size(palmoi_sky_r,2);     
palmoi_r(1,h_r)=0; 
palmoi_2_r(1,z_r)=0;

for n=1:1:h_r                              %������������� ������ ��� ����� ���� �������
for k=1:i_r                                %�������� ������ ���� ������
    palmoi_r(1,n)=palmoi_r(1,n)+palmoi_star_r(k,n);
    k=k+1; 
end
end

for n=1:1:z_r                              %������������� ������ ��� ���� ��� ���������
for k=1:j_r                                %�������� ������ �������
    palmoi_2_r(1,n)=palmoi_2_r(1,n)+palmoi_sky_r(k,n);
    k=k+1;
  end
end
real_palmoi_r=(palmoi_r/i_r)-(palmoi_2_r/j_r);     %���������� ���� ������ ���� ������
S_r=real_palmoi_r/t_r/Klimaka_r;           %��������� ������ ���� ������
m_r=-2.5*log10(S_r);                       %������� ��� ������ R
b=m_r';                                    %���������� ������� �� ������-�����   

%I-filter
%%%%%%%%%%%%%
t_i=10; Klimaka_i=10;

palmoi_star_i=xlsread('i_filter.xlsx');        %�������� ������ ��������� ��� ��������� ������ ��� ������
palmoi_sky_i=xlsread('i_fil.xlsx');            %�������� ������ ��������� ��� ��������� ������ ��� ������

i_i=size(palmoi_star_i,1);    %������� ��������� ������ ������
j_i=size(palmoi_sky_i,1);     %������� ��������� ������ �������
h_i=size(palmoi_star_i,2);    %������� ������� ��� ������ �������
z_i=size(palmoi_sky_i,2);     
palmoi_i(1,h_i)=0; 
palmoi_2_i(1,z_i)=0;

for n=1:1:h_i                              %������������� ������ ��� ����� ���� �������
for k=1:i_i                                %�������� ������ ���� ������
    palmoi_i(1,n)=palmoi_i(1,n)+palmoi_star_i(k,n);
    k=k+1; 
end
end

for n=1:1:z_i                              %������������� ������ ��� ���� ��� ���������
for k=1:j_i                                %�������� ������ �������
    palmoi_2_i(1,n)=palmoi_2_i(1,n)+palmoi_sky_i(k,n);
    k=k+1;
   end
end
real_palmoi_i=(palmoi_i/i_i)-(palmoi_2_i/j_i);     %���������� ���� ������ ���� ������
S_i=real_palmoi_i/t_i/Klimaka_i;           %��������� ������ ���� ������
m_i=-2.5*log10(S_i);                       %������� ��� ������ I
i=m_i';                                    %���������� ������� �� ������-�����   

%����������� ������ �����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
H=xlsread('H_angle.xlsx');       %�������� ������ ����� ������� ������
phi=35;                          %���������� ������ ����� 
delta=xlsread('delta.xlsx');     %E������� ������ ��������� ���� ������
secz=(sin(phi).*sin(delta)+cos(phi).*cos(delta).*cos(H)).^(-1);   %����������� secz
X=secz-0.0018167*(secz-1)-0.002875*(secz-1).^2-0.0008083*(secz-1).^3; %����������� ������ ����� ���� ������

%�������� ��� ��� ������������ ���������� � �����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%U-filter
%%%%%%%%%%
U=xlsread('U_standard_stars.xlsx');        %E������� ������ �������� �������� ��� ��������� ������� 
U_u=U-u;                                   %�������� ��� �������������� �������� ��� �� �������
scatter(X,U_u);                            %������� ��������� �������, x-������: � y-������: U-u
xlabel('Air mass X');                      %����� ����� x
ylabel('U - u');                           %����� ����� y
title('A����������� ����������');          %������ ������������
hl_u = lsline;                               %�������� ������� ��������� ����������
B_u= [ones(size(hl_u.XData(:))), hl_u.XData(:)]\hl_u.YData(:);
Slope_u = B_u(2);                              %����� �������-����������� ����������� �' �����
Intercept_u = B_u(1);                          %������ ����� �� ����� y
k_u=abs(Slope_u);                              %��������� ��� ������� ���� ��� ���������� ����������� k
u0=u-k_u.*X;                                 %Y���������� ��� ����������� ������� ��� ���� ������
fprintf('H ����� ��� ������� (U-u)=kX+ b ������ � ����������� ����������� k_u ����� %f',k_u)

Du=U-u0;                                   %Y���������� ��� �������� U-u0
Pinakas_2_u=[U,u0,Du,X];          %���������� ������ �� �� ��� ��������

%B-filter
%%%%%%%%%%
figyre(2)
B=xlsread('B_standard_stars.xlsx');        %E������� ������ �������� �������� ��� ��������� ������� 
B_b=B-b;                                   %�������� ��� �������������� �������� ��� �� �������
scatter(X,B_b);                            %������� ��������� �������, x-������: � y-������: B-b
xlabel('Air mass X');                      %����� ����� x
ylabel('B - b');                           %����� ����� y
title('A����������� ����������');          %������ ������������
hl_b = lsline;                               %�������� ������� ��������� ����������
B_b= [ones(size(hl_b.XData(:))), hl_b.XData(:)]\hl_b.YData(:);
Slope_b = B_b(2);                              %����� �������-����������� ����������� �' �����
Intercept_b = B_b(1);                          %������ ����� �� ����� y
k_b=abs(Slope_b);                              %��������� ��� ������� ���� ��� ���������� ����������� k
b0=b-k_b.*X;                                 %Y���������� ��� ����������� ������� ��� ���� ������
fprintf('H ����� ��� ������� (B-b)=kX+ b ������ � ����������� ����������� k_b ����� %f',k_b)

Db=B-b0;                                   %Y���������� ��� �������� B-b0
Pinakas_2_b=[B,b0,Db,X];          %���������� ������ �� �� ��� ��������

%V-filter
%%%%%%%%%%
figure(3)
V=xlsread('V_standard_stars.xlsx');        %E������� ������ �������� �������� ��� ��������� ������� 
V_v=V-v;                                   %�������� ��� �������������� �������� ��� �� �������
scatter(X,V_v);                            %������� ��������� �������, x-������: � y-������: V-v
xlabel('Air mass X');                      %����� ����� x
ylabel('V - v');                           %����� ����� y
title('A����������� ����������');          %������ ������������
hl_v = lsline;                               %�������� ������� ��������� ����������
B_v= [ones(size(hl_v.XData(:))), hl_v.XData(:)]\hl_v.YData(:);
Slope_v = B_v(2);                              %����� �������-����������� ����������� �' �����
Intercept_v = B_v(1);                          %������ ����� �� ����� y
k_v=abs(Slope_v);                              %��������� ��� ������� ���� ��� ���������� ����������� k
v0=v-k_v.*X;                                 %Y���������� ��� ����������� ������� ��� ���� ������
fprintf('H ����� ��� ������� (V-v)=kX+ b ������ � ����������� ����������� k_v ����� %f',k_v)

Dv=V-v0;                                   %Y���������� ��� �������� V-v0
Pinakas_2_v=[V,v0,Dv,X];          %���������� ������ �� �� ��� ��������

%R-filter
%%%%%%%%%%
figure(4)
R=xlsread('R_standard_stars.xlsx');        %E������� ������ �������� �������� ��� ��������� ������� 
R_r=R-r;                                   %�������� ��� �������������� �������� ��� �� �������
scatter(X,R_r);                            %������� ��������� �������, x-������: � y-������: R-r
xlabel('Air mass X');                      %����� ����� x
ylabel('R - r');                           %����� ����� y
title('A����������� ����������');          %������ ������������
hl_r = lsline;                               %�������� ������� ��������� ����������
B_r= [ones(size(hl_r.XData(:))), hl_r.XData(:)]\hl_r.YData(:);
Slope_r = B_r(2);                              %����� �������-����������� ����������� �' �����
Intercept_r = B_r(1);                          %������ ����� �� ����� y
k_r=abs(Slope_r);                              %��������� ��� ������� ���� ��� ���������� ����������� k
r0=r-k_r.*X;                                 %Y���������� ��� ����������� ������� ��� ���� ������
fprintf('H ����� ��� ������� (R-r)=kX+ b ������ � ����������� ����������� k_r ����� %f',k_r)

Dr=R-r0;                                   %Y���������� ��� �������� R-r0
Pinakas_2_r=[R,r0,Dr,X];          %���������� ������ �� �� ��� ��������

%I-filter
%%%%%%%%%%
figure(5)
I=xlsread('I_standard_stars.xlsx');        %E������� ������ �������� �������� ��� ��������� ������� 
I_i=I-i;                                   %�������� ��� �������������� �������� ��� �� �������
scatter(X,I_i);                            %������� ��������� �������, x-������: � y-������: I-i
xlabel('Air mass X');                      %����� ����� x
ylabel('I - i');                           %����� ����� y
title('A����������� ����������');          %������ ������������
hl_i = lsline;                               %�������� ������� ��������� ����������
B_i= [ones(size(hl_i.XData(:))), hl_i.XData(:)]\hl_i.YData(:);
Slope_i = B_i(2);                              %����� �������-����������� ����������� �' �����
Intercept_i = B_i(1);                          %������ ����� �� ����� y
k_i=abs(Slope_i);                              %��������� ��� ������� ���� ��� ���������� ����������� k
i0=i-k_i.*X;                                 %Y���������� ��� ����������� ������� ��� ���� ������
fprintf('H ����� ��� ������� (I-i)=kX+ b ������ � ����������� ����������� k_i ����� %f',k_i)

Di=I-i0;                                   %Y���������� ��� �������� I-i0
Pinakas_2_i=[I,i0,Di,X];          %���������� ������ �� �� ��� ��������

%�������� ��� �o ������� �������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%U-filter
%%%%%%%%%%
figure(6)
scatter(U_B,Du);                            %������� ��������� �������, x-������: U-B y-������: V-v0
xlabel('U-B');                              %����� ����� x
ylabel('U-u0');                             %����� ����� y
title('��������� ��� ������� �������');     %������ ������������
h2_u = lsline;                              %�������� ������� ��������� ����������
C_u = [ones(size(h2_u.XData(:))), h2_u.XData(:)]\h2_u.YData(:);
Slope_2_u = C_u(2);                          %����� �������
Intercept_2_u = C_u(1);                      %������ ����� �� ����� y
fprintf('\n H ����� ��� ������� (U-u0)=�(U-B)+� ������ � ����������� � ����� %f',Slope_2_u);
fprintf('\n H ������� ��� ������� (U-u0)=�(U-B)+� ������ � ������� ��������� ������� � ����� %f \n \n',Intercept_2_u)

U_c=v0+Slope_2_v*B_V+Intercept_2_v;           %����������� �������� V ���������� ������� ��� ���� ������
Pinakas_3_u=[U,u,u0,U_c,U-U_c];               %���������� ������ �� �� ���������� ������ ��� ��������

%B-filter
%%%%%%%%%%
figure(7)
scatter(B_V,Db);                            %������� ��������� �������, x-������: B-V y-������: B-b0
xlabel('B-V');                              %����� ����� x
ylabel('B-b0');                             %����� ����� y
title('��������� ��� ������� �������');     %������ ������������
h2_b = lsline;                              %�������� ������� ��������� ����������
C_b = [ones(size(h2_b.XData(:))), h2_b.XData(:)]\h2_b.YData(:);
Slope_2_b = C_b(2);                          %����� �������
Intercept_2_b = C_b(1);                      %������ ����� �� ����� y
fprintf('\n H ����� ��� ������� (B-b0)=�(B-V)+� ������ � ����������� � ����� %f',Slope_2_b);
fprintf('\n H ������� ��� ������� (B-b0)=�(B-V)+� ������ � ������� ��������� ������� � ����� %f \n \n',Intercept_2_b)

B_c=b0+Slope_2_b*B_V+Intercept_2_b;           %����������� �������� V ���������� ������� ��� ���� ������
Pinakas_3_b=[B,b,b0,B_c,B-B_c];               %���������� ������ �� �� ���������� ������ ��� ��������

%V-filter
%%%%%%%%%%
figure(8)
scatter(B_V,Dv);                            %������� ��������� �������, x-������: B-V y-������: V-v0
xlabel('B-V');                              %����� ����� x
ylabel('V-v0');                             %����� ����� y
title('��������� ��� ������� �������');     %������ ������������
h2_v = lsline;                              %�������� ������� ��������� ����������
C_v = [ones(size(h2_v.XData(:))), h2_v.XData(:)]\h2_v.YData(:);
Slope_2_v = C_v(2);                          %����� �������
Intercept_2_v = C_v(1);                      %������ ����� �� ����� y
fprintf('\n H ����� ��� ������� (V-v0)=�(B-V)+� ������ � ����������� � ����� %f',Slope_2_v);
fprintf('\n H ������� ��� ������� (V-v0)=�(B-V)+� ������ � ������� ��������� ������� � ����� %f \n \n',Intercept_2_v)

V_c=v0+Slope_2_v*B_V+Intercept_2_v;           %����������� �������� V ���������� ������� ��� ���� ������
Pinakas_3_v=[V,v,v0,V_c,V-V_c];               %���������� ������ �� �� ���������� ������ ��� ��������

%R-filter
%%%%%%%%%%
figure(9)
scatter(V_R,Dr);                            %������� ��������� �������, x-������: V-R y-������: R-r0
xlabel('V-R');                              %����� ����� x
ylabel('R-r0');                             %����� ����� y
title('��������� ��� ������� �������');     %������ ������������
h2_r = lsline;                              %�������� ������� ��������� ����������
C_r = [ones(size(h2_r.XData(:))), h2_r.XData(:)]\h2_r.YData(:);
Slope_2_r = C_r(2);                          %����� �������
Intercept_2_r = C_r(1);                      %������ ����� �� ����� y
fprintf('\n H ����� ��� ������� (R-r0)=�(V-R)+� ������ � ����������� � ����� %f',Slope_2_r);
fprintf('\n H ������� ��� ������� (R-r0)=�(V-R)+� ������ � ������� ��������� ������� � ����� %f \n \n',Intercept_2_r)

R_c=r0+Slope_2_r*B_V+Intercept_2_r;           %����������� �������� V ���������� ������� ��� ���� ������
Pinakas_3_v=[R,r,r0,R_c,R-R_c];               %���������� ������ �� �� ���������� ������ ��� ��������

%I-filter
%%%%%%%%%%
figure(10)
scatter(V_I,Di);                            %������� ��������� �������, x-������: V-I y-������: I-i0
xlabel('V-I');                              %����� ����� x
ylabel('I-i0');                             %����� ����� y
title('��������� ��� ������� �������');     %������ ������������
h2_i = lsline;                              %�������� ������� ��������� ����������
C_i = [ones(size(h2_i.XData(:))), h2_i.XData(:)]\h2_i.YData(:);
Slope_2_i = C_i(2);                          %����� �������
Intercept_2_i = C_i(1);                      %������ ����� �� ����� y
fprintf('\n H ����� ��� ������� (I-i0)=�(V-I)+� ������ � ����������� � ����� %f',Slope_2_i);
fprintf('\n H ������� ��� ������� (I-i0)=�(V-I)+� ������ � ������� ��������� ������� � ����� %f \n \n',Intercept_2_i)

I_c=i0+Slope_2_i*B_V+Intercept_2_i;           %����������� �������� V ���������� ������� ��� ���� ������
Pinakas_3_i=[I,i,i0,I_c,I-I_c];               %���������� ������ �� �� ���������� ������ ��� ��������

%����������� ������� �������� ������� ��� ������� �������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%������� �� �� ���������� ��� ��� ������������ ���������� ������ �������� �������
unknown_stars=[u0(19) b0(19) v0(19) r0(19) i0(19); u0(21) b0(21) v0(21) r0(21) i0(21)];
Slopes=[Slope_2_u Slope_2_b Slope_2_v Slope_2_r Slope_2_i]; %������� �� ����������� � �� ��� �� ������
Inters=[Intercept_2_u Intercept_2_b Intercept_2_v Interecept_2_r Interecept_2_i]; %������� �� ����������� � �� ��� �� ������

for n=1:2
Uc_1(n)=unknown_stars(n,1)+Slopes(1);          %������������ ������� ��� ���������� ������� ��� ��� ��� �������
Bc_1(n)=unknown_stars(n,2)+Slopes(2);
Vc_1(n)=unknown_stars(n,3)+Slopes(3);
Rc_1(n)=unknown_stars(n,4)+Slopes(4);
Ic_1(n)=unknown_stars(n,5)+Slopes(5);

Uc_2(n)=Uc_1(n)+Inters(1)*(Uc_1(n)-Bc_1(n));
Bc_2(n)=Bc_1(n)+Inters(2)*(Bc_1(n)-Vc_1(n));
Vc_2(n)=Vc_1(n)+Inters(3)*(Bc_1(n)-Vc_1(n));
Rc_2(n)=Rc_1(n)+Inters(4)*(Vc_1(n)-Rc_1(n));
Ic_2=Ic_1+Inters(5)*(Vc_1-Ic_1);

Uc_3(n)=Uc_1(n)+Inters(1)*(Uc_2(n)-Bc_2(n));          %������ ������ �� ��� �� ������ ��� ��� ���� ��� �������
Bc_3(n)=Bc_1(n)+Inters(2)*(Bc_2(n)-Vc_2(n));
Vc_3(n)=Vc_1(n)+Inters(3)*(Bc_2(n)-Vc_2(n));
Rc_3(n)=Rc_1(n)+Inters(4)*(Vc_2(n)-Rc_2(n));
Ic_3(n)=Ic_1(n)+Inters(5)*(Vc_2(n)-Ic_2(n));

n=n+1;
end

disp('          ������� ������� UBVRI');                    %�������� ������ ������� �������������
disp('       25 � Tau            3 � Eri ');
FINAL=[Uc_3; Bc_3; Vc_3; Rc_3 ;Ic_3];
disp(FINAL);