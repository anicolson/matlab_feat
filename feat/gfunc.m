function G = gfunc(xi, gamma, gain, cdm)
% GFUNC - computes a gain function.
%
% Input/s:
%	xi - a priori SNR.
%	gamma - a posteriori SNR.
%	gain - gain function.
%   cdm - constructive-deconstructive mask.
%
% Output/s:
%	G - gain function.
%
%% FILE:           gfunc.m
%% DATE:           2018
%% AUTHOR:         Aaron Nicolson
%% AFFILIATION:    Signal Processing Laboratory, Griffith University
%% BRIEF:          Computes gain function.
%
%% REFERENCE/S
%
%   [1] Ephraim, Y. and Malah, D., 1984. Speech enhancement using a minimum
%   -mean square error short-time spectral amplitude estimator. IEEE
%   Transactions on acoustics, speech, and signal processing, 32(6),
%   pp.1109-1121.
%
%   [2] Ephraim, Y. and Malah, D., 1985. Speech enhancement using a minimum
%   mean-square error log-spectral amplitude estimator. IEEE transactions
%   on acoustics, speech, and signal processing, 33(2), pp.443-445.
%
%   [3] Loizou, P.C., 2005. Speech enhancement based on perceptually motivated
%   Bayesian estimators of the magnitude spectrum. IEEE Transactions on
%   Speech and Audio Processing, 13(5), pp.857-869.

%% GAIN
    switch gain % gain.
        case 'ibm'
            G = xi > 1; % Ideal Binary Mask (IBM), 0 dB threshold (10^(0/10) = 1).
        case 'wf'
            G = xi./(xi + 1); % Wiener Filter (WF).
        case 'srwf'
            G = sqrt(xi./(xi + 1)); % Square-root Wiener Filter (WF).
        case 'cwf'
            xi = sqrt(xi);
            G = (xi./(xi + 1)); % Speech Presence Probability (SPP).
        case 'mmse-stsa'
            xi = max(xi, 1e-12); % cannot have xi <= 0.
            gamma = max(gamma, 1e-12); % cannot have gamma <= 0.
            nu = (xi./(1 + xi)).*gamma;
            G = (sqrt(pi)./2)*(sqrt(nu)./gamma).*exp(-nu./2).* ...
                ((1 + nu).*besseli(0, nu./2) + nu.*besseli(1, nu./2)); % MMSE-STSA [1].
            G_WF = xi./(1 + xi);
            [i, j] = find(isnan(G) | isinf(G)); % replace by Wiener gain.
            G(i, j) = G_WF(i, j); % Wiener gain.
        case 'mmse-lsa'
            xi = max(xi, 1e-12); % MMSE-LSA cannot have xi = 0.
            gamma = max(gamma, 1e-12); % MMSE-LSA cannot have gamma = 0.
        	  nu = (xi./(1 + xi)).*gamma;
            G = (xi./(1 + xi)).*exp(0.5*expint(nu)); % MMSE-LSA [2].
        case 'pmmse'
            % xi = min(xi, 1400); % clip a priori SNR.
            nu = (xi./(1 + xi)).*gamma;
            G = (sqrt(nu)./(sqrt(pi).*gamma)).*(exp(nu./2)./besseli(0, nu./2)); % pMMSE [3].
        case 'dgwf'
            G = zeros(size(xi));
            G_minus = (xi - (2/pi)*sqrt(xi))./(xi + 1 - (4/pi).*sqrt(xi));
            G_plus = (xi + (2/pi)*sqrt(xi))./(xi + 1 + (4/pi).*sqrt(xi));
            G(~cdm) = G_minus(~cdm);
            G(cdm) = G_plus(cdm);
        case 'lblg'
            G = zeros(size(xi));
            G_minus = (xi - 0.5*sqrt(xi))./(xi + 1 - sqrt(xi));
            G_plus = (xi + 0.5*sqrt(xi))./(xi + 1 + sqrt(xi));
            G(~cdm) = G_minus(~cdm);
            G(cdm) = G_plus(cdm);
        case 'nblg'
            G = zeros(size(xi));
            v_1 = exp(sqrt((2*gamma)./xi));
            v_2 = exp(-sqrt((2*gamma)./xi));
            v_3 = exp(sqrt(2*gamma)); % correct.
            v_4 = exp(-sqrt(2*gamma)); % correct.
            v_5 = 1./(1 + sqrt(xi)); % correct.
            v_6 = 1./(1 - sqrt(xi)); % correct.
            v_7 = sqrt(xi./(2*gamma)); % correct.
            G_minus = (v_2./(v_2 + v_4)) + v_7.*v_5.*((v_2 - v_4)./(v_2 + v_4));
            G_plus = v_7.*v_6 - (v_3./(v_1 - v_3));
            G(~cdm) = G_minus(~cdm);
            G(cdm) = G_plus(cdm);
        case 'dmmse'
            G = zeros(size(xi));
            G_WF = xi./(xi + 1);
            num = exp(-gamma./(2*xi.*(1 + xi))) - exp(-(gamma.*xi)./(2*(1 + xi)));
            den_1 = erfc(gamma./(2*xi.*(1+xi))) + erfc(sqrt(gamma.*xi./(2*(1+xi))));
            den_2 = erf(sqrt(gamma./(2*xi.*(1+xi)))) + erf(sqrt(gamma.*xi./(2*(1+xi))));
            G_minus = G_WF - sqrt(G_WF).*sqrt(2./(pi.*gamma)).*(num./den_1);
            G_plus = G_WF + sqrt(G_WF).*sqrt(2./(pi.*gamma)).*(num./den_2);
            G(~cdm) = G_minus(~cdm);
            G(cdm) = G_plus(cdm);
        otherwise
            error('Unknown option.')
        end
end
%% EOF
