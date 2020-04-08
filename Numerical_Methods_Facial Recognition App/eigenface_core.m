function [m A eigenfaces pr_img] = eigenface_core(database_path)
  %TODO
  T=[];
for i=1:10
   B=double(rgb2gray(imread(sprintf("task6/dataset/%d.jpg",i))));
   B =reshape(B,size(B,1)*size(B,2) ,1);
   T(:,i)=B;
endfor
  
    m = mean(T,2);
    A = T - m;
    V=[];
    k=1;
    [I a] = eig(A'*A);
    for i = 1 : size(I,2) 
      if( a(i,i) > 1 )
        V(:,k)=I(:,i);
        k++;
      endif
    endfor
    eigenfaces = A * V;
    pr_img = [];
    for i = 1 : 10
      val = eigenfaces'*A(:,i);
      pr_img(:,i) = val;
    endfor
end