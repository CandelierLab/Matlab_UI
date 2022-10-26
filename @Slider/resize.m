function resize(this, ~, ~)
% This function is triggered upon figure creation and each time 
% the window is resized.

this.axes.Units = 'pixel';
this.pospix = this.axes.Position;
this.axes.Units = 'normalized';

switch this.orientation

  case 'horizontal'

    this.axes.XLim = this.range;
    this.axes.YLim = [0 1];

    % Thickness
    th = this.thickness/this.pospix(4);

    % Text shift
    ts = this.text.shift/this.pospix(3);

    % Positions
    this.track.Position = [this.range(1) 0 diff(this.range) th];
    this.bar.Position = [this.range(1) 0 this.value-this.range(1) th];
    this.start_line.YData = [0 th];
    this.stop_line.YData = [0 th];
    if this.text.display
      this.textval.Position = [this.range(1)+ts th/2];
    end

  case 'vertical'

    this.axes.XLim = [0 1];
    this.axes.YLim = this.range;
    
    % Thickness
    th = this.thickness/this.pospix(3);

    % Text shift
    ts = this.text.shift/this.pospix(4);

    % Positions
    this.track.Position = [0 this.range(1) th diff(this.range)];
    this.bar.Position = [0 this.range(1) th this.value-this.range(1)];
    this.start_line.XData = [0 th];
    this.stop_line.XData = [0 th];
    if this.text.display
      this.textval.Rotation = 90;
      this.textval.Position = [th/2 this.range(1)+ts];
    end

    

end

