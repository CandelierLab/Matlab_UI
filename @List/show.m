function show(this)

if ~isempty(this.axes)
  delete(this.axes);
end

% --- Checks ---------------------------------------------------------------

if strcmp(this.mode, 'single') && numel(this.selected)>1
  warning('UI:List:tooManySelected', ...
    ['More than one element is selected while the List is in ''single'' mode.\n' ...
    'Only the first element (' num2str(this.selected(1)) ') is kept.']);
  this.selected = this.selected(1);
end

if any(this.selected<1 | this.selected>numel(this.Elm))
  warning('UI:List:outOfRange', ...
    ['Some elements are out of the acceptable range [1,' ...
    num2str(numel(this.Elm)) ']. Incorrect values are changed to boundary values']);
  this.selected(this.selected<1) = 1;
  this.selected(this.selected>numel(this.Elm)) = numel(this.Elm);
  this.selected = unique(this.selected);
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

for i = 1:numel(this.Elm)

  this.Elm(i).cell.rect = rectangle(this.axes, ...
    EdgeColor = 'none', ...    
    ButtonDownFcn = @this.click, ...
    UserData = i);

  if any(this.selected==i)
    this.Elm(i).cell.rect.FaceColor = this.window.theme.color.element.selected;
  else
    this.Elm(i).cell.rect.FaceColor = this.window.theme.color.element.background;
  end

  this.Elm(i).cell.text = text(this.axes, 0, 0, ...
    this.Elm(i).string, ...
    Margin = 1, ...
    Color = this.window.theme.color.figure.text, ...
    FontName = 'monospaced', ...
    Clipping = 'on', ...
    ButtonDownFcn = @this.click, ...
    UserData = i);

end

% Slider track
this.slider.track = rectangle(this.axes, ...
  EdgeColor = 'none');

% Set dynamic properties
this.resize;