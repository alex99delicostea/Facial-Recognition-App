function A_k = task1(image, k)
  %TODO
  A=double(imread(image));
  [U,S,V]=svd(A);
  C=S;
  C(k+1:end,:)=0;
  C(:,k+1:end)=0;
  A_k=U*C*V';
end