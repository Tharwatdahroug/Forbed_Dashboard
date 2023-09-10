import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:forbeddashboard/Widget/alertToast.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:forbeddashboard/Widget/AuthWeight.dart';
import 'package:forbeddashboard/responsive.dart';
import 'package:forbeddashboard/porivider/Categroys.dart';

class CategroyScreen extends StatelessWidget {
  final TextEditingController _namecategroycontroller = TextEditingController();
  // ignore: non_constant_identifier_names
  final TextEditingController _Idcategroycontroller = TextEditingController();
  final TextEditingController _searchcategroycontroller =
      TextEditingController();
  final TextEditingController _nameupdatacategroycontroller =
      TextEditingController();

  // var _initValues = {
  //   'name': _namecategroycontroller,
  // };
  late bool isLoading;

  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<CategroyProvider>(context, listen: false)
        .getCategoryData();
  }

  Future Alertcategroy(
      context, _namecategroycontroller, String imgecategroy, String id) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("AddCategroy", style: TextStyle(color: Colors.white)),
        content: Container(
          width: 400,
          child: Column(children: [
            Container(child:
                Consumer<CategroyProvider>(builder: (context, Categr, child) {
              return imgecategroy.isNotEmpty
                  ? Container(
                      color: Colors.white,
                      child: Image.network(
                        Categr.getImageUrl().toString().isEmpty
                            ? imgecategroy
                            : Categr.getImageUrl().toString(),
                        width: 200,
                        height: 200,
                      ))
                  : Container(
                      height: 200,
                      width: 200,
                      margin: const EdgeInsets.only(right: 15),
                      color: Colors.white,
                      child: const Center(
                        child: SpinKitCubeGrid(
                          size: 200,
                          color: Colors.black,
                          // duration:
                          //     const Duration(milliseconds: 100),
                        ),
                      ),
                    );
            })),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: 400,
              height: 40,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.camera_enhance_rounded,
                    color: Colors.white),
                label: const Text(
                  "اختار الصوره",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  try {
                    isLoading = false;
                    await Provider.of<CategroyProvider>(
                      context,
                      listen: false,
                    ).UploadedImages();

                    //  isLoading=true ;
                  } catch (ex) {
                    print(
                        "^^^^^^^^^^^^^^^^^^^^^^ exception in uploading image ${ex}");
                  }
                },
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            AuthTextField(
              "ادخل اسم القسم",
              Icons.add_home_outlined,
              false,
              _namecategroycontroller,
              // initialValue,
            ),
          ]),
        ),
        actions: [
          // ignore: non_constant_identifier_names
          Consumer<CategroyProvider>(builder: (context, Categr, child) {
            return ElevatedButton.icon(
              icon: const Icon(Icons.add_box_outlined, color: Colors.white),
              label: const Text(
                "Updata",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                if (_namecategroycontroller.text.isNotEmpty &
                    imgecategroy.isNotEmpty) {
                  Categr.updataCategroy(
                    _namecategroycontroller.text,
                    Categr.getImageUrl().toString().isEmpty
                        ? imgecategroy
                        : Categr.getImageUrl(),
                    id,
                  );
                  alertToast(
                      "لقد أضفت قسم جديد",
                      const Color.fromRGBO(96, 43, 213, 1),
                      const Color.fromARGB(255, 255, 254, 254));
                } else {
                  alertToast(
                      "رجاء قم بأدخال كل البيانات !",
                      const Color.fromRGBO(96, 43, 213, 1),
                      const Color.fromARGB(255, 255, 254, 254));
                }

                Categr.deledImageUrl();
                _namecategroycontroller.text = "";
                _refreshProducts(context);
                Navigator.pop(context);
              },
            );
          })
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categroy"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Center(
            child: Container(
                child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Responsive.isMobile(context)
                  ? Image(
                      image: const NetworkImage(
                          "https://www.forbed.com/web/image/website/1/arabic_logo/FORBED?unique=84dac83"),
                      fit: BoxFit.cover,
                      width: size.width / 1,
                      height: size.height * 0.4,
                    )
                  : Image(
                      image: const NetworkImage(
                          "https://www.forbed.com/web/image/website/1/arabic_logo/FORBED?unique=84dac83"),
                      fit: BoxFit.cover,
                      width: size.width / 4,
                      height: size.height * 0.4,
                    ),
            )),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => Dialog(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  onChanged: (value) {
                                    _searchcategroycontroller.text = value;
                                    _refreshProducts(context);
                                  },
                                  cursorColor:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                              255, 255, 255, 255)
                                          .withOpacity(0.9)),
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.search,
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                    ),
                                    labelText: 'ابحث عن منتج',
                                    labelStyle: TextStyle(
                                        color: const Color.fromARGB(
                                                255, 255, 255, 255)
                                            .withOpacity(0.9)),
                                    filled: true,
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    // fillColor: Colors.white.withOpacity(0.3),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        borderSide: const BorderSide(
                                            width: 0, style: BorderStyle.none)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                // AuthTextField('ابحث عن منتج', Icons.search,
                                //     false, _searchcategroycontroller),
                                Expanded(
                                  child: FutureBuilder(
                                    future: _refreshProducts(context),
                                    builder: (ctx, snapshot) => snapshot
                                                .connectionState ==
                                            ConnectionState.waiting
                                        ? const Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : RefreshIndicator(
                                            onRefresh: () =>
                                                _refreshProducts(context),
                                            child: Consumer<CategroyProvider>(
                                              builder:
                                                  (context, categroydata,
                                                          child) =>
                                                      categroydata
                                                              .getUserModelList
                                                              .isEmpty
                                                          ? const Center(
                                                              child: Text(
                                                              "لا يوجد اصناف ",
                                                              style: TextStyle(
                                                                  fontSize: 50,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ))
                                                          : Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8),
                                                              child: ListView
                                                                  .builder(
                                                                itemBuilder: (_, i) => categroydata
                                                                        .getUserModelList[
                                                                            i]
                                                                        .nameCategory
                                                                        .contains(
                                                                            _searchcategroycontroller.text)
                                                                    ? Column(
                                                                        children: <Widget>[
                                                                          Container(
                                                                            color:
                                                                                Colors.white,
                                                                            child:
                                                                                ListTile(
                                                                              leading: Image.network(
                                                                                categroydata.getUserModelList[i].imageUrl,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                              title: Text(
                                                                                categroydata.getUserModelList[i].nameCategory,
                                                                                style: const TextStyle(color: Colors.black),
                                                                              ),
                                                                              subtitle: Text(
                                                                                categroydata.getUserModelList[i].id,
                                                                                style: const TextStyle(color: Colors.black),
                                                                              ),
                                                                              trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                                                                                IconButton(
                                                                                  icon: const Icon(
                                                                                    Icons.delete,
                                                                                    color: Colors.orangeAccent,
                                                                                    // size: 35,
                                                                                  ),
                                                                                  onPressed: () async {
                                                                                    await categroydata.deleteCategroy(categroydata.getUserModelList[i].id);
                                                                                    _refreshProducts(context);
                                                                                  },
                                                                                ),
                                                                                const SizedBox(
                                                                                  width: 5,
                                                                                ),
                                                                                IconButton(
                                                                                  icon: const Icon(
                                                                                    Icons.edit,
                                                                                    color: Colors.orangeAccent,
                                                                                    // size: 35,
                                                                                  ),
                                                                                  onPressed: () async {
                                                                                    _nameupdatacategroycontroller.text = categroydata.getUserModelList[i].nameCategory;
                                                                                    Alertcategroy(context, _nameupdatacategroycontroller, categroydata.getUserModelList[i].imageUrl, categroydata.getUserModelList[i].id);

                                                                                    _refreshProducts(context);
                                                                                  },
                                                                                ),
                                                                              ]),
                                                                            ),
                                                                          ),
                                                                          const Divider(),
                                                                        ],
                                                                      )
                                                                    : Container(),
                                                                itemCount:
                                                                    categroydata
                                                                        .getUserModelList
                                                                        .length,
                                                              ),
                                                            ),
                                            ),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ));
                },
                icon: const Icon(Icons.add_circle_sharp, color: Colors.white),
                label: const Text("ShowCategroy",
                    style: TextStyle(color: Colors.white))),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("AddCategroy",
                          style: TextStyle(color: Colors.white)),
                      content: Container(
                        width: 400,
                        child: SingleChildScrollView(
                          child: Column(children: [
                            Container(child: Consumer<CategroyProvider>(
                                builder: (context, Categr, child) {
                              return Categr.getImageUrl().toString().isNotEmpty
                                  ? Container(
                                      color: Colors.white,
                                      child: Image.network(
                                        Categr.getImageUrl().toString(),
                                        width: 200,
                                        height: 200,
                                      ))
                                  : Container(
                                      height: 200,
                                      width: 200,
                                      margin: const EdgeInsets.only(right: 15),
                                      color: Colors.white,
                                      child: const Center(
                                        child: SpinKitCubeGrid(
                                          size: 200,
                                          color: Colors.black,
                                          // duration:
                                          //     const Duration(milliseconds: 100),
                                        ),
                                      ),
                                    );
                            })),
                            const SizedBox(
                              height: 40,
                            ),
                            Container(
                              width: 400,
                              height: 40,
                              child: ElevatedButton.icon(
                                icon: const Icon(Icons.camera_enhance_rounded,
                                    color: Colors.white),
                                label: const Text(
                                  "اختار الصوره",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () async {
                                  try {
                                    isLoading = false;
                                    await Provider.of<CategroyProvider>(
                                      context,
                                      listen: false,
                                    ).UploadedImages();

                                    //  isLoading=true ;
                                  } catch (ex) {
                                    print(
                                        "^^^^^^^^^^^^^^^^^^^^^^ exception in uploading image ${ex}");
                                  }
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            AuthTextField(
                              "ادخل اسم القسم",
                              Icons.add_home_outlined,
                              false,
                              _namecategroycontroller,
                              // initialValue,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            AuthTextField(
                              "Id",
                              Icons.currency_yen_outlined,
                              false,
                              _Idcategroycontroller,
                              // initialValue,
                            ),
                          ]),
                        ),
                      ),
                      actions: [
                        Consumer<CategroyProvider>(
                            builder: (context, Categr, child) {
                          return ElevatedButton.icon(
                            icon: const Icon(Icons.add_box_outlined,
                                color: Colors.white),
                            label: const Text(
                              "Add",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              if (_namecategroycontroller.text.isNotEmpty &
                                  Categr.getImageUrl().toString().isNotEmpty &
                                  _Idcategroycontroller.text.isNotEmpty) {
                                Categr.AddCategroy(
                                    _namecategroycontroller.text,
                                    Categr.getImageUrl(),
                                    _Idcategroycontroller.text);
                                alertToast(
                                    "لقد أضفت قسم جديد",
                                    const Color.fromRGBO(96, 43, 213, 1),
                                    const Color.fromARGB(255, 255, 254, 254));
                              } else {
                                alertToast(
                                    "رجاء قم بأدخال كل البيانات !",
                                    const Color.fromRGBO(96, 43, 213, 1),
                                    const Color.fromARGB(255, 255, 254, 254));
                              }

                              Categr.deledImageUrl();
                              _Idcategroycontroller.text = "";
                              _namecategroycontroller.text = "";
                              Navigator.pop(context);
                            },
                          );
                        })
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.add_circle_sharp, color: Colors.white),
                label: const Text("AddCategroy",
                    style: TextStyle(color: Colors.white))),
          )
        ]),
      ),
    );
  }
}
