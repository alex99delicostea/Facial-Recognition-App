function task5(image,k)
  %TODO
  %Grafic 1
  A=double(imread(image));
  [A_k S Z] = task3(image, k);
  figure(1);
  plot(1:k,diag(S));
    %Grafic 2 
    [U,S,V]=svd(Z);
    C=S;
    C(k+1:end,:)=0;
    C(:,k+1:end)=0;
    Z_k=U*C*V';
    [U_k,S_k,V_k]=svd(Z_k);
    n_rows=size(Z,1);
    n_col=size(Z,2);
    m=min(n_rows,n_col);
    val_Z=0;
    for i=1:m
      val_Z+=S(i,i);
    endfor
    vec_k=[];
    val_k=0;
    for i=1:k
      val_k+=S_k(i,i);
      vec_k(i)=val_k;
    endfor
    vec_rap=[];
    for i=1:k
      vec_rap(i)=vec_k(i)/val_Z;
    endfor
    figure(2);
    plot(1:k,vec_rap);
    
    %Grafic 3
    vec_er=[];
    for i=1:k
      [A_k S Z] = task3(image, i);
      er=(A-A_k).^2;
      s =sum(er(:));
      vec_er(i)=s/(n_col*n_rows);
    endfor
    
    
    figure(3);
    plot(1:k,vec_er);
    
    
    %Grafic 4
    vec=[];
    for i=1:k
      val=0;
      val=((2*i)+1)/n_col;
      vec(i)=val;
    endfor
    figure(4);
    plot(1:k,vec);
end