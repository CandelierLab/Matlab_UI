function add_element(this, str, val)

arguments
  this
  str char
  val double = NaN
end

k = numel(this.Elm) + 1;

this.Elm(k).cell = struct(rect=[], text=[]);
this.Elm(k).string = str;
if isnan(val)
  this.Elm(k).value = k;
else
  this.Elm(k).value = val;
end