%sample bayesian Calculations 

%reads in matrix from excel 
A = xlsread('samplebayesian.xlsx');

%Matrix results for the draft
%Rows are the pick number, columns are where they were projected 
results = zeros(length(A));

%Finds the number of expert picks + 1 since one column is the actual 
row_len = length(A(1,:));
%Finds number of picks 
col_len = length(A(:,1));

%fills in the matrix of results 
for i = 1:col_len
    for j = 2:row_len
        results(i,A(i,j)) = results(i,A(i,j)) + 1;
    end
end

%Divide Matrix by total number of expert picks and transpose so columns are
%the actual picks

percentages = results / (row_len - 1);

csvwrite('bayesian_results.csv', percentages);
