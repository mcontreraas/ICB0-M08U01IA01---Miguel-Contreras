import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:flutter/cupertino.dart';

class Dog {
  final String name;
  final String location;
  final String description;
  String imageUrl;
  String imagen;
  int rating = 5;


  Dog(this.name, this.location, this.description, this.imagen);

  Future getImageUrl() async {
    if (imageUrl != null) {
      return;
    }

    HttpClient http = new HttpClient();
    try {
      //var uri = Uri.https('dog.ceo', '/api/breeds/image/random');
      //var request = await http.getUrl(uri);
      //var response = await request.close();
      //var responseBody = await response.transform(utf8.decoder).join();

      imageUrl = imagen;
    } catch (exception) {
      print(exception);
    }
  } 
}
