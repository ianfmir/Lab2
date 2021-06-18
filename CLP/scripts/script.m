%importar dados do arquivo saida.txt no workspace e colocar nome nas colunas (temperatura,potencia,velocidade) 

temperatura = saida.temperatura;
potencia = saida.potencia;
velocidade = saida.velocidade;

figure
size = length(temperatura);
amostras = linspace(1,size,size);
plot(amostras, temperatura)
grid on

figure
plot(amostras, potencia)
grid on

figure
plot(amostras, velocidade)
grid on

%definir intervalos de tempo de regime permanente (regiao logo antes dos degraus)
%intervalo 1
t0 = 1;
t1 = 74;
%intervalo 2
t2 = 446;
t3 = 493;
%intervalo 3
t4 = 827;
t5 = 945;
%intervalo 4
t6 = 1278;
t7 = 1412;
%intervalo 5
t8 = 1788;
t9 = 1866;

media1=mean(temperatura(t0:t1,1));
media2=mean(temperatura(t2:t3,1));
media3=mean(temperatura(t4:t5,1));
media4=mean(temperatura(t6:t7,1));
media5=mean(temperatura(t8:t9,1));

%ganhos
ganho1=(media2-media1)/100;
ganho2=(media3-media2)/(500);
ganho3=(media4-media3)/(500);
ganho4=(media5-media4)/(1000);

tau1=0.632;
tau3=0.95;

%calculei as constantes de tempo manualmente
%olhando no gráfico os valores de x quando: y=regime_permanente x tau1
%                                           y=regime_permanente x tau3
%e subtraindo do momento de inicio de cada degrau
%constante de tempo degrau 1 48 ~ 50
%constante de tempo degrau 2 32 ~ 25
%constante de tempo degrau 3 33 ~ 27
%constante de tempo degrau 4 30 ~ 32.6

