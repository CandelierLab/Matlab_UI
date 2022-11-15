function show(this, mode, root, arg)

arguments
  this
  mode char = 'inner'     % 'inner', 'outer'
  root logical = true
  arg.font_size double = []
end

% --- Display settings

if isempty(arg.font_size)
  arg.font_size = UI.font_size('large');
end

% --- Window title

if root
  if isempty(this.cell(1).frame)
    this.window.figure.NumberTitle = 'on';
  else
    this.window.figure.NumberTitle = 'off';
  end
end

% --- Layout cells contours

for i = 1:numel(this.cell)

  % Inner layout
  if isa(this.cell(i).content, class(this))

    this.cell(i).content.show(mode, false);

  else

    if isempty(this.cell(i).frame)
      
      % Current cell
      this.cell(i).frame = annotation(this.window.figure, 'textbox', ...
        Position = this.cell(i).(mode), ...
        String = this.cell(i).name, ...
        FontSize = arg.font_size, ...
        FitBoxToText = 'off', ...
        HorizontalAlignment = 'center', ...
        VerticalAlignment = 'middle', ...
        Color = this.window.theme.color.figure.layout, ...
        EdgeColor = this.window.theme.color.figure.layout, ...
        LineStyle = ':');

    else

      delete(this.cell(i).frame);
      this.cell(i).frame = [];

    end

  end

end
