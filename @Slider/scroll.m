function scroll(this, ~, p, arg)

arguments
  this
  ~
  p
  arg.value double = NaN
end

bpos = this.bar.Position;

switch this.orientation

  case 'horizontal'

    % --- Set value

    if isnan(arg.value)
      arg.value = this.range(1) + (p(1)-this.pospix(1))/this.pospix(3)*diff(this.range);
    end
    
    this.value = min(max(arg.value, this.range(1)), this.range(2));

    % --- Update elemnts

    % Bar size
    bpos(3) = this.value - this.range(1);

  case 'vertical'

    % --- Set value

    if isnan(arg.value)
      arg.value = this.range(1) + (p(2)-this.pospix(2))/this.pospix(4)*diff(this.range);
    end
    
    this.value = min(max(arg.value, this.range(1)), this.range(2));

    % --- Update elemnts

    % Bar size
    bpos(4) = this.value - this.range(1);


end

% Update bar size
this.bar.Position = bpos;

% Update text value
if this.text.display
  this.textval.String = num2str(this.value, this.text.format);
end

notify(this, 'set_value',  UI.EventData(value=this.value));

% --- Play
if ~this.continuous && this.play.status

  v = this.value+this.play.dval;
  vmax = min(this.stop, this.range(2));
  if v>vmax

    this.play.status = false;
    this.scroll([],[], value = vmax);  

    if this.play.repeat
      pause(0.1);
      this.play.status = true;
      this.scroll([],[], value = max(this.start, this.range(1)));  
    end
    
  else
    pause(this.play.dt);
    this.scroll([],[], value = v);
  end

end