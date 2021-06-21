class Orientation {
  String idOri;
  String namOri;
  String desOri;
  String datOri;

  Orientation({this.idOri, this.namOri, this.desOri, this.datOri});

  Orientation.fromJson(Map<String, dynamic> json) {
    idOri = json['id_ori'];
    namOri = json['nam_ori'];
    desOri = json['des_ori'];
    datOri = json['dat_ori'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_ori'] = this.idOri;
    data['nam_ori'] = this.namOri;
    data['des_ori'] = this.desOri;
    data['dat_ori'] = this.datOri;
    return data;
  }
}