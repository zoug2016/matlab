close all;        %先关闭所有图片
clear;
Adc=2;            %直流分量幅度
A1=3;             %频率F1信号的幅度
A2=1.5;           %频率F2信号的幅度
F1=50;            %信号1频率(Hz)
F2=75;            %信号2频率(Hz)
Fs=256;           %采样频率(Hz)
P1=-30;           %信号1相位(度)
P2=90;            %信号相位(度)
N=256;            %采样点数
t=0:1/Fs:N/Fs;  %采样时刻
 
%信号
S=Adc+A1*cos(2*pi*F1*t+pi*P1/180)+A2*cos(2*pi*F2*t+pi*P2/180);
 
%显示原始信号
subplot(2,2,1);
plot(S);
title('混合signal');
xlabel('Sample point');
ylabel('信号值');
 
%figure;
Y = fft(S,N);                 %做FFT变换
Ayy = (abs(Y));               %取模
subplot(2,2,2);
plot(Ayy(1:N));               %显示原始的FFT模值结果
title('Frequency spectrum');
xlabel('Sample point');
ylabel('FFT模');
 
%figure;
Ayy=Ayy/(N/2);                %换算成实际的幅度
Ayy(1)=Ayy(1)/2;
F=(1:N-1)*Fs/N;             %换算成实际的频率值
subplot(2,2,3);
plot(F(1:N/2),Ayy(1:N/2));    %显示换算后的FFT模值结果
title('Amplitude-frequency');
xlabel('frequency');
ylabel('Amplitude');

%figure;
Ph=1:N/2;
for i=1:N/2
 Ph(i)=phase(Y(i));          %计算相位
 Ph(i)=Ph(i)*180/pi;        %换算为角度
end
subplot(2,2,4);
plot(F(1:N/2),Ph(1:N/2));    %显示相位图
title('Phase, frequency');
xlabel('frequency');
ylabel('Phase');