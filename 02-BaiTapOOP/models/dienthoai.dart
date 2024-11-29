import 'dart:ffi';

class Dienthoai {
  String _maDth;
  String _tenDth;
  String _hangDth;
  double _giaNhap;
  double _giaBan;
  int _SL;
  bool _trangThai;

  Dienthoai(this._maDth,this._tenDth,this._hangDth,this._giaNhap,this._giaBan,this._SL,this._trangThai);

  String get MaDT => _maDth;
  String get TenDT => _tenDth;
  String get HangDT => _hangDth;
  double get GiaNhap => _giaNhap;
  double get GiaBan => _giaBan;
  int get SoLuong => _SL;
  bool get TrangThai => _trangThai;

  set MaDT (String MaDT){
    if(MaDT.isNotEmpty){
      _maDth=MaDT;
    }else{
      print("Mã điện thoại không được rỗng!!!");
    }
    if(RegExp(r'^DT-\d{3}$').hasMatch(MaDT)){
      _maDth=MaDT;
    }else{
      print("Mã điện thoại không đúng định dạng :DT-XXX");
    }
  }
  set TenDt (String TenDT){
    if(TenDT.isNotEmpty){
      _tenDth=TenDT;
    }else{
      print("Tên điện thoại không được rỗng!!!");
    }
  }
  set HangDT (String HangDT){
    if (HangDT.isNotEmpty){
      _hangDth=HangDT;
    }else{
      print("Hãng điện thoại không được rỗng!!!");
    }
  }
  set GiaNhap (double GiaNhap){
    _giaNhap = (GiaNhap > 0) ? GiaNhap : _giaNhap;
  }
  set GiaBan (double GiaBan){
    _giaBan =(GiaBan > 0 && GiaBan > GiaNhap)? GiaBan :_giaBan;
  }
  set SoLuong (int SoLuong){
    _SL=(SoLuong >= 0)? SoLuong :_SL;
  }
  set trangThai(bool value) {
    _trangThai = value;
  }

  void hienThiThongTin() {
    print("Mã: $_maDth, Tên: $_tenDth, Hãng: $_hangDth, Giá nhập: $_giaNhap, Giá bán: $_giaBan, Số lượng tồn: $_SL, Trạng thái: ${_trangThai ? 'Còn kinh doanh' : 'Ngừng kinh doanh'}");
  }
  // Phương thức kiểm tra có thể bán không
  bool coTheBan() {
    return _SL > 0 && _trangThai;
  }
}