classdef List < handle
%{
Component:Selectable list class
%
% --- Events 
% The selectable list object can emit the following events:
%   - 'selection'
%
% --- Listeners
% The selectable list object can be set to listen to the following events:
%   - ''
%
%}

  % === EVENTS =============================================================

  events
    selection
  end

  % === PROPERTIES =========================================================

  properties

    % Figure
    window
    position
    
    % Axes
    axes

    % Selection
    mode = 'multiple'   % 'single', 'multiple'
    selected

    % Scrollbar
    slider = struct(width=15, value=0);

    % Dimension
    element = struct(height=16);
        
  end

  properties (Access=protected)
    
    % Elements
    Elm = struct(cell = {}, string = {}, value = {});

    % Sizes and conversions
    H
    pos

  end

  % === METHODS =========================================================

  methods

      % --- Constructor -------------------------------------------------
      function this = List()
        
      end

      % --- Setters --------------------------------------------------------
      function set.window(this, value)

        this.window = value;
        
        % Listeners
        addlistener(this.window, 'resize', @this.resize);

      end

  end
    
end