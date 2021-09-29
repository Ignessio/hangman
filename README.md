# Description

  The program outputs a greeting and shows the hidden letters in the random word, as well as the initial picture with the gallows.
  The player must enter one letter at a step.
  The letters that the player guesses are displayed in the hidden word.
  Letters that are not in the word are displayed in the error list and new gallows pickture appears.
  If the player has guessed all the letters, the game ends and the program congratulates the winner.
  If the attempts are over, and the word is not opened, the player is considered as a looser.

  *Exapmle of the interface:*
  ```
  Слово: К О __ О __ __
          _______
          |/
          |     ( )
          |      |
          |
          |
          |
          |
          |
        __|________
        |         |

Ошибки (2): Х, У
У вас осталось ошибок: 5

Введите следующую букву:
  ```

# Language

  Ruby is used in program.

# Usage

  Load content to the local folder keeping intire structure. Run
  ```ruby
  $ ruby main.rb
  ```
  in terminal window to start. To change word to guess please edit /data/words.txt file
