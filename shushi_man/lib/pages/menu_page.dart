import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shushi_man/components/button.dart';
import 'package:shushi_man/theme/colors.dart';
import '../components/food_tile.dart';
import '../pages/food_details.dart';
import '../models/shop.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  void navigateToFoodDetails(int index){

    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    Navigator.push(context, MaterialPageRoute(builder: (context) => FoodDetailsPage(
      food: foodMenu[index],
    )));
  }

  @override
  Widget build(BuildContext context) {

    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[800],
        elevation: 0,
        leading: const Icon(
          Icons.menu,
        ),
        title: const Text(
          "Tokyo",
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cartpage');
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.grey,
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[
        //promo banner
        Container(
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Get 32% promo",
                  style: GoogleFonts.dmSerifDisplay(
                    fontSize: 20,
                    color: Colors.white,
                  )
                  ),

                  const SizedBox(height: 20,),

                  MyButton(
                    text: 'Redeem', 
                    onTap: () {},
                  )
                ],
              ),

              Image.asset("lib/images/manysushi.png",
                height: 100,
              )
            ],
          ),
        ),

        //seach bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20),
              ),hintText: 'Search here..',
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),

        const SizedBox(height: 25,),

        //menu list
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            "Food Menu",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800]
            ),
          ),
        ),

        const SizedBox(height: 10,),

        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: foodMenu.length,itemBuilder: (context, index) => FoodTile(
              onTap: () => navigateToFoodDetails(index),
              food: foodMenu[index],
            )  
          )
        ),

        const SizedBox(height: 25,),

        //popular food
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'lib/images/toro.png',
                    height: 60,
                  ),

                  const SizedBox(width: 20,),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Salmon Eggs',
                        style: GoogleFonts.dmSerifDisplay(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 18,),

                      Text('\$ 21.00',
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      )
                    ],
                  ),
                ]
              ),
              const Icon(
                Icons.favorite_outlined,
                color: Colors.grey,
                size: 20,
              )
            ],
          ),
        )

      ])
    );
  }
}