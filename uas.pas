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

procedure tambah; //menambah data pengeluaran
var
    p: pengeluaran;
begin
    clrscr;
    with p do
    begin
        write('Masukkan jenis pengeluaran: ');
        readln(jenis);
        write('Masukkan jumlah pengeluaran (dalam angka): ');
        readln(jumlah);
        write('Masukkan tanggal pengeluaran (dd-mm-yyyy): ');
        readln(tanggal);
    end;
