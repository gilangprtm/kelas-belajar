import 'dart:convert';
import '../../infrastructure/mahas/services/mahas_format.dart';

class UserModel {
  int? id;
  String? nama;
  String? foto;
  String? role;
  String? idFirebase;
  String? email;

  UserModel();

  static UserModel fromJson(String jsonString) {
    final data = json.decode(jsonString);
    return fromDynamic(data);
  }

  static UserModel fromDynamic(dynamic dynamicData) {
    final model = UserModel();

    model.id = MahasFormat.dynamicToInt(dynamicData['id']);
    model.nama = dynamicData['nama'];
    model.foto = dynamicData['foto'];
    model.role = dynamicData['role'];
    model.idFirebase = dynamicData['id_firebase'];
    model.email = dynamicData['email'];

    return model;
  }
}
