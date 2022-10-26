function set_positions(this)

arguments
  this
end

% --- Checks ---------------------------------------------------------------

if isempty(this.col)
  return
end

% --- Computation ----------------------------------------------------------

% --- Column width

W = [this.col.width];
W(isnan(W)) = (1-sum(W(~isnan(W))))/nnz(isnan(W));
W = W*this.position(3);

% --- Row heigths

H = [this.row.height];
H(isnan(H)) = (1-sum(H(~isnan(H))))/nnz(isnan(H));
H = H*this.position(4);

% --- Cell positions

for i = 1:this.Nr

  switch this.orientation

    case 'xy'

      % --- Vertical position

      if i==1
        y = this.position(2);
      else
        y = this.position(2) + sum(H(1:i-1));
      end

      % --- Vertical margins

      if i==1
        md = this.margin;
      else
        md = this.padding/2;
      end

      if i==this.Nr
        mu = this.margin;
      else
        mu = this.padding/2;
      end

    case 'ij'

      % --- Vertical position

      y = this.position(2) + this.position(4) - sum(H(1:i));

      % --- Vertical margins

      if i==1
        mu = this.margin;
      else
        mu = this.padding/2;
      end

      if i==this.Nr
        md = this.margin;
      else
        md = this.padding/2;
      end

  end

  for j = 1:this.Nc

    % --- Horizontal position

    if j==1
      x = this.position(1);
    else
      x = this.position(1) + sum(W(1:j-1));
    end

    % --- Horizontal margins
    if j==1
      ml = this.margin;
    else
      ml = this.padding/2;
    end

    if j==this.Nc
      mr = this.margin;
    else
      mr = this.padding/2;
    end

    this.cell(i,j).outer = [x y W(j) H(i)];
    this.cell(i,j).inner = [x+ml y+md W(j)-ml-mr H(i)-md-mu];

    % --- Update sublayouts
    if isa(this.cell(i,j).content, class(this))
      this.cell(i,j).content.set_positions;
    end

  end

end