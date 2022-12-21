import 'package:flutter/material.dart';
import 'package:testcarmarket/home/selectcard.dart';
import 'package:testcarmarket/home/selectcard1.dart';
import 'package:testcarmarket/home/specialoffers.dart';
import 'package:testcarmarket/home/topdealseeall.dart';

import '../const/string.dart';
import 'itemlistview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  get decoration => null;
  TextEditingController nameController = TextEditingController();
  PageController controller = PageController();
  final List<String> _list = [
    "assets/images/anhlogin.jpg",
    'assets/images/icons8-like-64.png',
    'assets/images/oto1.jpg',
    'assets/images/oto1.jpg',
    'assets/images/icons8-like-64.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                width: 100,
                child: IconButton(
                  icon: Image.asset('assets/images/icons8-user-100.png'),
                  iconSize: 50,
                  onPressed: () {},
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const <Widget>[
                    Text(goodmorning),
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
                width: 40,
                child: IconButton(
                  icon: Image.asset('assets/images/icons8-bell-96.png'),
                  onPressed: () {},
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                height: 40,
                width: 40,
                child: IconButton(
                  icon: Image.asset('assets/images/icons8-like-64.png'),
                  onPressed: () {},
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
          Container(
              height: 100,
              padding: const EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: IconButton(icon: Icon(Icons.search),
                    onPressed: () {
                      showSearch(
                          context: context, delegate: CustomSearch());
                    }),
                hintText: search,
                hintStyle: const TextStyle(fontStyle: FontStyle.italic),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                suffixIcon:
                    GestureDetector(child: const Icon(Icons.import_export), ),
              ),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    _buildRowSeeAll(special, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SpecialRoute()),
                      );
                    }),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: 250,
                        width: double.infinity,
                        child: PageView.builder(
                          itemBuilder: (_, index) {
                            return Image.asset(
                              _list[index],
                              fit: BoxFit.fill,
                            );
                          },
                          itemCount: _list.length,
                        )),
                    const SizedBox(height: 20),
                    GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 20,
                        mainAxisExtent: 80,
                      ),
                      itemBuilder: (context, index) {
                        return SelectCard(choice: choices[index]);
                      },
                      itemCount: choices.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    ),
                    const SizedBox(height: 20),
                    _buildRowSeeAll(topDeal, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SeeAllRoute()),
                      );
                    }),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: SizedBox(
                        height: 46,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return buildItemListView(topdeals: text[index]);
                          },
                          itemCount: text.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ),
                    GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        // mainAxisExtent: 100,
                      ),
                      itemBuilder: (context, index) {
                        return SelectCard1(anh: images[index]);
                      },
                      itemCount: images.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildRowSeeAll(String title, callbackSeeAll) {
    return Row(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(20),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Column(),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: GestureDetector(
            onTap: callbackSeeAll,
            child: const Text(
              seeAll,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomSearch extends SearchDelegate {
  List<String> allData = ['TOYOTA',
    'KIA',
    'HONDA',
    'ACURA',
    'ASTON MARTIN',
    'AUDI',
    'BMW',
    'BUGATI',
    'CADILLAC',
    'CHEVROLET',
    'CHRYSLER',
    'CITROEN',
    'DAIHATSU',
    'DODGE',
    'FERRARI',
    'FORD',
    'INFINITI',
    'SUZUKI',
    'ISUZU',
    'HUYNDAI',
    'JAGUAR',
    'JEEP',
    'LAMBORGHINI',
    'LAND ROVER',
    'LEXUS',
    'MASERATI',
    'MAZDA',
    'MESCERDES BEND',
    'MINI COOPER',
    'MITSUBISHI',
    'NISSAN',
    'PEUGOUET',
    'POSCHER',

  ];


  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(icon: const Icon(Icons.clear), onPressed: null)
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () {
      close(context, null);
    }, icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in allData) {
      if(item.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(item);
      }
    }
    return ListView.builder(itemCount: matchQuery.length, itemBuilder: (context,index) {
      var result = matchQuery[index];
      return ListTile(title: Text(result),);
    });
  }
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in allData) {
      if(item.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(item);
      }
    }
    return ListView.builder(itemCount: matchQuery.length, itemBuilder: (context,index) {
      var result = matchQuery[index];
      return ListTile(title: Text(result),);
    });
  }
}
