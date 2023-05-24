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
