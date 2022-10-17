function show(this)

% === FIGURE ===============================================================

% --- Figure
if isnan(this.prop.id)

  % New figure
  this.figure = figure(Menu='none', Toolbar='none');

else

  % Already existing figure
  this.figure = figure(this.prop.id);
  this.figure.MenuBar ='none';
  this.figure.ToolBar='none';
  clf(this.figure);

end

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
this.figure.KeyPressFcn = @this.KeyPress;


% Mouse pointer management
iptPointerManager(this.figure);

% Show all non-layout widgets
for i = 1:numel(this.widget)
  if ~isa(this.widget(i).object, 'UI.Layout')
    this.widget(i).object.show();
  end
end
