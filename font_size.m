function out = font_size(desc)

arguments
  desc char = 'normal'
end

screen = get(0, 'MonitorPositions');
n = screen(3)/1000;
  
switch desc

  case 'normal'
    out = round(10 + n);

  case 'large'
    out = round(10 + 2*n);

end
    