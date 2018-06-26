function walshMatrix = Walsh( len )
%WALSH Summary of this function goes here
%   Detailed explanation goes here

% part of code from example:
N = len;  % Length of Walsh (Hadamard) functions
hadamardMatrix = hadamard(N);
HadIdx = 0 : N-1;                          % Hadamard index
M = log2(N) + 1;  
binHadIdx = fliplr(dec2bin(HadIdx,M))-'0'; % Bit reversing of the binary index
binSeqIdx = zeros(N,M-1);                  % Pre-allocate memory
for k = M:-1:2
    % Binary sequency index 
    binSeqIdx(:,k) = xor(binHadIdx(:,k),binHadIdx(:,k-1));
end
SeqIdx = binSeqIdx*pow2((M-1:-1:0)');    % Binary to integer sequency index
walshMatrix = hadamardMatrix(SeqIdx+1,:); % 1-based indexing

end

