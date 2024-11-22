import 'dart:io';

void main() {
  int n = 1;
  do {
    stdout.write('Nhap he so n:');
    String? input = stdin.readLineSync();
    if (input != null) {
      n = int.tryParse(input) ?? 0;
    }
    if (n < 1) {
      print("Vui long nhap lai");
    }
  } while (n < 1);
  //tinh tong uoc so
  int sum = 0;
  for (int i = 1; i <= n; i++) {
    if (n % i == 0) {
      sum += i; // Cộng ước số vào tổng
    }
  }

  print("Tổng các ước số của $n là: $sum");
}
