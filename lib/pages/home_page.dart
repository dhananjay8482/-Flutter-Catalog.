import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'dart:convert';
import '../widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds:2));
    var catalogJson = await rootBundle.loadString("files/catalog.json");
    // print(catalogJson);
    //DECODE CONVERTS STRING DATA INTO MAP (KEY AND VALUE TYPE)
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];

    //calling from list
    CatalogModel.items = List.from(productsData).
    map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {

    });
    print(productsData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Catalog") ,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ( !(CatalogModel.items==null) && CatalogModel.items.isNotEmpty) ?
        //LIST VIEW START--------------------------------------------------------
                  // ListView.builder(
                  //   itemCount: CatalogModel.items.length,
                  //     itemBuilder: (context, index){
                  //       return ItemWidget(
                  //         item:CatalogModel.items[index]
                  //       );
                  //     }
                  // ):
        //LIST VIEW END--------------------------------------------------------

                  GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                      ),
                    itemBuilder: (context, index){
                        final item = CatalogModel.items[index];
                        return Card
                          ( shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)) ,
                             clipBehavior: Clip.antiAlias,
                            child: GridTile(
                                child: Image.network(item.image),
                              header: Container(
                                  child: Text(item.name, style: TextStyle(
                                    color: Colors.white
                                  ), ),
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple,
                                ),
                              ),
                              footer: Text(item.price.toString() ),
                            ));
                    },
                    itemCount: CatalogModel.items.length,
                  ):
          Center( child: CircularProgressIndicator())
        ,
      ),
      drawer: MyDrawer(),
    );
  }
}
  