s=0;a=0;for(u=1;u<1000000;++u){f=1;n=u;while(n!=1){if(n%2==0)n/=2;else{n=3*n+1}++f}if(f>s){a=u;s=f}}console["log"](a)
