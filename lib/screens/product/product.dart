import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:forbeddashboard/Widget/mybutton.dart';
import 'package:forbeddashboard/porivider/Categroys.dart';
import 'package:forbeddashboard/porivider/Products.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:forbeddashboard/Widget/AuthWeight.dart';
import 'package:forbeddashboard/responsive.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ProductScreen extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final TextEditingController _nameProduccontroller = TextEditingController();
  final TextEditingController _priceFACcontroller = TextEditingController();
  final TextEditingController _productCodecontroller = TextEditingController();
  final TextEditingController _pricecontroller = TextEditingController();
  final TextEditingController _descriptioncontroller = TextEditingController();
  final TextEditingController _discountcontroller = TextEditingController();
  final TextEditingController _categroycontroller = TextEditingController();
  final TextEditingController _categroynamecontroller = TextEditingController();
  String Size = "";
  int selectedImage = 0;

  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<ProductsProvider>(context, listen: false)
        .getProductData();
  }

  Future<void> _refreshCategroys(BuildContext context) async {
    await Provider.of<CategroyProvider>(context, listen: false)
        .getCategoryData();
  }

  List<Color> Colorers = [];
  Color color = Colors.red;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Product"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Center(
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
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add_circle_sharp, color: Colors.white),
                label: const Text("Show-Product",
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
                    builder: (context) => Dialog(
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DefaultTextStyle(
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      WavyAnimatedText(
                                        "Add Product",
                                        textStyle: GoogleFonts.lobster(
                                          textStyle: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 254, 254),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30,
                                          ),
                                        ),
                                      ),
                                    ],
                                    isRepeatingAnimation: true,
                                    onTap: () {
                                      print("Tap Event");
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child: AuthTextField(
                                    "اسم المنتج",
                                    Icons.production_quantity_limits,
                                    false,
                                    _nameProduccontroller,
                                    // initialValue,
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Expanded(
                                  child: AuthTextField(
                                    "كود المنتج",
                                    Icons.code,
                                    false,
                                    _productCodecontroller,
                                    // initialValue,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Divider(),
                            Consumer<ProductsProvider>(
                                builder: (context, product, child) {
                              return product.getImageList.length != 0
                                  ? Container(
                                      height: 200,
                                      // color: Colors.white,
                                      child: ListView.builder(
                                        padding: EdgeInsets.all(5),
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            margin: EdgeInsets.all(15),
                                            // color: Colors.white,
                                            child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(40)),
                                                child: Image(
                                                  image: NetworkImage(
                                                    product.getImageList[index]
                                                        .toString(),
                                                  ),
                                                  width: 200,
                                                  height: 200,
                                                )

                                                //  Image.network(
                                                //   product.getImageList[index]
                                                //       .toString(),
                                                // width: 200,
                                                // height: 200,
                                                // ),
                                                ),
                                          );
                                        },
                                        itemCount: product.getImageList.length,
                                      ),
                                    )
                                  : Container(
                                      margin: const EdgeInsets.only(right: 15),
                                      // width: 200,
                                      // height: 200,
                                      color: Colors.white,
                                      child: const SpinKitCubeGrid(
                                        size: 200,
                                        color: Colors.black,
                                        // duration:
                                        //     const Duration(milliseconds: 100),
                                      ),
                                    );
                            }),
                            const SizedBox(
                              height: 20,
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
                                    // isLoading = false;
                                    await Provider.of<ProductsProvider>(
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
                              height: 20,
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child: AuthTextField(
                                    "السعر الاساسى",
                                    Icons.price_check_sharp,
                                    false,
                                    _pricecontroller,
                                    // initialValue,
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Expanded(
                                  child: AuthTextField(
                                    "السعلر القديم",
                                    Icons.price_change_rounded,
                                    false,
                                    _priceFACcontroller,
                                    // initialValue,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child: AuthTextField(
                                    "وصف المنتج",
                                    Icons.abc,
                                    false,
                                    _descriptioncontroller,
                                    // initialValue,
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Expanded(
                                  child: AuthTextField(
                                    "الخصم",
                                    Icons.stream_sharp,
                                    false,
                                    _discountcontroller,
                                    // initialValue,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Consumer<CategroyProvider>(
                                        builder: (context, categroydata,
                                                child) =>
                                            categroydata.getCategoryList.isEmpty
                                                ? const Center(
                                                    child: Text(
                                                    "لا يوجد اصناف ",
                                                    style: TextStyle(
                                                        fontSize: 50,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ))
                                                : Container(
                                                    color: Colors.white,
                                                    child: ListTile(
                                                      leading: Image.network(
                                                        categroydata
                                                            .getCategoryList[1]
                                                            .toString(),
                                                        fit: BoxFit.cover,
                                                      ),
                                                      title: Text(
                                                        categroydata
                                                            .getCategoryList[0]
                                                            .toString(),
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ),
                                                  ),
                                      ),
                                      Container(
                                        width: 200,
                                        height: 40,
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
                                                              onChanged:
                                                                  (value) {
                                                                _categroycontroller
                                                                        .text =
                                                                    value;
                                                                _refreshCategroys(
                                                                    context);
                                                              },
                                                              cursorColor:
                                                                  const Color
                                                                      .fromARGB(
                                                                      255,
                                                                      255,
                                                                      255,
                                                                      255),
                                                              style: TextStyle(
                                                                  color: const Color
                                                                      .fromARGB(
                                                                255,
                                                                255,
                                                                255,
                                                                255,
                                                              ).withOpacity(
                                                                      0.9)),
                                                              decoration:
                                                                  InputDecoration(
                                                                prefixIcon:
                                                                    const Icon(
                                                                  Icons.search,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          255,
                                                                          255,
                                                                          255,
                                                                          1),
                                                                ),
                                                                labelText:
                                                                    'ابحث عن منتج',
                                                                labelStyle: TextStyle(
                                                                    color: const Color
                                                                            .fromARGB(
                                                                            255,
                                                                            255,
                                                                            255,
                                                                            255)
                                                                        .withOpacity(
                                                                            0.9)),
                                                                filled: true,
                                                                floatingLabelBehavior:
                                                                    FloatingLabelBehavior
                                                                        .never,
                                                                // fillColor: Colors.white.withOpacity(0.3),
                                                                border: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30.0),
                                                                    borderSide: const BorderSide(
                                                                        width:
                                                                            0,
                                                                        style: BorderStyle
                                                                            .none)),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            // AuthTextField('ابحث عن منتج', Icons.search,
                                                            //     false, _searchcategroycontroller),
                                                            Expanded(
                                                              child:
                                                                  FutureBuilder(
                                                                future:
                                                                    _refreshCategroys(
                                                                        context),
                                                                builder: (ctx,
                                                                        snapshot) =>
                                                                    snapshot.connectionState ==
                                                                            ConnectionState.waiting
                                                                        ? const Center(
                                                                            child:
                                                                                CircularProgressIndicator(),
                                                                          )
                                                                        : RefreshIndicator(
                                                                            onRefresh: () =>
                                                                                _refreshCategroys(context),
                                                                            child:
                                                                                Consumer<CategroyProvider>(
                                                                              builder: (context, categroydata, child) => categroydata.getUserModelList.isEmpty
                                                                                  ? const Center(
                                                                                      child: Text(
                                                                                      "لا يوجد اصناف ",
                                                                                      style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                                                                                    ))
                                                                                  : Padding(
                                                                                      padding: const EdgeInsets.all(8),
                                                                                      child: ListView.builder(
                                                                                        itemBuilder: (_, i) => categroydata.getUserModelList[i].nameCategory.contains(_categroycontroller.text)
                                                                                            ? Column(
                                                                                                children: <Widget>[
                                                                                                  NotificationListener(
                                                                                                    child: Container(
                                                                                                      color: Colors.white,
                                                                                                      child: ListTile(
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
                                                                                                        onTap: () {
                                                                                                          categroydata.postCategoryList(categroydata.getUserModelList[i].nameCategory, categroydata.getUserModelList[i].imageUrl);
                                                                                                          _categroynamecontroller.text = categroydata.getUserModelList[i].nameCategory;
                                                                                                          print(_categroynamecontroller.text);

                                                                                                          Navigator.pop(context);
                                                                                                        },
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  const Divider(),
                                                                                                ],
                                                                                              )
                                                                                            : Container(),
                                                                                        itemCount: categroydata.getUserModelList.length,
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
                                            icon: const Icon(
                                                Icons.add_circle_sharp,
                                                color: Colors.white),
                                            label: const Text("اضف القسم",
                                                style: TextStyle(
                                                    color: Colors.white))),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Consumer<ProductsProvider>(
                                          builder: (context, product, child) {
                                        return product.getSize.length != 0
                                            ? Container(
                                                height: 100,
                                                // color: Colors.white,
                                                child: ListView.builder(
                                                    padding: EdgeInsets.all(5),
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Container(
                                                        margin:
                                                            EdgeInsets.all(15),
                                                        // color: Colors.white,
                                                        child: Card(
                                                          color: Colors.white,
                                                          child: Container(
                                                            width: 50,
                                                            height: 50,
                                                            // decoration:
                                                            //     BoxDecoration(
                                                            //   borderRadius: BorderRadius
                                                            //       .all(Radius
                                                            //           .circular(
                                                            //               20)),
                                                            //   color:
                                                            //       Colors.white,
                                                            // ),
                                                            child: Center(
                                                              child: Text(
                                                                product.getSize[
                                                                    index],
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    itemCount:
                                                        product.getSize.length),
                                              )
                                            : const Center(
                                                child: Text(
                                                  "لا يوجد اجحام ",
                                                  style: TextStyle(
                                                      fontSize: 50,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              );
                                      }),
                                      Container(
                                        width: 200,
                                        height: 40,
                                        child: ElevatedButton.icon(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      AlertDialog(
                                                        title: Text("Size"),
                                                        content: TextFormField(
                                                          onChanged: (value) {
                                                            Size = value;
                                                          },
                                                          cursorColor:
                                                              const Color
                                                                  .fromARGB(
                                                                  255,
                                                                  255,
                                                                  255,
                                                                  255),
                                                          style: TextStyle(
                                                              color: const Color
                                                                  .fromARGB(
                                                            255,
                                                            255,
                                                            255,
                                                            255,
                                                          ).withOpacity(0.9)),
                                                          decoration:
                                                              InputDecoration(
                                                            prefixIcon:
                                                                const Icon(
                                                              Icons.search,
                                                              color: Color
                                                                  .fromRGBO(
                                                                      255,
                                                                      255,
                                                                      255,
                                                                      1),
                                                            ),
                                                            labelText:
                                                                'ادخل الحجم',
                                                            labelStyle: TextStyle(
                                                                color: const Color
                                                                        .fromARGB(
                                                                        255,
                                                                        255,
                                                                        255,
                                                                        255)
                                                                    .withOpacity(
                                                                        0.9)),
                                                            filled: true,
                                                            floatingLabelBehavior:
                                                                FloatingLabelBehavior
                                                                    .never,
                                                            // fillColor: Colors.white.withOpacity(0.3),
                                                            border: OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30.0),
                                                                borderSide: const BorderSide(
                                                                    width: 0,
                                                                    style: BorderStyle
                                                                        .none)),
                                                          ),
                                                        ),
                                                        actions: [
                                                          ElevatedButton.icon(
                                                            onPressed:
                                                                () async {
                                                              // Colorers.add(
                                                              //     color);
                                                              Provider.of<ProductsProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .postSize(
                                                                      Size);

                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            icon: const Icon(
                                                                Icons
                                                                    .add_box_outlined,
                                                                color: Colors
                                                                    .white),
                                                            label: const Text(
                                                              "Add",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          )
                                                        ],
                                                      ));
                                            },
                                            icon: const Icon(
                                                Icons.add_circle_sharp,
                                                color: Colors.white),
                                            label: const Text("اضف الاحجام",
                                                style: TextStyle(
                                                    color: Colors.white))),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Consumer<ProductsProvider>(
                                          builder: (context, product, child) {
                                        return product.getcolorList.length != 0
                                            ? Container(
                                                height: 100,
                                                // color: Colors.white,
                                                child: ListView.builder(
                                                    padding: EdgeInsets.all(5),
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Container(
                                                        margin:
                                                            EdgeInsets.all(15),
                                                        // color: Colors.white,
                                                        child: Container(
                                                          width: 50,
                                                          height: 50,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: product
                                                                    .getcolorList[
                                                                index],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    itemCount: product
                                                        .getcolorList.length),
                                              )
                                            : const Center(
                                                child: Text(
                                                  "لا يوجد الوان ",
                                                  style: TextStyle(
                                                      fontSize: 50,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              );
                                      }),
                                      Container(
                                        width: 200,
                                        height: 40,
                                        child: ElevatedButton.icon(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      AlertDialog(
                                                        title: Text("Colors"),
                                                        content:
                                                            Column(children: [
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    color:
                                                                        color),
                                                            width: 100,
                                                            height: 100,
                                                          ),
                                                          SizedBox(
                                                            height: 30,
                                                          ),
                                                          ColorPicker(
                                                              pickerColor:
                                                                  color,
                                                              onColorChanged:
                                                                  (value) {
                                                                color = value;
                                                                // Colorers.add(
                                                                //     color);
                                                                // _Colorcontroller
                                                                //         .text =
                                                                //     color
                                                                //         .toString();
                                                              })
                                                        ]),
                                                        actions: [
                                                          ElevatedButton.icon(
                                                            onPressed:
                                                                () async {
                                                              // Colorers.add(
                                                              //     color);
                                                              await Provider.of<
                                                                          ProductsProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .postColor(
                                                                      color);

                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            icon: const Icon(
                                                                Icons
                                                                    .add_box_outlined,
                                                                color: Colors
                                                                    .white),
                                                            label: const Text(
                                                              "Add",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          )
                                                        ],
                                                      ));
                                            },
                                            icon: const Icon(
                                                Icons.add_circle_sharp,
                                                color: Colors.white),
                                            label: const Text("اضف الالوان",
                                                style: TextStyle(
                                                    color: Colors.white))),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Divider(),
                            Consumer<ProductsProvider>(
                                builder: (context, product, child) {
                              return MyButton(
                                  name: "Add Product",
                                  onPressed: product.getImageList.isNotEmpty &
                                          product.getcolorList.isNotEmpty &
                                          product.getSize.isNotEmpty &
                                          _nameProduccontroller
                                              .toString()
                                              .isNotEmpty &
                                          _priceFACcontroller.text.isNotEmpty &
                                          _productCodecontroller
                                              .toString()
                                              .isNotEmpty &
                                          _pricecontroller
                                              .toString()
                                              .isNotEmpty &
                                          _descriptioncontroller
                                              .toString()
                                              .isNotEmpty &
                                          _discountcontroller
                                              .toString()
                                              .isNotEmpty &
                                          _categroynamecontroller
                                              .toString()
                                              .isNotEmpty
                                      ? () {
                                          product.AddProduct(
                                              _nameProduccontroller.toString(),
                                              _descriptioncontroller.toString(),
                                              _categroynamecontroller
                                                  .toString(),
                                              double.parse(_priceFACcontroller
                                                  .toString()),
                                              _productCodecontroller.toString(),
                                              product.getSize,
                                              product.getcolorList,
                                              product.getImageList,
                                              double.parse(_discountcontroller
                                                  .toString()),
                                              double.parse(
                                                  _pricecontroller.toString()));
                                          Navigator.pop(context);
                                        }
                                      : () {
                                          print(
                                              product.getImageList.isNotEmpty);
                                          print(
                                              product.getcolorList.isNotEmpty);
                                          print(product.getSize.isNotEmpty);
                                          print(_nameProduccontroller
                                              .text.isNotEmpty);
                                          print(_categroynamecontroller
                                              .text.isNotEmpty);
                                          print(_descriptioncontroller
                                              .text.isNotEmpty);
                                          print(_discountcontroller
                                              .text.isNotEmpty);
                                          print(_priceFACcontroller
                                              .text.isNotEmpty);
                                          print(
                                              _pricecontroller.text.isNotEmpty);
                                          print(_productCodecontroller
                                              .text.isNotEmpty);
                                        },
                                  colors: Color.fromARGB(255, 188, 113, 0),
                                  height: 50,
                                  width: 400,
                                  borderRadius: 20,
                                  colorwrite: Colors.white);
                            }),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.add_circle_sharp, color: Colors.white),
                label:
                    Text("Add Product", style: TextStyle(color: Colors.white))),
          )
        ]),
      ),
    );
  }
}
