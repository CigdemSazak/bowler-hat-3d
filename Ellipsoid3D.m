function se = Ellipsoid3D(s,rx,ry,rz)  
%% Ellipsoid3D - 3D elipsoid
%
%   INPUT:
%       s        - size
%       rx,ry,rz - resolution in x, y and z
%
%   OUTPUT:
%       se       - ellipsoid
%
%   AUTHOR:
%       Boguslaw Obara, http://boguslawobara.net/
%
%   VERSION:
%       0.1 - 27/02/2017 First implementation
%% Round 
sx = round(s*rx);
sy = round(s*ry);
sz = round(s*rz);
%% Mesh
[xg,yg,zg] = meshgrid(-sx:sx,-sy:sy,-sz:sz);
%% Ellipsoid
se = ( (xg/sx).^2 + (yg/sy).^2 + (zg/sz).^2 ) <= 1;
end