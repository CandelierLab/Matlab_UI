classdef Controls < handle
%{
UI Controls class
%
%}

  % === PROPERTIES =========================================================

  properties

    % Figure
    window
    position
    
    % Axes
    axes

    % Columns
    colSize = [0.5 0.4 0.1];
    slider = struct(width=15);
       
  end

  properties (Access=protected)
    
    % Elements
    Elm = struct(cell = {}, ...
      type = {}, ...
      description = {}, ...
      default = {}, ...
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
        addlistener(this.window, 'resize', @this.set_sizes);

      end

      function set.colSize(this, value)

        this.colSize = value;
        if numel(this.value)==2
          this.colSize(end+1) = 0;
        end
        
      end

  end
    
end