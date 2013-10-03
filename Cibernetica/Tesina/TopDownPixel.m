function out=TopDownPixel(immagine, blu, I, J, c)

k = 1;

while k <= length(J)
    sopra_col = J(k);
    if I(k) > 1
        sopra_riga = I(k)-1;
        sopra_diff = double(blu(sopra_riga, sopra_col)) - double(immagine(sopra_riga, sopra_col , c));
    end
    t = k;
    temp = find (J>sopra_col);
    if (numel(temp) == 0)
        k = length(J);
    else
        k = temp(1) - 1;
    end
    if I(k) < length(blu(:,1))
        sotto_riga = I(k)+1;
        sotto_col = J(k);
        sotto_diff = double(blu(sotto_riga, sotto_col)) - double(immagine(sotto_riga, sotto_col , c));
    else
        sotto_diff = sopra_diff;
    end
    if I(t) == 1
        sopra_diff = sotto_diff;
    end
    meta = ceil((k-t)/2);
    for i = 0 : meta - 1
       blu(I(t+i), J(t+i))=double(immagine(I(t+i), J(t+i), c)) + sopra_diff;
       blu(I(k-i), J(k-i))=double(immagine(I(k-i), J(k-i), c)) + sotto_diff;
    end
    if mod(k-t,2) == 0
           blu(I(t+meta), J(t+meta))=double(immagine(I(t+meta), J(t+meta), c)) + sopra_diff;
    end
    k = k + 1;
end

out=blu;