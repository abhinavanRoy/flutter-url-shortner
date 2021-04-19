import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:urlshortner/Model/url_shoetner_response_model.dart';

class UrlShortnerState extends ChangeNotifier{
final urlController = TextEditingController();
String  finalUrl = "See your resultant URL here";

handleGetLinkButton() async{
  final longUrl = urlController.text;

  final String shortUrl = await getShortLink(longUrl);
  finalUrl = "$shortUrl";
  notifyListeners();

}

Future<String> getShortLink(String longUrl) async{

  final result = await http.post("https://cleanuri.com/api/v1/shorten",body: {"url": longUrl});



  if(result.statusCode ==200){
  print("Success");
  final response = urlShortnerResponseFromJson(result.body);

  return response.resultUrl;
}else{
  print("Error with api");
  print(result.body);
  return "Error while shortening the URL! ";
}

}
}