import 'package:dio/dio.dart';
import '../helpers/api_client.dart';
import '../model/tanaman.dart';

class TanamanService {
  Future<List<Tanaman>> listData() async {
    final Response response = await ApiClient().get('tanaman');
    final List data = response.data as List;
    List<Tanaman> result = data.map((json) => Tanaman.fromJson(json)).toList();
    return result;
  }

  Future<Tanaman> simpan(Tanaman tanaman) async {
    var data = tanaman.toJson();
    final Response response = await ApiClient().post('tanaman', data);
    Tanaman result = Tanaman.fromJson(response.data);
    return result;
  }

  Future<Tanaman> ubah(Tanaman tanaman, String id) async {
    var data = tanaman.toJson();
    final Response response = await ApiClient().put('tanaman/${id}', data);
    print(response);
    Tanaman result = Tanaman.fromJson(response.data);
    return result;
  }

  Future<Tanaman> getById(String id) async {
    final Response response = await ApiClient().get('tanaman/${id}');
    Tanaman result = Tanaman.fromJson(response.data);
    return result;
  }

  Future<Tanaman> hapus(Tanaman tanaman) async {
    final Response response = await ApiClient().delete('tanaman/${tanaman.id}');
    Tanaman result = Tanaman.fromJson(response.data);
    return result;
  }
}
