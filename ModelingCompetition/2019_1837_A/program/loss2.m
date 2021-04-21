function value1=loss2(long,a,b,k,kuan)
     w=acos(1/(1+k))/kuan;
    if(long<b-kuan)
       value1=a;
    elseif(long>=b-kuan && long<b+pi/(2*w))
        value1=(1+k)*a*cos(w*(long-b));
    else
        value1=0;
    end
end