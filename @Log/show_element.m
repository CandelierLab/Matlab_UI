function show_element(this, k, arg)

arguments
  this
  k double
  arg.update = true
end

% --- Styling --------------------------------------------------------------

prop = struct();
prop.color = this.window.theme.color.figure.text;
prop.size = 10;
prop.weight = 'normal';
prop.angle = 'normal';
prop.alignment = 'left';

switch this.Elm(k).type

  case 'title'
    prop.color = this.window.theme.color.log.title;
    prop.size = 12;
    prop.weight = 'bold';

  case 'section'
    prop.color = this.window.theme.color.log.section;
    prop.angle = 'italic';

  case 'date'
    prop.color = this.window.theme.color.log.date;
    prop.angle = 'italic';
    prop.alignment = 'right';
    
end

% --- Insert element -------------------------------------------------------

this.Elm(k).cell.rect = rectangle(this.axes, ...
  EdgeColor = 'none', ...
  FaceColor = this.window.theme.color.log.background);

this.Elm(k).cell.text = text(this.axes, 0, 0, ...
  this.Elm(k).string, ...
  Margin = 1, ...
  Color = prop.color, ...
  FontName = 'monospaced', ...
  FontSize = prop.size, ...
  FontWeight = prop.weight, ...
  FontAngle = prop.angle, ...
  HorizontalAlignment = prop.alignment, ...
  Clipping = 'on');

% Reset dynamic properties
if arg.update
  this.resize;
end