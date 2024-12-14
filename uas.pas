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
    readln;
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

    writeln('--- Laporan Pengeluaran ---');
    writeln('Total pengeluaran: ', total);
    writeln('Jenis pengeluaran terbesar: ', terbesar);
    writeln('Sisa anggaran: ', sisa);
    
    if sisa < (anggaran div 10) then
        writeln('Peringatan: Sisa anggaran kurang dari 10%!');

    writeln;
    writeln('Detail pengeluaran:');
    writeln;
    for i := 1 to n do
    begin
        writeln('Pengeluaran ke-', i, ':');
        writeln('  Jenis: ', data[i].jenis);
        writeln('  Jumlah: ', data[i].jumlah);
        writeln('  Tanggal: ', data[i].tanggal);
        writeln;
    end;
    writeln('Tekan Enter untuk kembali ke menu...');
    readln; // Tunggu pengguna membaca laporan
end;

//program utama
begin 
    clrscr;
    n := 0;
    total := 0;
    write('Masukkan total anggaran bulanan Anda: ');
    readln(anggaran);

    repeat
        clrscr;
        writeln('--- Menu Utama ---');
        writeln('1. Tambah Pengeluaran');
        writeln('2. Lihat Laporan');
        writeln('3. Keluar');
        write('Pilih menu (1-3): ');
        readln(menu);

        case menu of
            1: tambah; //ke procedure tambah
            2: laporan; //ke procedure laporan
            3: writeln('Terima kasih telah menggunakan program!');
        else
            writeln('Pilihan tidak valid. Silakan coba lagi.');
            writeln('Tekan Enter untuk kembali ke menu.');
            readln;
        end;
    until menu = 3;
end.
