% Figure 6 in protests paper
clear all; close all; clc;
t0=0;
tmax=3000;
dt=0.01;
Nt=(tmax-t0)/dt+1;
t=t0:dt:tmax;

beta1=0.0045;
beta2=0.1832;
chi=0.0203;
gamma=[0.011 0.012 0.013 0.014 0.015 0.016]; 
n=5;
C0=15;
delta1=0.0762;
delta2=0.002;
delta0=delta1-delta2;


%IC
S(1)=1.2;
 I(1)=6;
 C(1)=1.8;  
  R(1)=78;
for j=1:length(gamma)
for i=1:Nt-1
S(i+1)=S(i)+dt*(-beta1*S(i)*I(i)-beta2*S(i)*C(i)+gamma(j)*R(i));
 I(i+1)=I(i)+dt*(beta1*S(i)*I(i)+beta2*S(i)*C(i)-chi*I(i)-delta1*I(i));
 C(i+1)=C(i)+dt*(chi*I(i)-C(i)*(delta2+delta0*C0^n/((C(i)+I(i))^n+C0^n)));  
  R(i+1)=R(i)+dt*(delta1*I(i)+C(i)*(delta2+delta0*C0^n/((C(i)+I(i))^n+C0^n))-gamma(j)*R(i));  
end
if (j==1);people=I+C;end
if (j==2);people1=I+C;end
if (j==3);people2=I+C;end
if (j==4);people3=I+C;end
if (j==5);people4=I+C;end
if (j==6);people5=I+C;end
end



plot(t,people,'c',t,people1,'m',t,people2,'g',t,people3,'b',t,people4,'r',t,people5,'k')
legend('$\gamma$=0.011','$\gamma$=0.012','$\gamma$=0.013','$\gamma$=0.014','$\gamma$=0.015','$\gamma$=0.016','Interpreter','latex')
xlabel('Time')
ylabel('No. of people')



