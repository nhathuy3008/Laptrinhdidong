import 'dienthoai.dart';

class Hoadon {
  String _maHD;
  DateTime _ngayBan;
  Dienthoai _dienthoai;
  int _slMua;
  double _giabanTT;
  String _tenKH;
  String _sdt;

  Hoadon(this._maHD, this._ngayBan, this._dienthoai, this._slMua,this._giabanTT, this._tenKH, this._sdt);

  String get MaHD => _maHD;
  DateTime get NgayBan => _ngayBan;
  Dienthoai get dienThoai => _dienthoai;
  int get SoluongMua => _slMua;
  double get GiaBanThucTe => _giabanTT;
  String get TenKhachHang => _tenKH;
  String get SoDienThoai => _sdt;

  set MaHD (String MaHD){
    if (MaHD.isNotEmpty){
      _maHD=MaHD;
    }else{
      print("Mã hóa đơn không được rỗng !!!");
    }
    if(RegExp(r'^HD-\d{3}$').hasMatch(MaHD)){
      _maHD=MaHD;
    }else{
      print("Mã hóa đơn phải đúng định dạng (HD-XXX)");
    }
  }

  set NgayBan(DateTime NgayBan) {
    if (NgayBan.isBefore(DateTime.now()) || NgayBan.isAtSameMomentAs(DateTime.now())) {
      _ngayBan = NgayBan;
    } else {
      print("Ngày bán không được sau ngày hiện tại!");
    }
  }

  set dienThoai (Dienthoai dienThoai ){
    _dienthoai=dienThoai;
  }

  set SoluongMua (int SoluongMua){
    if (SoluongMua > 0){
      _slMua=SoluongMua;
    }else{
      print("Số lượng mua không được nhỏ hơn 0 !!!");
    }
    if(SoluongMua <= _dienthoai.SoLuong){
      _slMua=SoluongMua;
    }else{
      print("Số lượng mua phải bé hơn hoặc bằng số lượng sản phẩm trong kho !!!");
    }
  }

  set GiaBanThucTe (double GiaBanThucTe){
    if (GiaBanThucTe > 0){
      _giabanTT=GiaBanThucTe;
    }else{
      print("Gía bán phải lớn hơn 0 !!!");
    }
  }

  set TenKhachHang (String TenKhachHang){
    if(TenKhachHang.isNotEmpty){
      _tenKH=TenKhachHang;
    }else{
      print("Thông tin khách hàng không được rỗng !!!");
    }
  }

  set SoDienThoai (String SoDienThoai){
    if(SoDienThoai.isNotEmpty){
      _sdt=SoDienThoai;
    }else{
      print("Thông tin khách hàng không được rỗng !!!");
    }
    if (RegExp(r'^0\d{9}$').hasMatch(SoDienThoai)){
      _sdt=SoDienThoai;
    }else{
      print("Số điện thoại chưa đúng định dạng !!!");
    }
  }
  // Phương thức tính tổng tiền
  double tinhTongTien() {
    return _giabanTT * _slMua;
  }

   // Phương thức tính lợi nhuận thực tế
  double tinhLoiNhuanThucTe() {
    double loiNhuanMoiSanPham = _giabanTT - _dienthoai.GiaNhap;
    return loiNhuanMoiSanPham * _slMua;
  }

   // Phương thức hiển thị thông tin hóa đơn
  void hienThiThongTin() {
    print("Mã hóa đơn: $_maHD");
    print("Ngày bán: ${_ngayBan.toLocal()}");
    print("Tên khách hàng: $_tenKH");
    print("Số điện thoại khách: $_sdt");
    print("Điện thoại: ${_dienthoai.TenDT} (${_dienthoai.HangDT})");
    print("Số lượng mua: $_slMua");
    print("Giá bán thực tế: $_giabanTT");
    print("Tổng tiền: ${tinhTongTien()}");
    print("Lợi nhuận thực tế: ${tinhLoiNhuanThucTe()}");
  }
}
