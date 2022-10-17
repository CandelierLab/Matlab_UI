function set_sizes(this, ~, ~)

this.axes.Units = 'pixel';
this.pos = this.axes.Position;
this.axes.Units = 'normalized';

w = this.slider.width/this.pos(3);
h = this.element.height/this.pos(4);
this.H = h*numel(this.Elm);

for i = 1:numel(this.Elm)

  this.Elm(i).cell.rect.Position = [0 (i-1)*h 1-w h];
  this.Elm(i).cell.text.Position = [0, (i-1/2)*h];

end

% Track
this.slider.track.Position = [1-w 0 w this.H];
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