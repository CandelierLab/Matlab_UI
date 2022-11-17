function show(this)

% === FIGURE ===============================================================

% --- Figure
if isnan(this.prop.id)

  % New figure
  this.figure = figure(Menu='none', Toolbar='none');
  
else

  % Already existing figure
  this.figure = figure(this.prop.id);
  this.figure.MenuBar = 'none';
  this.figure.ToolBar = 'none';
  clf(this.figure);

end

% Misc
this.figure.DockControls = 'off';

% Title
this.figure.NumberTitle = 'off';
this.figure.Name = this.prop.title;

% Fullscreen
if this.prop.fullscreen
  this.figure.WindowState = 'fullscreen';
end

% Theme
this.figure.Color = this.theme.color.figure.background;

% Resize
this.figure.SizeChangedFcn = @(~,~) notify(this, 'resize');

% Shortcuts
this.figure.KeyPressFcn = @this.key_press;

% Mouse position
this.figure.WindowButtonMotionFcn = @this.mouse_move;

% Scroll wheel
this.figure.WindowScrollWheelFcn = @this.scroll_wheel;

% Mouse pointer management
iptPointerManager(this.figure);

% Display the menu
if isa(this.menu, 'UI.Menu')

  % Text color
  this.menu.color = this.theme.color.menu.item;

  this.menu.show(this.figure);

  % --- Theming

  % Java frame
  warning('off', 'MATLAB:ui:javaframe:PropertyToBeRemoved');
  jFrame = get(this.figure, 'JavaFrame');
  warning('on', 'MATLAB:ui:javaframe:PropertyToBeRemoved');

  % Menu bar
  jMB = jFrame.fHG2Client.getMenuBar;

  % Background
  jMB.setBackground(javax.swing.plaf.ColorUIResource(this.theme.color.menu.background(1), ...
  this.theme.color.menu.background(2), ...
  this.theme.color.menu.background(3)));

  % Border
  pause(0.005)
  jMB.setBorder(javax.swing.border.CompoundBorder);

end

% Compute inner and outer positions
this.layout.set_positions;

% Show all non-layout widgets
for i = 1:numel(this.widget)
  if ~isa(this.widget(i).object, 'UI.Layout')
    this.widget(i).object.show();
  end
end
