% Numero
numero(1..5).

% Colore
colore(rossa;verde;bianca;gialla;blu).

% Nazionalità
nazionalita(inglese;spagnolo;giapponese;italiano;norvegese).

% Animale
animale(cane;lumache;volpe;cavallo;zebra).

% Professione
professione(pittore;scultore;diplomatico;violinista;dottore).

% Bevanda
bevanda(te;caffe;latte;succo_di_frutta;altro).

% Casa
casa(X, C, N, A, P, B) :-
    numero(X),
    colore(C),
    nazionalita(N),
    animale(A),
    professione(P),
    bevanda(B).

% 1. L’inglese vive nella casa rossa.
casa(X, C, N, A, P, B) :-
    numero(X),
    colore(C),
    nazionalita(N),
    animale(A),
    professione(P),
    bevanda(B),
    C = rosso,
    N = inglese.

%*1 {casa(X, C, N, A, P, B) : colore(C), nazionalita(N)} 1 :-
    colore(rossa),
    nazionalita(inglese). *%

%*
    % 2. Lo spagnolo possiede un cane.
    :- nazionalita(spagnolo), animale(A), A != cane.

    % 3. Il giapponese è un pittore.
    :- nazionalita(giapponese), professione(P), P != pittore.

    % 4. L’italiano beve tè.
    :- nazionalita(italiano), bevanda(B), B != te.

    % 5. Il norvegese vive nella prima casa a sinistra.
    :- nazionalita(norvegese), numero(X), X != 1.

    % 6. Il proprietario della casa verde beve caffè.
    :- colore(verde), bevanda(B), B != caffe.

    % 7. La casa verde è immediatamente sulla destra di quella bianca.

    % 8. Lo scultore alleva lumache.
    :- professione(scultore), animale(A), A != lumache.

    % 9.  Il diplomatico vive nella casa gialla.
    :- professione(diplomatico), colore(C), C != gialla.

    % 10. Nella casa di mezzo si beve latte.
    :- numero(3), bevanda(B), B != latte.

    % 11. La casa del norvegese è adiacente a quella blu.
    %:- colore(blu)
    % 12. Il violinista beve succo di frutta.
    % 13. La volpe è nella casa adiacente a quella del dottore.
    % 14. Il cavallo è nella casa adiacente a quella del diplomatico


    %:- nazionalita(X1, inglese), colore(X2, rossa), X1 != X2.
*%
%*
    colore(X, rossa) :- nazionalita(X, inglese).
    nazionalita(X, spagnolo) :- animale(X, cane).
    nazionalita(X, giapponese) :- professione(X, pittore).
    nazionalita(X, italiano) :- bevanda(X, te).
    nazionalita(X, norvegese) :- numero(X, 1).
    % Il proprietario della casa verde beve caffè.
    % La casa verde è immediatamente sulla destra di quella bianca.
    professione(X, scultore) :- animale(X, lumache).
    professione(X, diplomatico) :- colore(X, gialla).
    % Nella casa di mezzo si beve latte.
    % La casa del norvegese è adiacente a quella blu.
    professione(X, violinista) :- colore(X, succo_di_frutta).
    % La volpe è nella casa adiacente a quella del dottore.
    % Il cavallo è nella casa adiacente a quella del diplomatico
*%

% KB
% c(_, rossa, inglese, _, _, _).
% c(_, _, spagnolo, _, _, cane).
% c(_, _, giapponese, pittore, _, _).
% c(_, _, italiano, _, te, _).
% c(NNorv, _, norvegese, _, _, _).
% c(NV, verde, _, _, caffe, _).
% c(NBi, bianca, _, _, _, _).
% c(_, _, _, scultore, _, lumache).
% c(_, gialla, _, diplomatico, _, _).
% c(3, _, _, _, latte, _).
% 11?
% c(_, _, _, violinista, succo_di_frutta, _).
% 13?

% Regole
% NB :- NV + 1.
% NNorv :- 1.
% NBl :- 

#hide.
#show casa/6.