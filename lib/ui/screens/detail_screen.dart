import 'package:flutter/material.dart';
import 'package:restofood_api/core/models/food_mdl.dart';
import 'package:restofood_api/core/services/food_services.dart';
import 'package:restofood_api/core/utils/toast_utils.dart';
import 'package:restofood_api/ui/screens/update_screen.dart';

class DetailScreen extends StatelessWidget {
  FoodModel foodModel;
  DetailScreen({this.foodModel});

  void deleteFoods(BuildContext context) async{
    FoodResponse response = await FoodServices.deleteFood(foodModel.id);
    if (response.status == 200) {
      ToastUtils.show(response.message);
      Future.delayed(Duration(
        seconds: 1
      ),(){
        Navigator.pushNamedAndRemoveUntil(context, "/home", 
        (Route<dynamic> routes) => false);
      });
    } else {
      ToastUtils.show(response.message);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(foodModel.title, style: TextStyle(
          color: Colors.white
        ),
        ),
        actions: <Widget>[

          //Edit Makanan
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(
                builder: (context) => UpdateScreen(foodModel: foodModel)
                )
              ),
              child: Icon(Icons.edit, color: Colors.white,),
            ),
          ),

          //Delete Makanan
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
             onTap: () => deleteFoods(context),
              child: Icon(Icons.delete, color: Colors.white,),
            ),
          )
        ],
      ),
      body: DetailBody(foodModel: foodModel,),
    );
  }
}

class DetailBody extends StatelessWidget {
  FoodModel foodModel;
  DetailBody({this.foodModel});
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          new Stack(
            children: <Widget>[
              // widget image detail
              new ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0)
                ),
                child: Image.network(
                  foodModel.image,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width / 2,
                  fit: BoxFit.cover,
                ),
              ),

              new Positioned(
                bottom: 20,
                right: 15,
                child: Container(
                  width: 300,
                  color: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(foodModel.title,
                      style: TextStyle(fontSize: 20,color: Colors.white),
                      ),
                      Text("Harga: Rp ${foodModel.title}",
                      style: TextStyle(fontSize: 15,color: Colors.grey),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      ),
                    ],
                  ),
              )
              )
            ],
          ),
          new SizedBox(height: 4,),
          new Card(
            margin: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[

                //Description
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    children: <Widget>[
                      new Icon(Icons.assessment, size: 20,),
                      Padding(padding: const EdgeInsets.only(left: 10),
                      child: new Text(
                        "Description", style: TextStyle(fontSize: 20, ),
                        ),
                      ),
                    ],
                  ),
                ),

                //full_Description
                Padding(padding: const EdgeInsets.all(10),
                child: new Text(foodModel.fullDescription, style: TextStyle(fontSize: 15),),
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}