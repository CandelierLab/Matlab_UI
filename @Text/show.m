function show(this)

% --- Display --------------------------------------------------------------

% Create annotation

if this.vertical
  this.box = annotation(this.window.figure, 'textbox', ...
    Position = [this.position(1)+this.position(3) this.position(2) this.position([4 3])], ...
    Rotation = 90);
else
  this.box = annotation(this.window.figure, 'textbox', ...
    Position = this.position);
end

this.box.String = this.text;
this.box.FontSize = this.window.fontsize.normal;
this.box.FitBoxToText = false;
this.box.Color = this.window.theme.color.figure.text;
this.box.EdgeColor = 'none';
this.box.Margin = this.margin;
this.box.HorizontalAlignment = this.align{1};
this.box.VerticalAlignment = this.align{2};
