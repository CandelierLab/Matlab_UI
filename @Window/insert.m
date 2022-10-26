function insert(this, obj, name, arg)

arguments
  this
  obj
  name char
  arg.rename logical = true
end

% --- Parenting

this.add_widget(obj, name);
if isprop(obj, 'window')
  obj.window = this;
  position = 'position';
elseif isprop(obj, 'Parent')
  obj.Parent = this.figure;
  position = 'Position';
end

if isa(obj, 'UI.Layout')

  % Default padding
  if ~isnan(this.prop.padding)
    obj.padding = this.prop.padding;
    obj.margin = 0;
  end

end

% --- Layout and index

L = {this.layout};

while true

  for i = 1:numel(L{1}.cell)

    % Sub-layouts
    if isa(L{1}.cell(i).content, 'UI.Layout')
      L{end+1} = L{1}.cell(i).content;
    end

    if strcmp(L{1}.cell(i).name, name)

      % --- Check that there is no element

      if ~isempty(L{1}.cell(i).content)
        error('UI:Window:Reassignation', ...
          'The cell ''%s'' is already assigned.', ...
          name);
      end

      % --- Insert element

      L{1}.cell(i).content = obj;
      obj.(position) = L{1}.cell(i).inner;

      % Rename sublayout cells
      if isa(obj, 'UI.Layout') && arg.rename
        obj.names({}, prefix=L{1}.cell(i).name+" > ");
      end
      
      return

    end

  end

  % Remove element
  L(1) = [];

  if isempty(L)
    error('UI:Window:place:find', 'Could not find the cell ''%s''', name);
  end


end