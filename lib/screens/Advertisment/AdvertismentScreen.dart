import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:forbeddashboard/Widget/alertToast.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:forbeddashboard/Widget/AuthWeight.dart';
import 'package:forbeddashboard/responsive.dart';
import 'package:forbeddashboard/porivider/Advertisment.dart';

class AdvertismentScreen extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final TextEditingController _Idcategroycontroller = TextEditingController();
  final TextEditingController _searchcategroycontroller =
      TextEditingController();
  final TextEditingController _namevendorupdatacategroycontroller =
      TextEditingController();
  final TextEditingController _vendorInformationcontroller =
      TextEditingController();

  // var _initValues = {
  //   'name': _namecategroycontroller,
  // };
  late bool isLoading;

  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<AdvertismentProvider>(context, listen: false)
        .getAdvertismentData();
  }

  Future Alertcategroy(context, _namevendorupdatacategroycontroller,
      _vendorInformationcontroller, String imgecategroy, String id) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Add Advertisment", style: TextStyle(color: Colors.white)),
        content: Container(
          width: 400,
          child: SingleChildScrollView(
            child: Column(children: [
              Container(child: Consumer<AdvertismentProvider>(
                  builder: (context, Categr, child) {
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
                        margin: EdgeInsets.only(right: 15),
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
              SizedBox(
                height: 40,
              ),
              Container(
                width: 400,
                height: 40,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.camera_enhance_rounded, color: Colors.white),
                  label: Text(
                    "اختار الصوره",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    try {
                      isLoading = false;
                      await Provider.of<AdvertismentProvider>(
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
              SizedBox(
                height: 40,
              ),
              AuthTextField(
                "ادخل اسم معلن",
                Icons.add_home_outlined,
                false,
                _namevendorupdatacategroycontroller,
                // initialValue,
              ),
              SizedBox(
                height: 20,
              ),
              AuthTextField(
                "معلومات  عن معلن",
                Icons.add_home_outlined,
                false,
                _vendorInformationcontroller,
                // initialValue,
              ),
            ]),
          ),
        ),
        actions: [
          Consumer<AdvertismentProvider>(
              builder: (context, advertisment, child) {
            return ElevatedButton.icon(
              icon: const Icon(Icons.add_box_outlined, color: Colors.white),
              label: Text(
                "Updata",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                if (_namevendorupdatacategroycontroller.text.isNotEmpty ||
                    advertisment.getImageUrl().toString().isNotEmpty &
                        _Idcategroycontroller.text.isNotEmpty ||
                    _vendorInformationcontroller.text.isNotEmpty) {
                  advertisment.updataAdvertisment(
                      _namevendorupdatacategroycontroller.text,
                      _vendorInformationcontroller.text,
                      advertisment.getImageUrl().toString().isEmpty
                          ? imgecategroy
                          : advertisment.getImageUrl(),
                      id);
                  alertToast(
                      "لقد أضفت قسم جديد",
                      Color.fromRGBO(96, 43, 213, 1),
                      const Color.fromARGB(255, 255, 254, 254));
                } else {
                  alertToast(
                      "رجاء قم بأدخال كل البيانات !",
                      Color.fromRGBO(96, 43, 213, 1),
                      const Color.fromARGB(255, 255, 254, 254));
                }

                // advertisment.deledImageUrl();

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
        title: Text("Advertisment"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Center(
            child: Container(
                child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
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
          SizedBox(
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
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  onChanged: (value) {
                                    _searchcategroycontroller.text = value;
                                    _refreshProducts(context);
                                  },
                                  cursorColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255)
                                          .withOpacity(0.9)),
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                    ),
                                    labelText: 'ابحث عن منتج',
                                    labelStyle: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)
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
                                SizedBox(
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
                                        ? Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : RefreshIndicator(
                                            onRefresh: () =>
                                                _refreshProducts(context),
                                            child:
                                                Consumer<AdvertismentProvider>(
                                              builder: (context,
                                                      advertismentdata,
                                                      child) =>
                                                  advertismentdata
                                                          .getUserModelList
                                                          .isEmpty
                                                      ? Center(
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
                                                              EdgeInsets.all(8),
                                                          child:
                                                              ListView.builder(
                                                            itemBuilder: (_,
                                                                    i) =>
                                                                advertismentdata
                                                                        .getUserModelList[
                                                                            i]
                                                                        .vendor
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
                                                                                advertismentdata.getUserModelList[i].uploadedImageUrl,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                              title: Text(
                                                                                advertismentdata.getUserModelList[i].vendor,
                                                                                style: TextStyle(color: Colors.black),
                                                                              ),
                                                                              subtitle: Text(
                                                                                advertismentdata.getUserModelList[i].vendorInformation,
                                                                                style: TextStyle(color: Colors.black),
                                                                              ),
                                                                              trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                                                                                IconButton(
                                                                                  icon: Icon(
                                                                                    Icons.delete,
                                                                                    color: Colors.orangeAccent,
                                                                                    // size: 35,
                                                                                  ),
                                                                                  onPressed: () async {
                                                                                    await advertismentdata.deleteCategroy(advertismentdata.getUserModelList[i].id);
                                                                                    _refreshProducts(context);
                                                                                  },
                                                                                ),
                                                                                SizedBox(
                                                                                  width: 5,
                                                                                ),
                                                                                IconButton(
                                                                                  icon: Icon(
                                                                                    Icons.edit,
                                                                                    color: Colors.orangeAccent,
                                                                                    // size: 35,
                                                                                  ),
                                                                                  onPressed: () async {
                                                                                    _namevendorupdatacategroycontroller.text = advertismentdata.getUserModelList[i].vendor;
                                                                                    _vendorInformationcontroller.text = advertismentdata.getUserModelList[i].vendorInformation;

                                                                                    Alertcategroy(context, _namevendorupdatacategroycontroller, _vendorInformationcontroller, advertismentdata.getUserModelList[i].uploadedImageUrl, advertismentdata.getUserModelList[i].id);

                                                                                    _refreshProducts(context);
                                                                                  },
                                                                                ),
                                                                              ]),
                                                                            ),
                                                                          ),
                                                                          Divider(),
                                                                        ],
                                                                      )
                                                                    : Container(),
                                                            itemCount:
                                                                advertismentdata
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
                icon: Icon(Icons.add_circle_sharp, color: Colors.white),
                label: Text("Show-Advertisment",
                    style: TextStyle(color: Colors.white))),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Add-Advertisment",
                          style: TextStyle(color: Colors.white)),
                      content: Container(
                        width: 400,
                        child: SingleChildScrollView(
                          child: Column(children: [
                            Container(child: Consumer<AdvertismentProvider>(
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
                                      margin: EdgeInsets.only(right: 15),
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
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              width: 400,
                              height: 40,
                              child: ElevatedButton.icon(
                                icon: Icon(Icons.camera_enhance_rounded,
                                    color: Colors.white),
                                label: Text(
                                  "اختار الصوره",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () async {
                                  try {
                                    isLoading = false;
                                    await Provider.of<AdvertismentProvider>(
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
                            SizedBox(
                              height: 40,
                            ),
                            AuthTextField(
                              "ادخل اسم معلن",
                              Icons.add_home_outlined,
                              false,
                              _namevendorupdatacategroycontroller,
                              // initialValue,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            AuthTextField(
                              "معلومات  عن معلن",
                              Icons.add_home_outlined,
                              false,
                              _vendorInformationcontroller,
                              // initialValue,
                            ),
                            SizedBox(
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
                        Consumer<AdvertismentProvider>(
                            builder: (context, advertisment, child) {
                          return ElevatedButton.icon(
                            icon: Icon(Icons.add_box_outlined,
                                color: Colors.white),
                            label: Text(
                              "Add",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              if (_namevendorupdatacategroycontroller
                                      .text.isNotEmpty &
                                  advertisment
                                      .getImageUrl()
                                      .toString()
                                      .isNotEmpty &
                                  _Idcategroycontroller.text.isNotEmpty &
                                  _vendorInformationcontroller
                                      .text.isNotEmpty) {
                                advertisment.Addadvertisment(
                                    _namevendorupdatacategroycontroller.text,
                                    _vendorInformationcontroller.text,
                                    advertisment.getImageUrl(),
                                    _Idcategroycontroller.text);
                                alertToast(
                                    "لقد أضفت قسم جديد",
                                    Color.fromRGBO(96, 43, 213, 1),
                                    const Color.fromARGB(255, 255, 254, 254));
                              } else {
                                alertToast(
                                    "رجاء قم بأدخال كل البيانات !",
                                    Color.fromRGBO(96, 43, 213, 1),
                                    const Color.fromARGB(255, 255, 254, 254));
                              }

                              advertisment.deledImageUrl();
                              _Idcategroycontroller.text = "";
                              _namevendorupdatacategroycontroller.text = "";
                              _vendorInformationcontroller.text = "";
                              Navigator.pop(context);
                            },
                          );
                        })
                      ],
                    ),
                  );
                },
                icon: Icon(Icons.add_circle_sharp, color: Colors.white),
                label: Text("Add Advertisment",
                    style: TextStyle(color: Colors.white))),
          )
        ]),
      ),
    );
  }
}
