#Author: Bipin
#Date: 5th October 2017

use strict;
use warnings;
use feature 'say';

my $Directory = '1995';   #keep the folder name
my @Directory_Files;      #This is used to store the file names in the $Directory

opendir (DIR, $Directory);
@Directory_Files = readdir(DIR);

#All the files names in the folder ($Directory) are in @Directory_Files array.
#We use foreach loop to cycle through each entry

foreach my $File_Name_Unmodified (@Directory_Files) {
  my $File_Name_Under_Modification = $File_Name_Unmodified;
  say $File_Name_Under_Modification;                      #Display the file name before modifying


#*** You need to change the below code as per your requirement
  $File_Name_Under_Modification =~ s/#\d+\w?//;           #this matches exactly # and number
  my $match = $&;                                         #Copies the matched one with the variable
  $File_Name_Under_Modification =~ s/^/$match /;          #Keeps the matched part at the beginning
  $File_Name_Under_Modification =~ s/\s+/ /g;             #removes multiple white spaces
  $File_Name_Under_Modification =~ s/\s(?=\.mp4)//;       #removes white space at the end
#*** No more changing the code, because regex part is over.


  my $File_Name_Modified = $File_Name_Under_Modification;
  say $File_Name_Modified."\n";                           #Displays the file name after modification
  rename "$Directory/$File_Name_Unmodified","$Directory/$File_Name_Modified";#Update the modified file name to the directory file
}
