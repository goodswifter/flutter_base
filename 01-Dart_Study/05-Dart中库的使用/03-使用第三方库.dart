import 'package:http/http.dart' as http;

main(List<String> args) async {
  var url = 'http://123.207.32.32:8000/home/multidata';
  var reponse = await http.get(url);
  
  print('Response status: ${reponse.statusCode}');
  print('Response body: ${reponse.body}');
}