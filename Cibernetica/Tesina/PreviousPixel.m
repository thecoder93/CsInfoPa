function out=PreviousPixel(immagine, blu, I, J, c)

if I(1)==1
    temp=find(blu(:,J(1))>0);
    index=temp(1);
else
    index=I(1)-1;
end
    
diff = double(blu(index, J(1))) - double(immagine(index,J(1), c));

for q = 1 : length(I)
    blu(I(q), J(q))=double(immagine(I(q), J(q), c)) + diff;
end

out=blu;