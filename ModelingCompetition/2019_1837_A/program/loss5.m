function value1=loss5(long,a,b,k,kuan)
    if(long<b-kuan)
       value1=a;
    elseif(long>=(b-kuan) && long<=b)
        value1=(k/kuan)*a*(long-b+kuan)+a;
    else
        value1=0;
    end
end