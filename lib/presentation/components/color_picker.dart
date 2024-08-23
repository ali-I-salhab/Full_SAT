import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:osta/data/models/field_info.dart';
import 'package:osta/logic/main_cubit/main_cubit.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';


class AppColorPicker extends StatelessWidget {
  const AppColorPicker({super.key,required this.field,});
  final FieldInfo field;

   @override
  Widget build(BuildContext context) {
    Color choosenColor = Colors.black;

    return Row(
      children: [
        StatefulBuilder(
          builder: (context,setState) {
            return IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Pick a color!'),
                          content: SingleChildScrollView(
                              child: ColorPicker(
                                pickerColor: choosenColor, //default color
                                onColorChanged:
                                    (Color color){//on color picked
                                      setState((){
                                        choosenColor = color ;
                                        print(color);
                                      });

                                },
                              )
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              child: const Text('DONE',style: TextStyle(color: Colors.white),),
                              onPressed: () {
                                context.read<MainCubit>().userInputs[field.name]
                                // !.update("value", (value) => '#${(choosenColor.value & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}');
                                =
                           {"value":     '#${(choosenColor.value & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}' ,
                           "cost":field.price
                           };
                              Navigator.of(context)
                                    .pop(); //dismiss the color picker
                              },
                            ),
                          ],
                        );
                      });
                },
                icon: CircleAvatar(
                    backgroundColor: choosenColor,
                    child: Icon(Icons.color_lens_outlined , color: Colors.white,)));
          }
        ),
        LabelText(labelText: field.label ?? ''),
      ],
    );
    // IconButton(onPressed: (){}, icon: icon)
  }
}
