function resize(this, ~, ~)

this.axes.Units = 'pixel';
this.pos = this.axes.Position;
this.axes.Units = 'normalized';

ws = this.slider.width/this.pos(3);
wd = this.colSize(1)*(1-ws);
wc = this.colSize(2)*(1-ws);
wu = (1-this.colSize(1)-this.colSize(2))*(1-ws);
h = this.elm_height/this.pos(4);
this.H = h*numel(this.Elm);

for i = 1:numel(this.Elm)

  % --- Description

  this.Elm(i).cell.desc.Position = [0 (i-1/2)*h];

  % --- Control

  this.Elm(i).cell.bkg.Position = [wd (i-1)*h wc h];
  this.Elm(i).cell.control.Position = [wd+wc/2 (i-1/2)*h];

  % --- Units

  this.Elm(i).cell.units.Position = [wd+wc (i-1/2)*h];

end

% Track
this.slider.track.Position = [1-ws 0 ws this.H];

% Activate scrolling if necessary
if this.H>1

  iptSetPointerBehavior(this.slider.track, struct( ...
    enterFcn = @activateTrack, ...
    exitFcn = @inactivateTrack, ...
    traverseFcn = @this.move));

  this.slider.track.FaceColor = this.window.theme.color.bar.background; 
  this.move([],[], value=this.slider.value);

else

  iptSetPointerBehavior(this.slider.track, struct( ...
    enterFcn = [], ...
    exitFcn = [], ...
    traverseFcn = []));

  this.slider.track.FaceColor = this.window.theme.color.bar.inactive;
  
end

  % === Nested functions ===================================================

  function activateTrack(varargin)
    this.slider.track.FaceColor = this.window.theme.color.bar.highlight;
  end

  function inactivateTrack(varargin)
    this.slider.track.FaceColor = this.window.theme.color.bar.background;
  end

end