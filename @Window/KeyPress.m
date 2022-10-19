function input = KeyPress(this, varargin)

K = varargin{2};

if isempty(K.Modifier)
    input = K.Key;
else
    m = join(K.Modifier,'+');
    input =  [m{1} '+' K.Key];
end

% --- General shortcuts
switch input

  case {'control+control', 'shift+shift', 'alt+alt', ...
    'shift+control+shift', 'shift+control+control'}
    % Dummmy inputs: do nothing
        
  case 'escape'

    % Quit viewer
    close(this.figure)
        
  case 'control+h'        

    % Print shortcuts
    this.print('help');

  case 'alt+l'

    % Display layout
    this.layout.show;

  otherwise

    % Emit event
    notify(this, 'shortcut', UI.EventData(value=input));

end


