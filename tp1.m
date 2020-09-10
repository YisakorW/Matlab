
A = [3 4 0 3 0;
     5 -4 3 -4 2;
     3 0 1 4 4;
     -1 -1 -3 -5 -3;
     -3 -5 -5 -3 1]
 
b = [23;0;42;-47;-35]
 
rep = gauss(A,b)
disp(rep)

function x = gauss(A,b)
   lignes = size(A,1)
   colones = size(A,2)
   if lignes ~= colones
       error('La matrice doit etre carre')
   elseif lignes ~= size(b,1) | size(b,2)~=1
       error('dimensions incompatibles')
   end

    %triangularisation
    B = [A,b]
    
    for  i=1:colones-1
        for j=i+1:lignes
            B(j,:) = B(j,:)-B(j,i)*B(i,:)/ B(i,i);
        end
    end
    disp(B)
  
    
    %remonte
     x=zeros(lignes,1);
     
     for i=lignes:-1:1
        x(i)= (B(i,lignes+1) - B(i,i+1:lignes)*x(i+1:end))/B(i,i)
     end
    
    
    
end %sol =A\b

% 
%  B = [A b]
%  
%  for i=2:5
%      B(i,:) = B(i,:)- B(i,1)/B(1,1)*B(1,:)
%  end
%  
%  for  i=1:4
%     for j=i+1:5
%         B(j,:) = B(j,:)-B(j,i)*B(i,:)/ B(i,i)
%     end    
%  end    