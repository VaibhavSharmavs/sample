import 'package:flutter/material.dart';
import 'package:sample/model/email_response.dart';
import 'package:sample/services/api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String output1 = '';
  String output2 = '';

  final TextEditingController string1 = TextEditingController();
  final TextEditingController string2 = TextEditingController();
  void getOutput(String str1, String str2) {
    String strDup1 = str1;
    for (int i = 0; i < str2.length; i++) {
      str1 = str1.replaceAll(str2[i], '');
    }
    for (int i = 0; i < strDup1.length; i++) {
      str2 = str2.replaceAll(strDup1[i], '');
    }

    setState(() {
      output1 = str1;
      output2 = str2;
    });

    print(
        '${(str1.isNotEmpty) ? str1 : null} , ${(str2.isNotEmpty) ? str1 : null} ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Sample')),
        body: Column(children: [
          FutureBuilder(
              future: getEmail(),
              builder: (context, snapshot) {
                EmailResponse response = snapshot.data as EmailResponse;
                return Text('${response.data?.email}');
              }),
          FutureBuilder(
              future: getEmail1(),
              builder: (context, snapshot) {
                EmailResponse response = snapshot.data as EmailResponse;
                return Text('${response.data?.email}');
              }),
          FutureBuilder(
              future: getEmail2(),
              builder: (context, snapshot) {
                EmailResponse response = snapshot.data as EmailResponse;
                return Text('${response.data?.email}');
              }),
          TextFormField(
            controller: string1,
          ),
          TextFormField(
            controller: string2,
          ),
          ElevatedButton(
            onPressed: () {
              getOutput(string1.text, string2.text);
            },
            child: Text('click me'),
          ),
          Text(
              '${(output1.isNotEmpty) ? output1 : null} , ${(output2.isNotEmpty) ? output1 : null} '),
        ]));
  }
}
