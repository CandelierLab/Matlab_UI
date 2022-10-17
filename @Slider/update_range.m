function update_range(this)

this.value = min(max(this.value, this.range(1)), this.range(2));

if this.start <= this.range(1) || this.start >= this.range(2)
  this.start = -Inf;
end
    
if this.stop <= this.range(1) || this.stop >= this.range(2)
  this.stop = Inf;
end

if ~isempty(this.window)
  this.set_sizes;
  this.scroll([],[],value=this.value);
end