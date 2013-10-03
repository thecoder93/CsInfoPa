function out=PreviousPixelMean(immagine, blu, I, J)

if I(1)==1
    temp=find(blu(:,J(1))>0);
    index=temp(1);
else
    index=I(1)-1;
end
    
diff = double(blu(index, J(1))) - fix((double(immagine(index,J(1),1))+double(immagine(index,J(1),2)))/2);

for q = 1 : length(I)
    blu(I(q), J(q))=fix((double(immagine(I(q),J(q),1)) + double(immagine(I(q),J(q),2)))/2) + diff;
end

out=blu;