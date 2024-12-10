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

    inc(n); //(increment) setiap data ditambah maka n+1
    with data[n] do
    begin
        jenis := p.jenis;
        jumlah := p.jumlah;
        tanggal := p.tanggal;
    end;
    total := total + p.jumlah;

    writeln('Pengeluaran berhasil ditambahkan.');
end;

function terbesar: string; //cari pengeluaran terbesar
var
    i, maks: integer;
begin
    maks := 1;
    for i := 1 to n do
        if data[i].jumlah > data[maks].jumlah then
            maks := i;
    terbesar := data[maks].jenis;
end;

function saldo: longint; //hitung saldo
begin
    saldo := anggaran - total;
end;

procedure laporan; //menampilkan laporan pengeluaran
var
    sisa: longint;
    i: longint;
begin
    clrscr;
    sisa := saldo;
