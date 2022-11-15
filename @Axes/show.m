function show(this)

if ~isempty(this.axes)
  delete(this.axes);
end

% --- Display --------------------------------------------------------------

% Create axes
this.axes = axes(this.window.figure, ...
  Units = 'normalized', ...
  OuterPosition = this.position);

% Theme
this.axes.Color = this.window.theme.color.figure.background;
this.axes.XAxis.Color = this.window.theme.color.axis;
this.axes.YAxis.Color = this.window.theme.color.axis;
this.axes.ZAxis.Color = this.window.theme.color.axis;

% Font
this.axes.FontSize = UI.font_size();

% Misc
this.axes.Box = true;
grid(this.axes, 'on');
hold(this.axes, 'on');
