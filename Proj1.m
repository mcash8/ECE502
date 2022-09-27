%% Section 2.1.1 Generating Continuous Random Variables - X = F^-1(U)
M = [10, 10^2, 10^3, 10^4, 10^5, 10^6]; a = 0; b = 1;
rng(0); 

%Exponential Distribution - Inverse Transfrom Method
lambda = 9; 
syms x 
f_x = lambda*exp(-lambda*x); %pdf - theory
u = int(f_x, [0, x]); %cdf, u = F(x)
f_inv = finverse(u);

%Exponential Distribution - Theory 
y = double(subs(f_x, x, 0:0.01:1)); 

figure
Legend = cell(4,1); 
for i = 2:4
    U = a + (b-a).*rand(M(i), 1); 
    X = double(subs(f_inv, x, U)); %F^-1(U)
    histogram(X, 'FaceAlpha', 0.35, 'Normalization','pdf')
    Legend{i-1} = strcat('Inverse Transform - M = ', num2str(M(i))) ; 
    hold on
end 

hold on
plot(0:0.01:1,y, 'LineWidth', 2, 'Color', "#7E2F8E")
title('Exponential Distribution: Theory vs. Inverse Transform Method')
Legend{4} = 'Theory'; 
xlabel('x')
ylabel('f_{x}(x)')
legend(Legend)

%Rayleigh Distribution - Inverse Transform Method
alpha = 14;
f_x = (x/alpha^2)*exp(-(x^2/(2*alpha^2))); %pdf - theory
u = int(f_x, [0, x]); %cdf, u = F(x)
f_inv = finverse(u); %F^-1

y = double(subs(f_x, x, 0:0.01:50));

figure
Legend = cell(4,1); 
for i = 3:5
    U = a + (b-a).*rand(M(i), 1); 
    X = double(subs(f_inv, x, U)); %F^-1(U)
    histogram(X, 'FaceAlpha', 0.35, 'Normalization','pdf')
    Legend{i-2} = strcat('Inverse Transform - M = ', num2str(M(i))) ; 
    hold on
end 

hold on
plot(0:0.01:50,y, 'LineWidth', 2, 'Color', "#7E2F8E")
title('Rayleigh Distribution: Theory vs. Inverse Transform Method')
Legend{4} = 'Theory'; 
xlabel('x')
ylabel('f_{x}(x)')
legend(Legend)

%Cauchy Distribution
y = -15:0.01:15; 
f_x = (6./(pi.*(36+(y-3).^2))); %pdf
figure
for i = 2:4
    U = a + (b-a).*rand(M(3), 1); 
    f_inv = 6.*tan(pi.*(U-1/2))+3; 
    histogram(f_inv, 'FaceAlpha', 0.35, 'Normalization','pdf')
    Legend{i-1} = strcat('Inverse Transform - M = ', num2str(M(i))) ; 
    hold on
end 
plot(y,f_x, 'Color', "#7E2F8E")
title('Cauchy Distribution: Theory vs. Inverse Transform Method')
Legend{4} = 'Theory'; 
xlabel('x')
xlim([-1e4 1e4])
ylabel('f_{x}(x)')
legend(Legend)
%% Section 2.1.2 Generating Discrete Random Variables
M = [10, 10^2, 10^3, 10^4, 10^5, 10^6]; a = 0; b = 1;
rng(0); 

%Bernoulli Random Variable Generation

