function select(this, src, ~)

k = src.UserData;

% Update value
this.Elm(k).value = src.Value;
this.Elm(k).string = src.String{src.Value};
this.Elm(k).cell.control.String = this.Elm(k).string;

% Notify edit
notify(this, 'selected', UI.EventData(value=struct('idx', k, 'val', src.Value)));

% Remove edit uicontrol
delete(src);