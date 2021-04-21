function value1=loss1(long,a,b,k,kuan)
    if(long<b-kuan)
       value1=a;
    elseif(long>=(b-kuan) && long<b)
        value1=(k/kuan)*a*(long-b+kuan)+a;
    elseif(long>=b && long<b+(1+1/k)*kuan)
        value1=(1+k)*a-(k*a/kuan)*(long-b);
    else
        value1=0;
    end
end