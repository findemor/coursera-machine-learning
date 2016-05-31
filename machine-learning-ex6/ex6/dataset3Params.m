function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

posibilidades = [ 0.01 0.03 0.1 0.3 1 3 10 30 ];

n = length(posibilidades);

error = zeros(n); %matriz de errores

auxMin_error = Inf
auxMin_c = 0;
auxMin_s = 0;

for c=1:n
	C = posibilidades(c);
	
	for s=1:n
		sigma = posibilidades(s);

		c
		s

		%entrenamos la SVM como en la primera parte del examen
		model = svmTrain(X, y, C, @(x1,x2) gaussianKernel(x1,x2,sigma ));
		predictions = svmPredict(model, Xval); %segun las instrucciones de este documento
		error = mean(double(predictions ~= yval)); % segun las instrucciones de este documento

		if (error < auxMin_error) 
			auxMin_error = error;
			auxMin_c = c;
			auxMin_s = s;
		end
	end
end

auxMin_error
auxMin_c
auxMin_s

C = posibilidades(auxMin_c);
sigma = posibilidades(auxMin_s);










% =========================================================================

end
