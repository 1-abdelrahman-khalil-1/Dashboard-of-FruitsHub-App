
import 'package:dashboard/Core/helperFunctions/bar.dart';
import 'package:dashboard/Feature/MainScreen/data/model/productmodel.dart';
import 'package:dashboard/Feature/MainScreen/presentation/cubit/product_cubit.dart';
import 'package:dashboard/Feature/MainScreen/presentation/view/widgets/check_box.dart';
import 'package:dashboard/Feature/MainScreen/presentation/view/widgets/customtextbutton.dart';
import 'package:dashboard/Feature/MainScreen/presentation/view/widgets/customtextform.dart';
import 'package:dashboard/Feature/MainScreen/presentation/view/widgets/uploadimage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Mainscreenbody extends StatefulWidget {
  const Mainscreenbody({super.key});

  @override
  State<Mainscreenbody> createState() => _MainscreenbodyState();
}

class _MainscreenbodyState extends State<Mainscreenbody> {
  TextEditingController nameController = TextEditingController();
  TextEditingController productIDController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController caloriesController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, description;
  late int price, calories, productID;
  bool organic = false, vegetable = false, fruit = false, image = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              CustomTextfield(
                  maxline: 1,
                  hinttext: "Name",
                  textInputType: TextInputType.text,
                  onSaved: (name) => this.name = name!,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Can't be empty!";
                    }
                    return null;
                  },
                  controller: nameController),
              SizedBox(height: 16.h),
              CustomTextfield(
                maxline: 1,
                hinttext: "ProductID",
                textInputType: TextInputType.number,
                onSaved: (productID) => this.productID = int.parse(productID!),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Can't be empty!";
                  }
                  return null;
                },
                controller: productIDController,
                textInputFormatter: [FilteringTextInputFormatter.digitsOnly],
              ),
              SizedBox(height: 16.h),
              CustomTextfield(
                  maxline: 1,
                  hinttext: "Price",
                  textInputType: TextInputType.number,
                  onSaved: (price) => this.price = int.parse(price!),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Can't be empty!";
                    }
                    return null;
                  },
                  controller: priceController),
              SizedBox(height: 16.h),
              CustomTextfield(
                  maxline: 1,
                  hinttext: "Calories",
                  textInputType: TextInputType.number,
                  onSaved: (calories) => this.calories = int.parse(calories!),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Can't be empty!";
                    }
                    return null;
                  },
                  textInputFormatter: [FilteringTextInputFormatter.digitsOnly],
                  controller: caloriesController),
              SizedBox(height: 16.h),
              CustomTextfield(
                  maxline: 5,
                  hinttext: "Description",
                  textInputType: TextInputType.text,
                  onSaved: (description) => this.description = description!,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Can't be empty!";
                    }
                    return null;
                  },
                  controller: descriptionController),
              SizedBox(height: 16.h),
              Check_box(
                  onChanged: (value) => setState(() {
                        fruit = value!;
                      }),
                  text: "Fruit"),
              Check_box(
                  onChanged: (value) => setState(() {
                        vegetable = value!;
                      }),
                  text: "Vegetable"),
              Check_box(
                onChanged: (value) => setState(() {
                  organic = value!;
                }),
                text: "Organic",
              ),
              Uploadimage(
                onImageSelected: () =>setState(() {
                   image = true;
                }),
                onImageRemoved: () => setState(() {
                  image = false;
                }),
              ),
              SizedBox(height: 16.h),
              CustomTextButton(
                show: true,
                text: "Submit",
                onpressed: () {
                  if(!image)
                  {
                  bar(context, message: "Please Add an image");
                  }
                 else if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    Productmodel product = Productmodel(
                      id: productID,
                      name: name,
                      price: price,
                      description: description,
                      organic: organic,
                      calories: calories,
                      imageUrl: "",
                      category: (fruit) ? "Fruit" : "Vegetable",
                    );
                    context.read<ProductCubit>().uploadData(data: product.toMap(product));
                  } else {
                    bar(context, message: "Please fill all fields");
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
