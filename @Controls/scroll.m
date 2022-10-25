function scroll(this, ~, evt)

% --- Check mouseover
if isempty(this.window.mouseover) || this~=this.window.widget(this.window.mouseover).object
  return
end

this.move([],[], value=this.slider.value+2*evt.value/numel(this.Elm));