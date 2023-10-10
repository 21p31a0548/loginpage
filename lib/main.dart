import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
  
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyForms(),
    );
  }
}
class MyForms extends StatefulWidget {
  const MyForms({super.key});

  @override
  State<MyForms> createState() => _MyFormsState();
}

class _MyFormsState extends State<MyForms> {
  String err="";
  final emailAddress=TextEditingController();
  final password=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Text("Forms"),
          ),
          SizedBox(height: 10,),
          TextField(
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
            cursorColor: Colors.yellow,
            keyboardType: TextInputType.emailAddress,
            // cursorHeight: 56,
            // cursorWidth: 10,
            cursorRadius: Radius.circular(39),
            //textAlign: TextAlign.center,
            textCapitalization: TextCapitalization.characters,
            //obscureText: true,
            keyboardAppearance: Brightness.dark,
            showCursor: true,
            onChanged: (val){
              print(val);
            },
            controller: emailAddress,
          ),
          TextField(
            obscureText: true,
            controller: password,
          ),
          err.length==0? SizedBox(height: 20,):Text("$err",style: TextStyle(),),

          ElevatedButton(onPressed: (){
            if(emailAddress.text.isEmpty || password.text.isEmpty){
              setState(() {
                err="enter all the feilds";
              });
            }
            else{
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyScreen()));
            }
            },
            child: Text("submit",),
          ),
        ],
      ),
    );
  }
}
class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
      ),
    );
  }
}