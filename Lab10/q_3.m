I = imread('img3.jpg');
BW=rgb2gray(I);
[B,L,N,A] = bwboundaries(BW); 
figure; imshow(BW); hold on; 
% Loop through object boundaries  
for k = 1:N 
    % Boundary k is the parent of a hole if the k-th column 
    % of the adjacency matrix A contains a non-zero element 
    if (nnz(A(:,k)) > 0) 
        boundary = B{k}; 
        plot(boundary(:,2),... 
            boundary(:,1),'r','LineWidth',2); 
        % Loop through the children of boundary k 
        for l = find(A(:,k))' 
            boundary = B{l}; 
            plot(boundary(:,2),... 
                boundary(:,1),'g','LineWidth',2); 
        end 
    end 
end