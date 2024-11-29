import 'dienthoai.dart';
import 'hoadon.dart';
class Cuahang {
  String _tenCH;
  String _diaChi;
  List<Dienthoai> _danhsachDT = [];
  List<Hoadon> _danhsachHD = [];

  Cuahang(this._tenCH,this._diaChi,this._danhsachDT,this._danhsachHD);

  String get TenCuaHang => _tenCH;
  String get DiaChi => _diaChi;
  List<Dienthoai> get DanhSachDT => _danhsachDT;
  List<Hoadon> get DanhSachHD => _danhsachHD;

  set TenCuaHang (String TenCuaHang){
    _tenCH = TenCuaHang;
  }
  
  set DiaChi (String DiaChi){
    _diaChi = DiaChi;
  }

  set DanhSachDT (List<Dienthoai> DanhSachDT){
    _danhsachDT = DanhSachDT;
  }

  set DanhSachHD (List<Hoadon> DanhSachHD){
    _danhsachHD = DanhSachHD;
  }

  // ====== Quản lý điện thoại ======
  // Thêm điện thoại mới
  void themDienThoai(Dienthoai dienThoai) {
    _danhsachDT.add(dienThoai);
    print("Đã thêm điện thoại: ${dienThoai.TenDT}");
  }
  // Cập nhật thông tin điện thoại
  void capNhatDienThoai(String maDT, Dienthoai dienThoaiMoi) {
    for (var dt in _danhsachDT) {
      if (dt.MaDT == maDT) {
        _danhsachDT[_danhsachDT.indexOf(dt)] = dienThoaiMoi;
        print("Cập nhật thông tin cho điện thoại mã $maDT.");
        return;
      }
    }
    print("Không tìm thấy điện thoại có mã $maDT để cập nhật.");
  }

  // Ngừng kinh doanh điện thoại
  void ngungKinhDoanhDienThoai(String maDT) {
    for (var dt in _danhsachDT) {
      if (dt.MaDT == maDT) {
        dt.trangThai = false;
        print("Điện thoại mã $maDT đã ngừng kinh doanh.");
        return;
      }
    }
    print("Không tìm thấy điện thoại có mã $maDT để ngừng kinh doanh.");
  }

   // Tìm kiếm điện thoại (theo mã, tên, hãng)
  List<Dienthoai> timKiemDienThoai({String? ma, String? ten, String? hang}) {
    return _danhsachDT.where((dt) {
      return (ma != null && dt.MaDT == ma) ||
          (ten != null && dt.TenDT.toLowerCase().contains(ten.toLowerCase())) ||
          (hang != null && dt.HangDT.toLowerCase() == hang.toLowerCase());
    }).toList();
  }

  // Hiển thị danh sách điện thoại
  void hienThiDanhSachDienThoai() {
    if (_danhsachDT.isEmpty) {
      print("Cửa hàng không có điện thoại nào.");
    } else {
      print("Danh sách điện thoại:");
      for (var dt in _danhsachDT) {
        dt.hienThiThongTin();
      }
    }
  }
   // ====== Thống kê ======
  // Tính tổng doanh thu theo khoảng thời gian
  double tinhTongDoanhThu(DateTime tuNgay, DateTime denNgay) {
    return _danhsachHD
        .where((hd) => hd.NgayBan.isAfter(tuNgay) && hd.NgayBan.isBefore(denNgay))
        .map((hd) => hd.tinhTongTien())
        .reduce((a, b) => a + b);
  }

  // Tính tổng lợi nhuận theo khoảng thời gian
  double tinhTongLoiNhuan(DateTime tuNgay, DateTime denNgay) {
    return _danhsachHD
        .where((hd) => hd.NgayBan.isAfter(tuNgay) && hd.NgayBan.isBefore(denNgay))
        .map((hd) => hd.tinhLoiNhuanThucTe())
        .reduce((a, b) => a + b);
  }

  // Thống kê top điện thoại bán chạy
  void thongKeTopBanChay() {
    var map = <String, int>{};
    for (var hd in _danhsachHD) {
      map[hd.dienThoai.MaDT] = (map[hd.dienThoai.MaDT] ?? 0) + hd.SoluongMua;
    }
    var top = map.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    print("Top điện thoại bán chạy:");
    top.forEach((e) => print("Mã: ${e.key}, Số lượng bán: ${e.value}"));
  }

  // Thống kê tồn kho
  void thongKeTonKho() {
    print("Thống kê tồn kho:");
    for (var dt in _danhsachDT) {
      print("Tên: ${dt.TenDT}, Số lượng tồn: ${dt.SoLuong}");
    }
  }
}