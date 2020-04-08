function task2(image,k)
   A=double(imread(image));
   %Primul Grafic
   v=[];
   [A_k] = task1(image, k);
   [U_k,S_k,V_k]=svd(A_k);
   for i=1:k
     v(i)=S_k(i,i);
   endfor
    v=sort(v,"descend");
    figure(1);
    plot(1:k,v);
    
    %Al doilea Grafic
    n_rows=size(A,1);
    n_col=size(A,2);
    [U,S,V]=svd(A);
    m=min(n_rows,n_col);
    val_A=0;
    for i=1:m
      val_A+=S(i,i);
    endfor
    vec_k=[];
    val_k=0;
    for i=1:k
      val_k+=S_k(i,i);
      vec_k(i)=val_k;
    endfor
    vec_rap=[];
    for i=1:k
      vec_rap(i)=vec_k(i)/val_A;
    endfor
    figure(2);
    plot(1:k,vec_rap);
    
    %Al treilea grafic
    
    
    vec_er=[];
    for i=1:k
      A_k = task1(image,i);
      er=(A-A_k).^2;
      s =sum(er(:));
      
      vec_er(i)=s/(n_col*n_rows);
    endfor
    
    
    figure(3);
    plot(1:k,vec_er);
    
    %Al patrulea grafic
    
    vec=[];
    for i=1:k
      val=0;
      val=((n_rows*i)+(n_col*i)+i)/(n_col*n_rows);
      vec(i)=val;
    endfor
    figure(4);
    plot(1:k,vec);
      
end