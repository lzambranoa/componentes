import 'package:flutter/material.dart';


class InputPage extends StatefulWidget {
  

  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = "";
  String _email = "";
  String _fecha = "";

  String _opcionSeleccionada = 'Volar';

  List _poderes = ['Volar', 'Rayos X', 'Super Aliento', 'Super Fuerza'];

  TextEditingController _inputFieldDateController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(
            color: Colors.red,
          ),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha( context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
                  ],
                ),
                 
              );
            }
          
          Widget _crearInput() {
          
            return TextField(
              autofocus: false,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0)
                ),
                counter: Text('Letras ${ _nombre.length}'),
                hintText: 'Nombre de la persona',
                labelText: 'Nombre',
                helperText: 'Solo es el nombre',
                suffixIcon: Icon(Icons.accessibility),
                icon: Icon(Icons.account_circle, color: Colors.red,)
              ),
              onChanged: (valor){
                
                setState(() {
                  _nombre = valor;  
                });
              },
            );
          }
          
           Widget _crearPersona() {

             return ListTile(
               title: Text('Nombre es: $_nombre'),
               subtitle: Text('Email: $_email'),
               trailing: Text(_opcionSeleccionada),
             );
           }

  Widget _crearEmail() {

    return TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0)
                ),
                hintText: 'Email',
                labelText: 'Email',
                suffixIcon: Icon(Icons.alternate_email),
                icon: Icon(Icons.email)
              ),
              onChanged: (valor){
                
                setState(() {
                  _email = valor;  
                });
              },
            );
  }

  Widget _crearPassword() {

     return TextField(
              obscureText: true,             
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0)
                ),
                hintText: 'Password',
                labelText: 'Password',
                suffixIcon: Icon(Icons.lock_open),
                icon: Icon(Icons.lock)
              ),
             
            );
  }

  Widget _crearFecha( BuildContext context) {

    return TextField(
              enableInteractiveSelection: false,
              controller: _inputFieldDateController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0)
                ),
                hintText: 'Fecha de Nacimiento',
                labelText: 'Fecha de Nacimiento',
                suffixIcon: Icon(Icons.calendar_today),
                icon: Icon(Icons.calendar_view_day)
              ),
              onTap: (){

                FocusScope.of(context).requestFocus(new FocusNode());
                _selectDate( context );
              },
            );
  }

 _selectDate(BuildContext context) async {
   DateTime picked =  await showDatePicker(
     context: context,
     initialDate: new DateTime.now(),
     firstDate: new DateTime(2018),
     lastDate: new DateTime(2025),
     locale: Locale('es', 'ES')   
     );

     if ( picked != null ) {
       setState(() {
         _fecha = picked.toString();
         _inputFieldDateController.text = _fecha;
       });
     }
 }

  List<DropdownMenuItem<String>> getOpcionesDropdown () {

    List<DropdownMenuItem<String>> lista = new List();

    _poderes.forEach((poder) {
      lista.add( DropdownMenuItem (
        child: Text(poder),
        value: poder,
      ) );
    });

    return lista;
  }

  Widget _crearDropdown() {

    return Row(
      children: <Widget>[
      Icon(Icons.select_all),
      SizedBox(width: 35.0),
     DropdownButton(
        value: _opcionSeleccionada,
        items: getOpcionesDropdown (),
        onChanged: (opt) {
          setState(() {
           _opcionSeleccionada = opt;
           });
      },
    )
      ],
    );


   
  }
}