classdef Slider < handle
%{
Component:Slider class
%
% --- Events 
% The slider object can emit the following events:
%   - 'value'
%
%}

  % === EVENTS =============================================================

  events
    set_value
    set_limits
  end

  % === PROPERTIES =========================================================

  properties

    % Figure
    window
    position
    
    % Axes
    axes

    % Values
    value = 0
    range = [0 1]
    start = -Inf
    stop = Inf

    % Dimension & orientation
    orientation = 'horizontal'
    thickness = 20

    % Display value
    text = struct(display=true, format='%.02f', shift=15)

    % Mode
    continuous = true
    play = struct(status=false, dt=0.04, dval=0.02, repeat=true);   
    % NB: dval is the amount of value to play per dt (sec)

  end

  properties (Access=protected)
    
    % Components
    track
    bar
    start_line
    stop_line
    textval

    pospix


  end

  % === METHODS =========================================================

  methods

      % --- Constructor -------------------------------------------------
      function this = Slider()
        
      end

      % --- Setters --------------------------------------------------------
      function set.window(this, value)

        this.window = value;
        
        % Listeners
        addlistener(this.window, 'resize', @this.set_sizes);

      end

      function set.range(this, value)
        this.range = value;
        this.update_range;
      end

  end
    
end