import 'package:flutter/material.dart';
import 'package:tokokita/model/produk.dart';
import 'package:tokokita/ui/produk_form.dart';

class ProdukDetail extends StatefulWidget {
  Produk produk;
  ProdukDetail({required this.produk});
  @override
  _ProdukDetailState createState() => _ProdukDetailState();
}

class _ProdukDetailState extends State<ProdukDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Produk'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Kode : ${widget.produk.kodeProduk}",
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              "Nama : ${widget.produk.namaProduk}",
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              "Harga : Rp. ${widget.produk.hargaProduk.toString()}",
              style: TextStyle(fontSize: 18.0),
            ),
            _tombolHapusEdit()
          ],
        ),
      ),
    );
  }

  Widget _tombolHapusEdit() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        //Tombol Edit
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => ProdukForm(
                            produk: widget.produk,
                          )));
            },
            child: Text("EDIT"),
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
            )),
        //Tombol Hapus
        ElevatedButton(
            onPressed: () => confirmHapus(),
            child: Text("DELETE"),
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
            )),
      ],
    );
  }

  void confirmHapus() {
    AlertDialog alertDialog = new AlertDialog(
      content: Text("Yakin ingin menghapus data ini?"),
      actions: [
        //tombol hapus
        ElevatedButton(
          onPressed: () {},
          child: Text("Ya"),
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
          ),
        ),
        //tombol batal
        ElevatedButton(
          child: Text("Batal"),
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
          ),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );

    showDialog(context: context, builder: (_) => alertDialog);
  }
}
