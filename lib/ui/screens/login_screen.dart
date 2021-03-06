import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restofood_api/core/config/endpoint.dart';
import 'package:restofood_api/core/services/auth_services.dart';
import 'package:restofood_api/core/utils/toast_utils.dart';
import 'package:restofood_api/ui/screens/register_screen.dart';
import 'package:restofood_api/ui/widgets/input_field.dart';
import 'package:restofood_api/ui/widgets/primary_button.dart';
import 'package:dio/dio.dart';

//import 'package:restofood_api/core/models/profil_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        body: SingleChildScrollView(
          child: LoginBody(),
        ),
      ),
    );
  }
}

class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  // void login(BuildContext context) {
  //   if (usernameController.text.isNotEmpty &&
  //       passwordController.text.isNotEmpty) {
  //     Navigator.pushNamedAndRemoveUntil(
  //         context, "/dashboard", (Route<dynamic> routes) => false);
  //   } else {
  //     ToastUtils.show("Silahkan isi semua field");
  //   }
  // }

//Tmabahan Hidepassword jepri
  bool _isHidePassw = true;
  String username = '';

  void showHidePassword() {
    setState(() {
      _isHidePassw = !_isHidePassw;
    });
  }
  //akhir Tmabahan Hidepassword jepri

  // Tambahan Login Jepri
  
  String pesan = "";

  Future<List> login(BuildContext context) async {

    print("mulai");

	
    FormData formData = new FormData.fromMap({
      "username": usernameController.text,
      'password': passwordController.text,
    });

    Dio dio = new Dio();
    final response = await dio.post(Endpoint.login,
        data: formData,
        options: Options(headers: {"Accept": "application/json"}));
    
    // print(response.data);
    var mydata = response.data;
    // cara panggil model gimana?
    // ane belum ngerti hehe
    print(mydata['status']);
   
    // var datauser = (json.decode(response.data));
    if (usernameController.text.isEmpty && passwordController.text.isEmpty) {
      ToastUtils.show("Username dan Password tidak boleh kosong");
      print("Kosong");
    } else {
      if (mydata['status'] == 200) {
        //seperti ini bisa ga?
        //  pesan = "Username atau password salah";
        print("salah");
        setState(() {
          // ToastUtils.show(pesan);
          pesan = "Username atau password salah";
        });
      } else {
        print("Benar");
        Navigator.pushNamedAndRemoveUntil(
            context, '/dashboard', (Route<dynamic> routes) => false);
      }
      // setState(() {
      //   username = datauser['username'].toString();
      //   print(datauser[0]['username']);
      // });
    }
    //  return datauser;
//print(datauser[0]['username']);
  }
// Tambahan akhir Login Jepri

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //Bagian Header
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2.5,
          color: Colors.orange,
          child: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.fastfood,
                size: 40,
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "RestoFood",
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )
            ],
          )),
        ),
        //Bagian field Login
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Column(
            children: <Widget>[
              //Username
              InputField(
                action: TextInputAction.done,
                type: TextInputType.text,
                controller: usernameController,
                hintText: 'Username',
              ),
              SizedBox(
                height: 10,
              ),
              //Password
              InputField(
                action: TextInputAction.done,
                //  type: TextInputType.text,
                controller: passwordController,
                hintText: 'Password',
                secureText: _isHidePassw,
                //obcureText: _isHidePassw,
                icon: IconButton(
                  onPressed: () {
                    showHidePassword();
                  },
                  icon: Icon(
                    _isHidePassw ? Icons.visibility_off : Icons.visibility,
                    color: Colors.orange[200],
                  ),
                ),
              ),

              SizedBox(
                height: 15,
              ),
              //UNTUK BUTTON
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  child: PrimaryButton(
                    color: Colors.orange,
                    text: 'Login',
                    //  onClick: () => login(context),
                    onClick: () => login(context),
                  )),

              // add button press & call register class route
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Belum ada akun?',
                      style: TextStyle(fontSize: 14, color: Colors.black54)),
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen())),
                    child: Text(
                      " Daftar disini!",
                      style: TextStyle(fontSize: 16, color: Colors.blue[200]),
                    ),
                  ),
                ],
              )
              // akhir add call register class
            ],
          ),
        )
      ],
    );
  }
}

//JEJO JEPRI UPDATE LOGIN NEW

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:restofood_api/core/utils/toast_utils.dart';
// import 'package:restofood_api/ui/screens/home_screen.dart';
// //add jejo register
// import 'package:restofood_api/ui/screens/register_screen.dart';
// //akhir add jejo register
// import 'package:restofood_api/ui/widgets/input_field.dart';
// import 'package:restofood_api/ui/widgets/primary_button.dart';

// class LoginScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return AnnotatedRegion<SystemUiOverlayStyle>(
//       value: SystemUiOverlayStyle(
//         statusBarColor: Colors.transparent,
//       ),
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: LoginBody()
//         ),
//       ),
//     );
//   }
// }

// class LoginBody extends StatelessWidget {

//   var usernameController = TextEditingController();
//   var passwordController = TextEditingController();

//   void login(BuildContext context) {
//     if (usernameController.text.isNotEmpty && passwordController.text.isNotEmpty) {
//       Navigator.pushNamedAndRemoveUntil(context, "/dashboard", (Route<dynamic> routes) => false);
//     } else {
//       ToastUtils.show("Silahkan isi semua field");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[

//         //Bagian headers
//         Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height / 2.5,
//           color: Colors.orange,
//           child: SafeArea(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Icon(Icons.fastfood, size: 40, color: Colors.white),
//                 SizedBox(height: 10),
//                 Text(
//                   "Restofood",
//                   style: TextStyle(
//                     fontSize: 35,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold
//                   ),
//                 )
//               ],
//             ),
//           )
//         ),

//         //Bagian field login
//         Padding(
//           padding: EdgeInsets.only(left: 20, right: 20, top: 30),
//           child: Column(
//             children: <Widget>[
//               InputField(
//                 action: TextInputAction.done,
//                 type: TextInputType.text,
//                 controller: usernameController,
//                 hintText: "Username",
//               ),
//               SizedBox(height: 10),
//               InputField(
//                 action: TextInputAction.done,
//                 type: TextInputType.text,
//                 controller: passwordController,
//                 hintText: "Password",
//                 secureText: true,
//               ),
//               SizedBox(height: 15),
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: 45,
//                 child: PrimaryButton(
//                   color: Colors.orange,
//                   text: "LOGIN",
//                   onClick: () => login(context),
//                 ),
//               ),
//               SizedBox(height: 10),
//               InkWell(
//                 onTap: () => Navigator.push(context, MaterialPageRoute(
//                   builder: (context) => RegisterScreen()
//                 )),
//                 child: Text(
//                   "Belum punya akun? Daftar Sekarang!",
//                   style: TextStyle(
//                     fontSize: 14, color: Colors.black87
//                   ),
//                 ),
//               )
//             ],
//           ),
//         )

//       ],
//     );
//   }
// }
