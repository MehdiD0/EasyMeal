import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddMealScreen extends StatefulWidget {
  @override
  _AddMealScreenState createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  File? _image;
  String? _selectedCategory;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _addMeal() {
    String name = _nameController.text;
    String description = _descriptionController.text;

    if (name.isNotEmpty && description.isNotEmpty) {
      print("Repas ajouté : $name, Description : $description, Image : \${_image?.path}");
      // Ici, ajouter la logique pour sauvegarder le repas (ex: Firebase, SQLite)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Ajouter un Repas",
            style: TextStyle(color: Color(0xFFFF904B), fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
  
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: "Nom du repas",
                    prefixIcon: Icon(Icons.fastfood, color: Color(0xFFFF904B)),
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 300,
                child: DropdownButtonFormField<String>(
                  value: _selectedCategory,
                  decoration: InputDecoration(
                    labelText: "Catégorie",
                    prefixIcon: Icon(Icons.restaurant_menu, color: Color(0xFFFF904B)),
                    border: OutlineInputBorder(),
                  ),
                  items: ["Entrée", "Plat", "Dessert"].map((category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCategory = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: "Description",
                    prefixIcon: Icon(Icons.description, color: Color(0xFFFF904B)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(height: 30),
              GestureDetector(
                onTap: _pickImage,
                child: _image == null
                    ? Container(
                        height: 150,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.add_a_photo, size: 50, color: Colors.grey[700]),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(_image!, height: 150, width: 300, fit: BoxFit.cover),
                      ),
              ),
              SizedBox(height: 25),
              Center(
                child: Container(
                  width: 200,
                  height: 2,
                  color: Color(0xFFFF904B),
                ),
              ),
              SizedBox(height: 10),
              Spacer(),
              SizedBox(
                width: 250,
                child: ElevatedButton.icon(
                  onPressed: _addMeal,
                  icon: Icon(Icons.add),
                  label: Text("Ajouter le repas"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFF904B),
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
    );
  }
}