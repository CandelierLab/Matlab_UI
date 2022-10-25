function cm = french(n)

arguments
  n double = 64
end

if mod(n,2)==0
  cm = [flipud(1-hot(n/2)) ; flipud(hot(n/2))];
else
  cm = [flipud(1-hot((n-1)/2)) ; 1 1 1; flipud(hot((n-1)/2))];
end
