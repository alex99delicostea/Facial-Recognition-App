function [A_k S Z] = task3(image, k)
  %TODO
  A=double(imread(image));
  n_rows=size(A,1);
  n_col=size(A,2);
  v=[];
  for i=1:n_rows
    Ui=sum(A(i,:))/n_col;
    v(i)=Ui;
  endfor
  for i=1:n_rows
      H(i,:)=A(i,:)-v(i);
    endfor
    B=H';
    Z=B/sqrt(n_col-1);
    [U,S,V]=svd(Z);
    for i=1:k
      W(:,i)=V(:,i);
    endfor
    X=W';
    Y=X*H;
    A_k=W*Y + v';
endfunction