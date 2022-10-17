function click(this, src, evt)

switch evt.Button

  case 1

    k = src.UserData;
    if any(this.selected==k)

      this.selected(this.selected==k) = [];
      this.Elm(k).cell.rect.FaceColor = this.window.theme.color.element.background;

    else

      switch this.mode

        case 'multiple'

          this.selected(end+1) = k;
          this.Elm(k).cell.rect.FaceColor = this.window.theme.color.element.selected;    
          
        case 'single'

          % Unselect previously selected item
          if ~isempty(this.selected)
            this.Elm(this.selected).cell.rect.FaceColor = this.window.theme.color.element.background;
          end

          % Select item
          this.selected = k;
          this.Elm(k).cell.rect.FaceColor = this.window.theme.color.element.selected;
          
      end     

    end

  case 2

    this.selected = [];
    for k = 1:numel(this.Elm)
      this.Elm(k).cell.rect.FaceColor = this.window.theme.color.element.background;
    end

end

% Emit event
notify(this, 'selection');