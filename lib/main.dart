import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  bool hidePass = true;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              TextFormField(
                controller: name,
                decoration: InputDecoration(
                  label: Text("Enter Your Name"),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)
                  ),
                  hintText: "John Doe",
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value){
                  if(value==null || value ==" " || value.isEmpty){
                    return "Name is Required";
                  }
                },
              ),

              SizedBox(height: 10,),

              TextFormField(
                controller: email,
                decoration: InputDecoration(
                  label: Text("Enter Your Email"),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)
                  ),
                  hintText: "John Doe",
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value){
                  if(value==null || value ==" " || value.isEmpty){
                    return "Email is Required";
                  }
                },
              ),

              SizedBox(height: 10,),

              TextFormField(
                controller: pass,
                decoration: InputDecoration(
                  label: Text("Enter Your Password"),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)
                  ),
                  hintText: "John Doe",
                  prefixIcon: Icon(Icons.key),
                  suffixIcon: IconButton(onPressed: (){
                    setState(() {
                      hidePass = !hidePass;
                    });
                  }, icon: hidePass==false?Icon(Icons.remove_red_eye):Icon(Icons.panorama_fish_eye_outlined))
                ),
                obscureText: hidePass==false?false:true,
                validator: (value){
                  if(value==null || value ==" " || value.isEmpty){
                    return "Password is Required";
                  }
                  if(value.length<6){
                    return "Password must be of 6 digits or more";
                  }
                },
              ),

              SizedBox(height: 10,),

              ElevatedButton(onPressed: (){
             if(formkey.currentState!.validate()){
               print(name.text.toString());
               print(email.text.toString());
               print(pass.text.toString());
               name.clear();
               email.clear();
               pass  .clear();
             }
              }, child: Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}


