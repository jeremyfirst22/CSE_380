/*
Purpose: Numerical integrator of Cos(x) using user specfied xmin, xmax and number of steps.
Author : Jeremy First
Date   : 03 November 2015 
Input  : Command line options, --help for help 
Output : The definite integrate and abosolute error. 
      _
     / b
     |   Cos(x) dx 
    _/ a

*/

#include <iostream> 
#include <boost/program_options.hpp> 
#include <stdlib.h> 
#include <cmath> 
#include <cstdio> 

using namespace std; 
namespace 
{ 
    const size_t ERROR_IN_COMMAND_LINE = 1; 
    const size_t SUCCESS = 0; 
    const size_t ERROR_UNHANDLED_EXCEPTION = 2; 
} 

//This function simply prints the description of the program. Useful when exittin 
// the program due to bad flags, or --help flag. 
void description() ; 

int main(int argc, char** argv){
    int np ; 
    double xmin ; 
    double xmax ;  
    //Use boost's program options to parse command line options. 
    try
    {
       namespace po = boost::program_options; 
       po::options_description desc("Options"); 
       desc.add_options()
        ("help,h", "Print help message") 
        ("min,a", po::value<double>(&xmin)->required(), \
            "Set the minimum (xmin) of numerical integration") 
        ("max,b", po::value<double>(&xmax)->required(), \
            "Set the maximum (xmax) of numerical integration") 
        ("numPoints,n", po::value<int>(&np)->default_value(10), \
            "Number of discretized points ") ; 
    //Done adding program options
       po::variables_map vm; 
       try 
       {
           po::store(po::parse_command_line(argc, argv, desc),vm); 

           if (vm.count("help") )
           {
               description() ; 
               cout << desc << endl ;
               return SUCCESS; 
           //Catch help flag and exit. 
           }
           po::notify(vm); 
        }
        catch(po::error& e) 
        {
           description() ; 
           cerr << "ERROR: " << e.what() << endl << endl; 
           cerr << desc << endl;
           return ERROR_IN_COMMAND_LINE;
           //Catch incorrect options. 
        }
    }
    catch(exception& e) 
    {
        //Make sure no exceptions got through. 
        cerr << "Unhanlded exception reached the top of main: " << e.what()\
             << " , application will exit" << endl; 
        return ERROR_UNHANDLED_EXCEPTION; 
    }

    //Ensure xmin is less than xmax. 
    if (xmin > xmax)
    {
        cout << "Error: xmin cannot be larger than xmax \n\n" ; 
        exit (EXIT_FAILURE);  
    }

    //Begin computation of numeric integral.

    //convert input variables into usable variable for the loop. 
    double defInt = 0; 
    double h = (xmax - xmin)/np ;  
    double minx , maxx ; 
    double analyticInt, absError ; 
    
    for (int i=0 ; i < np ; i++)
    {
        minx = xmin + h*i ; 
        maxx = xmin + h ; 
        defInt += h* cos(minx + h/2) ; 
    }        
    //End coputation of numeric integral 

    //Compute analytic integral and absolute error. 
    analyticInt = sin(xmax) - sin(xmin) ; 
    absError = abs(defInt - analyticInt) ; 

    //Print numeric integral and absolule error. 
    printf("DefIntegral: %f \t AbsError: %f \n", defInt, absError)  ; 

    return SUCCESS; 
}


void description()
{
    printf("\nThis program numerically integrates Cos(x) using the composite midpoint \n \
        rule and prints the definite integral and absolute error\n\n") ; 
    return ; 
}

