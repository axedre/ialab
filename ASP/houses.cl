%% Dominio

% Casa
casa(1..5).

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

%% Vincoli impliciti

% Ogni casa ha uno ed un solo colore...
1 {coloreDi(X,C) : colore(C)} 1 :- casa(X).
% ...e due case con lo stesso colore sono la stessa casa
:- casa(X), casa(Y), coloreDi(X,C), coloreDi(Y,C), X != Y.

% In ogni casa abita una persona di una ed una sola nazionalità...
1 {nazionalitaDi(X,N) : nazionalita(N)} 1 :- casa(X).
% ...e due case con la persona della stessa nazionalità sono la stessa casa
:- casa(X), casa(Y), nazionalitaDi(X,N), nazionalitaDi(Y,N), X != Y.

% In ogni casa abita una persona che ama uno ed un solo animale...
1 {animaleDi(X,A) : animale(A)} 1 :- casa(X).
% ...e due case con la persona che ama lo stesso animale sono la stessa casa
:- casa(X), casa(Y), animaleDi(X,A), animaleDi(Y,A), X != Y.

% In ogni casa abita una persona che svolge una ed una sola professione...
1 {professioneDi(X,P) : professione(P)} 1 :- casa(X).
% ...e due case con la persona che svolge la stessa preofessione sono la stessa casa
:- casa(X), casa(Y), professioneDi(X,P), professioneDi(Y,P), X != Y.

% In ogni casa abita una persona che predilige una ed una sola bevanda...
1 {bevandaDi(X,B) : bevanda(B)} 1 :- casa(X).
% ...e due case con la persona che predilige la stessa bevanda sono la stessa casa
:- casa(X), casa(Y), bevandaDi(X,B), bevandaDi(Y,B), X != Y.

%% Convenzioni

% casa(1) è quella posta più a sinistra
% casa(5) è quella posta più a destra
% casa(X) è a destra di casa(Y) <=> X > Y
% casa(X) è a sinistra di casa(Y) <=> X < Y

%% Funzione di adiacenza

adj(X,Y) :- casa(X), casa(Y), |X-Y|==1.

%% Vincoli espliciti

% 1. L'inglese vive nella casa rossa
:- nazionalitaDi(X,inglese), coloreDi(X,C), C!=rossa.

% 2. Lo spagnolo possiede un cane
:- nazionalitaDi(X,spagnolo), animaleDi(X,A), A!=cane.

% 3. Il giapponese è un pittore
:- nazionalitaDi(X,giapponese), professioneDi(X,P), P!=pittore.

% 4. L'italiano beve tè
:- nazionalitaDi(X,italiano), bevandaDi(X,B), B!=te.

% 5. Il norvegese vive nella prima casa a sinistra
:- nazionalitaDi(X,norvegese), X!=1.

% 6. Il proprietario della casa verde beve caffè
:- bevandaDi(X,caffe), coloreDi(X,C), C!=verde.

% 7. La casa verde è immediatamente sulla destra di quella bianca
:- coloreDi(X,verde), coloreDi(Y,bianca), X!=Y+1.

% 8. Lo scultore alleva lumache
:- professioneDi(X,scultore), animaleDi(X,A), A!=lumache.

% 9. Il diplomatico vive nella casa gialla
:- professioneDi(X,diplomatico), coloreDi(X,C), C!=gialla.

% 10. Nella casa di mezzo si beve latte
:- bevandaDi(3,B), B!=latte.

% 11. La casa del norvegese è adiacente a quella blu
:- nazionalitaDi(X,norvegese), coloreDi(Y,blu), not adj(X,Y).

% 12. Il violinista beve succo di frutta
:- professioneDi(X,violinista), bevandaDi(X,B), B!=succo_di_frutta.

% 13. La volpe è nella casa adiacente a quella del dottore
:- animaleDi(X,volpe), professioneDi(Y,dottore), not adj(X,Y).

% 14. Il cavallo è nella casa adiacente a quella del diplomatico
:- animaleDi(X,cavallo), professioneDi(Y,diplomatico), not adj(X,Y).

%% Output

#hide.
#show coloreDi/2.
#show nazionalitaDi/2.
#show animaleDi/2.
#show professioneDi/2.
#show bevandaDi/2.
