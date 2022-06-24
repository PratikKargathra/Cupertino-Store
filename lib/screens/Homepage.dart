import 'package:flutter/cupertino.dart';
import 'package:cupertino_store/sorces.dart';
import 'package:flutter/material.dart';
int cupertinoTabIndex = 0;
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            IndexedStack(
              index: cupertinoTabIndex,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Expanded(
                      flex: 3,
                        child:  Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text("Cupertino Store", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                              SizedBox(height:20,),
                            ],
                          ),
                        ),
                    ),
                    Expanded(
                      flex: 15,
                      child: ListView.separated(
                        shrinkWrap: true,
                          itemBuilder: (context, index) =>  Row(
                            children: [
                              const SizedBox(width: 20,),
                              Container(
                                height: MediaQuery.of(context).size.height*0.1,
                                width: MediaQuery.of(context).size.height*0.1,
                                decoration: BoxDecoration(
                                    color: appColor.white,
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(products[index].img),
                                      fit: BoxFit.cover,
                                    )
                                ),
                              ),
                              const SizedBox(width: 20,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(products[index].name,),
                                  const SizedBox(height: 10,),
                                  Text(products[index].price,),
                                ],
                              ),
                              const Spacer(),
                              CupertinoButton(
                                onPressed: () {  },
                                child: const Icon(CupertinoIcons.add_circled),
                              )
                            ],
                          ),
                          separatorBuilder: (context, index) =>  Divider(indent: 110,endIndent: 20,color: appColor.Grey, thickness: 2),
                          itemCount: products.length,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children:  [
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            decoration:  BoxDecoration(
                              color: const Color(0xFFe0e0e0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 15,
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>  Row(
                          children: [
                            const SizedBox(width: 20,),
                            Container(
                              height: MediaQuery.of(context).size.height*0.1,
                              width: MediaQuery.of(context).size.height*0.1,
                              decoration: BoxDecoration(
                                  color: appColor.white,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(products[index].img),
                                    fit: BoxFit.cover,
                                  )
                              ),
                            ),
                            const SizedBox(width: 20,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(products[index].name,),
                                const SizedBox(height: 10,),
                                Text(products[index].price,),
                              ],
                            ),
                            const Spacer(),
                            CupertinoButton(
                              onPressed: () {  },
                              child: const Icon(CupertinoIcons.add_circled),
                            )
                          ],
                        ),
                        separatorBuilder: (context, index) =>  Divider(indent: 110,endIndent: 20,color: appColor.Grey, thickness: 2),
                        itemCount: products.length,
                      ),
                    ),
                  ],
                ),

              ],
            ),
            CupertinoTabBar(
                onTap: (val){
                  setState(() {
                    cupertinoTabIndex = val;
                  });
                },
                currentIndex: cupertinoTabIndex,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.home),
                    label: "Products",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.search),
                    label: "Search",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.cart),
                    label: "Carts",
                  ),
                ]
            )
          ],
        ),
      backgroundColor: appColor.appBG,
    );
  }
}
