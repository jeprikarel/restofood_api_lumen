import 'package:flutter/material.dart';
import 'package:restofood_api/core/models/food_mdl.dart';
import 'package:restofood_api/core/services/food_services.dart';
import 'package:restofood_api/ui/screens/add_screen.dart';
import 'package:restofood_api/ui/screens/detail_screen.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "Restofood",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        leading: Icon(Icons.fastfood, color: Colors.white),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(
                builder: (context) => AddScreen()
                )
                ),
              child: Icon(Icons.add_circle, color: Colors.white)
            ),
          )
        ],
      ),
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          //Bagian untuk title
          Text(
            "Daftar Makanan & Minuman",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black87,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 20),
          //Widget untuk daftar makanan
          ListFood()
        ],
      )
    );
  }
}

class ListFood extends StatefulWidget {

  @override
  _ListFoodState createState() => _ListFoodState();
}

class _ListFoodState extends State<ListFood> {
  List<FoodModel> foods;

  void loadData() async {
    print('Tess');
    var _foods = await FoodServices.getAll();
    print(_foods.toString());
    setState(() {
      foods = _foods;
    });
  }
  @override
  void initState() {
    super.initState();
    this.loadData();
  }
  @override
  Widget build(BuildContext context) {
    //Ketika proses mengambil data muncul loading
    if (foods == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (foods.length == 0) {
      return Center(
        child: Text("DATA KOSONG"),
      );
    }

    return Container(
       child: ListView.builder(
         shrinkWrap: true,
         physics: NeverScrollableScrollPhysics(),
         itemCount: foods.length,
         itemBuilder: (context, index) {

           //Menambahkan item list
           return Padding(
             padding: EdgeInsets.only(bottom: 10),
             child: Card(
               elevation: 1,
               child: InkWell(
                 onTap: () => Navigator.push(context, MaterialPageRoute(
                   builder: (context) => DetailScreen(
                     foodModel: foods[index],
                   ))
                   ),
                 child: Container(
                   padding: EdgeInsets.all(10),
                   child: Row(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[

                       //Bagian ini untuk gambar
                       Container(
                         width: 64,
                         height: 64,
                         child: Image.network(
                           foods[index].image,
                           fit: BoxFit.cover,
                         ),
                       ),

                       //Memberi jarak
                       SizedBox(width: 10),

                       //Bagian untuk title dan description
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           Text(
                             foods[index].title,
                             style: TextStyle(
                               fontSize: 16, 
                               fontWeight: FontWeight.bold
                             )
                           ),
                           SizedBox(height: 5,),

                           //Description 
                           Container(
                             width: MediaQuery.of(context).size.width / 2,
                             child: Text(
                               foods[index].description,
                               style: TextStyle(
                                 fontSize: 16, 
                                 color: Colors.black54
                               ),
                               maxLines: 2,
                               overflow: TextOverflow.ellipsis,
                             ),
                           ),

                        // Harga
                          Container(
                             width: MediaQuery.of(context).size.width / 2,
                             child: Align(
                               alignment: Alignment.topRight,
                                child: Text(
                                 "Rp ${foods[index].price.toString()}",
                                 style: TextStyle(
                                   fontSize: 16, 
                                   color: Colors.black54,
                                   fontWeight: FontWeight.bold
                                 ),
                                
                               ),
                             ),
                           )
                         ],
                       )
                     ],
                   ),
                 ),
               ),
             ),
           );
         },
       ),
    );
  }
}



//JEJO UPDATE HOME SCREEEN TAMBHAN DRAWER ICON 

// import 'package:flutter/material.dart';
// import 'package:restofood_api/core/models/food_mdl.dart';
// import 'package:restofood_api/core/services/food_services.dart';
// import 'package:restofood_api/ui/screens/add_screen.dart';
// import 'package:restofood_api/ui/screens/cart_screen.dart';
// import 'package:restofood_api/ui/screens/dashboard_screen.dart';
// import 'package:restofood_api/ui/screens/detail_screen.dart';
// import 'package:restofood_api/ui/screens/profile_screen.dart';

// class HomeScreen extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      
      
//       appBar: AppBar(
//         backgroundColor: Colors.orange,
//         title: Text(
//           "Restofood",
//           style: TextStyle(
//             color: Colors.white
//           ),
//         ),
//       //  leading: Icon(Icons.fastfood, color: Colors.white),
//         actions: <Widget>[
//           Padding(
//             padding: EdgeInsets.only(right: 10),
//             child: InkWell(
//               onTap: () => Navigator.push(context, MaterialPageRoute(
//                 builder: (context) => AddScreen()
//                 )
//                 ),
//               child: Icon(Icons.add_circle, color: Colors.white)
//             ),
//           )
//         ],
//       ),
//       body: HomeBody(),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(child: Text('Header data')
//             ,decoration: BoxDecoration(
//               color: Colors.blue
//             ),
//             ),
//                ListTile(
//               title: Text('TabBar Dashboard'),
//               leading: Icon(Icons.dashboard),
//               onTap: () => Navigator.push(context, MaterialPageRoute(
//                    builder: (context) => DashBoardScreen(            
//                    )
//                    ),
//                )
//             ),
//             ListTile(
//               title: Text('Home'),
//               leading: Icon(Icons.home),
//               onTap: () => Navigator.push(context, MaterialPageRoute(
//                    builder: (context) => HomeScreen(            
//                    )
//                    ),
//                )
//             ),
//             ListTile(
//               title: Text('Profile'),
//               leading: Icon(Icons.contacts),
//                onTap: () => Navigator.push(context, MaterialPageRoute(
//                    builder: (context) => ProfileScreen(            
//                    )
//                    ),
//                )
//             ),
//             ListTile(
//               title: Text('Cart'),
//               leading: Icon(Icons.shop),
//               onTap: () => Navigator.push(context, MaterialPageRoute(
//                    builder: (context) => CartScreen(            
//                    )
//                    ),
//                )
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class HomeBody extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(20),
//       child: Column(
//         children: <Widget>[
//           //Bagian untuk title
//           Text(
//             "Daftar Makanan & Minuman",
//             style: TextStyle(
//               fontSize: 18,
//               color: Colors.black87,
//               fontWeight: FontWeight.bold
//             ),
//           ),
//           SizedBox(height: 20),
//           //Widget untuk daftar makanan
//           ListFood()
//         ],
//       )
//     );
//   }
// }

// class ListFood extends StatefulWidget {

//   @override
//   _ListFoodState createState() => _ListFoodState();
// }

// class _ListFoodState extends State<ListFood> {
//   List<FoodModel> foods;

//   void loadData() async {
//     print('Tess');
//     var _foods = await FoodServices.getAll();
//     print(_foods.toString());
//     setState(() {
//       foods = _foods;
//     });
//   }
//   @override
//   void initState() {
//     super.initState();
//     this.loadData();
//   }
//   @override
//   Widget build(BuildContext context) {
//     //Ketika proses mengambil data muncul loading
//     if (foods == null) {
//       return Center(
//         child: CircularProgressIndicator(),
//       );
//     } else if (foods.length == 0) {
//       return Center(
//         child: Text("DATA KOSONG"),
//       );
//     }

//     return Container(
//        child: ListView.builder(
//          shrinkWrap: true,
//          physics: NeverScrollableScrollPhysics(),
//          itemCount: foods.length,
//          itemBuilder: (context, index) {

//            //Menambahkan item list
//            return Padding(
//              padding: EdgeInsets.only(bottom: 10),
//              child: Card(
//                elevation: 1,
//                child: InkWell(
//                  onTap: () => Navigator.push(context, MaterialPageRoute(
//                    builder: (context) => DetailScreen(
//                      foodModel: foods[index],
//                    )
//                    )
//                    ),
//                  child: Container(
//                    padding: EdgeInsets.all(10),
//                    child: Row(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[

//                        //Bagian ini untuk gambar
//                        Container(
//                          width: 64,
//                          height: 64,
//                          child: Image.network(
//                            foods[index].image,
//                            fit: BoxFit.cover,
//                          ),
//                        ),

//                        //Memberi jarak
//                        SizedBox(width: 10),

//                        //Bagian untuk title dan description
//                        Column(
//                          crossAxisAlignment: CrossAxisAlignment.start,
//                          children: <Widget>[
//                            Text(
//                              foods[index].title,
//                              style: TextStyle(
//                                fontSize: 16, 
//                                fontWeight: FontWeight.bold
//                              )
//                            ),
//                            SizedBox(height: 5,),

//                            //Description 
//                            Container(
//                              width: MediaQuery.of(context).size.width / 2,
//                              child: Text(
//                                foods[index].description,
//                                style: TextStyle(
//                                  fontSize: 16, 
//                                  color: Colors.black54
//                                ),
//                                maxLines: 2,
//                                overflow: TextOverflow.ellipsis,
//                              ),
//                            ),

//                         // Harga
//                           Container(
//                              width: MediaQuery.of(context).size.width / 2,
//                              child: Align(
//                                alignment: Alignment.topRight,
//                                 child: Text(
//                                  "Rp ${foods[index].price.toString()}",
//                                  style: TextStyle(
//                                    fontSize: 16, 
//                                    color: Colors.black54,
//                                    fontWeight: FontWeight.bold
//                                  ),
                                
//                                ),
//                              ),
//                            )
//                          ],
//                        )
//                      ],
//                    ),
//                  ),
//                ),
//              ),
//            );
//          },
//        ),
//     );
//   }
// }