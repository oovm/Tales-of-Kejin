Sum[i*p (1-p)^(i-1),{i,1,Ceiling[1/p]}]//FullSimplify
1/Sum[i*p (1-p)^(i-1),{i,1,k}]/.k->1/p
Plot[-(p/(-1+2 (1-p)^(1/p))),{p,0,1}]
