function declare_shortcut(this, tag, desc)
% UI.Template.declare_shortcut
% 
% Declare a shortcut, for display in the help.
%
% NB: The code associated to each shortcut is defined in the 'shortcuts' method.

arguments
  this
  tag char
  desc char
end

k = numel(this.shortlist) + 1 ;
this.shortlist(k).tag = tag;
this.shortlist(k).desc = desc;