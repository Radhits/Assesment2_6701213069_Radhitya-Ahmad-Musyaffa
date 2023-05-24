import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Peminjaman Kendaraan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String name = '';
  String prodi = '';
  String fakultas = '';
  String keperluan = '';
  String selectedVehicleType = '';
  String selectedDuration = '';
  bool isChecked = false;
  bool withDriver = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Peminjaman Kendaraan'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Nama',
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    prodi = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Program Studi',
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    fakultas = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Fakultas',
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    keperluan = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Keperluan Peminjaman Kendaraan',
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text('Jenis Kendaraan:'),
            Row(
              children: [
                Radio(
                  value: 'Avanza/Xenia',
                  groupValue: selectedVehicleType,
                  onChanged: (value) {
                    setState(() {
                      selectedVehicleType = value.toString();
                    });
                  },
                ),
                Text('Avanza/Xenia'),
                Radio(
                  value: 'Elf',
                  groupValue: selectedVehicleType,
                  onChanged: (value) {
                    setState(() {
                      selectedVehicleType = value.toString();
                    });
                  },
                ),
                Text('Elf'),
              ],
            ),
            SizedBox(height: 16.0),
            Text('Durasi Peminjaman:'),
            Row(
              children: [
                Radio(
                  value: '12 Jam',
                  groupValue: selectedDuration,
                  onChanged: (value) {
                    setState(() {
                      selectedDuration = value.toString();
                    });
                  },
                ),
                Text('12 Jam'),
                Radio(
                  value: '18 Jam',
                  groupValue: selectedDuration,
                  onChanged: (value) {
                    setState(() {
                      selectedDuration = value.toString();
                    });
                  },
                ),
                Text('18 Jam'),
              ],
            ),
            SizedBox(height: 16.0),
            CheckboxListTile(
              title: Text('Dengan Sopir'),
              value: withDriver,
              onChanged: (value) {
                setState(() {
                  withDriver = value!;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondScreen(
                      name: name,
                      prodi: prodi,
                      fakultas: fakultas,
                      keperluan: keperluan,
                      vehicleType: selectedVehicleType,
                      duration: selectedDuration,
                      isChecked: isChecked,
                      withDriver: withDriver,
                    ),
                  ),
                );
              },
              child: Text('KIRIM PERMINTAAN'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final String name;
  final String prodi;
  final String fakultas;
  final String keperluan;
  final String vehicleType;
  final String duration;
  final bool isChecked;
  final bool withDriver;

  SecondScreen({
    required this.name,
    required this.prodi,
    required this.fakultas,
    required this.keperluan,
    required this.vehicleType,
    required this.duration,
    required this.isChecked,
    required this.withDriver,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Permintaan'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama: $name'),
            Text('Program Studi: $prodi'),
            Text('Fakultas: $fakultas'),
            Text('Keperluan Peminjaman Kendaraan: $keperluan'),
            Text('Jenis Kendaraan: $vehicleType'),
            Text('Durasi Peminjaman: $duration'),
            if (isChecked) Text('Persetujuan Penggunaan Kendaraan: Disetujui'),
            if (withDriver) Text('Dengan Sopir'),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(LoginApp());
// }

// class LoginApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Aplikasi Peminjaman',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: LoginPage(),
//     );
//   }
// }

// class LoginPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Aplikasi Peminjaman - Radhitya Ahmad Musyaffa 6701213069'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'Silahkan lengkapi data berikut terlebih dahulu',
//               textAlign: TextAlign.center,
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Container(
//               margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
//               padding: EdgeInsets.only(left: 20),
//               height: 50,
//               decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey, width: 2.0)),
//               child: Row(
//                 children: [
//                   Icon(
//                     Icons.email,
//                     color: Colors.black26,
//                     size: 24.0,
//                   ),
//                   SizedBox(width: 20),
//                   Expanded(
//                       child: TextFormField(
//                     decoration: InputDecoration(
//                         border: InputBorder.none, hintText: 'Nama'),
//                   ))
//                 ],
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.symmetric(horizontal: 30),
//               padding: EdgeInsets.only(left: 20),
//               height: 50,
//               decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey, width: 2.0)),
//               child: Row(
//                 children: [
//                   Icon(
//                     Icons.password,
//                     color: Colors.black26,
//                     size: 24.0,
//                   ),
//                   SizedBox(width: 20),
//                   Expanded(
//                       child: TextFormField(
//                     decoration: InputDecoration(
//                         border: InputBorder.none, hintText: 'Prodi'),
//                   ))
//                 ],
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
//               padding: EdgeInsets.only(left: 20),
//               height: 50,
//               decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey, width: 2.0)),
//               child: Row(
//                 children: [
//                   Icon(
//                     Icons.email,
//                     color: Colors.black26,
//                     size: 24.0,
//                   ),
//                   SizedBox(width: 20),
//                   Expanded(
//                       child: TextFormField(
//                     decoration: InputDecoration(
//                         border: InputBorder.none, hintText: 'Fakultas'),
//                   ))
//                 ],
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
//               padding: EdgeInsets.only(left: 20),
//               height: 50,
//               decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey, width: 2.0)),
//               child: Row(
//                 children: [
//                   Icon(
//                     Icons.email,
//                     color: Colors.black26,
//                     size: 24.0,
//                   ),
//                   SizedBox(width: 20),
//                   Expanded(
//                       child: TextFormField(
//                     decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: 'Keperluan Peminjaman Kendaraan'),
//                   ))
//                 ],
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: 30),
//               child: ElevatedButton(
//                 child: Text('Kirim Permintaan'),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => SecondRoute()),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CheckboxExample extends StatefulWidget {
//   const CheckboxExample({super.key});

//   @override
//   State<CheckboxExample> createState() => _CheckboxExampleState();
// }

// class _CheckboxExampleState extends State<CheckboxExample> {
//   bool isChecked = false;

//   @override
//   Widget build(BuildContext context) {
//     Color getColor(Set<MaterialState> states) {
//       const Set<MaterialState> interactiveStates = <MaterialState>{
//         MaterialState.pressed,
//         MaterialState.hovered,
//         MaterialState.focused,
//       };
//       if (states.any(interactiveStates.contains)) {
//         return Colors.blue;
//       }
//       return Colors.red;
//     }

//     return Checkbox(
//       checkColor: Colors.white,
//       fillColor: MaterialStateProperty.resolveWith(getColor),
//       value: isChecked,
//       onChanged: (bool? value) {
//         setState(() {
//           isChecked = value!;
//         });
//       },
//     );
//   }
// }

// class SecondRoute extends StatelessWidget {
//   // final String nama;
//   // final String prodi;
//   // final String fakultas;
//   // final String keperluan;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Second Route'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: const Text('Go back!'),
//         ),
//       ),
//     );
//   }
// }
