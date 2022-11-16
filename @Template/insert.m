function insert(this, obj, name, arg)

arguments
  this
  obj
  name char
  arg.rename logical = true
end

% === Checks ===============================================================

% --- Check that there is no element with this name

if ~isempty(this.widget)

  Names = {this.widget.name};

  if ismember(name, Names)
    error('UI:Template:Reassignation', 'The cell ''%s'' is already assigned.', name);
  end

end

% === Templates ============================================================

if isa(obj, 'UI.Template')

  % Insert layout
  this.insert(obj.layout, name, rename=arg.rename);

  % Insert widgets
  for i = 1:numel(obj.widget)
    this.insert(obj.widget(i).object, name + " > " + obj.widget(i).name);
  end

  return

end

% === Widgets ==============================================================

this.add_widget(obj, name);

% --- Parenting

if isa(this, 'UI.Window')
  if isprop(obj, 'window')
    obj.window = this;
  elseif isprop(obj, 'Parent')
    obj.Parent = this.figure;
  end
end

% --- Layout padding

if isa(obj, 'UI.Layout')

  % Default padding
  if ~isnan(this.prop.padding)
    obj.padding = this.prop.padding;
    obj.margin = 0;
  end

end

% --- Layout and index

% Find parent layout
k = strfind(name, ' > ');
if isempty(k)
  lay = this.layout;
else
  lay = this.widget(find(ismember(Names, name(1:k(end)-1)))).object;
end

% Find cell in layout
cellNames = arrayfun(@(x) convertStringsToChars(x.name), lay.cell, UniformOutput=false);
I = find(ismember(cellNames, name));

% Check cell existence
if isempty(I)
  error('UI:Template:place:find', 'Could not find the cell ''%s''', name);
end

% Assign content
lay.cell(I).content = obj;

% Rename sub-layout cells
if isa(obj, 'UI.Layout') && arg.rename
  obj.names({}, prefix = lay.cell(I).name+" > ");
end