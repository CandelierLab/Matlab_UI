classdef Window < UI.Template
%{
Window class

--- Events
Objects of this class emit the following events:
  - 'resize' whenever the window is resized
  - 'shortcut' whenever a keyboard shortcut is activated
  - 'scroll' scroll event

--- Usage

W = UI.Window(1);

% Set theme ('light', 'dark' [default])
W.set_theme('light');

% Remove padding (default is 0.01)
W.prop.padding = NaN;

%}

    % === EVENTS ===========================================================

    events
      resize
      shortcut
      scroll
    end

    % === PROPERTIES =======================================================

    properties

      % Figure
      figure
      prop
      mouseover
      
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
        function this = Window(Nr, Nc, arg)

          arguments
            Nr double = 1
            Nc double = 1
            arg.name cell = {}
            arg.fid double = NaN
            arg.padding double = 0.01
          end

          % Call UI.Template constructor
          this = this@UI.Template(Nr, Nc, name=arg.name);

          % Default figure properties
          this.prop.id = arg.fid; 
          this.prop.title = 'UI Window';
          this.prop.fullscreen = false;
          this.prop.padding = arg.padding;

          % Layout padding
          if ~isnan(this.prop.padding)
            % this.layout.padding = this.prop.padding;
            % this.layout.margin = this.prop.padding;
          end

          % Default theme
          this.set_theme;            

          % Default shortcuts
          this.declare_shortcut('escape', 'Close the GUI');
          this.declare_shortcut('control+h', 'Print the GUI help (including list of shortcuts)');
          this.declare_shortcut('alt+l', 'Toggle the layout display');

        end

    end
    
end
