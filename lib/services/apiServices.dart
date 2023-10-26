import 'dart:convert';
import 'dart:developer';


import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:provider/provider.dart';

import '../config/appConfig.dart';




class ApiServices {
  Future<http.Response?> getData(String uri,{String? tocken}) async {
    var url = baseUrl+uri;
    try {
        http.Response response = await http.get(
        Uri.parse(url),
          headers: {
            "Authorization": "Bearer "+"${tocken??""}",
          }
      );
        print(response.body);
        if (response.statusCode == 200) {
        return response;
      }else if(response.statusCode == 302){
          return null;
        }
        else{
          Fluttertoast.showToast(msg: json.decode(response.body)["message"]);
          return null;
      }
    } catch (e) {

      print("Error in getData ${uri} ${e.toString()}");
      Fluttertoast.showToast(msg: "Something Went wrong");
    }
  }


  Future<http.Response?> postData(String uri, dynamic body,BuildContext context,
      {bool? header,he}) async {
    print(body);
    log(he.toString());
    try {

      http.Response response = await http.post(
        Uri.parse(baseUrl+uri),
        body: (body),
        headers: header!=null?{
          "Authorization": "Bearer "+he,
        }:null
      );
      print(response.statusCode);
      log(response.body);
      if (response.statusCode == 200) {
        return response;
      }else if(response.statusCode == 302){
        return null;
      }
      else if(response.statusCode == 400){

        Fluttertoast.showToast(msg: json.decode(response.body)["message"]);
        return null;
      }
      else{

        Fluttertoast.showToast(msg: json.decode(response.body)["message"]);
        return null;
      }


    } catch (e) {

      print("Error in postData ${uri} ${e.toString()}");
      Fluttertoast.showToast(msg: "Something Went wrong");
      return null;
    }
  }




  Future<http.Response?> simplegetData(String uri,{String? tocken}) async {
    try {
      http.Response response = await http.get(
          Uri.parse(uri),

      );
      print(response.body);
      if (response.statusCode == 200) {
        return response;
      }else if(response.statusCode == 302){}

      else{
        Fluttertoast.showToast(msg: json.decode(response.body)["message"]);
      }
    } catch (e) {

      print("Error in getData ${uri} ${e.toString()}");
      Fluttertoast.showToast(msg: "Something Went wrong");
    }
  }




}


