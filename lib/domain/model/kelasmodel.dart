import 'dart:convert';

import '../../infrastructure/mahas/services/mahas_format.dart';

class KelasModel {
  int? id;
  String? nama;
  int? tahun;
  int? semester;
  int? idGuru;
  String? namaGuru;

  KelasModel();

  static KelasModel fromJson(String jsonString) {
    final data = json.decode(jsonString);
    return fromDynamic(data);
  }

  static KelasModel fromDynamic(dynamic dynamicData) {
    final model = KelasModel();

    model.id = MahasFormat.dynamicToInt(dynamicData['id']);
    model.nama = dynamicData['nama'];
    model.tahun = MahasFormat.dynamicToInt(dynamicData['tahun']);
    model.semester = MahasFormat.dynamicToInt(dynamicData['semester']);
    model.idGuru = MahasFormat.dynamicToInt(dynamicData['id_guru']);
    model.namaGuru = dynamicData['nama_guru'];

    return model;
  }
}
