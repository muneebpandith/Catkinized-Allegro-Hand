#include<iostream>
#include<armadillo>

using namespace std;
int main(){
arma::Mat<double>A = arma::randu(4,4);
arma::Mat<double>B = A.t();

std::cout<<1;
return 0;}
