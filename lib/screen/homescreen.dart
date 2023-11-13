import 'package:flutter/material.dart';
import 'package:music_player/constants/appcolor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
          Container(
              child:  const  Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Icon(Icons.menu_rounded, color:  AppColorDesign. pTextColor,),
                        
                      ),
                       SizedBox(width: 30,),
                      Text(" AudioBook Player",style: TextStyle(color: AppColorDesign.blueTopDark,fontSize: 25),),
                      SizedBox(width: 30,),
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Icon(Icons.star_border_outlined, color:  AppColorDesign. pTextColor,),
                        
                      )
                    ],
                  ),
                  //  Center(child: Text(" AudioBook Player",style: TextStyle(color: Color.fromARGB(255, 10, 66, 162),fontSize: 30),)),
                 
                
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              child: PageView.builder(itemBuilder: (_, i){
                return Container(
                  height: 220,
                  
                  decoration: const  BoxDecoration(
                    image: DecorationImage(image: AssetImage("Images/image.png"))
                ));
              }),
            ),
          ],
        ),
      ),
    );
  }
}
