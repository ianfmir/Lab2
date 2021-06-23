%importar dados do arquivo saida.txt no workspace e colocar nome nas colunas (temperatura,potencia,velocidade) 

close all

temperatura = dadosvalidacao1.temperatura;
potencia = dadosvalidacao1.potencia;
velocidade = dadosvalidacao1.velocidade;
tempo = dadosvalidacao1.time;


size = length(temperatura);
amostras = linspace(1,size,size);
amostras = amostras';
figure
subplot(2,1,1)
grid on
plot(amostras, temperatura,'linewidth',1.5)
legend('Temperatura')
xlabel('Tempo (s)')
ylabel('Temperatura °C')
axis([500 2000 20 70])
title('Temperatura em função da velocidade do ventilador')
subplot(2,1,2)
grid on
plot(amostras, velocidade,'linewidth',1.5)
legend('Velocidade')
xlabel('Tempo (s)')
ylabel('Velocidade (rpm)')
axis([500 2000 0 810])

figure
plot(amostras, potencia)
grid on

figure
plot(amostras, velocidade)
grid on

%definir intervalos de tempo de regime permanente (regiao logo antes dos degraus)
%intervalo 1
t0 = 1029;
t1 = 1122;
% %intervalo 2
t2 = 1581;
t3 = 1670;
% %intervalo 3
t4 = 2000;
t5 = 2082;
% %intervalo 4
% t6 = 1278;
% t7 = 1412;
% %intervalo 5
% t8 = 1788;
% t9 = 1866;
% 
media1=mean(temperatura(t0:t1,1));
media2=mean(temperatura(t2:t3,1));
media3=mean(temperatura(t4:t5,1));

plot(tempo(1137:t3),temperatura(1137:t3));

vetor_aux = linspace(1,534,534);
vetor_aux = vetor_aux';

subida = [vetor_aux temperatura(1137:t3)];
descida = [vetor_aux(1:386,:) temperatura(1697:2082)];

y1 = out.deg_descida.signals(1).values;
y2 = out.deg_descida.signals(2).values;
t = out.deg_descida.time;

figure
plot(t,y1,':','linewidth',1.8)
hold on
plot(t,y2,'linewidth',1.5)
title('Validação degrau de descida')
legend('Simulacao', 'Experimento')
xlabel('Tempo (s)')
ylabel('Temperatura °C')

quadratic_sum = sum((y1-y2).^2)
a = length(y1);
raiz_erro_quadratico_medio = sqrt(quadratic_sum/a)

y3 = out.deg_subida.signals(1).values;
y4 = out.deg_subida.signals(2).values;
t = out.deg_subida.time;

figure
plot(t,y3,':','linewidth',1.8)
hold on
plot(t,y4,'linewidth',1.5)
title('Validação degrau de subida')
legend('Simulacao', 'Experimento')
xlabel('Tempo (s)')
ylabel('Temperatura °C')

quadratic_sum2 = sum((y3-y4).^2)
a2 = length(y3);
raiz_erro_quadratico_medio2 = sqrt(quadratic_sum2/a)



% subida = [amostras(1137:t3)' temperatura(t0:t3)];


% media4=mean(temperatura(t6:t7,1));
% media5=mean(temperatura(t8:t9,1));
% 
% %ganhos
% ganho1=(media2-media1)/100;
% ganho2=(media3-media2)/(500);
% ganho3=(media4-media3)/(500);
% ganho4=(media5-media4)/(1000);
% 
% tau1=0.632;
% tau3=0.95;

%calculei as constantes de tempo manualmente
%olhando no gráfico os valores de x quando: y=regime_permanente x tau1
%                                           y=regime_permanente x tau3
%e subtraindo do momento de inicio de cada degrau
%constante de tempo degrau 1 48 ~ 50
%constante de tempo degrau 2 32 ~ 25
%constante de tempo degrau 3 33 ~ 27
%constante de tempo degrau 4 30 ~ 32.6

