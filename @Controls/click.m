function click(this, src, evt)

k = src.UserData;

switch this.Elm(k).type

  case 'edit'

    % Scrolling
    yL = this.axes.YLim;

    pos = this.Elm(k).cell.bkg.Position;
    ppos(1) = this.pos(1) + this.pos(3)*(1-pos(1)) - this.slider.width;
    ppos(2) = this.pos(2) + this.pos(4)*(1+yL(1)-pos(2)) - this.elm_height;
    ppos(3) = this.pos(3)*pos(3);
    ppos(4) = this.pos(4)*pos(4);

    switch evt.Button

      case 1

        C = uicontrol(this.window.figure, ...
          Style = 'edit', ...
          Position = ppos, ...
          String = this.Elm(k).cell.control.String, ...
          FontSize = this.window.fontsize.normal, ...
          BackgroundColor = this.window.theme.color.edit.background, ...
          ForegroundColor = this.window.theme.color.figure.text, ...
          UserData = k, ...
          callback = @this.edit);

        % Set focus
        uicontrol(C);
        
    end

  case 'button'

    switch evt.Button

      case 1

        % Notify click
        notify(this, 'clicked', UI.EventData(value=k));

        if this.Elm(k).value
          this.Elm(k).cell.bkg.FaceColor = this.window.theme.color.button.off;
          pause(0.1);
          this.Elm(k).cell.bkg.FaceColor = this.window.theme.color.button.on;
        else
          this.Elm(k).cell.bkg.FaceColor = this.window.theme.color.button.on;
          pause(0.1);
          this.Elm(k).cell.bkg.FaceColor = this.window.theme.color.button.off;
        end

      case 3

        % Toggle value
        this.Elm(k).value = ~this.Elm(k).value;

        % Notify toggle
        notify(this, 'toggled', UI.EventData(value=k));

        % Toggle button appearance
        if this.Elm(k).value
          this.Elm(k).cell.bkg.FaceColor = this.window.theme.color.button.on;
        else
          this.Elm(k).cell.bkg.FaceColor = this.window.theme.color.button.off;
        end
        
    end

end
