import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiCalls {
  static const String baseUrl = "http://10.0.2.2:8000/api/";
  // static const String baseUrl = "https://ndkumarwansha.xyz/api/";

  static _emptyHeaders() {
    return {"Accept": "application/json", "Content-Type": "application/json"};
  }

  static Future<Map<String, String>> _headerWithToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token =
        prefs.getString('access_token'); // Get the token from SharedPreferences

    var headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };

    return headers;
  }

  static Future<Map<String, String>> _headerWithTokenAndMultipart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token =
        prefs.getString('access_token'); // Get the token from SharedPreferences

    var headers = {
      "Accept": "application/json",
      "Content-Type": "multipart/form-data",
      "Authorization": "Bearer $token",
    };

    return headers;
  }

  static Future<Response> allUsers() async {
    var url = Uri.parse("${baseUrl}all/users");
    var response = await get(url);
    return response;
  }

  static Future<Response> login(
      {required String email,
      required String password,
      String? deviceName}) async {
    var url = Uri.parse("${baseUrl}login");
    var payload = {
      "email": email,
      "password": password,
      "device_name": deviceName
    };
    var response =
        await post(url, headers: _emptyHeaders(), body: json.encode(payload));
    return response;
  }

  static Future<Response> register(
      {required String email,
      required String password,
      String? deviceName}) async {
    var url = Uri.parse("${baseUrl}register");
    var payload = {
      "email": email,
      "password": password,
      "device_name": deviceName
    };
    var response =
        await post(url, headers: _emptyHeaders(), body: json.encode(payload));
    return response;
  }

  static Future<Response> logout() async {
    var url = Uri.parse("${baseUrl}user/revoke");
    var headers = await _headerWithToken();
    var response = await get(url, headers: headers);
    return response;
  }

  static Future<Response> googleSignIn({required String idToken}) async {
    final response = await post(
      Uri.parse('${baseUrl}auth/google'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'id_token': idToken}),
    );

    return response;
  }

  static Future<Response> getActiveWarehouse() async {
    var url = Uri.parse("${baseUrl}user/active/warehouse");
    var headers = await _headerWithToken();
    var response = await get(url, headers: headers);
    return response;
  }

  static Future<Response> getWarehouses() async {
    var url = Uri.parse("${baseUrl}warehouses/list");
    var headers = await _headerWithToken();
    var response = await get(url, headers: headers);
    return response;
  }

  static Future<Response> setActiveWarehouse(int warehouseId) async {
    var url = Uri.parse("${baseUrl}user/active/warehouse");
    var headers = await _headerWithToken();
    var payload = {"warehouse_id": warehouseId};
    var response =
        await post(url, headers: headers, body: json.encode(payload));
    return response;
  }

  static Future<Response> resetWarehouse() async {
    var url = Uri.parse("${baseUrl}user/reset/warehouse");
    var headers = await _headerWithToken();
    var response = await get(url, headers: headers);
    return response;
  }

  static Future<Response> getMaterials(query) async {
    var url = Uri.parse("${baseUrl}materials/list?query=$query");
    var headers = await _headerWithToken();
    var response = await get(url, headers: headers);
    return response;
  }

  static Future<Response> getMaterialList(query) async {
    var url = Uri.parse("${baseUrl}materials/select/list?query=$query");
    var headers = await _headerWithToken();
    var response = await get(url, headers: headers);
    return response;
  }

  static Future<Response> getMaterialBySKU(String code) async {
    var url = Uri.parse("${baseUrl}materials/by-sku/$code");
    var headers = await _headerWithToken();
    var response = await get(url, headers: headers);
    return response;
  }

  static Future<Response> getMaterialBySKUPreview(String code) async {
    var url = Uri.parse("${baseUrl}materials/by-sku/preview/$code");
    var headers = await _headerWithToken();
    var response = await get(url, headers: headers);
    return response;
  }

  static Future<Response> issueMaterial(
      String materialId,
      int quantity,
      String issueTo,
      int warehouseId,
      String? styleNumber,
      int cutPieces,
      String issueType,
      DateTime effectiveDate,
      String? bodyType,
      [int? selectedMrId]) async {
    var url = Uri.parse("${baseUrl}gi/issue");
    var headers = await _headerWithToken();
    var payload = {
      "stock_id": materialId,
      "qty": quantity,
      "issue_to": issueTo,
      "warehouse_id": warehouseId,
      "style_no": styleNumber,
      "cut_pieces": cutPieces,
      "transaction_type": issueType,
      "eff_date": effectiveDate.toString(),
      "body_type": bodyType,
      "mr_id": selectedMrId
    };
    var response =
        await post(url, headers: headers, body: json.encode(payload));
    return response;
  }

  static Future<Response> getStockMaterialById(int id) async {
    var url = Uri.parse("${baseUrl}stock/$id");
    var headers = await _headerWithToken();
    var response = await get(url, headers: headers);
    return response;
  }

  static uploadImage(String base64string, int? materialId) async {
    var url = Uri.parse("${baseUrl}materials/update/image/$materialId");
    var headers = await _headerWithToken();
    var payload = {
      "photo": base64string,
    };
    var response = post(url, headers: headers, body: json.encode(payload));
    return response;
  }

  static Future<Response> getCategories() async {
    var url = Uri.parse("${baseUrl}categories/list");
    var headers = await _headerWithToken();
    var response = await get(url, headers: headers);
    return response;
  }

  static Future<Response> getUOMs() async {
    var url = Uri.parse("${baseUrl}uom/list");
    var headers = await _headerWithToken();
    var response = await get(url, headers: headers);
    return response;
  }

  static Future<Response> getSuppliers() async {
    var url = Uri.parse("${baseUrl}suppliers/list");
    var headers = await _headerWithToken();
    var response = await get(url, headers: headers);
    return response;
  }

  static createMaterial(
      {required String name,
      required String uom,
      required String category,
      double? rate,
      String? supplier,
      String? color,
      double? width,
      double? height,
      double? length,
      double? size,
      double? weight,
      double? quantity,
      String? location,
      String? batch,
      String? invoice,
      DateTime? effDate,
      int? warehouseId}) async {
    var url = Uri.parse("${baseUrl}materials/create");
    var headers = await _headerWithToken();
    var payload = {
      "name": name,
      "uom_id": uom,
      "category_id": category,
      "rate": rate,
      "supplier_id": supplier,
      "color": color,
      "width": width,
      "height": height,
      "length": length,
      "size": size,
      "weight": weight,
      "quantity": quantity,
      "location": location,
      "batch": batch,
      "invoice": invoice,
      "eff_date": effDate?.toIso8601String(),
      "warehouse_id": warehouseId,
      "transaction_type_id": 1
    };
    var response = post(url, headers: headers, body: json.encode(payload));
    return response;
  }

  static createGRN(
      int warehouseId,
      String material,
      double quantity,
      String? location,
      String? batch,
      String invoice,
      DateTime dateTime,
      int? type,
      int? supplierId,
      [String? goodIssueCode]) async {
    var url = Uri.parse("${baseUrl}grn/create");
    var headers = await _headerWithToken();
    var payload = {
      "warehouse_id": warehouseId,
      "material_code": material,
      "qty": quantity,
      "location": location,
      "batch": batch,
      "invoice": invoice,
      "eff_date": dateTime.toIso8601String(),
      "type": type,
      "supplier_id": supplierId,
      "gi_code": goodIssueCode
    };
    var response = post(url, headers: headers, body: json.encode(payload));
    return response;
  }

  static Future<Response> getTransactionTypes() async {
    var url = Uri.parse("${baseUrl}transaction-types/list/gi");
    var headers = await _headerWithToken();
    var response = await get(url, headers: headers);
    return response;
  }

  static Future<Response> getSupplierList(query) async {
    var url = Uri.parse("${baseUrl}suppliers/select/list?query=$query");
    var headers = await _headerWithToken();
    var response = await get(url, headers: headers);
    return response;
  }

  static Future<Response> getGoodIssuingList(query) async {
    var url = Uri.parse("${baseUrl}gi/select/list?query=$query");
    var headers = await _headerWithToken();
    var response = await get(url, headers: headers);
    return response;
  }

  static Future<Response> getGoodIssuingListForWarehouse(query) async {
    var url = Uri.parse("${baseUrl}gi/for/warehouse/select/list?query=$query");
    var headers = await _headerWithToken();
    var response = await get(url, headers: headers);
    return response;
  }

  static Future<Response> getStyleList(query) async {
    var url = Uri.parse("${baseUrl}styles/select/list?query=$query");
    var headers = await _headerWithToken();
    var response = await get(url, headers: headers);
    return response;
  }

  static Future<Response> getMrList(query) async {
    var url = Uri.parse("${baseUrl}mrs/select/list?query=$query");
    var headers = await _headerWithToken();
    var response = await get(url, headers: headers);
    return response;
  }

  static Future<Response> getMrListForWarehouse(query) async {
    var url = Uri.parse("${baseUrl}mrs/for/warehouse/select/list?query=$query");
    var headers = await _headerWithToken();
    var response = await get(url, headers: headers);
    return response;
  }
}
