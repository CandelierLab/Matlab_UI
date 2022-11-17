classdef Controls < handle
%{ 
UI Controls class

Events:
  - edited (edit)
  - clicked (button)
  - toggled (button)

%}

  % === EVENTS =============================================================

  events
    edited
    clicked
    toggled
    selected
  end

  % === PROPERTIES =========================================================

  properties

    % Figure
    window
    position
    
    % Axes
    axes

    % Columns
    colSize = [0.5 0.4];
    slider = struct(width=15, value=0);
       
  end

  properties (Access=protected)
    
    % Elements
    Elm = struct(cell = {}, ...
      type = {}, ...
      description = {}, ...
      value = {}, ...
      string = {}, ...
      list = {}, ...
      units = {}, ...
      callback = {});

    % Sizes and conversions
    elm_height = 20
    H
    pos

  end

  % === METHODS =========================================================

  methods

      % --- Constructor -------------------------------------------------
      function this = Log()
        
      end

      % --- Setters --------------------------------------------------------
      function set.window(this, value)

        this.window = value;
        
        % Listeners
        addlistener(this.window, 'resize', @this.resize);

      end

  end
    
end