function name(this, varargin)

if isnumeric(varargin{1})

  % --- Single cell naming

  this.cell(varargin{1}, varargin{2}).name = varargin{3};

elseif iscell(varargin{1})

  % --- Batch naming

  name = varargin{1};

  % Check size
  if ~isequal(size(name), size(this.cell))
    error('UI:Layout:NameSize', 'The size of the cell of names (%i,%i) does not match the layout size (%i,%i).', ...
      size(name,1), ...
      size(name,2), ...
      size(this.cell,1), ...
      size(this.cell,2));
  end

  for i = 1:numel(this.cell)
    this.cell(i).name = name{i};
  end

end