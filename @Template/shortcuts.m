function shortcuts(this, ~, evt)
% UI.Template.shortcuts
% 
% By default, this method is just passing the shortcut event to subtemplates.
% In applications, this method can be overloaded to define the actions 
% associated with the different shortcuts.
%
% NB: Please also declare each shortcuts with the 'declare_shortcut' method
% in the template constructor.

% --- Shortcuts definition -------------------------------------------------

% switch evt.value
%   case ''
% end

% --- Events ---------------------------------------------------------------

% Emit event (necessary to pass the shortcut to subtemplates)
notify(this, 'shortcut', UI.EventData(value=evt.value));