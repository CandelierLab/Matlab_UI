function print(this, what)

arguments
  this
  what char     % 'shortcuts'
end

switch what

  case 'help'

    clc
    this.print('shortcuts');

  case 'shortcuts'

    % Get largest tag
    W = max(cellfun(@numel, {this.shortlist.tag})) + 1;

    fprintf('--- Shortcuts -----------------\n\n');

    for i = 1:numel(this.shortlist)
      fprintf('[%s]%s%s\n', ...
      this.shortlist(i).tag, ...
      repmat(' ', [1 W-numel(this.shortlist(i).tag)]), ...
      this.shortlist(i).desc);
    end
    
end