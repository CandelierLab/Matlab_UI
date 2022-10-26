classdef Layout < handle
%{
Layout class
%
%}

     % === PROPERTIES =======================================================

    properties

      % Parent window
      window
      position = [0 0 1 1];

      % Orientation
      orientation = 'ij'

      % Constraints
      row
      col

      % Margins
      margin = 0
      padding = 0

      % Cells
      cell = struct(name={}, content={}, outer={}, inner={}, frame={})

    end

    properties (Access=protected)

      % Layout size
      Nr
      Nc

    end

    % === METHODS =========================================================

    methods

        % --- Constructor -------------------------------------------------
        function this = Layout(Nr, Nc, arg)

          arguments
            Nr double = 1
            Nc double = 1
            arg.name cell = {}
          end

          % Number of rows, cols
          this.Nr = Nr;
          this.Nc = Nc;

          % --- Size constraints

          tmp = struct(height={});
          for i = 1:this.Nr
            tmp(i).height = NaN;
          end
          this.row = tmp;

          tmp = struct(width={});
          for i = 1:this.Nc
            tmp(i).width = NaN;
          end
          this.col = tmp;

          % Set names
          this.names(arg.name);

        end

        % === Property setters =============================================

        % function set.row(this, value) 
        %   this.row = value;
        %   this.set_positions;
        % end

        % function set.col(this, value) 
        %   this.col = value;
        %   this.set_positions;
        % end

        % function set.padding(this, value) 
        %   this.padding = value;
        %   this.set_positions;
        % end

        % function set.margin(this, value) 
        %   this.margin = value;
        %   this.set_positions;
        % end

        % function set.position(this, value) 
        %   this.position = value;
        %   this.set_positions;
        % end
    end
    
end