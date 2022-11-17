function show(this, parent)

arguments
  this
  parent
end

this.uimenu = uimenu(parent);
this.uimenu.Text = this.text;
this.uimenu.ForegroundColor = this.color;