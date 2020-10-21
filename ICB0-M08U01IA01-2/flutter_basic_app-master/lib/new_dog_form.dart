import 'package:basic_flutter_app/dog_model.dart';
import 'package:flutter/material.dart';

class AddDogFormPage extends StatefulWidget {
  @override
  _AddDogFormPageState createState() => new _AddDogFormPageState();
}

class _AddDogFormPageState extends State<AddDogFormPage> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController locationController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  TextEditingController url_imagen = new TextEditingController();


  void submitPup(BuildContext context) {
    if (nameController.text.isEmpty) {
      Scaffold.of(context).showSnackBar(new SnackBar(
        backgroundColor: Colors.redAccent,
        content: new Text('And the name?'),
      ));
    } else {
      var newDog = new Dog(nameController.text, locationController.text,
          descriptionController.text, url_imagen.text);
      Navigator.of(context).pop(newDog);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('A new good rookie?'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: new Container(      
        //  decoration: new BoxDecoration(
        //  image: DecorationImage(
        //  image: new NetworkImage('https://i.pinimg.com/736x/6b/e1/d1/6be1d1d2d129f253c2b22f81b86264e6.jpg)'),
        //  fit: BoxFit.cover
       // )),
        color: Colors.black45,
        child: new Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
          child: new Column(children: [
            new Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: new TextField(
                controller: nameController,
                //onChanged: (v) => nameController.text = v,
                decoration: new InputDecoration(labelText: 'Name it'),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: new TextField(
                controller: locationController,
                //onChanged: (v) => locationController.text = v,
                decoration: new InputDecoration(labelText: "Locate it"),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: new TextField(
                controller: descriptionController,
                //onChanged: (v) => descriptionController.text = v,
                decoration: new InputDecoration(labelText: 'Describe his season'),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(16.0),
              child: new Builder(
                builder: (context) {
                  return new RaisedButton(
                    onPressed: () => submitPup(context),
                    color: Colors.indigoAccent,
                    child: new Text('Add rookie'),
                  );
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
