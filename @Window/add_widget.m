function add_widget(this, widget, name)

arguments
  this
  widget
  name char
end

% --- Add widget

k = numel(this.widget) + 1;
this.widget(k).name = name;
this.widget(k).object = widget;
