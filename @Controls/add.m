function out = add(this, type, description, arg)

arguments
  this
  type char
  description char
  arg.default double = 0    % For edit boxes
  arg.string char = ''      % For buttons
  arg.value logical = false % For buttons
  arg.units char = ''
  arg.callback = @(~,~) []
end

% --- Default behavior

k = numel(this.Elm) + 1;

this.Elm(k).cell = struct(desc=[], bkg=[], control=[], units=[]);
this.Elm(k).type = type;
this.Elm(k).description = description;
this.Elm(k).units = arg.units;
this.Elm(k).callback = arg.callback;
switch type
  case 'edit'
    this.Elm(k).default = arg.default;
    this.Elm(k).value = arg.default;
  case 'button'
    this.Elm(k).string = arg.string;
    this.Elm(k).value = arg.value;
end

if ~isempty(this.window)
  this.show_element(k);
end

if nargout
  out = k;
end