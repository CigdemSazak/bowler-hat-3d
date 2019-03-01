function [imda,imra] = BowlerHat3D(im,s,no,rx,ry,rz)

[p,~,~] = SurfacesSpiralPoints3D(no);
%%
ps=p;
imol = zeros(size(im,1),size(im,2),size(im,3),s,no);
imod = zeros(size(im,1),size(im,2),size(im,3),s);
for i=2:s
      fprintf('Calculating at Sphere %d ;\n',i);
      se = Ellipsoid3D(i,rx,ry,rz);
      imod(:,:,:,i) = imopen(im,se);
  
    fprintf('Calculating at Line %d ;\n',i);
      for t=1:length(ps)
          se = Line3D(i,ps(t,:),rx,ry,rz);
          imol(:,:,:,i,t) = imopen(im,se);
      end
end
%%
imd = zeros(size(im,1),size(im,2),size(im,3),s);
imr = zeros(size(im,1),size(im,2),size(im,3),s);
imm = zeros(size(im,1),size(im,2),size(im,3),s);
triv = imod==0;
for j=1:s
   imm(:,:,:,j) = max(imol(:,:,:,j,:),[],5);
   imd(:,:,:,j) = imm(:,:,:,j) - imod(:,:,:,j); % Diff betwen sphere and line
end
imr(triv) = 0;
%%
imda = max(imd,[],4);
imra = max(imr,[],4);
end