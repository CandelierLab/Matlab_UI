classdef Text < handle
%{
Component:Text
%
%}

  % === PROPERTIES =========================================================

  properties

    tag

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
      function this = Text(text, arg)

        arguments
          text char
          arg.tag char = ''
        end

        this.text = text;
        this.tag = arg.tag;
        
      end

  end
    
end