classdef Window < handle
%{
Window class
%
% --- Events
% Objects of this class emit the following events:
%   - 'resize' whenever the window is resized
%   - 'shortcut' whenever a keyboard shortcut is activated
%
%}

    % === EVENTS ===========================================================

    events
      resize
      shortcut
    end

    % === PROPERTIES =======================================================

    properties

      % Figure
      figure
      prop
      layout

      % Widgets
      widget   

      % Display
      theme

    end

    properties (Access=protected)

      % List of shortcuts
      shortlist

    end

    % === METHODS =========================================================

    methods

        % --- Constructor -------------------------------------------------
        function this = Window(figId)

          arguments
            figId = NaN
          end

          this.prop.id = figId;  

          % Default figure properties
          this.prop.title = 'UI Window';
          this.prop.fullscreen = false;
          this.prop.padding = NaN;

          % Default theme
          this.set_theme;            

          % Default shortcuts
          this.declare_shortcut('escape', 'Close the GUI');
          this.declare_shortcut('control+h', 'Print the GUI help (including list of shortcuts)');
          this.declare_shortcut('alt+l', 'Toggle the layout display');

        end

        % --- Setters ------------------------------------------------------

        function set.layout(this, L)
          this.layout = L;
          this.layout.window = this;
          if ~isnan(this.prop.padding)
            this.layout.padding = this.prop.padding;
            this.layout.margin = this.prop.padding;
          end
        end

    end
    


end
