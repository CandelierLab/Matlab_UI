clc

% --- Main window

W = UI.Window(3,2, fid=1);

W.layout.col(2).width = 0.3;
W.layout.cell(2,1).name = 'Sub';
W.layout.cell(1,2).name = 'spare';

T = UI.Template(2,2);

% L = UI.Layout(2,1);
% W.insert(L, 'Sub');


% --- Axes

% A = UI.Axes();
% W.insert(A, '3,1');

% % --- List widgets

X = UI.List();
for i = 1:10
  X.add_element(['Hello ' num2str(i)]);
end
W.insert(X, '1,1');

% --- Text

Z = UI.Text('Random text');
% Z.vertical = true;
T.insert(Z, '1,1');
% W.insert(Z, 'Sub > 1,1');

% --- Slider

S = UI.Slider();
T.insert(S, '2,1')

% --- Log

S = UI.Log();
S.add('title', 'Log console');
S.add('');
S.add('---');
S.add('section', 'Section 1');
S.add('Standard text here');

S.add('--date');

for i = 1:10
  S.add('Standard text too');
end

S.add('---');
S.add('Standard text again');
S.add('--date');

S.add('Standard text final');

W.insert(S, '3,1')

% --- Controls

C = UI.Controls;
C.colSize = [0.5 0.3];

C.add('edit', 'First edit box', default=18);
for i = 1:15
  C.add('button', "button " + i, string='Try me');
end
C.add('edit', 'Second edit box', units='ms');

W.insert(C, '2,2')

% --- Display

W.insert(T, 'Sub');

W.show

W.layout.show

% -------------

% --- TO DO
% UI.Image
% UI.Colorbar