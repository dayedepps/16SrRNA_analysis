#!/usr/bin/perl
use warnings;
use strict;
my $usage="
#########################################################Promgram#########################################
rdpformat.pl

This script is used to translate the the output of rdp website to unclassfied if the confidence <50%
History:
   2014/08/10    Sam    First release
example:
   perl /path/way/to/rdpformat.pl <input> <output>
###########################################################################################################
";

die $usage if (@ARGV!=2);
my ($input,$output)=@ARGV;

open IN,"$input" or die;
open OUT,'>',"$output" or die;

my @p=();
while (<IN>){
chomp;
  my @p=split /;/;
  if ($p[5]<50){
     print OUT "$p[0]\t$p[1]\t$p[2]\t$p[3]\tunclassfied_$p[2]\t$p[5]\tunclassfied_$p[2]\tp[7]\tunclassfied_$p[2]\t$p[9]\tunclassfied_$p[2]\t$p[9]\tunclassfied_$p[2]\t$p[9]\tunclassfied_$p[2]\t$p[9]\n";
     }else {     
if ($p[7]<50) {
        print OUT "$p[0]\t$p[1]\t$p[2]\t$p[3]\t$p[4]\t$p[5]\tunclassfied_$p[4]\t$p[7]\tunclassfied_$p[4]\t$p[9]\tunclassfied_$p[4]\t$p[9]\tunclassfied_$p[4]\t$p[9]\tunclassfied_$p[4]\t$p[9]\n";
         }else {
       if ($p[9]<50) {
             print OUT "$p[0]\t$p[1]\t$p[2]\t$p[3]\t$p[4]\t$p[5]\t$p[6]\t$p[7]\tunclassfied_$p[6]\t$p[9]\tunclassfied_$p[6]\t$p[9]\tunclassfied_$p[6]\t$p[9]\tunclassfied_$p[6]\t$p[9]\n";
             }else {
               
  if (defined($p[11])){                       
    if ($p[11]<50) {
                  print OUT "$p[0]\t$p[1]\t$p[2]\t$p[3]\t$p[4]\t$p[5]\t$p[6]\t$p[7]\t$p[8]\t$p[9]\tunclassfied_$p[8]\t$p[9]\tunclassfied_$p[8]\t$p[9]\tunclassfied_$p[8]\t$p[9]\n";
                   }else {                     
 if (defined($p[13])){  
                              if ($p[13]<50) {
                         print OUT "$p[0]\t$p[1]\t$p[2]\t$p[3]\t$p[4]\t$p[5]\t$p[6]\t$p[7]\t$p[8]\t$p[9]\t$p[10]\t$p[11]\tunclassfied_$p[10]\t$p[13]\tunclassfied_$p[10]\t$p[15]\n";
                               }else {                                     
 if (defined($p[15])){ 
 if ($p[15]<50) {
                               print OUT "$p[0]\t$p[1]\t$p[2]\t$p[3]\t$p[4]\t$p[5]\t$p[6]\t$p[7]\t$p[8]\t$p[9]\t$p[10]\t$p[11]\t$p[12]\t$p[13]\tunclassfied_$p[12]\t$p[15]\n";
                                      }else {
                                print OUT "$p[0]\t$p[1]\t$p[2]\t$p[3]\t$p[4]\t$p[5]\t$p[6]\t$p[7]\t$p[8]\t$p[9]\t$p[10]\t$p[11]\t$p[12]\t$p[13]\t$p[14]\t$p[15]\n"; 
                                      }           
  }else {
                                print OUT "$p[0]\t$p[1]\t$p[2]\t$p[3]\t$p[4]\t$p[5]\t$p[6]\t$p[7]\t$p[8]\t$p[9]\t$p[10]\t$p[11]\t$p[12]\t$p[13]\tunclassfied_$p[12]\t$p[13]\n"; 
                                      }                                

   }                                    
}else{
                                  print OUT "$p[0]\t$p[1]\t$p[2]\t$p[3]\t$p[4]\t$p[5]\t$p[6]\t$p[7]\t$p[8]\t$p[9]\t$p[10]\t$p[11]\tunclassfied_$p[10]\t$p[11]\tunclassfied_$p[10]\t$p[11]\n";
                                          }                                      
}                             
 }else{
                               print OUT "$p[0]\t$p[1]\t$p[2]\t$p[3]\t$p[4]\t$p[5]\t$p[6]\t$p[7]\t$p[8]\t$p[9]\tunclassfied_$p[8]\t$p[9]\tunclassfied_$p[8]\t$p[9]\tunclassfied_$p[8]\t$p[9]\n";
                                   }                  
}
                  
 }
               
 }                

  }
close IN;
close OUT;
