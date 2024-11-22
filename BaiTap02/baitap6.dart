import 'dart:io';
void main () {
  int n=1;
  do{
    
    stdout.write('Nhap he so n:');
    String? input = stdin.readLineSync();
    if(input != null){
      n = int.tryParse(input) ?? 0;
    }
    if (n < 1){
      print("Vui long nhap lai");
    }
  }while( n < 1);
  //bien doi so da nhap thanh so nhi phan
  String binary = n.toRadixString(2);
  print("Số $n trong hệ nhị phân là: $binary");
}

