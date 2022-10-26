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
this.axes.ClippingStyle = 'rectangle';

% --- Insert elements

% Track
this.track = rectangle(this.axes, ...
    FaceColor = this.window.theme.color.bar.background, ...
    EdgeColor = 'none', ...    
    ButtonDownFcn = @this.click);

% Bar
this.bar = rectangle(this.axes, ...
    FaceColor = this.window.theme.color.bar.highlight, ...
    EdgeColor = 'none', ...    
    ButtonDownFcn = @this.click);

switch this.orientation

  case 'horizontal'

    this.axes.YDir = 'reverse';

    % Start line
    this.start_line = line(this.axes, [1 1]*this.start, [0 0], ...
      Color = this.window.theme.color.figure.text, ...    
      LineStyle = '-', ...
      ButtonDownFcn = @this.click);

    % Stop line
    this.stop_line = line(this.axes, [1 1]*this.stop, [0 0], ...
      Color = this.window.theme.color.figure.text, ...    
      LineStyle = ':', ...
      ButtonDownFcn = @this.click);

  case 'vertical'

    % Start line
    this.start_line = line(this.axes, [0 0], [1 1]*this.start, ...
      Color = this.window.theme.color.figure.text, ...    
      LineStyle = '-', ...
      ButtonDownFcn = @this.click);

    % Stop line
    this.stop_line = line(this.axes, [0 0], [1 1]*this.stop, ...
      Color = this.window.theme.color.figure.text, ...    
      LineStyle = ':', ...
      ButtonDownFcn = @this.click);

end

% Display value
if this.text.display
  this.textval = text(this.axes, 0, 0, '', ...
    Color = this.window.theme.color.figure.text, ...
    FontName = 'monospaced', ...
    Clipping = 'on', ...
    ButtonDownFcn = @this.click);
end

% Set dynamic properties
this.toggle_mode(this.continuous);
this.resize;
this.scroll([],[],value=this.value);