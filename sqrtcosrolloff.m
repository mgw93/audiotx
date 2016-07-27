function g = sqrtcosrolloff( t, alpha )
%
% sqrt-cos-roll-off impulse
% Course "Digital Communications"
% (C) Prof. Dr. R. Fischer / NT, Uni Ulm
%

% %% sqrt(cos)-roll-off pulse
g = zeros(size(t));
g = (4*alpha*t.*cos(pi*(1+alpha)*t) + ...
    sin(pi*(1-alpha)*t))./(pi*t.*(1-(4*alpha*t).^2));

% limit for t=0
it = find( abs(t)<1e-8 ); g(it) = (4*alpha+pi*(1-alpha))/pi;

% limits for t=+/- 1/(4*alpha)
it = find( abs(t-1/(4*alpha))<1e-8 );
g(it) = (4*alpha*cos(pi*(1+alpha)/4/alpha) ...
        - pi*(1+alpha)*sin(pi*(1+alpha)/4/alpha) ...
        + pi*(1-alpha)*cos(pi*(1-alpha)/4/alpha)) / (-2*pi);
it = find( abs(t+1/(4*alpha))<1e-8 );
g(it) = (4*alpha*cos(pi*(1+alpha)/4/alpha) ...
        - pi*(1+alpha)*sin(pi*(1+alpha)/4/alpha) ...
        + pi*(1-alpha)*cos(pi*(1-alpha)/4/alpha)) / (-2*pi);
