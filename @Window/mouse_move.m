function mouse_move (this, ~, ~)

% Cursor position (pixel)
c = get (this.figure, 'CurrentPoint');

% Cursor position (relative)
C = c./this.figure.Position(3:4);

% --- Set current widget

for i = 1:numel(this.widget)

  % Skip layouts
  if isa(this.widget(i).object, 'UI.Layout')
    continue
  end

  % Get position
  P = this.widget(i).object.position;

  % Compare positions
  if C(1)>=P(1) && C(1)<=P(1)+P(3) && C(2)>=P(2) && C(2)<=P(2)+P(4)
    this.mouseover = i;
    return
  end

end

this.mouseover = [];