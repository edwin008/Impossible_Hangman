function[nextGuess, guesses] = GetNextGuess(guesses)
%Written by
%Mario Cespedes
%Edwin Carvajal

%Funtion asks the user for the next character guess
%The charcter must be new and not previously entered
%The function checks for it
%The functions returns new and previously used characters entered

  while true %Allows it to ask again
     nextGuess = input('Enter next guess: ', 's');
     if sum(find(guesses == nextGuess)) ~= 0 %checks for uniqueness
         nextGuess = '';
         disp('You have already guessed that letter...');
         continue;
     else %New guess is added to the list
         guesses = [guesses nextGuess];
         guesses = sort(guesses);
         break;
     end
  end %end while
end %end function