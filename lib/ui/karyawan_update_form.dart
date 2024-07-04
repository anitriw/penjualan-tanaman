import 'package:flutter/material.dart';
import 'package:plantapp/model/karyawan.dart';
import 'karyawan_detail.dart';

class KaryawanUpdateForm extends StatefulWidget {
  final Karyawan karyawan;

  const KaryawanUpdateForm({Key? key, required this.karyawan})
      : super(key: key);
  _KaryawanUpdateFormState createState() => _KaryawanUpdateFormState();
}

class _KaryawanUpdateFormState extends State<KaryawanUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _idCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tanggal_lahirCtrl = TextEditingController();
  final _nomor_teleponCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  @override
  void initState() {
    super.initState();
    setState(() {
      _idCtrl.text = widget.karyawan.id;
      _namaCtrl.text = widget.karyawan.nama;
      _tanggal_lahirCtrl.text = widget.karyawan.tanggal_lahir;
      _nomor_teleponCtrl.text = widget.karyawan.nomor_telepon;
      _emailCtrl.text = widget.karyawan.email;
      _passwordCtrl.text = widget.karyawan.password;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ubah Data Karyawan",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 82, 162, 25),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldID(),
              _fieldNama(),
              _fieldTanggalLahir(),
              _fieldNomorTelepon(),
              _fieldEmail(),
              _fieldPassword(),
              SizedBox(height: 20),
              _tombolSimpan()
            ],
          ),
        ),
      ),
    );
  }

  _fieldID() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "ID:"),
      controller: _idCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Silahkan Masukkan ID';
        }
        return null;
      },
    );
  }

  _fieldNama() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Nama:"),
      controller: _namaCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'PSilahkan Masukkan Nama';
        }
        return null;
      },
    );
  }

  _fieldTanggalLahir() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Tanggal Lahir:"),
      controller: _tanggal_lahirCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Silahkan Masukkan Tanggal Lahir';
        }
        return null;
      },
    );
  }

  _fieldNomorTelepon() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Nomor Telepon:"),
      controller: _nomor_teleponCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Silahkan Masukkan Nomor Telepon';
        }
        return null;
      },
    );
  }

  _fieldEmail() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Email:"),
      controller: _emailCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Silahkan Masukkan Email';
        }
        return null;
      },
    );
  }

  _fieldPassword() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Password:"),
      controller: _passwordCtrl,
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Silahkan Masukkan Password';
        }
        return null;
      },
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Karyawan karyawan = Karyawan(
            id: _idCtrl.text,
            nama: _namaCtrl.text,
            tanggal_lahir: _tanggal_lahirCtrl.text,
            nomor_telepon: _nomor_teleponCtrl.text,
            email: _emailCtrl.text,
            password: _passwordCtrl.text,
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => KaryawanDetail(karyawan: karyawan),
            ),
          );
        }
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 82, 162, 25)),
      child:
          const Text("Simpan Perubahan", style: TextStyle(color: Colors.white)),
    );
  }
}
