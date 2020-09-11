
A = [3 4 0 3 0;
     5 -4 3 -4 2;
     3 0 1 4 4;
     -1 -1 -3 -5 -3;
     -3 -5 -5 -3 1]
 
b = [23;0;42;-47;-35]
 

% matrice_test_A = rand(5)
% matrice_test_b = rand(5,1)
% resultat = gauss(matrice_test_A,matrice_test_b)
% bon_res = matrice_test_A\matrice_test_b


rep = gauss2(A,b)
disp(rep)

%rep2 = gauss2(A,b);
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


function x = gauss2(A,b)
   lignes = size(A,1)
   colones = size(A,2)
   if lignes ~= colones
       error('La matrice doit etre carre')
   elseif lignes ~= size(b,1) | size(b,2)~=1
       error('dimensions incompatibles')
   end
   
    %triangularisation
    B = [A,b]
    
    disp(B)
    for  i=1:colones-1
        disp('avant'); disp(B);
        M_lignes = max(abs(B(i:lignes,i:colones)),[],2);
        temp = B(i:lignes,i:colones);
        disp('les max');disp(M_lignes);
        for compteur = 1:length(M_lignes)
            temp(compteur,:) = temp(compteur,:)/M_lignes(compteur);
        end
        B(i:lignes,i:colones)=temp;
        M_col = find(Max(B(i:lignes,i)));
        disp('apr�s');disp(B);
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


function x = gauss3(A,b)
   lignes = size(A,1)
   colones = size(A,2)
   if lignes ~= colones
       error('La matrice doit etre carre')
   elseif lignes ~= size(b,1) | size(b,2)~=1
       error('dimensions incompatibles')
   end
   
    %triangularisation
    B = [A,b]
    
    disp(B)
    for  i=1:colones-1
        %disp('avant'); disp(B);
        M = max(abs(B(i,1:colones)),[],2);
        B(i,:) = B(i,:)/M;
        %disp('apr�s');disp(B);
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