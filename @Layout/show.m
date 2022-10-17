function show(this, mode)

arguments
  this
  mode char = 'inner'     % 'inner', 'outer'
end

for i = 1:numel(this.cell)

  % Inner layout
  if isa(this.cell(i).content, class(this))

    this.cell(i).content.show(mode);

  else

    if isempty(this.cell(i).frame)
      
      % Current cell
      this.cell(i).frame = annotation(this.window.figure, 'textbox', ...
        Position = this.cell(i).(mode), ...
        String = this.cell(i).name, ...
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
