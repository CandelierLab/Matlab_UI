function click(this, src, evt)

k = src.UserData;

pos = this.Elm(k).cell.bkg.Position;
ppos(1) = this.pos(1) + this.pos(3)*(1-pos(1)) - this.slider.width;
ppos(2) = this.pos(2) + this.pos(4)*(1-pos(2)) - this.elm_height;
ppos(3) = this.pos(3)*pos(3);
ppos(4) = this.pos(4)*pos(4);

switch evt.Button

  case 1

    C = uicontrol(this.window.figure, ...
      Style = 'edit', ...
      Position = ppos, ...
      String = this.Elm(k).cell.control.String, ...
      BackgroundColor = this.window.theme.color.edit.background, ...
      ForegroundColor = this.window.theme.color.figure.text, ...
      UserData = k, ...
      callback = @this.edit);

end

uicontrol(C);

% Emit event
% notify(this, 'selection');