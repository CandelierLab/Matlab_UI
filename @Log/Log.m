classdef Log < handle
%{
UI Log class
%
%}

  % === PROPERTIES =========================================================

  properties

    tag

    % Figure
    window
    position
    
    % Axes
    axes

    % Scrollbar
    slider = struct(width=15, value=1);
       
  end

  properties (Access=protected)
    
    % Elements
    Elm = struct(cell = {}, type = {}, string = {});

    % Sizes and conversions
    elm_height = 16
    H
    pos

  end

  % === METHODS =========================================================

  methods

      % --- Constructor -------------------------------------------------
      function this = Log(arg)

        arguments
          arg.tag char = ''
        end

        this.tag = arg.tag;
        
      end

      % --- Setters --------------------------------------------------------
      function set.window(this, value)

        this.window = value;
        
        % Listeners
        addlistener(this.window, 'resize', @this.resize);

      end

  end
    
end