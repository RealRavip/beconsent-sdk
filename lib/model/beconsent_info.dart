import 'package:http/http.dart' as http;


cancelConsent(int id) async{
  int consent_id = id;
    final url = Uri.parse("http://dev.beconsent.tech/api/v1/03a29a62-eb39-4d7b-895c-7e900d893e37/user-consents");
    var response = await http.post(url, body: {
      "consentId": consent_id.toString(),
      "uid": "real_test",
      "name":"Test customAPI",
      "consentVersion": "2",
      "action": "NONE",
      "language": "th",
      "collectionChannel": "Mobile App"
    });
    print(response.statusCode);
    print(response.body);
  }