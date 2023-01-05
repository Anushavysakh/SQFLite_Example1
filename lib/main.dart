import 'package:flutter/material.dart';

import 'database_helper.dart';

void main(){
  runApp(const MaterialApp(home: HomePage(),));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SqfLite")),
      body: Column(
        children: <Widget>[
          TextButton(onPressed:() async {
            int i = await DatabaseHelper.instance.insert({
              DatabaseHelper.columnName: 'Anu'
            });
            print('the inserted id is $i');
          } , child: Text('insert'),),
          TextButton(onPressed:() async {
            List<Map<String,dynamic>> queryRows = await DatabaseHelper.instance.queryAll();
            print(queryRows);
          } , child: Text('query'),),
          TextButton(onPressed:() async {
            int updated = await DatabaseHelper.instance.update(
                {DatabaseHelper.columnId: 1,
                DatabaseHelper.columnName:'Mark'});
          } , child: Text('update'),),
          TextButton(onPressed:() async {
            int rowAffected = await DatabaseHelper.instance.delete(2);
          } , child: Text('delete'),),

        ],
      ),
    );
  }
}

