import 'dart:convert';

import 'package:http/http.dart' as http;
class NetwrokHelper{
  String Url;
  NetwrokHelper(this.Url);
  Future getData()async{
    http.Response response=await http.get(Uri.parse(Url));
    if(response.statusCode==200){
      String data=response.body;
      return jsonDecode(data);

    }else{
      print('error in networking ${response.statusCode}');
    }
  }
}