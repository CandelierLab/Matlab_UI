classdef Menu

  % === PROPERTIES =========================================================

  properties

    % Menu iterm
    text
    accelerator
    callback
    checked = 'off';
    separator = 'off';
    color

    % Structure
    uimenu
    children

  end

  % === METHODS ============================================================

  methods

    % --- Contructor -------------------------------------------------------
    function this = Menu(text)

      arguments
        text char
      end

      this.text = text;

    end

  end

end