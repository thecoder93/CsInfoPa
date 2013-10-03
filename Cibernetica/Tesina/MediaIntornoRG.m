function out=MediaIntornoRG(immagine, rosso, verde, blu, I, J)

for q = 1 : length(I)
    blu(I(q), J(q)) = fix( ( double(rosso(I(q),J(q))) + double(verde(I(q),J(q))) ) / 2);
end

out=blu;