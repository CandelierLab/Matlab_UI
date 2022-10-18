function edit(this, src, evt)

% Update value
this.Elm(src.UserData).cell.control.String = src.String;

% Remove edit uicontrol
delete(src);