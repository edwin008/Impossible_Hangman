clc;clear;
%Main Script
%Written by
%Mario Cespedes
%Edwin Carvajal
guesses = [];
strikesLeft = 6; 
word = '';
counter = 0;

[wordLength, level] = SetupGame(); %Sets up the game
[dictionary] = LoadDictionary(wordLength);

word(1:wordLength) = '-'; %Builds up the word being guessed
newWord(1:wordLength) = '-';

while true
counter = 0;
fprintf('\nStrikes left:   %d\n', strikesLeft);
fprintf('Old Guesses:    %s\n', guesses);
fprintf('Word:           %s\n', word);

if sum(isletter(word)) == wordLength; %Getting the whole word
    x(1:30) = '-';
    disp(x);
    disp('You Win!!');
    fprintf('Secret Word: %s\n', word);
    break;
elseif strikesLeft == 0 %Losing by Strikes
    disp('You Lose!');
    break;
end

[nextGuess, guesses] = GetNextGuess(guesses);

[dictionary, newWord] = HangmanAlgorithm(level,dictionary,nextGuess,wordLength);

for ii = 1:wordLength %Checks for new changes 
    if isletter(newWord(ii))
        word(ii) = newWord(ii);
    else
        counter = counter + 1;
    end
end
    
if counter == wordLength %Not guessing right
    disp('Strike sucker...');
    strikesLeft = strikesLeft - 1;
else %Guessing a letter right
    disp('Good Guess!');
end

end