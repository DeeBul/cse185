function [output, match] = template_matching_normcorr(I1, template, threshold)
output = I1;
shift_u = size(template, 1);
shift_v = size(template, 2);

for u = 1 + shift_u : size(I1, 2) - shift_u
    for v = 1 + shift_v : size(I1, 1) - shift_v
 
        x1 = u - floor(shift_u / 2);
        x2 = u + floor(shift_u / 2);
        y1 = v - floor(shift_v / 2);
        y2 = v + floor(shift_v / 2);  

        patch = I1(y1:y2, x1:x2);
        
        newPatch = patch(:);
        newTemplate = template(:);
        
        newPatch = newPatch - mean(newPatch);
        newTemplate = newTemplate - mean(newTemplate);
        
        newPatch = newPatch / norm(newPatch);
        newTemplate = newTemplate / norm(newTemplate);
        
        normcorr = dot(newPatch, newTemplate);
        
        output(v, u) = normcorr;
        
    end
end

match = (output > threshold);
end


        