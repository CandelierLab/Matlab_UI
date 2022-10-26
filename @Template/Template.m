classdef Template < handle
%{
Template class
%}

    % === PROPERTIES =======================================================

    properties
      
      % Layout
      layout

      % Widgets
      widget

    end

    % === METHODS =========================================================

    methods

        % --- Constructor -------------------------------------------------
        function this = Template(Nr, Nc, arg)

          arguments
            Nr double = 1
            Nc double = 1
            arg.name cell = {}
          end

          this.layout = UI.Layout(Nr, Nc, name=arg.name);

        end

        % --- Setters ------------------------------------------------------

        function set.layout(this, L)
          this.layout = L;
          if isa(this, 'UI.Window')
            this.layout.window = this;
          end
        end
    end

end
