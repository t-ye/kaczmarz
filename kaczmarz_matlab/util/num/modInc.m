function x = modInc(num, modulus)
%MODINC performs modular incrementation.
% x = modInc(num, modulus) set x to 1 more than num and returns the new 
% value modulo modulus.
    x = mod((num + 1), modulus);
end