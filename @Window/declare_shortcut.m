function declare_shortcut(this, tag, desc)

arguments
  this
  tag char
  desc char
end

k = numel(this.shortlist) + 1 ;
this.shortlist(k).tag = tag;
this.shortlist(k).desc = desc;