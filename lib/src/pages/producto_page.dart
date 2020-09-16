import 'dart:io';

import 'package:flutter/material.dart';
import 'package:formvalidation/src/models/producto_model.dart';
import 'package:formvalidation/src/providers/producto_provider.dart';
import 'package:formvalidation/src/utils/utils.dart' as utils;
import 'package:image_picker/image_picker.dart';

class ProductoPage extends StatefulWidget {
  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  ProductosProvider productosProvider = new ProductosProvider();
  ProductoModel producto = new ProductoModel();
  bool _guardando = false;
  File _foto;

  @override
  Widget build(BuildContext context) {
    final ProductoModel prodData = ModalRoute.of(context).settings.arguments;
    if (prodData != null) {
      producto = prodData;
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Productos'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            onPressed: _seleccionarFoto,
          ),
          IconButton(icon: Icon(Icons.camera_alt), onPressed: _tomarFoto),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                _mostrarFoto(),
                _crearNombre(),
                _crearPrecio(),
                _crearDisponible(),
                _crearBoton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      initialValue: producto.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Producto',
      ),
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese un nombre del producto';
        }
        return null;
      },
      onSaved: (value) => producto.titulo = value,
    );
  }

  Widget _crearPrecio() {
    return TextFormField(
      // keyboardType: TextInputType.number,
      initialValue: producto.valor.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Precio',
      ),
      validator: (value) {
        if (utils.isNumeric(value)) {
          return null;
        }
        return 'Ingrese un número válido';
      },
      onSaved: (value) => producto.valor = double.parse(value),
    );
  }

  Widget _crearDisponible() {
    return SwitchListTile(
      value: producto.disponible,
      title: Text('Disponible'),
      activeColor: Colors.deepPurple,
      onChanged: (value) => setState(() {
        producto.disponible = value;
      }),
    );
  }

  Widget _crearBoton() {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      color: Colors.deepPurple,
      textColor: Colors.white,
      icon: Icon(Icons.save),
      label: Text('Guardar'),
      onPressed: (_guardando) ? null : _submit,
    );
  }

  void _submit() {
    if (formKey.currentState.validate()) {
      //formulario valido
      formKey.currentState
          .save(); // dispara todos los metodos onSave de los TextField del Form
      setState(() {
        _guardando = true;
      });
      // print('Todo Okey');

      if (producto.id == null) {
        productosProvider.crearProducto(producto);
        mostrarSnackbar('Registro creado');
      } else {
        productosProvider.editarProduto(producto);
        mostrarSnackbar('Registro actualizado');
      }
      setState(() {
        _guardando = false;
      });

      Navigator.pop(context);
    }
  }

  void mostrarSnackbar(String mensaje) {
    final snackbar = SnackBar(
      content: Text(mensaje),
      duration: Duration(microseconds: 1500),
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  Widget _mostrarFoto() {
    if (producto.fotoUrl != null) {
      // tengo que renderizar la foto
      return Container();
    } else {
      // imagen por default
      return Image(
        // si hay algo en Path (path!=null) muestra path caso contrario miestra 'assets/...'
        image: AssetImage(_foto?.path ?? 'assets/no-image.png'),
        height: 300.0,
        fit: BoxFit.cover,
      );
    }
  }

  void _seleccionarFoto() async {
    _procesarImagen(ImageSource.gallery);
  }

  void _procesarImagen(ImageSource tipoSource) async {
    var imagen = await ImagePicker.pickImage(source: tipoSource);
    print('--------------------');
    print(imagen);
    print(imagen.path);
    print('--------------------');

    if (imagen != null) {
      //limpieza

    }
    setState(() {
      _foto = imagen;
    });
  }

  void _tomarFoto() async {
    _procesarImagen(ImageSource.camera);
  }
}
