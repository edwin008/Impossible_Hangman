function[wordLength, level] = SetupGame()
%Written by
%Mario Cespedes
%Edwin Carvajal

%Asks the User for wordlength (4-23 characters)
%Asks for level of difficulty (easy, normal, impossible)
%Displays choosen options and returns the variables
%Returns wordlength, level variables

while true
    wordLength = input('Enter desired word length: ');
    if wordLength >= 4 && wordLength <= 23 %correct length
        break;
    else %incorrect length
        disp('Try Again!');
    end
end

%checks for capitals, minorcase, and can deffault to normal
level = input('Enter difficulty level: ', 's');
if strcmp(level, 'easy') || strcmp(level, 'Easy')
    level = 'Easy';
elseif strcmp(level, 'normal') || strcmp(level, 'Normal')
    level = 'Normal';
elseif strcmp(level, 'impossible') || strcmp(level, 'Impossible')
    level = 'Impossible';
else
    level = 'Normal';
end
fprintf('Difficulty level set to %s with a word length of %d \n',level,wordLength)

end