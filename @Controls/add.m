function out = add(this, type, description, arg)

arguments
  this
  type char
  description char
  arg.value = NaN
  arg.string char = ''      % For buttons
  arg.list cell = {}        % For select
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

    if isnan(arg.value)
      arg.value = 0;
    end

    this.Elm(k).value = arg.value;

  case 'button'

    if isnan(arg.value)
      arg.value = false;
    end

    this.Elm(k).string = arg.string;
    this.Elm(k).value = arg.value;

  case 'select'

    if isempty(arg.list)
      error('UI:Control:emptySelectList', 'Empty list for select element ''%s''.', description);
    end

    if isnan(arg.value)
      arg.value = 1;
    end

    this.Elm(k).list = arg.list;
    this.Elm(k).string = arg.list{arg.value};
    this.Elm(k).value = arg.value;

end

if ~isempty(this.window)
  this.show_element(k);
end

if nargout
  out = k;
end