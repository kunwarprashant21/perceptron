function [W,accuracy] = perceptron()
% this is single layer perceptron, works on bi-polar inputs 
prompt = 'It will run for bi-polar inputs and bi-polar targets ,enter the X, the input matrix  ';

X = input(prompt)    % like for AND function [-1,-1; -1,1; 1,-1; 1,1]
prompt = 'enter the Y, the output vector  ';
y = input(prompt)     % like for AND [-1,-1,-1,1]

prompt = 'enter the number of epochs  ';
epoch = input(prompt)
prompt = 'enter the alpha, learning rate  ';
alpha = input(prompt);

m = length(y); % number of training examples
% adding 1's for bias 
X=[ones(m,1),X]; 

% X is of size m X n
n=size(X,2); 
% initializing the weight matrix
W= ones(n,1); % vector of one's

yin=zeros(m,1);
y_pred=zeros(m,1); % vector of zero's
for iter = 1:epoch,  % running for given epochs

   for i=1:m,        % for all m training examples
       
       yin(i)= X(i,:) * W;  % W contains bais b, at first position
       if yin(i)>=0,        % activation function,  threshold=0
           y_pred(i)=1;
       else,
          y_pred(i)=-1;
       end   
         
   endfor
   for i=1:m,
      if y_pred(i)!= y(i),   % if y_pred!= target then update the weights
         
         W = W + (X(i,:)*alpha*y(i))';  % W= W + alpha*y*X;
         
      endif  
   endfor  
    
endfor

y_pred   % printing results
W    
  
  
  
