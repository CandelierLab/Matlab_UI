function set_sizes(this, ~, ~)

this.axes.Units = 'pixel';
this.pos = this.axes.Position;
this.axes.Units = 'normalized';

ws = this.slider.width/this.pos(3);
wd = this.colSize(1)*(1-ws);
wc = this.colSize(2)*(1-ws);
wu = this.colSize(3)*(1-ws);
h = this.elm_height/this.pos(4);
this.H = h*numel(this.Elm);

for i = 1:numel(this.Elm)

  % this.Elm(i).cell.rect.Position = [0 (i-1)*h 1-ws h];

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
    traverseFcn = @this.scroll));

  this.slider.track.FaceColor = this.window.theme.color.bar.background; 
  this.scroll([],[], value=0);

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