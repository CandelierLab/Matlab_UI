function add(this, type, description, arg)

arguments
  this
  type char
  description char
  arg.default double = 0
  arg.units char = ''
  arg.callback = @(~,~) []
end

% --- Default behavior

k = numel(this.Elm) + 1;

this.Elm(k).cell = struct(desc=[], bkg=[], control=[], units=[]);
this.Elm(k).type = type;
this.Elm(k).description = description;
this.Elm(k).default = arg.default;
this.Elm(k).units = arg.units;
this.Elm(k).callback = arg.callback;

if ~isempty(this.window)
  this.show_element(k);
end