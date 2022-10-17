function click(this, src, evt)

% --- Double-click

persistent tref
th_dclk = 0.2;
double_click = false;

if isempty(tref)
    tref = tic();
else
    dt = toc(tref);    
    if dt < th_dclk
      double_click = true;
    end
    tref = tic();
end

% --- Get cursor value
switch this.orientation
  case 'horizontal'
    p = evt.IntersectionPoint(1);
  case 'vertical'
    p = evt.IntersectionPoint(2);
end

% --- Actions

switch evt.Button

  case 1

    if this.continuous

      % Set start
      if double_click
        this.start = -Inf;
        this.stop = Inf;
      else
        this.start = p;
      end
      replace_start_stop(this);

    else

      % Restrain values in play range
      v = min(max(p*~double_click, this.start), this.stop);

      % Set scrolling position 
      this.scroll([],[], value=v);

    end

  case 2

    % Toggle continuous mode
    this.toggle_mode;

    if this.continuous
      this.scroll([],[], value=p);
      this.play.status = false;
    end

  case 3

    if this.continuous

      % Set stop
      if double_click
        this.start = -Inf;
        this.stop = Inf;
      else
        this.stop = p;
      end
      replace_start_stop(this);      

    else

      % Play/pause
      this.play.status = ~this.play.status;
      if this.play.status

        if this.value==min(this.stop, this.range(2))
          this.value = max(this.start, this.range(1));
        end

        this.scroll([],[], value=this.value);
      end

    end

end

end

% === MISC FUNCTIONS =======================================================

function replace_start_stop(this)

% --- Ensure start is before stop 

if this.stop<this.start

  tmp = this.start;
  this.start = this.stop;
  this.stop = tmp;

end

% --- Pace start & stop

switch this.orientation

  case 'horizontal'
    this.start_line.XData = [1 1]*this.start;
    this.stop_line.XData = [1 1]*this.stop;

  case 'vertical'
    this.start_line.YData = [1 1]*this.start;
    this.stop_line.YData = [1 1]*this.stop;

end

notify(this, 'set_limits',  UI.slider_data(value=[this.start this.stop]));

end