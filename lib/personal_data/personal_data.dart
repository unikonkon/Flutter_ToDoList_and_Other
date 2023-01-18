import 'package:flutter/material.dart';
import 'package:flutter_app_todolist/personal_data/bloc/personal_bloc.dart';
import 'package:flutter_app_todolist/personal_data/data_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Personal extends StatefulWidget {
  const Personal({super.key});

  @override
  State<Personal> createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  final formKey = GlobalKey<FormState>();
  String name = '';
  String namedata = '';
  late String _email;

  // List<Data> dataList = [
  //   Data(title: 'asda'),
  //   Data(title: 'sddas'),
  // ];

  Widget nameForm() {
    return TextFormField(
      // controller: titleController,
      keyboardType: TextInputType.name,

      decoration: const InputDecoration(
        labelText: 'ข้อมูลส่วนตัว',
        labelStyle: TextStyle(color: Color.fromARGB(255, 248, 245, 245)),
        icon: Icon(
          Icons.person,
          color: Color.fromARGB(255, 109, 132, 225),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a ข้อมูลส่วนตัว';
        }
        return null;
      },
      onSaved: (String? value) {
        name = value!;
      },
    );
  }

  Widget dataForm() {
    return TextFormField(
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
        labelText: 'ข้อมูลที่อยู่ตามบัตรประชาชน',
        labelStyle: TextStyle(color: Color.fromARGB(255, 248, 245, 245)),
        icon: Icon(
          Icons.home,
          color: Color.fromARGB(255, 109, 132, 225),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a ข้อมูลที่อยู่ตามบัตรประชาชน';
        }
        return null;
      },
      onSaved: (String? value) {
        namedata = value!;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // print('_email = $_email');
    return BlocBuilder<PersonalBloc, PersonalState>(
      builder: (context, state) {
        List<Data> dataList = state.allData;

        return Padding(
          padding: EdgeInsets.only(top: 40.h),
          child: Container(
            child: Column(
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      nameForm(),
                      dataForm(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      if (name.isNotEmpty || namedata.isNotEmpty) {
                        var data = Data(title: name, titledata: namedata);
                        context.read<PersonalBloc>().add(
                              OnAddata(
                                data: data,
                              ),
                            );
                      }
                    }
                    // print(state.name);
                    // print(";  data = $data");
                    formKey.currentState!.reset();
                  },
                  child: const Text('ตกลง'),
                ),
                DataList(dataList: dataList),
              ],
            ),
          ),
        );
      },
    );
  }
}

class DataList extends StatelessWidget {
  const DataList({
    Key? key,
    required this.dataList,
  }) : super(key: key);

  final List<Data> dataList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          var data = dataList[index];
          return Card(
            color: Color.fromARGB(255, 207, 215, 221),
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Theme.of(context).colorScheme.outline),
                borderRadius: const BorderRadius.all(Radius.circular(7))),
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(data.title),
                    subtitle: Text(data.titledata),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
