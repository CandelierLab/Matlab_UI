function set_theme(this, tag)

arguments
  this
  tag char = 'dark'
end

% Set theme name
this.theme.name = tag;

switch tag

  case 'light'

    this.theme.color.figure.background = grey(0.95);
    this.theme.color.figure.text = grey(0.20);
    this.theme.color.figure.layout = [0.75 0 0.75];

    this.theme.color.axis = grey(0.3);

    this.theme.color.element.background = grey(0.85);
    this.theme.color.element.selected = grey(0.7);

    this.theme.color.bar.inactive = grey(0.9);
    this.theme.color.bar.background = grey(0.8);
    this.theme.color.bar.highlight = [100 175 175]/255;

  case 'dark'

    this.theme.color.figure.background = grey(0);
    this.theme.color.figure.text = grey(0.65);
    this.theme.color.figure.layout = [1 0.75 0];

    this.theme.color.axis = grey(0.8);

    this.theme.color.edit.background = grey(0.2);
    this.theme.color.button.off = grey(0.2);
    this.theme.color.button.on = grey(0.3);
    this.theme.color.select.background = grey(0.25);

    this.theme.color.element.background = grey(0.15);
    this.theme.color.element.selected = grey(0.3);

    this.theme.color.bar.inactive = grey(0.1);
    this.theme.color.bar.background = grey(0.4);
    this.theme.color.bar.highlight = [0 80 120]/255;

    this.theme.color.log.background = grey(0.05);
    this.theme.color.log.title = [37 109 133]/255;
    this.theme.color.log.section = [71 181 255]/255;
    this.theme.color.log.date = [167 210 203]/255;

end

end

% === FUNCTIONS ============================================================

function rgb = grey(v)
  rgb = [1 1 1]*v;
end