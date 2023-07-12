import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/data/models/products/rating_model.dart';

import 'package:flutter_defualt_project/ui/product_add/widgets/get_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/models/products/product_model.dart';
import '../../data/network/repositories/product_repo.dart';
import '../../utils/constants.dart';
import '../../utils/utility_function.dart';


class ProductAddScreen extends StatefulWidget {
  const ProductAddScreen({super.key, required this.productRepo});

  final ProductRepo productRepo;

  @override
  State<ProductAddScreen> createState() => _ProductAddScreenState();
}

class _ProductAddScreenState extends State<ProductAddScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  String imagePath = defaultImageConstant;
  String dropdownValue = categoriesForAdd.first;

  ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Text("Add new Product",style: Theme.of(context).textTheme.titleLarge,),
          elevation: 5,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(24),
                children: [
                  TextField(
                    controller: titleController,
                    decoration: getTextFieldDecoration("Title"),
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: priceController,
                    decoration: getTextFieldDecoration("Price"),
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    controller: descriptionController,
                    decoration: getTextFieldDecoration("Description"),
                  ),
                  const SizedBox(height: 24),
                  DropdownButtonFormField(
                    decoration: getTextFieldDecoration("Select Category"),
                    value: dropdownValue,
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    onChanged: (String? value) {
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    items: categoriesForAdd
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        showBottomSheetDialog();
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Theme.of(context).indicatorColor),
                      child: imagePath == defaultImageConstant
                          ? Text(
                        imagePath,
                        style: const TextStyle(color: Colors.white),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                          : Image.file(
                        File(imagePath),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  GetButton(
                      text: "Add Product",
                      onTap: () async {
                        if (titleController.text.isNotEmpty &&
                            priceController.text.isNotEmpty &&
                            descriptionController.text.isNotEmpty &&
                            imagePath != defaultImageConstant) {
                          ProductModel? product = await widget.productRepo.addProduct(
                            ProductModel(
                              id: 0,
                              title: titleController.text,
                              price: double.parse(priceController.text),
                              description: descriptionController.text,
                              category: dropdownValue,
                              image: imagePath,
                              rating: Rating(
                                rate: 0,
                                count: 0,
                              ),
                            ),
                          );

                          if (product != null) {
                            showCustomMessage(context, "Product Added");
                            titleController.clear();
                            priceController.clear();
                            descriptionController.clear();
                            imagePath = defaultImageConstant;
                            setState(() {

                            });
                          } else {
                            showCustomMessage(context, "Something went wrong!!!");
                          }
                        } else {
                          showCustomMessage(
                              context, "Enter valid data for product add!!!");
                        }
                      }),
                ],
              ),
            ),
             SizedBox(height: 60.h),
          ],
        ));
  }

  void showBottomSheetDialog() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(24),
          height: 200,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  _getFromCamera();
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.camera_alt),
                title: const Text("Select from Camera"),
              ),
              ListTile(
                onTap: () {
                  _getFromGallery();
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.photo),
                title: const Text("Select from Gallery"),
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> _getFromCamera() async {
    XFile? xFile = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 512,
      maxWidth: 512,
    );
    if (xFile != null) {
      setState(() {
        imagePath = xFile.path;
      });
    }
  }

  Future<void> _getFromGallery() async {
    XFile? xFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 512,
      maxWidth: 512,
    );
    if (xFile != null) {
      setState(() {
        imagePath = xFile.path;
      });
    }
  }
}