close all;        %�ȹر�����ͼƬ
clear;
Adc=2;            %ֱ����������
A1=3;             %Ƶ��F1�źŵķ���
A2=1.5;           %Ƶ��F2�źŵķ���
F1=50;            %�ź�1Ƶ��(Hz)
F2=75;            %�ź�2Ƶ��(Hz)
Fs=256;           %����Ƶ��(Hz)
P1=-30;           %�ź�1��λ(��)
P2=90;            %�ź���λ(��)
N=256;            %��������
t=0:1/Fs:N/Fs;  %����ʱ��
 
%�ź�
S=Adc+A1*cos(2*pi*F1*t+pi*P1/180)+A2*cos(2*pi*F2*t+pi*P2/180);
 
%��ʾԭʼ�ź�
subplot(2,2,1);
plot(S);
title('���signal');
xlabel('Sample point');
ylabel('�ź�ֵ');
 
%figure;
Y = fft(S,N);                 %��FFT�任
Ayy = (abs(Y));               %ȡģ
subplot(2,2,2);
plot(Ayy(1:N));               %��ʾԭʼ��FFTģֵ���
title('Frequency spectrum');
xlabel('Sample point');
ylabel('FFTģ');
 
%figure;
Ayy=Ayy/(N/2);                %�����ʵ�ʵķ���
Ayy(1)=Ayy(1)/2;
F=(1:N-1)*Fs/N;             %�����ʵ�ʵ�Ƶ��ֵ
subplot(2,2,3);
plot(F(1:N/2),Ayy(1:N/2));    %��ʾ������FFTģֵ���
title('Amplitude-frequency');
xlabel('frequency');
ylabel('Amplitude');

%figure;
Ph=1:N/2;
for i=1:N/2
 Ph(i)=phase(Y(i));          %������λ
 Ph(i)=Ph(i)*180/pi;        %����Ϊ�Ƕ�
end
subplot(2,2,4);
plot(F(1:N/2),Ph(1:N/2));    %��ʾ��λͼ
title('Phase, frequency');
xlabel('frequency');
ylabel('Phase');