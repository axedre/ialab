%Dominio
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

%Vincoli impliciti
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

%Convenzioni
%*
    casa(X) è a destra di casa(Y) <=> X > Y
    casa(X) è a sinistra di casa(Y) <=> X < Y
*%

%Vincoli espliciti
%*
    1. L’inglese vive nella casa rossa =>
        se la persona di nazionalità inglese vive nella casa X, la casa X è rossa
        se la casa X è rossa, vi abita la persona di nazionalità inglese
*%
:- casa(X), nazionalitaDi(X,inglese), coloreDi(X,C), C!=rossa.
:- casa(X), nazionalitaDi(X,N), coloreDi(X,rossa), N!=inglese.

%*
    2. Lo spagnolo possiede un cane =>
        se la persona di nazionalità spagnola vive nella casa X, la casa X è abitata dalla persona che ama i cani
        se la casa X è abitata dalla persona che ama i cani, vi abita la persona di nazionalità spagnola
*%
:- casa(X), nazionalitaDi(X,spagnolo), animaleDi(X,A), A!=cane.
:- casa(X), nazionalitaDi(X,N), animaleDi(X,cane), N!=spagnolo.

%*
    3. Il giapponese è un pittore =>
        se la persona di nazionalità giapponese vive nella casa X, la casa X è abitata dalla persona che svolge la professione di pittore
        se la casa X è abitata dalla persona che svolge la professione di pittore, vi abita la persona di nazionalità giapponese
*%
:- casa(X), nazionalitaDi(X,giapponese), professioneDi(X,P), P!=pittore.
:- casa(X), nazionalitaDi(X,N), professioneDi(X,pittore), N!=giapponese.

%*
    4. L’italiano beve tè =>
        se la persona di nazionalità italiana vive nella casa X, la casa X è abitata dalla persona che predilige il tè
        se la casa X è abitata dalla persona che predilige il tè, vi abita la persona di nazionalità italiana
*%
:- casa(X), nazionalitaDi(X,italiano), bevandaDi(X,B), B!=te.
:- casa(X), nazionalitaDi(X,N), bevandaDi(X,te), N!=italiano.

%*
    5. Il norvegese vive nella prima casa a sinistra =>
        se la persona di nazionalità norvegese vive nella casa X, la casa X è la prima
        se la casa X è la prima, vi abita la persona di nazionalità norvegese
*%
:- casa(X), nazionalitaDi(X,norvegese), X!=1.
:- casa(X), X=1, nazionalitaDi(X,N), N!=norvegese.

%*
    6. Il proprietario della casa verde beve caffè =>
        se la persona che predilige il caffè vive nella casa X, la casa X è verde
        se la casa X è verde, vi abita la persona che predilige il caffè
*%
:- casa(X), bevandaDi(X,caffe), coloreDi(X,C), C!=verde.
:- casa(X), bevandaDi(X,B), coloreDi(X,verde), B!=caffe.

%*
    7. La casa verde è immediatamente sulla destra di quella bianca =>
        se la casa X è sulla destra della casa Y, la casa X è verde e la casa Y è bianca
        se la casa X è verde e la casa Y è bianca, la casa X è sulla destra della casa Y
*%
:- casa(X), casa(Y), X=Y+1, coloreDi(X,verde), coloreDi(Y,C2), C2!=bianca.
:- casa(X), casa(Y), X=Y+1, coloreDi(X,C1), coloreDi(Y,bianca), C1!=verde.
:- casa(X), casa(Y), coloreDi(X,verde), coloreDi(Y,bianca), X!=Y+1.

%*
    8. Lo scultore alleva lumache =>
        se la persona che svolge la professione di scultore vive nella casa X, la casa X è abitata dalla persona che ama le lumache
        se la casa X è abitata dalla persona che ama le lumache, vi abita la persona che svolge la professione di scultore
*%
:- casa(X), professioneDi(X,scultore), animaleDi(X,A), A!=lumache.
:- casa(X), professioneDi(X,P), animaleDi(X,lumache), P!=scultore.

%*
    9.  Il diplomatico vive nella casa gialla =>
        se la persona che svolge la professione di diplomatico vive nella casa X, la casa X è gialla
        se la casa X è gialla, vi abita la persona che svolge la professione di diplomatico
*%
:- casa(X), professioneDi(X,diplomatico), coloreDi(X,C), C!=gialla.
:- casa(X), professioneDi(X,P), coloreDi(X,gialla), P!=diplomatico.

%*
    10. Nella casa di mezzo si beve latte =>
        se la casa X è situata in mezzo, la casa X è abitata dalla persona che predilige il latte
        se la casa X è abitata dalla persona che predilige il latte, la casa X è situata in mezzo
*%
:- casa(X), X=3, bevandaDi(X,B), B!=latte.
:- casa(X), bevandaDi(X,latte), X!=3.

%*
    11. La casa del norvegese è adiacente a quella blu =>
        se la persona di nazionalità norvegese vive nella casa X e la casa X è adiacente alla casa Y, la casa Y è blu
        se la casa Y è blu e la casa X è adiancente ad essa, la casa X è abitata dalla persona di nazionalità norvegese
*%
:- casa(X), casa(Y), nazionalitaDi(X,norvegese), abs(X-Y)==1, coloreDi(Y,C), C!=blu.
:- casa(X), casa(Y), nazionalitaDi(X,N), abs(X-Y)==1, coloreDi(Y,blu), N!=norvegese.

%*
    12. Il violinista beve succo di frutta =>
        se la persona che svolge la professione di violinista vive nella casa X, la casa X è abitata dalla persona che predilige il succo di frutta
        se la casa X è abitata dalla persona che predilige il succo di frutta, vi abita la persona che svolge la professione di violinista
*%
:- casa(X), professioneDi(X,violinista), bevandaDi(X,B), B!=succo_di_frutta.
:- casa(X), professioneDi(X,P), bevandaDi(X,succo_di_frutta), P!=violinista.

%*
    13. La volpe è nella casa adiacente a quella del dottore =>
        se la persona che ama le volpi vive nella casa X e la casa X è adiacente alla casa Y, la casa Y è abitata dalla persona che svolge la professione di dottore
        se la casa Y è abitata dalla persona che svolge la professione di dottore e la casa X è adiancente ad essa, la casa X è abitata dalla persona che ama le volpi
*%
:- casa(X), casa(Y), animaleDi(X,volpe), abs(X-Y)==1, professioneDi(Y,P), P!=dottore.
:- casa(X), casa(Y), animaleDi(X,A), abs(X-Y)==1, professioneDi(Y,dottore), A!=volpe.

%*
    14. Il cavallo è nella casa adiacente a quella del diplomatico =>
        se la persona che ama i cavalli vive nella casa X e la casa X è adiacente alla casa Y, la casa Y è abitata dalla persona che svolge la professione di diplomatico
        se la casa Y è abitata dalla persona che svolge la professione di diplomatico e la casa X è adiancente ad essa, la casa X è abitata dalla persona che ama i cavalli
*%
:- casa(X), casa(Y), animaleDi(X,cavallo), abs(X-Y)==1, professioneDi(Y,P), P!=diplomatico.
:- casa(X), casa(Y), animaleDi(X,A), abs(X-Y)==1, professioneDi(Y,diplomatico), A!=cavallo.

#hide.
#show coloreDi/2.
#show nazionalitaDi/2.
#show animaleDi/2.
#show professioneDi/2.
#show bevandaDi/2.
