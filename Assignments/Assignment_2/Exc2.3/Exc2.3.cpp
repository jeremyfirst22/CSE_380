#include <cmath> 
#include <iostream> 

using namespace std; 
namespace
{
    const size_t SUCCESS = 0 ; 
    const size_t FAILURE = 1 ; 
}

void description() ;   
double logFactorial(int) ; 

int main()
{
    double actual , approx ; 
    double error = 1; 
    int i = 1 ; 
    for (int i = 0 ; i < 100 ; i++) 
    {
        approx = i * log(i) - i ; 
   //     cout << i << "     " << sterling << "    " << log(factorial(i)) << endl; 
      //cout << i << "   " << logFactorial(i) << endl ; 
        actual = logFactorial(i) ; 
        error = abs(approx - actual)/actual ; 
        printf("%i \t %f \t %f \n",i, actual, error) ; 
    }

    return SUCCESS ; 
}


void description(){
    printf("This program computes the factorial of every integer from 1 to 100.")  ; 
    return ; 
}

double logFactorial(int x)
{
    double logFactorial = 1 ; 
    for (int i = 1 ; i <= x ; i++)
        logFactorial += log(i) ; 
    return logFactorial ; 
}
