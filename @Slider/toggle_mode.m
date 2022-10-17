function toggle_mode(this, mode)

arguments
  this
  mode logical = ~this.continuous
end

% Set mode
this.continuous = mode;

% Point behavior
if this.continuous

  pB = struct( ...
    enterFcn = @this.scroll, ...
    exitFcn = [], ...
    traverseFcn = @this.scroll);

  else

  pB = struct( ...
    enterFcn = [], ...
    exitFcn = [], ...
    traverseFcn = []);
  
end

iptSetPointerBehavior(this.track, pB);
iptSetPointerBehavior(this.bar, pB);
iptSetPointerBehavior(this.start_line, pB);
iptSetPointerBehavior(this.stop_line, pB);
if this.text.display
  iptSetPointerBehavior(this.textval, pB);
end