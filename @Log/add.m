function add(this, type, str)

arguments
  this
  type char
  str char = ''
end

% --- Default behavior

k = numel(this.Elm) + 1;

this.Elm(k).cell = struct(rect=[], text=[]);
if isempty(str)
  this.Elm(k).type = 'normal';
  this.Elm(k).string = type;
else
  this.Elm(k).type = type;
  this.Elm(k).string = str;
end

% --- Shorthand notation

switch this.Elm(k).string

  case '---'
    this.Elm(k).string = repmat('―', [1 20]);

  case '--date'
    this.Elm(k).type = 'date';
    this.Elm(k).string = string(datetime) + ' ';

end


if ~isempty(this.window)
  this.show_element(k);
end