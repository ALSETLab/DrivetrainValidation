%% Script to load the linearized models
clear all
% Linearization at t = 0
load ./dslin.mat
nu = size(ABCD,2) - nx;
ny = size(ABCD,1) - nx;
A = ABCD(1:nx,1:nx);
B = ABCD(1:nx,nx+1:nx+nu);
C = ABCD(nx+1:nx+ny,1:nx);
D = ABCD(nx+1:nx+ny,nx+1:nx+nu);
ss0 = ss(A,B,C,D);
s = tf('s');
[b,a] = ss2tf(A,B,C,D,2);

G1 = zpk(ss0(2,2))
