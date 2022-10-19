clc

% --- Main window

W = UI.Window(1);
% W.set_theme('light');

W.prop.padding = 0.01;

% --- Layouts

L = UI.Layout(3,2, ...
  {'cA' 'cB' ; 'cC' 'cE' ; 'cF' 'cG'});

L.row(1).height = 0.2;
L.col(2).width = 0.4;

W.layout = L;

L2 = UI.Layout(2, 2, {'sA' 'sB' ; 'sC' 'sD'});
W.insert(L2, 'cC');

% --- Axes

A = UI.Axes();
W.insert(A, 'cG');

% --- List widgets

X = UI.List();
for i = 1:10
  X.addElement(['Hello ' num2str(i)]);
end
W.insert(X, 'cA');

% --- Text

T = UI.Text('Random text');
% T.vertical = true;
W.insert(T, 'sD');

% --- Slider

% S = UI.Slider();
% W.insert(S, 'cF')

% --- Log

% S = UI.Log();
% S.add('title', 'Log console');
% S.add('');
% S.add('---');
% S.add('section', 'Section 1');
% S.add('Standard text here');

% S.add('--date');

% for i = 1:10
%   S.add('Standard text too');
% end

% S.add('---');
% S.add('Standard text again');
% S.add('--date');

% S.add('Standard text final');

% W.insert(S, 'cF')

% --- Form

C = UI.Controls;
C.colSize = [0.5 0.3];

C.add('edit', 'First edit box', default=18);
for i = 1:15
  C.add('button', "button " + i, string='Try me');
end
C.add('edit', 'Second edit box', units='ms');

W.insert(C, 'cF')

% --- Display

W.show

% -------------

% --- TO DO
% UI.Image
% UI.Colorbar