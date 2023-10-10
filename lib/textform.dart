import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyForm(),
    );
  }
}
class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  bool? _ischecked=false;
  final _formkey=GlobalKey<FormState>();
  final _email=TextEditingController();
  final _password=TextEditingController();
  bool pass_vadility=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(),
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.cyan,
                    child: Image(
                      fit: BoxFit.fill,
                      image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQV3YPesUrtOFI4tUX6pZihe1wI7djiIZ-2JQ&usqp=CAU"),
                    ),
                  ),
                )),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                keyboardAppearance: Brightness.dark,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 30),
                  hintText: "Email",
                  labelText: "Email Address",
                ),
                controller: _email,
                validator: (val)=>val!.length==0 ? "Enter email address":null,
              ),
            ),

            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                keyboardAppearance: Brightness.dark,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 30),
                  hintText: "Password",
                  labelText: "Password",
                   suffixIcon: IconButton(
                    onPressed: (){
                      setState(() {
                        pass_vadility=!pass_vadility;
                      });
                    },
                    icon: Icon(
                        Icons.remove_red_eye_outlined,),
                  ),
                  suffixIconColor: Colors.red,
                  //counter: Offstage(),
                ),
                obscureText: pass_vadility,
                //maxLength: 30,
                controller: _password,
                validator: (val)=>val!.isEmpty? "Enter your password":null,
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: CheckboxMenuButton(value: _ischecked, onChanged: (val){
                setState(() {
                  _ischecked=val;
                });
              }, child: Text("save the credentials"),
                focusNode: FocusNode(),
              ),
            ),
            SizedBox(height: 20,),
            TextButton(onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>Screen2()));
            },
                child: Text("forgotten your password",
              style: TextStyle(
              color: Colors.green,
            ),)),
            SizedBox(height: 10,),
            ElevatedButton(onPressed:(){
              if(_formkey.currentState!.validate()){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen()));
              }
            },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )
                ),
                child: Text("Login")),

            SizedBox(height: 5,),
            Center(child: Text("Don't have an account?")),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen1()));
            },
                child: Text("Create account",)
            )
          ],
        ),
      ),
    );
  }
}

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final _formatKey=GlobalKey<FormState>();
  final _name=TextEditingController();
  final _name2=TextEditingController();
  final _email=TextEditingController();
  final _pass=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal.shade50,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Screen1"),
        ),
        body: Form(
          key:_formatKey,
          child: Column(
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  keyboardAppearance: Brightness.dark,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 30),
                    hintText: "First Name",
                    labelText: "First Name",
                  ),

                  controller: _name,
                  validator: (val)=>val!.isEmpty? "Enter name":null,
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  keyboardAppearance: Brightness.dark,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 30),
                    hintText: "Last Name",
                    labelText: "Last Name",

                  ),
                  controller: _name2,
                  validator: (val)=>val!.isEmpty? "Enter your name":null,
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  keyboardAppearance: Brightness.dark,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 30),
                    hintText: "Email Address",
                    labelText: "Email",
                  ),
                  controller: _email,
                  validator: (val)=>val!.isEmpty? "Enter email":null,
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  keyboardAppearance: Brightness.dark,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 30),
                    hintText: "Password",
                    labelText: "Password",

                  ),
                  controller: _pass,
                  validator: (val)=>val!.isEmpty? "Enter your password":null,
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed:(){
                if(_formatKey.currentState!.validate()){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyForm()));
                }
              },
                  style: ElevatedButton.styleFrom(
                      elevation: 30,
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )
                  ),
                  child: Text("Sign in")),
            ],
          ),
        ),
      ),
    );
  }
}

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  final _formalkey=GlobalKey<FormState>();
  final _new1=TextEditingController();
  final _new2=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.cyan.shade50,
        body: Form(
          key: _formalkey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    keyboardAppearance: Brightness.dark,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 30),
                      hintText: "New Password",
                      labelText: "New Password",
                    ),
                    maxLength: 30,
                    controller: _new1,
                    validator: (val)=>val!.length==0 ? "New Password":null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    keyboardAppearance: Brightness.dark,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 30),
                      hintText: "Conform Password",
                      labelText: "Conform Password",
                    ),
                    maxLength: 30,
                    controller: _new2,
                    validator: (val)=>val!.length==0 ? "conform Password":null,
                  ),
                ),
                ElevatedButton(onPressed: (){
                  if(_formalkey.currentState!.validate()){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyForm()));
                  }
                },

                    child: Text("Reset"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  int index=0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child:
        Scaffold(
          drawer: Drawer(
            backgroundColor: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(70),
                  child: Container(
                    height: 140,
                    width: 140,
                    color: Colors.pink,
                    child: Image(
                      fit: BoxFit.fill,
                      image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8pWUPWJlyH82JWB_Um89yv3e0Rrtv44nPdQ&usqp=CAU"),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                TextButton(
                  onPressed: (){},
                  child: Text("wishlist",style: TextStyle(color: Colors.black,fontSize: 20),),
                ),
                SizedBox(height: 10,),
                TextButton(
                  onPressed: (){},
                  child: Text("Add to cart",style: TextStyle(color: Colors.black,fontSize: 20),),
                ),
                SizedBox(height: 10,),
                TextButton(
                  onPressed: (){},
                  child: Text("BuyNow",style: TextStyle(color: Colors.black,fontSize: 20),),
                ),
                SizedBox(height: 10,),
                TextButton(
                  onPressed: (){},
                  child: Text("Logout",style: TextStyle(color: Colors.black,fontSize: 20),),
                ),
              ],
            ),
          ),
          appBar:AppBar(backgroundColor: Colors.green,
            title: Center(child: Text('PlantStore',style: TextStyle(fontSize: (18)),)),
            actions: [IconButton(onPressed: (){}, icon: Icon(Icons.search_rounded)),],),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.red,
            elevation: 30,
            currentIndex: index,
            selectedIconTheme: IconThemeData(
                color: Colors.blue),
            unselectedIconTheme: IconThemeData(
                color: Colors.black),
            onTap: (idx){
              index=idx;
              setState(() {

              });
            },
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.green,
            items: const [
              BottomNavigationBarItem(icon:Icon(Icons.home),label: "Home",),
              BottomNavigationBarItem(icon: Icon(Icons.favorite_border),label: "favorites"),
              BottomNavigationBarItem(icon: Icon(Icons.message),label: "Message"),
              BottomNavigationBarItem(icon: Icon(Icons.person),label: "account"),
           ],
         ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: (
                Column(
                  children: [SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child:
                      Row(
                        children: [
                          Center(
                            child:Card(
                              child: SizedBox(
                                height: 500,
                                width: 500,
                                child: Image(fit: BoxFit.fill,image: NetworkImage("https://images.unsplash.com/photo-1612363228106-c94b0754e2c1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1964&q=80"),),
                              ),
                            ),
                          ),
                          Center(
                            child:Card(
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 500,
                                    width: 500,
                                    child: Image(fit: BoxFit.fill,image: NetworkImage("https://images.unsplash.com/photo-1614594975525-e45190c55d0b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1964&q=80"),),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child:Card(
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 500,
                                    width: 500,
                                    child: Image(fit: BoxFit.fill,image: NetworkImage("https://images.unsplash.com/photo-1509423350716-97f9360b4e09?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1935&q=80"),
                                      height: 300,width: 300,),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                  ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text("Popular",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        Flexible(fit: FlexFit.tight, child: SizedBox()),
                        Text('See More',style: TextStyle(fontSize: 15,color: Colors.green),),
                      ],
                    ),
                    Column(
                      children: [
                        SingleChildScrollView(scrollDirection: Axis.horizontal,
                          child:
                          Row(
                            children: [
                              Card(
                                color: Colors.white,
                                child:SizedBox(
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image(image: NetworkImage("https://images.unsplash.com/photo-1612363228106-c94b0754e2c1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1964&q=80"),
                                          height: 200,width: 200,),
                                      ),
                                      Text("Monstera Minima Plant",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                                      Row(
                                        children: [
                                          Icon(Icons.star,color: Colors.green),
                                          Icon(Icons.star,color: Colors.green),
                                          Icon(Icons.star,color: Colors.green),
                                          Icon(Icons.star,color: Colors.green),
                                          Icon(Icons.star_half,color: Colors.green),
                                        ],
                                      ),
                                      Text("Rs.800.99"),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                child: Card(
                                  child: SizedBox(
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image(image: NetworkImage("https://images.unsplash.com/photo-1612363066736-a4a933de2cab?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=464&q=80"),
                                            height: 200,width: 200,),
                                        ),
                                        Text("Dracaena fragrans Plant",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                                        Row(
                                          children: [
                                            Icon(Icons.star,color: Colors.green),
                                            Icon(Icons.star,color: Colors.green),
                                            Icon(Icons.star,color: Colors.green),
                                            Icon(Icons.star,color: Colors.green),
                                            Icon(Icons.star,color: Colors.grey,),
                                          ],
                                        ),
                                        Text("Rs.790.99"),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                child: Card(
                                  child:
                                  SizedBox(
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image(image: NetworkImage("https://images.unsplash.com/photo-1610630694586-2af2f4cefcf0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1964&q=80"),
                                            height: 200,width: 200,),
                                        ),
                                        Text("Alocasia macrorrhiza Plant",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                                        Row(
                                          children: [
                                            Icon(Icons.star,color: Colors.green),
                                            Icon(Icons.star,color: Colors.green),
                                            Icon(Icons.star,color: Colors.green),
                                            Icon(Icons.star_half,color: Colors.green),
                                            Icon(Icons.star,color: Colors.grey,),
                                          ],
                                        ),
                                        Text("Rs.790.99"),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                child: Card(
                                  child:
                                  SizedBox(
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image(image: NetworkImage("https://images.unsplash.com/photo-1616500443036-788d60118813?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=465&q=80"),
                                            height: 200,width: 200,),
                                        ),
                                        Text("Alocasia cucullata Plant",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                                        Row(
                                          children: [
                                            Icon(Icons.star,color: Colors.green),
                                            Icon(Icons.star,color: Colors.green),
                                            Icon(Icons.star,color: Colors.green),
                                            Icon(Icons.star_half,color: Colors.green),
                                            Icon(Icons.star,color: Colors.grey,),
                                          ],
                                        ),
                                        Text("Rs.790.99"),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text("Category",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        //Flexible(fit: FlexFit.tight, child: SizedBox()),
                        Text('See More',style: TextStyle(fontSize: 15,color: Colors.green),)
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                      children: [
                        SingleChildScrollView(scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Card(
                                shadowColor:Colors.blueGrey,
                                elevation: 10,
                                color:Colors.grey,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                child:
                                SizedBox(
                                  height: 40,
                                  width: 90,
                                  child: Row(
                                    children: [
                                      Center(child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(" Indoor",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.blueGrey),),
                                      )),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              Card(
                                shadowColor:Colors.blueGrey,
                                elevation: 10,
                                color:Colors.grey,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                child:
                                SizedBox(
                                  height: 40,
                                  width: 90,
                                  child: Row(
                                    children: [
                                      Center(child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(" Outdoor",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.blueGrey),),
                                      )),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              Card(
                                shadowColor:Colors.blueGrey,
                                elevation: 10,
                                color:Colors.grey,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                child:
                                SizedBox(
                                  height: 40,
                                  width: 110,
                                  child: Row(
                                    children: [
                                      Center(child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text("Air Purifying",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold
                                            ,color: Colors.blueGrey),),
                                      )),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              Card(
                                shadowColor:Colors.blueGrey,
                                elevation: 10,
                                color:Colors.grey,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                child:
                                SizedBox(
                                  height: 40,
                                  width: 110,
                                  child: Row(
                                    children: [
                                      Center(child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text("Pet Friendly",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold
                                            ,color: Colors.blueGrey),),
                                      ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              Card(
                                shadowColor:Colors.blueGrey,
                                elevation: 10,
                                color:Colors.grey,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                child:
                                SizedBox(
                                  height: 40,
                                  width: 70,
                                  child: Row(
                                    children: [
                                      Center(child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text("Potted",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold
                                            ,color: Colors.blueGrey),),
                                      )),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text("Recommended",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        Flexible(fit: FlexFit.tight, child: SizedBox()),
                        Text('See More',style: TextStyle(fontSize: 15,color: Colors.green),),
                      ],
                    ),
                    Column(
                      children: [
                        SingleChildScrollView(scrollDirection: Axis.horizontal,
                          child:
                          Row(
                            children: [
                              Card(
                                color: Colors.white,
                                child:SizedBox(
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image(image: NetworkImage("https://images.unsplash.com/photo-1614594895304-fe7116ac3b58?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=464&q=80"),
                                          height: 200,width: 200,),
                                      ),
                                      Text("Zamioculcas zamiifolia Plant",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                                      Row(
                                        children: [
                                          Icon(Icons.star,color: Colors.green),
                                          Icon(Icons.star,color: Colors.green),
                                          Icon(Icons.star,color: Colors.green),
                                          Icon(Icons.star,color: Colors.green),
                                          Icon(Icons.star_half,color: Colors.green),
                                        ],
                                      ),
                                      Text("Rs.800.99"),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                child: Card(
                                  child:
                                  SizedBox(
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image(image: NetworkImage("https://images.unsplash.com/photo-1620127807580-990c3ecebd14?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=465&q=80"),
                                            height: 200,width: 200,),
                                        ),
                                        Text("Zeylanica Plant",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                                        Row(
                                          children: [
                                            Icon(Icons.star,color: Colors.green),
                                            Icon(Icons.star,color: Colors.green),
                                            Icon(Icons.star,color: Colors.green),
                                            Icon(Icons.star,color: Colors.green),
                                            Icon(Icons.star,color: Colors.grey,),
                                          ],
                                        ),
                                        Text("Rs.790.99"),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                child: Card(
                                  child:
                                  SizedBox(
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image(image: NetworkImage("https://images.unsplash.com/photo-1615390038827-b6141807160f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=464&q=80"),
                                            height: 200,width: 200,),
                                        ),
                                        Text("Moonshine Plant",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                                        Row(
                                          children: [
                                            Icon(Icons.star,color: Colors.green),
                                            Icon(Icons.star,color: Colors.green),
                                            Icon(Icons.star,color: Colors.green),
                                            Icon(Icons.star_half,color: Colors.green),
                                            Icon(Icons.star,color: Colors.grey,),
                                          ],
                                        ),
                                        Text("Rs.790.99"),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                child: Card(
                                  child:
                                  SizedBox(
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image(image: NetworkImage("https://images.unsplash.com/photo-1614594895304-fe7116ac3b58?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=464&q=80"),
                                            height: 200,width: 200,),
                                        ),
                                        Text("Zamioculcas zamiifolia Plant",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                                        Row(
                                          children: [
                                            Icon(Icons.star,color: Colors.green),
                                            Icon(Icons.star,color: Colors.green),
                                            Icon(Icons.star,color: Colors.green),
                                            Icon(Icons.star_half,color: Colors.green),
                                            Icon(Icons.star,color: Colors.grey,),
                                          ],
                                        ),
                                        Text("Rs.790.99"),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text("Explore",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        Flexible(fit: FlexFit.tight, child: SizedBox()),
                        Text('See More',style: TextStyle(fontSize: 15,color: Colors.green),),
                      ],
                    ),
                    Column(
                      children: [
                        SingleChildScrollView(scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Card(
                                color: Colors.white,
                                child:SizedBox(
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image(image: NetworkImage("https://images.unsplash.com/photo-1614594895304-fe7116ac3b58?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=464&q=80"),
                                          height: 200,width: 200,),
                                      ),
                                      Text("Zamioculcas zamiifolia Plant",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                                      Row(
                                        children: [
                                          Icon(Icons.star,color: Colors.green),
                                          Icon(Icons.star,color: Colors.green),
                                          Icon(Icons.star,color: Colors.green),
                                          Icon(Icons.star,color: Colors.green),
                                          Icon(Icons.star_half,color: Colors.green),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(width: 10),
                                          Text("Rs.800.99"),
                                          Icon(Icons.add_circle_outline_outlined),
                                          Center(
                                            child: SizedBox(width:8),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('1 '),
                                          ),
                                          Icon(Icons.remove_circle_outline_outlined),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                child: Card(
                                  child:
                                  SizedBox(
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image(image: NetworkImage("https://images.unsplash.com/photo-1620310252507-c65943dbd411?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1965&q=80"),
                                            height: 220,width: 220,),
                                        ),
                                        Text("Peace Lily ",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                                        Row(
                                          children: [
                                            Icon(Icons.star,color: Colors.green),
                                            Icon(Icons.star,color: Colors.green),
                                            Icon(Icons.star,color: Colors.green),
                                            Icon(Icons.star_half,color: Colors.green),
                                            Icon(Icons.star,color: Colors.grey,),
                                          ],
                                        ),
                                        Text("Rs.790.99"),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                child: Card(
                                  child:
                                  SizedBox(
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image(image: NetworkImage('https://images.unsplash.com/photo-1610976340891-13d54e59638a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1964&q=80'),
                                            height: 220,width: 220,),
                                        ),
                                        Text(" Philodendron squamiferum",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                                        Row(
                                          children: [
                                            Icon(Icons.star,color: Colors.green),
                                            Icon(Icons.star,color: Colors.green),
                                            Icon(Icons.star,color: Colors.green),
                                            Icon(Icons.star_half,color: Colors.green),
                                            Icon(Icons.star,color: Colors.grey,),
                                          ],
                                        ),
                                        Text("Rs.790.99"),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                child: Card(
                                  child:
                                  SizedBox(
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image(image: NetworkImage('https://images.unsplash.com/photo-1608625559126-02dbc60ffb76?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1965&q=80'),
                                            height: 220,width: 220,),
                                        ),
                                        Text("Philodendron red cherry",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                                        Row(
                                          children: [
                                            Icon(Icons.star,color: Colors.green),
                                            Icon(Icons.star,color: Colors.green),
                                            Icon(Icons.star,color: Colors.green),
                                            Icon(Icons.star_half,color: Colors.green),
                                            Icon(Icons.star,color: Colors.grey,),
                                          ],
                                        ),
                                        Text("Rs.790.99"),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )
            ),
          ),
        ),
        ),
      );
  }
}