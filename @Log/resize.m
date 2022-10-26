function resize(this, ~, ~)

this.axes.Units = 'pixel';
this.pos = this.axes.Position;
this.axes.Units = 'normalized';

w = this.slider.width/this.pos(3);
h = this.elm_height/this.pos(4);
this.H = h*numel(this.Elm);

for i = 1:numel(this.Elm)
  this.Elm(i).cell.rect.Position = [0 (i-1)*h 1-w h];
  switch this.Elm(i).cell.text.HorizontalAlignment
    case 'left'
      this.Elm(i).cell.text.Position = [0 (i-1/2)*h];
    case 'right'
      this.Elm(i).cell.text.Position = [1-w (i-1/2)*h];
  end
end

% Track
this.slider.track.Position = [1-w 0 w this.H];

% Activate scrolling if necessary
if this.H>1

  iptSetPointerBehavior(this.slider.track, struct( ...
    enterFcn = @activateTrack, ...
    exitFcn = @inactivateTrack, ...
    traverseFcn = @this.move));

  this.slider.track.FaceColor = this.window.theme.color.bar.background; 
  this.move([],[], value=1);

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