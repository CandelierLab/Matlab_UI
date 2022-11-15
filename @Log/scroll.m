function scroll(this, ~, evt)

% --- Check mouseover
if isempty(this.window.mouseover) || this~=this.window.widget(this.window.mouseover).object || this.H<=1
  return
end

this.move([],[], value=this.slider.value+3*evt.value/numel(this.Elm));