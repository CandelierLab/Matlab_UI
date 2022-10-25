function show(this)

if ~isempty(this.axes)
  delete(this.axes);
end

% --- Display --------------------------------------------------------------

% Create axes
this.axes = axes(this.window.figure, ...
  Units = 'normalized', ...
  Position = this.position);

% Remove the axes toolbar
this.axes.Toolbar.Visible = 'off';

disableDefaultInteractivity(this.axes);
this.axes.Visible = 'off';
this.axes.XLim = [0 1];
this.axes.YLim = [0 1];
this.axes.YDir = 'reverse';
this.axes.ClippingStyle = 'rectangle';

% Scroll listener
addlistener(this.window, 'scroll', @this.scroll);

% --- Insert elements

for k = 1:numel(this.Elm)
  this.show_element(k, update=false);
end

% Slider track
this.slider.track = rectangle(this.axes, ...
  EdgeColor = 'none');

% Set dynamic properties
this.set_sizes;