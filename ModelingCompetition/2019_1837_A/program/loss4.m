function value1=loss4(long,a,b,k,kuan)
     w=acos(1/(1+k))/kuan;
    if(long<b-kuan)
       value1=a;
    elseif(long>=b-kuan && long<=b)
       value1=(1+k)*a*cos(w*(long-b));    
    else
        value1=0;
    end
end