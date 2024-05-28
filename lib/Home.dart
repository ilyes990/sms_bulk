// ignore_for_file: prefer_final_fields, unused_field, prefer_const_constructors

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:sms_sender/customtextfield.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _messageController = TextEditingController();
  String? _fileName;
  List<String> _contacts = ["+213674130077"];

  Future<void> _pickFile() async {
    var result =
        await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['txt']);
    if (result != null) {
      File file = File(result.files.single.path ?? "");
      _fileName = result.files.single.name;
      String filecontent = await file.readAsString();
      setState(() {
        // _contacts = filecontent.split('\n').map((e) => e.trim()).toList();
        _contacts = [];
      });
    }
  }

  void _sendSms() async {
    String message = _messageController.text;
    if (_contacts.isNotEmpty) {
      String result = await sendSMS(
        message: message,
        recipients: _contacts,
      ).catchError((e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
        print(e.toString());
        return e.toString();
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 238, 238, 238),
      appBar: AppBar(
        // backgroundColor: Color.fromARGB(255, 238, 238, 238),
        centerTitle: true,
        title: Text(
          'S M S  B U L K ',
          style: TextStyle(color: Color.fromARGB(255, 231, 231, 231), fontSize: 20),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.message_sharp,
                size: 100,
              ),
              SizedBox(height: 20),
              CustomTextField(
                controller: _messageController,
              ),
              SizedBox(height: 120),
              ElevatedButton(
                onPressed: _pickFile,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(50, 20, 50, 20)),
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                ),
                child: Text(
                  "S E L E C T  F I L E",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 22, 22, 22),
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 15),
              Text(
                _fileName ?? 'No file selected',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: _sendSms,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 41, 41, 41)),
                  padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(50, 20, 50, 20)),
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                ),
                child: Text(
                  "S E N D  S M S",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
