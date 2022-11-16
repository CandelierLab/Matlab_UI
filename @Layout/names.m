function names(this, names, arg)
% Batch naming

arguments
  this
  names cell = {}
  arg.prefix string = ""
end

if isempty(names)

  % --- Automatic names --------------------------------------------------

  names = cell(this.Nr, this.Nc);
  for i = 1:this.Nr
    for j = 1:this.Nc
      names{i,j} = arg.prefix + i + "," + j;
    end
  end

else

  % --- User-defined names -----------------------------------------------

  % Check size
  if ~isempty(this.cell) && ~isequal(size(names), size(this.cell))
    error('UI:Layout:NameSize', 'The size of the cell of names (%i,%i) does not match the layout size (%i,%i).', ...
      size(names,1), ...
      size(names,2), ...
      size(this.cell,1), ...
      size(this.cell,2));
  end

end

% --- Name assignment ------------------------------------------------------

for i = 1:this.Nr
  for j = 1:this.Nc
    this.cell(i,j).name = names{i,j};
  end
end
