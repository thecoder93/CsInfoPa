function out = Main(immagine, min_area, algo)

blu = immagine(:,:,3);

bw = (blu == 0);

connex = bwlabel(bw,4);

n_comp = max(connex(:));

if algo == 2
	h = fspecial('gaussian',3,3);
	rosso = immagine(:,:,1);
	verde = immagine(:,:,2);
	rosso = imfilter(rosso,h);
	verde = imfilter(verde,h);
end

for q = 1 : n_comp
    [I,J] = find(connex == q);
    
    if length(I) >= min_area
        switch (algo)
            case 1
                blu = MediaRG(immagine, blu, I, J);
            case 2
                blu = MediaIntornoRG(immagine, rosso, verde, blu, I, J);
            case 3
                blu = PreviousPixel(immagine, blu, I, J, 1);
            case 4
                blu = PreviousPixel(immagine, blu, I, J, 2);
            case 5
                blu = PreviousPixelMean(immagine, blu, I, J);
            case 6
                blu = TopDownPixel(immagine, blu, I, J, 1);
            case 7
                blu = TopDownPixel(immagine, blu, I, J, 2);       
            case 8
                blu = TopDownPixelMean(immagine, blu, I, J);
        end
    end
    
end

immagine(:,:,3) = blu;


out = immagine;