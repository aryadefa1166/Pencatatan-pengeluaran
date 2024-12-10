program laporan_pengeluaran;
uses crt;

type
    pengeluaran = record
        jenis: string; //makanan, minuman, transportas
        jumlah: longint; //100000, 500000
        tanggal: string; //dd-mm-yyyy
    end;

var
    data: array[1..100] of pengeluaran;
    anggaran, total, n: longint;
    menu: integer;
