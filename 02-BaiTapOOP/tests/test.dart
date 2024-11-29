import '../models/cuahang.dart'; // Import lớp CuaHang
import '../models/dienthoai.dart'; // Import lớp Dienthoai
import '../models/hoadon.dart'; // Import lớp Hoadon

class Test {
  void runTests() {
    print("\n--- Bắt đầu kiểm thử ---");

    // Tạo cửa hàng và thêm dữ liệu mẫu
    Cuahang cuaHang = Cuahang("Cửa Hàng ABC", "123 Đường XYZ", [], []);

    // 1. Quản lý điện thoại
    print("\n1. Kiểm thử quản lý điện thoại:");
    testQuanLyDienThoai(cuaHang);

    // 2. Quản lý hóa đơn
    print("\n2. Kiểm thử quản lý hóa đơn:");
    testQuanLyHoaDon(cuaHang);

    // 3. Thống kê báo cáo
    print("\n3. Kiểm thử thống kê báo cáo:");
    testThongKeBaoCao(cuaHang);

    print("\n--- Hoàn thành kiểm thử ---");
  }

  void testQuanLyDienThoai(Cuahang cuaHang) {
    try {
      // Thêm điện thoại mới
      cuaHang.themDienThoai(Dienthoai("DT-001", "iPhone 15", "Apple", 2000, 2500, 10, true));
      cuaHang.themDienThoai(Dienthoai("DT-002", "Galaxy S23", "Samsung", 1800, 2200, 0, false));

      // Hiển thị danh sách điện thoại
      cuaHang.hienThiDanhSachDienThoai();

      // Cập nhật thông tin điện thoại
      cuaHang.capNhatDienThoai(
        "DT-001",
        Dienthoai("DT-001", "iPhone 15 Pro", "Apple", 2100, 2600, 100, true),
      );

      // Ngừng kinh doanh điện thoại
      cuaHang.ngungKinhDoanhDienThoai("DT-002");

      // Tìm kiếm điện thoại theo tên
      print("\nKết quả tìm kiếm điện thoại theo tên 'iPhone':");
      var ketQuaTimKiem = cuaHang.timKiemDienThoai(ten: "iPhone");
      ketQuaTimKiem.forEach((dt) => dt.hienThiThongTin());
    } catch (e) {
      print("Lỗi: $e");
    }
  }

  void testQuanLyHoaDon(Cuahang cuaHang) {
    try {
      // Thêm điện thoại để có dữ liệu hóa đơn
      cuaHang.themDienThoai(Dienthoai("DT-003", "Xiaomi 13", "Xiaomi", 1500, 2000, 10, true));

      // Tạo hóa đơn hợp lệ
      cuaHang.DanhSachHD.add(Hoadon(
        "HD-001",
        DateTime.now(),
        cuaHang.DanhSachDT.firstWhere((dt) => dt.MaDT == "DT-003"),
        2,
        2000,
        "Nguyen Van A",
        "0987654321",
      ));

      // Hiển thị danh sách hóa đơn
      print("\nDanh sách hóa đơn:");
      cuaHang.DanhSachHD.forEach((hd) => hd.hienThiThongTin());

      // Tạo hóa đơn không hợp lệ (số lượng mua vượt quá tồn kho)
      try {
        cuaHang.DanhSachHD.add(Hoadon(
          "HD-002",
          DateTime.now(),
          cuaHang.DanhSachDT.firstWhere((dt) => dt.MaDT == "DT-003"),
          15, // Số lượng vượt tồn kho
          2000,
          "Le Thi B",
          "0123456789",
        ));
      } catch (e) {
        print("Không thể tạo hóa đơn: $e");
      }
    } catch (e) {
      print("Lỗi: $e");
    }
  }

  void testThongKeBaoCao(Cuahang cuaHang) {
    try {
      // Tính doanh thu và lợi nhuận trong 7 ngày qua
      DateTime tuNgay = DateTime.now().subtract(Duration(days: 7));
      DateTime denNgay = DateTime.now();

      double doanhThu = cuaHang.tinhTongDoanhThu(tuNgay, denNgay);
      double loiNhuan = cuaHang.tinhTongLoiNhuan(tuNgay, denNgay);

      print("Doanh thu từ ${tuNgay.toLocal()} đến ${denNgay.toLocal()}: $doanhThu");
      print("Lợi nhuận từ ${tuNgay.toLocal()} đến ${denNgay.toLocal()}: $loiNhuan");

      // Thống kê top bán chạy
      cuaHang.thongKeTopBanChay();

      // Thống kê tồn kho
      cuaHang.thongKeTonKho();
    } catch (e) {
      print("Lỗi: $e");
    }
  }
}
// Hàm main
void main() {
  Test test = Test();
  test.runTests();
}
