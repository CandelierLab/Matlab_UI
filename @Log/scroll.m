function scroll(this, ~, p, arg)

arguments
  this
  ~
  p
  arg.value double = NaN
end

if isnan(arg.value)
  arg.value = 1-(p(2)-this.pos(2))/this.pos(4);
end

this.axes.YLim = max(0, min(1, arg.value))*(this.H-1) + [0 1];