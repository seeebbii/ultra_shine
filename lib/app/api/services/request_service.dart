import 'dart:convert';
import 'package:get/get.dart';
import 'package:ultra_shine/app/api/api.endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:ultra_shine/controller/api/request/request_controller.dart';

class RequestService {
  //final _client = http.Client();
  static RequestController instance = Get.find();
  Future<void> postRequest(
    String name,
    String email,
    String contact,
    String yearMake,
    String model,
    String polished,
    String city,
    String country,
    String manufacturer,
    String address,
  ) async {
    var url = Uri.parse('$baseUrl/requests');


    
    //for multipartrequest
    var request = http.MultipartRequest('POST', url);
    request.fields['name'] = name;
    request.fields['email'] = email;
    request.fields['contact_number'] = contact;
    request.fields['make'] = yearMake;
    request.fields['model'] = model;
    request.fields['previous_polish'] = polished;
    request.fields['country_id'] = country;
    request.fields['city_id'] = city;
    request.fields['manufacturer'] = manufacturer;
    request.fields['address'] = address;
    request.fields['vehicle_type_id'] = '';
    request.fields['paint_work_id'] = '';
    request.fields['polishing_id'] = '';
    request.fields['polishing_type_id'] = '';
    request.fields['film_id'] = '';
    request.fields['film_type_id'] = '';
    request.fields['paint_option_id'] = '';

    //for token
    // request.headers.addAll({"Authorization": "Bearer token"});
    //for image and videos and files
    print(instance.assets.length);

    instance.assets.forEach((element) async {
      request.files.add(
          await http.MultipartFile.fromPath("files", element.path.toString()));
    });

    //for completeing the request
    var response = await request.send();

    //for getting and decoding the response into json format
    var responsed = await http.Response.fromStream(response);
    final responseData = json.decode(responsed.body);

    if (response.statusCode == 200) {
      print("SUCCESS");
      print(responseData);
    } else {
      print("ERROR");
    }
    // }}
  }
}
