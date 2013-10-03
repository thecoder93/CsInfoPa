function out=MediaRG(immagine, blu, I, J)
    
for q = 1 : length(I)
    blu(I(q), J(q))=fix((double(immagine(I(q),J(q),1))+double(immagine(I(q),J(q),2)))/2);
end

out=blu;