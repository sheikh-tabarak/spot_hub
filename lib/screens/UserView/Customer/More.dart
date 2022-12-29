import 'package:flutter/material.dart';
import 'package:spot_hub/configurations/AppColors.dart';
import 'package:spot_hub/configurations/Dimensions.dart';
import 'package:spot_hub/models/UserModels/User.dart';
import 'package:spot_hub/screens/UserView/Admin/Login.dart';

class More extends StatelessWidget {

  final bool isLoggedin;
  final User MainUser;
  const More({super.key, required this.MainUser,required this.isLoggedin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color.fromARGB(255, 209, 209, 209),
        appBar: AppBar(
          title: const Text("Spot hub"),
        ),

        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            
            children: [

               ListTile(
                leading: Image(
                      image: NetworkImage(MainUser.image),
                      width: 60,
                      height:60,
                    ),
                    title: Text(MainUser.username),
                     subtitle:Text(MainUser.email),

                   trailing:TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                   }, child: isLoggedin==false?Text("Login"):Text("Logout")) 
            //         ElevatedButton.styleFrom(
            //   backgroundColor: AppColors.PrimaryColor,
            // ),
           
          
      //  onPressed: () {  },
           
  
           ),
           
          

           const ListTile(
            leading: Icon(Icons.graphic_eq_outlined),
            title: Text("Activity"),
       //   subtitle: Text("This is activity Button"),
           ),

            const ListTile(
            leading: Icon(Icons.bookmark),
            title: Text("Bookmarks"),
       //   subtitle: Text("This is activity Button"),
           ),

            const ListTile(
            leading: Icon(Icons.event_repeat),
            title: Text("Events"),
       //   subtitle: Text("This is activity Button"),
           ),

            const ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
       //   subtitle: Text("This is activity Button"),
           ),





              
            ],
          ),
        )

        // Column(

        // ),

        );
  }
}
