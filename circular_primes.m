function out = circular_primes(n)
% The function finds the number of circular prime numbers smaller than n,
% where n is a positive integer scalar input argument. For example, the
% number, 197, is a circular prime because all rotations of its digits (197,
% 971, and 719) are themselves prime. For instance, there are thirteen such
% primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
% Note that rotation means circular permutation not all possible permutations.

amount=0;
pr=primes(n-1);
if length(num2str(n))==1
    for i=n-1:-1:1
        if isprime(i)
            amount=amount+1;
        end
    end
    out=amount;
else
    for i=1:length(pr)
        i_str=num2str(pr(i));
        if length(i_str)==1
            amount=amount+1;
        else
            permutations=[pr(i)];
            for j=1:length(i_str)-1
                k=i_str(1);
                i_str(1)='';
                new_i=strcat(i_str,k);
                permutations=[permutations,str2num(new_i)];
                i_str=new_i;
            end
            logicals=[];
            for m=1:length(permutations)
                logics=isprime(permutations(m));
                logicals=[logicals,logics];
            end
            if sum(logicals)==length(permutations)
                amount=amount+1;
            end
        end
    end
end
out=amount;
end