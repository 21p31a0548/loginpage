import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp2());
}
class MyApp2 extends StatefulWidget {
  const MyApp2({super.key});

  @override
  State<MyApp2> createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  bool? _ischecked=false;
  bool _mode=false;
  List<String> branch=["CSE","IT","ECE","EEE","MECH","AIML","DS","CIVIL",];
  String? drop="";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            SizedBox(height: 20,),
            CheckboxMenuButton(value: _ischecked, onChanged: (val){
              setState(() {
                _ischecked=val;
              });
            }, child: Text("save the credentials"),
            trailingIcon: Icon(Icons.save),
            ),
            SizedBox(height: 20,),
            SwitchListTile(value: _mode, onChanged: (val){
              setState(() {
                _mode=val;
              });
            },
              title: Text("Allow Notifications"),
            ),
            SizedBox(height: 20,),
            DropdownMenu(dropdownMenuEntries: branch.map<DropdownMenuEntry<String>>((e) {
              return DropdownMenuEntry(value: e, label: "$e ");
            }).toList(),
              onSelected: (val){
              setState(() {
                drop=val;
              });
              },
              hintText: "Select",
            ),
            SizedBox(height: 20,),
            _ischecked==true &&   _mode && drop!.isNotEmpty ?
            Center(
              child: ElevatedButton(onPressed: (){
                if(_ischecked==true){
                  print("Verified");
                }
                else {
                  print("Not Verified");
                  }
              },
                  child: Text("check")),):Text("")
           ],
        ),
      ),
    );
  }
}
