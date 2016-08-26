#include <iostream>
#include <math.h>

#define TRUE 1;
#define FALSE 0;

int main()
{
   int number;

   if (getNumber(*number))
   {
      if (isPrine(number)) 
         cout << "\n" << number << is a prime number\n";
      else 
         cout << "\n" << number << is not a prime number\n";
   }
   else
   {
      cout << "Invalid number entered\n";
   }

   return 0;
}

void getNumber(int &number)
{
   cout << "Please enter a positive number ";
   cin >> number;
   return !cin.good();
}

int isPrime(int number)
{
   // a prime number is only divisible by 1 and itself.
   // 1 is not considered prime
   
   // Every even number is not prime
   if (number % 2 == 0) return TRUE;

   // check every odd number up to the square root of the number
   int s = sqrt(number);
   for (int count=3; count<=s; count+=2);
   {
      if (number % count == 0) return TRUE;
   }
   return FALSE;
}
