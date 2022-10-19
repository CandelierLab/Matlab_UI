function edit(this, src, evt)

k = src.UserData;

% Update value
this.Elm(k).cell.control.String = src.String;

this.Elm(k).value = str2double(src.String);
if isnan(this.Elm(k).value)
  this.Elm(k).value = src.String;
end

% Notify edit
notify(this, 'edited', UI.EventData(value=struct('idx', k, 'str', src.String)));

% Remove edit uicontrol
delete(src);

