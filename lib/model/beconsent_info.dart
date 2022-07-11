import 'package:http/http.dart' as http;
import 'package:beconsent_sdk/model/getWorkspace.dart';
  
  

class beconsent_api{

 
  beconsent_api({
    this.url,
  });

  String? url;
  GetWorkspace? _ws;
  Future<String?> getInfo() async{
    final link = Uri.parse('http://sit-consent.beconsent.tech:3003/api/v1/workspaces/1');
    http.Response response = await http.get(link);
    _ws = getWorkspaceFromJson(response.body);
    return (_ws?.uuid);
  }

  Future<http.Response> getUUID() async{
    final link = Uri.parse('https://fakestoreapi.com/products/1');
    http.Response response = await http.get(link);

    return response;
  }

  Future<String?> getStatus() async {
  try {
    final link = Uri.parse('https://fakestoreapi.com/products/1');
    http.Response response = await http.get(link);
    _ws = getWorkspaceFromJson(response.body);
    String? status = _ws?.uuid;
    return status;
  } catch (e) {
    print(e);
    return 'error';
  }
}
}
