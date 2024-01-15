import 'package:http/http.dart' as http;

import '../../model.dart';

class Services {
   Future<List<PostModel>?> getPost () async{
    var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if(response.statusCode == 200){
      var jsonString = response.body;
      print("the response body is $jsonString");
      return postModelFromJson(jsonString);

    }else{
      throw Exception("error occurred data not fetched");
    }
  }
}
