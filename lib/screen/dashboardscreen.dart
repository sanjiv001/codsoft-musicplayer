// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unnecessary_null_comparison

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:music_player/constants/appcolor.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  late List audio = [];
  late TabController _tabController;
  late ScrollController _scrollController;

  ReadData() async {
    await DefaultAssetBundle.of(context)
        .loadString("assets/json/audio.json")
        .then((a) {
      setState(() {
        audio = jsonDecode(a);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _scrollController = ScrollController();
    ReadData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Icon(
                      Icons.menu_rounded,
                      color: AppColorDesign.pTextColor,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    " AudioBook Player",
                    style: TextStyle(
                        color: AppColorDesign.blueTopDark, fontSize: 25),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Icon(
                      Icons.star_border_outlined,
                      color: AppColorDesign.pTextColor,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text("Popular Audio", style: TextStyle(color: Color.fromARGB(255, 13, 13, 14), fontSize: 20, fontWeight: FontWeight.bold),)),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        height: 200,
                        child: PageView.builder(
                            controller: PageController(viewportFraction: 0.8),
                            itemCount: audio == null ? 0 : audio.length,
                            itemBuilder: (_, i) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(22),
                                    image: DecorationImage(
                                      image: AssetImage(audio[i]["img"]),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: NestedScrollView(
                      controller: _scrollController,
                        headerSliverBuilder:
                            (BuildContext context, bool isScroll) {
                          return [
                            SliverAppBar(
                              backgroundColor: AppColorDesign.white,
                              pinned: true,
                              bottom: PreferredSize(
                                  preferredSize: Size.fromHeight(50),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Container(
                                      margin: EdgeInsets.only(),
                                      child: TabBar(
                                        indicatorPadding: EdgeInsets.all(0),
                                        indicatorSize: TabBarIndicatorSize.label,
                                        labelPadding: EdgeInsets.symmetric(vertical :4,horizontal:4),
                                        controller: _tabController,
                                        isScrollable: true,
                                        indicator: BoxDecoration(
                                            borderRadius: BorderRadius.circular(12),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: AppColorDesign.blue,
                                                blurRadius: 8,
                                                offset: Offset(0, 0),
                                              )
                                            ]),
                                        tabs: [
                                          Container(
                                            width: 120,
                                            height: 55,
                                            child: Center(
                                              child: Text(
                                                
                                                "Popular",
                                                style: TextStyle(
                                                  
                                                    color: AppColorDesign.white),
                                                   
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color:
                                                        AppColorDesign.blueTopDark,
                                                  )
                                                ]),
                                          ),
                                          
                                          Container(
                                            width: 140,
                                            height: 55,
                                            child: Center(
                                              child: const Text(
                                                "New",
                                                style: TextStyle(
                                                    color: AppColorDesign.white),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color:
                                                        AppColorDesign.blueTopDark,
                                                  )
                                                ]),
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                            )
                          ];
                        },
                        body: TabBarView(
                          controller : _tabController,
                          children: [
                            ListView.builder(
                              itemCount: audio==null?0:audio.length,
                              itemBuilder: (_, i){
                              return Container(
                                margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                                child: Container(
                                 // color: AppColorDesign.bgDark,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                      blurRadius: 2,
                                      offset: Offset(0,0),
                                      color: AppColorDesign.bgColor,
                                    )
                                    ]
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 120,
                                          height: 140,
                                          decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                   image: DecorationImage(
                                   fit: BoxFit.fill,
                                    image: AssetImage(audio[i]["img"])),
                                  ),

                                        ),
                                        SizedBox(width: 10),
                                        Column(
                                          children:  [
                                            Row(
                                              children: [
                                                Icon(Icons.star_border, color: Color.fromARGB(255, 7, 195, 60)),
                                                SizedBox(width: 4,),
                                                Text(audio[i]["rating"], style: TextStyle(fontSize: 20),)
                                              ],
                                            ),
                                          Text(audio[i]["title"], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                          Text(audio[i]["text"],
                                           style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: AppColorDesign.pTextColor),),
                                           SizedBox(height: 20),
                                          Container(
                                            width: 80,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(4),
                                              color: const Color.fromARGB(255, 200, 14, 14),
                                             
                                            ),
                                             child: Center(child: Text("Enjoy Music"))
                                          ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                
                              );
                            }),
                    
                          Material(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: AppColorDesign.bgDark,
                              ),
                              title: Text("KJhk"),
                            ),
                          )
                        ])),
                  )),
          ],
        ),
      ),
    );
  }
}
