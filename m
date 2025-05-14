import random

def get_difficulty_level():
    print("Choose a difficulty level: ")
    print("1. Easy (10 attempts)")
    print("2. Medium (7 attempts)")
    print("3. Hard (5 attempts)")
    
    while True:
        try:
            level = int(input("Enter your choice (1/2/3): "))
            if level == 1:
                return 10
            elif level == 2:
                return 7
            elif level == 3:
                return 5
            else:
                print("Invalid choice. Please choose between 1, 2, or 3.")
        except ValueError:
            print("Please enter a valid number.")

def provide_hint(number_to_guess, guess):
    if guess % 2 == 0:
        print("Hint: The number is even.")
    else:
        print("Hint: The number is odd.")
        
    if number_to_guess % 5 == 0:
        print("Hint: The number is a multiple of 5.")
        
    if guess < number_to_guess:
        print("Hint: The number is higher.")
    elif guess > number_to_guess:
        print("Hint: The number is lower.")

def main():
    print("Welcome to the Number Guessing Game!")
    print("I'm thinking of a number between 1 and 100.")
    
    number_to_guess = random.randint(1, 100)
    
    attempts_allowed = get_difficulty_level()
    attempts = 0
    guessed = False
    
    while not guessed and attempts < attempts_allowed:
        try:
            guess = int(input(f"Enter your guess (Attempts left: {attempts_allowed - attempts}): "))
            attempts += 1
            
            if guess < 1 or guess > 100:
                print("Please enter a number between 1 and 100.")
            elif guess < number_to_guess:
                print("Too low! Try again.")
                provide_hint(number_to_guess, guess)
            elif guess > number_to_guess:
                print("Too high! Try again.")
                provide_hint(number_to_guess, guess)
            else:
                guessed = True
                print(f"Congratulations! You've guessed the number {number_to_guess} in {attempts} attempts.")
                break
        except ValueError:
            print("Invalid input. Please enter a valid integer.")
    
    if not guessed:
        print(f"Sorry! You've used all your attempts. The number was {number_to_guess}.")
    
    play_again = input("Would you like to play again? (y/n): ").lower()
    if play_again == "y":
        main()
    else:
        print("Thanks for playing!")

if __name__ == "__main__":
    main()
