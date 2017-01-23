function[dictionary, newWord] = HangmanAlgorithm(level,dictionary,nextGuess,wordLength)
%Written by
%Mario Cespedes
%Edwin Carvajal

map = containers.Map('KeyType','double','ValueType','any'); %for grouping of words
map2 = containers.Map('KeyType','double','ValueType','any'); %For letter location
key = 0;
newWord = ''; %word format that returns for assesment
 
%Assigns specific key to each instance
for jj = 1:length(dictionary) %goes through each word
    word(1:wordLength) = '-'; %Builds up the word being guessed
    letters = strfind(dictionary{jj}, nextGuess); %Find appearance of the character
    %letters is an array of indexes of occurence
    
    if isempty(letters) %No instances
        key = 0;
    else
        key = bi2de(dictionary{jj} == nextGuess); %Gets a binary unique key
        word(letters) = nextGuess; %Builds the format
    end
    map2(key) = word; %saves the word format
    
    %Determine whether key has more than one word
    if isKey(map, key) %Not the first time
        map(key) = [map(key) dictionary{jj}];
    else %The first time
        map(key) = {dictionary{jj}};
    end
end

%Determine Key and Value choosen from the Dictionary

%Amount of Words
largest = 0;
secondLargest = 0;
shortest = 0;

choosenKey = 0;
dictionary = {};
v = values(map); %All the values on the map
v2 = values(map2); %All the word formats for the key

if strcmp(level, 'Impossible') %Impossible Level
    for ii = 1:length(v)
        if length(v{ii}) > largest
            largest = length(v{ii});
            choosenKey = ii;
        end
    end
    dictionary = v{choosenKey};
    newWord = v2{choosenKey};

elseif strcmp(level, 'Normal') %Normal Level
    for ii = 1:length(v) %finds largest
        if length(v{ii}) > largest
            largest = length(v{ii});
            choosenKey = ii;
        end
    end
    for rr = 1:largest %finds second largest
      for aa = 1:length(v)
          if length(v{aa}) >= rr && length(v{aa}) < largest
              secondLargest = length(v{aa});
              choosenKey = aa;
          end
      end
    end
    dictionary = v{choosenKey};
    newWord = v2{choosenKey};
    
else %Easy level
    for ii = 1:length(v) %finds largest
        if length(v{ii}) > largest
            largest = length(v{ii});
        end
    end
    
    for rr = largest:-1:1 %finds the shortest
      for ii = 1:length(v)
          if length(v{ii}) <= rr
              shortest = length(v{ii});
              choosenKey = ii;
          end
      end
    end
    dictionary = v{choosenKey};
    newWord = v2{choosenKey};
end

end %Function end