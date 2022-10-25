function cm = french(n, arg)

arguments
  n double = 64
  arg.exponent = 3/4
end

if mod(n,2)==0
  z = ones(n/2,1);
  v = linspace(0,1, n/2).^(arg.exponent)';
  cm = [ v v z ; z flipud(v) flipud(v) ];
else
  z = ones((n-1)/2,1);
  v = linspace(0,1, (n-1)/2).^(arg.exponent)';
  cm = [ v v z ; 1 1 1 ; z flipud(v) flipud(v) ];
end
