
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled123/login_screen.dart';

//import 'camera_page.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return initWidget();

  }
  DateTime selectedDate = DateTime.now();
  void selectDate() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1915, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
  void _showImageDialog(){
    showDialog(
        context:context,
        builder:(context){
          return AlertDialog(
              title:const Text("Please choose an option"),
              content:Column(
                mainAxisSize:MainAxisSize.min,
                children:[
                  InkWell(
                      onTap: (){
                        _getFromCamera();
                      },
                      child:Row(
                          children:const [
                            Padding(
                                padding:EdgeInsets.all(4.0),
                                child:Icon(
                                  Icons.camera,
                                  color: Colors.orange,
                                )
                            ),
                            Text(
                              "Camera",
                              style:TextStyle(color:Colors.orange),
                            ),
                          ]
                      )
                  ),
                  InkWell(
                      onTap: (){
                        _getFromGallery();
                      },
                      child:Row(
                          children:const [
                            Padding(
                                padding:EdgeInsets.all(4.0),
                                child:Icon(
                                  Icons.image,
                                  color: Colors.orange,
                                )
                            ),
                            Text(
                              "Gallery",
                              style:TextStyle(color:Colors.orange),
                            ),
                          ]
                      )
                  )
                ],
              )
          ) ;
        }
    );
  }

  void _getFromCamera() async
  {
    XFile? pickedFile = await ImagePicker().pickImage(source:ImageSource.camera);
    Navigator.pop(context);
  }
  void _getFromGallery() async
  {
    XFile? pickedFile = await ImagePicker().pickImage(source:ImageSource.gallery);
    Navigator.pop(context);
  }


  Widget initWidget() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 300,
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(90)),
                    color: Color(0xffF5591F),
                    gradient: LinearGradient(
                        colors: [(Color(0xffF5591F)), (Color(0xffF2861E))],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 50),
                        height: 90,
                        width: 90,
                        child: Image.asset('images/app_logo.png'),
                      ),

                    ],
                  ),
                )
            ),
            Container(
                margin:const EdgeInsets.only(left:20,right:20,top:70),
                padding:const EdgeInsets.only(left:20,right:20),
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color:Colors.grey[200],
                  boxShadow:const [BoxShadow(
                      offset:Offset(0,10),
                      blurRadius:50,
                      color:Color(0xffEEEEEE)
                  )],
                ),
                alignment: Alignment.center,
                child:const TextField(
                    cursorColor:Color(0xffF5591F),
                    decoration:InputDecoration(
                      icon:Icon(
                        Icons.person_add,
                        color:Color(0xffF5591F),
                      ),
                      hintText:"Enter Full Name",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    )
                )
            ),
            Container(
                margin:const EdgeInsets.only(left:20,right:20,top:20),
                padding:const EdgeInsets.only(left:20,right:20),
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color:Colors.grey[200],
                  boxShadow:const [BoxShadow(
                      offset:Offset(0,10),
                      blurRadius:50,
                      color:Color(0xffEEEEEE)
                  )],
                ),
                alignment: Alignment.center,
                child:const TextField(
                    cursorColor:Color(0xffF5591F),
                    decoration:InputDecoration(
                      icon:Icon(
                        Icons.email_outlined,
                        color:Color(0xffF5591F),
                      ),
                      hintText:"Enter Email",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    )
                )
            ),
            Container(
                margin:const EdgeInsets.only(left:20,right:20,top:20),
                padding:const EdgeInsets.only(left:20,right:20),
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color:Colors.grey[200],
                  boxShadow:const [BoxShadow(
                      offset:Offset(0,10),
                      blurRadius:50,
                      color:Color(0xffEEEEEE)
                  )],
                ),
                alignment: Alignment.center,
                child:const TextField(
                    cursorColor:Color(0xffF5591F),
                    decoration:InputDecoration(
                      icon:Icon(
                        Icons.phone_android_outlined,
                        color:Color(0xffF5591F),
                      ),
                      hintText:"Phone Number",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    )
                )
            ),
            Container(
                margin:const EdgeInsets.only(left:20,right:20,top:20),
                padding:const EdgeInsets.only(left:20,right:20),
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color:Colors.grey[200],
                  boxShadow:const [BoxShadow(
                      offset:Offset(0,10),
                      blurRadius:50,
                      color:Color(0xffEEEEEE)
                  )],
                ),
                alignment: Alignment.center,
                child:const TextField(
                  obscureText: true,
                    cursorColor:Color(0xffF5591F),
                    decoration:InputDecoration(
                      icon:Icon(
                        Icons.password_sharp,

                        color:Color(0xffF5591F),
                      ),
                      hintText:"Enter Password",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    )
                )
            ),
            GestureDetector(
                onTap:()=>{
                 // _showImageDialog()
                  selectDate(),
                  print(selectDate),
                },
                child:Container(
                    margin:const EdgeInsets.only(left:20,right:20,top:60),
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left:20,right:20),
                    height: 30,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors:[(Color(0xffffffff)),(Color(0xffffffff))],
                        begin:Alignment.centerLeft,
                        end:Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(0),
                      boxShadow:const [BoxShadow(
                          offset:Offset(0,10),
                          blurRadius:50,
                          color:Color(0xffe88932)
                      )],
                    ),
                    child:const Text(
                        "Enter DOB",
                        style:TextStyle(
                            color:Colors.black
                        )
                    )
                )
            ),


            GestureDetector(
                onTap:()=>{
                  _showImageDialog()
                },
                child:Container(
                    margin:const EdgeInsets.only(left:20,right:20,top:60),
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left:20,right:20),
                    height: 30,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors:[(Color(0xffffffff)),(Color(0xffffffff))],
                        begin:Alignment.centerLeft,
                        end:Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(0),
                      boxShadow:const [BoxShadow(
                          offset:Offset(0,10),
                          blurRadius:50,
                          color:Color(0xffe88932)
                      )],
                    ),
                    child:const Text(
                        "Take photo",
                        style:TextStyle(
                            color:Colors.black
                        )
                    )
                )
            ),

            GestureDetector(
                onTap:()=>{
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>const RegistrationScreen()
                  ))
                },
                child:Container(
                    margin:const EdgeInsets.only(left:20,right:20,top:60),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(left:20,right:20),
                    height: 54,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors:[(Color(0xffF5591F)),(Color(0xffF2861E))],
                        begin:Alignment.centerLeft,
                        end:Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(50),
                      boxShadow:const [BoxShadow(
                          offset:Offset(0,10),
                          blurRadius:50,
                          color:Color(0xffEEEEEE)
                      )],
                    ),
                    child:const Text(
                        "Register",
                        style:TextStyle(
                            color:Colors.white
                        )
                    )
                )
            ),
            Container(
                margin:const EdgeInsets.only(top:10),
                child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      const Text("Already on croptr ? "),
                      GestureDetector(
                          onTap:()=>{
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>const LoginScreen()))
                            //Navigator.pop(context)
                          },
                          child:const Text(
                            "Login Now",
                            style:TextStyle(
                                color:Color(0xffF5591f)
                            ),
                          )
                      )
                    ]
                )
            )

          ],
        ),
      ),
    );
  }
}
