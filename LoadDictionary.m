function[dictionary] = LoadDictionary(wordLength)

%Written by
%Mario Cespedes
%Edwin Carvajal

%The function takes the given Dictionary
%and eliminates the words that don't match
%the word length

fid = fopen('dictionary.txt');
dictionary = {};
%Checks for words matching the worth limit criteria
    while true
        nextLine = fgetl(fid);
        if nextLine == -1 %No words
            break
        end
        if length(nextLine) > wordLength || length(nextLine) < wordLength %No Match
            continue;
        else %Match wordlength
            newWord = nextLine;
        end
        dictionary = [dictionary newWord];
    end
%the fucntion returns the updated dictionary of words
end