function [FM] = BladeElementTheory(Omega,V,w,R,Spin)

e = 0.124;
CLa = 5.73;
Cd0 = 0.008;
n_blades = 2;
rho = 1.23;

RR = linspace(e,1,100)*R;
WR = (RR(2)-RR(1))*ones(size(RR)); WR([1 end]) = WR([1 end])/2;

psi = (0:5:360)'*pi/180;
WP = (psi(2)-psi(1))*ones(size(psi)); WP([1 end]) = WP([1 end])/2;

t0 = 20; tw = -12;
% t0 = 11; tw = 0;
theta = (t0+tw*(RR/R-e)/((1-e)))*pi/180;

c0 = 0.0311*R/0.1524; ct = 0.0123*R/0.1524;
% c0 = 0.0217*R/0.1524; ct = 0.0217*R/0.1524;
c = c0+(ct-c0)*(RR/R-e)/((1-e));

psiw = atan2(V(2),V(1));

Rw = [cos(psiw) sin(psiw) 0; -sin(psiw) cos(psiw) 0; 0 0 1];

V = Rw*V;
w = Rw*w;

UT = (Omega-w(3))*RR+V(1)*sin(psi)+V(2)*cos(psi);
UT(UT==0) = eps;
UP0= -V(3)+RR.*(-w(1)*sin(psi)-w(2)*cos(psi));

mu_x = sqrt(V(1)^2+V(2)^2)/(Omega*R);
mu_z = -V(3)/(Omega*R);
CTGuess = 0.012; lamGuess = sqrt(CTGuess/2);

CTpert = 1e-4;
lampert = 1e-4;

E = [1;1];
while norm(E)>1e-6
    UP = UP0+lamGuess*Omega*R;
    phi = UP./UT;
    alpha = theta-phi;
%     CL = CLa*alpha;
%     dL = 1/2*rho*UT.^2.*c.*CL;
    dL = 1/2*rho*c*CLa.*(theta.*UT.^2-UP.*UT);
    dD = 1/2*rho*UT.^2.*c.*Cd0;
    dFz = dL;
    dFx = dL.*phi+dD;
    
    T = WR*dFz'*WP*(n_blades/(2*pi)); %Positive Up
    CT = T/(rho*pi*Omega^2*R^4);
    lam = mu_z + CTGuess/(2*sqrt(mu_x^2+lamGuess^2));
    E = [CT-CTGuess;lam-lamGuess];
    
    %Get Jacobian of Error
    J(:,1) = [-1;1/(2*sqrt(mu_x^2+lamGuess^2))]; %With Respect to CTGuess
    
    %With respect to lamGuess
    UPPert = UP0+(lamGuess+lampert)*Omega*R;
    phiPert = UPPert./UT;
    alphaPert = theta-phiPert;
    CLPert = CLa*alphaPert;
    dLPert = 1/2*rho*UT.^2.*c.*CLPert;
    dFzPert = dLPert;
    dFxPert = dLPert.*phiPert+dD;
    
    TPert = WR*dFzPert'*WP*(n_blades/(2*pi));
    CTPert = TPert/(rho*pi*Omega^2*R^4);
    lamPert = mu_z + CTGuess/(2*sqrt(mu_x^2+(lamGuess+lampert)^2));
    EPert = [CTPert-CTGuess;lamPert-lamGuess];
    J(:,2) = (EPert-E)/lampert;
    
    deltaGuess = -0.5*(J\E);
    CTGuess = CTGuess+deltaGuess(1);
    lamGuess = lamGuess+deltaGuess(2);
    
end

%Forces

H = WR*(-dFx.*sin(psi))'*WP*(n_blades/(2*pi)); %Positive forward
Y = WR*(-dFx.*cos(psi))'*WP*(n_blades/(2*pi)); %Positive right

%Moments

L = WR*(-dFz.*RR.*sin(psi))'*WP*(n_blades/((2*pi))); %Positive Adv. Side Down
M = WR*(-dFz.*RR.*cos(psi))'*WP*(n_blades/((2*pi))); %Positive Nose Up; 
Q = WR*(dFx.*RR)'*WP*(n_blades/(2*pi)); %Positive CW

if Spin
    Y = -Y;
    L = -L;
    Q = -Q;
end

FM = [Rw'*[H;Y;-T];Rw'*[L;M;Q]];