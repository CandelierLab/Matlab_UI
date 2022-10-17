classdef Text < handle
%{
Component:Text
%
%}

  % === PROPERTIES =========================================================

  properties

    % Figure
    window
    position
    
    % Text
    box
    text

    % Misc properties
    vertical = false
    margin = 0
    align = {'left', 'top'}
    
  end

  % === METHODS =========================================================

  methods

      % --- Constructor -------------------------------------------------
      function this = Text(text)

        this.text = text;
        
      end

  end
    
end