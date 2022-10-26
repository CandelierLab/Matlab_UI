clc

% --- Main window

W = UI.Window(3,2, fid=1);

W.layout.col(2).width = 0.3;
W.layout.cell(1,2).name = 'spare';

L = UI.Layout(2, 1);
W.insert(L, '2,1');

W.layout.padding = W.prop.padding;
W.layout.margin = W.prop.padding;

% % --- Axes

% A = UI.Axes();
% W.insert(A, 'sC');

% % --- List widgets

% X = UI.List();
% for i = 1:10
%   X.addElement(['Hello ' num2str(i)]);
% end
% W.insert(X, 'cA');

% % --- Text

% T = UI.Text('Random text');
% % T.vertical = true;
% W.insert(T, 'cB');

% % --- Slider

% % S = UI.Slider();
% % W.insert(S, 'cF')

% % --- Log

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

% % --- Controls

% % C = UI.Controls;
% % C.colSize = [0.5 0.3];

% % C.add('edit', 'First edit box', default=18);
% % for i = 1:15
% %   C.add('button', "button " + i, string='Try me');
% % end
% % C.add('edit', 'Second edit box', units='ms');

% % W.insert(C, 'cF')

% --- Display

W.show

W.layout.show

% -------------

% --- TO DO
% UI.Image
% UI.Colorbar