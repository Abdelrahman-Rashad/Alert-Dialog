import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          title: Text("Home"),
          centerTitle: true,
        ),
      ),

          body: Center(

        child: Form(
          key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Name",
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return 'Please enter your Password';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 40.0,
              ),
              ElevatedButton(onPressed: (){
                if(formkey.currentState!.validate())
                  {
                    showDialog<void>(context: context,barrierDismissible: false, builder: (BuildContext context){
                      return AlertDialog(
                        title: const Text('Login'),
                        content: Text("Are you sure you want to Sing In?"),
                        actions: [
                          TextButton(onPressed: (){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Your Successfully login")));
                          }, child: Text("Ok")),
                          TextButton(onPressed: (){
                            Navigator.of(context).pop();
                          }, child: Text("Cancel")),
                        ],
                      );
                    });
                  }
                return null;
              },

               child: Text('Login'),),

      ],
    ),
          ),
        ),
    ),
    ),
    );
  }
}
