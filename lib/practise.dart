import 'dart:io';

void main(){
  print("Hey Guys my name is Manjeet");

  //out or print the text console
  stdout.write('Enter your name');

  //to get data from end user
  var name = stdin.readLineSync();
  var age = 35;
  print("welcome $name $age");

  var x = "Raman";
  print(x);
 Test().name;
}
class Test{
  var name = "man";
}