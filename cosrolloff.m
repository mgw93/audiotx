function g = cosrolloff( t, alpha )
%
% cos-roll-off impulse
% Course "Digital Communications"
% (C) Prof. Dr. R. Fischer / NT, Uni Ulm
%

% %% cos-roll-off pulse
g = zeros(size(t));
g = cos(pi*alpha*t)./(1-(2*alpha*t).^2).*sin(pi*t)./t/pi;
% limit for t=0 
it = find( abs(t)<1e-8 ); g(it) = 1;
% limits for t=+/- 1/(2*alpha)
it = find( abs(t-1/(2*alpha))<1e-8 ); g(it) = alpha/2*sin(pi/2/alpha);
it = find( abs(t+1/(2*alpha))<1e-8 ); g(it) = alpha/2*sin(pi/2/alpha);
