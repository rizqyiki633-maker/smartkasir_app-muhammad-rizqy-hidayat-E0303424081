// Blueprint / Struktur Data (Model) entitas produk kasir ritel SmartKasir
class Produk {
  // Deklarasi variabel ID produk (Nullable '?' karena ID otomatis di generate oleh SQLite via AUTOINCREMENT)
  final int? id;
  // Deklarasi variabel kode unik produk / SKU / Barcode kasir (Tipe: String)
  final String kodeProduk;
  // Deklarasi variabel nama barang dagangan (Tipe: String)
  final String nama;
  // Deklarasi variabel kelompok produk: Makanan / Minuman / Snack (Tipe: String)
  final String kategori;
  // Deklarasi variabel harga beli modal / HPP (Tipe: Double)
  final double hargaBeli;
  // Deklarasi variabel harga jual kasir kepada konsumen (Tipe: Double)
  final double hargaJual;
  // Deklarasi variabel sisa kuantitas fisik barang di toko (Tipe: Integer)
  final int stok;
  // Deklarasi variabel URL foto atau path lokal gambar produk (Tipe: String)
  final String gambarUrl;
  // Deklarasi variabel persentase promo diskon kasir (Tipe: Integer, default 0)
  final int diskonPersen;

  // Konstruktor konstan dengan parameter wajib (required) dan opsional (default)
  const Produk({
    this.id,
    required this.kodeProduk,
    required this.nama,
    required this.kategori,
    required this.hargaBeli,
    required this.hargaJual,
    required this.stok,
    required this.gambarUrl,
    this.diskonPersen = 0,
  });

  // --- METODE SERIALISASI (DART OBJECT -> SQLITE ROW MAP) ---
  // Mengonversi objek class Produk menjadi struktur Map<String, dynamic> untuk disimpan ke tabel SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'kode_produk': kodeProduk,
      'nama_produk': nama,
      'kategori': kategori,
      'harga_beli': hargaBeli,
      'harga_jual': hargaJual,
      'stok': stok,
      'gambar_path': gambarUrl,
      'diskon_persen': diskonPersen,
      'created_at': DateTime.now().toIso8601String(),
    };
  }

  // --- METODE DESERIALISASI (SQLITE ROW MAP -> DART OBJECT) ---
  // Membaca baris data (Map) hasil kueri SELECT dari tabel SQLite dan mengubahnya kembali menjadi objek Produk
  factory Produk.fromMap(Map<String, dynamic> map) {
    return Produk(
      id: map['id'] as int?,
      kodeProduk: map['kode_produk'] as String,
      nama: map['nama_produk'] as String,
      kategori: map['kategori'] as String,
      hargaBeli: (map['harga_beli'] as num).toDouble(),
      hargaJual: (map['harga_jual'] as num).toDouble(),
      stok: map['stok'] as int,
      gambarUrl: map['gambar_path'] as String? ?? '',
      diskonPersen: map['diskon_persen'] as int? ?? 0,
    );
  }
}

// --- DATA SEEDING AWAL PRODUK BAWAAN SMARTKASIR ---
// Daftar 6 produk awal ritel untuk mengisi database SQLite saat pertama kali dibuat
final List<Produk> produkAwalSQLite = [
  const Produk(
    kodeProduk: 'PRD-001',
    nama: 'Kopi Susu Gula Aren 250ml',
    kategori: 'Minuman',
    hargaBeli: 10000,
    hargaJual: 18000,
    stok: 24,
    gambarUrl:
        'https://images.unsplash.com/photo-1541167760496-1628856ab772?w=500',
  ),
  const Produk(
    kodeProduk: 'PRD-002',
    nama: 'Roti Bakar Cokelat Keju',
    kategori: 'Makanan',
    hargaBeli: 8000,
    hargaJual: 15000,
    stok: 5,
    gambarUrl:
        'https://images.unsplash.com/photo-1536256263959-770b48d82b0a?w=500',
  ),
  const Produk(
    kodeProduk: 'PRD-003',
    nama: 'Matcha Latte Ice',
    kategori: 'Minuman',
    hargaBeli: 12000,
    hargaJual: 22000,
    stok: 0,
    gambarUrl:
        'https://images.unsplash.com/photo-1536256263959-770b48d82b0a?w=500',
  ),
  const Produk(
    kodeProduk: 'PRD-004',
    nama: 'Nasi Goreng Banjar Spesial',
    kategori: 'Makanan',
    hargaBeli: 15000,
    hargaJual: 25000,
    stok: 12,
    diskonPersen: 10,
    gambarUrl:
        'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500',
  ),
  const Produk(
    kodeProduk: 'PRD-005',
    nama: 'Keripik Singkong Pedas Manis',
    kategori: 'Snack',
    hargaBeli: 6000,
    hargaJual: 12000,
    stok: 30,
    gambarUrl:
        'https://images.unsplash.com/photo-1566478989037-eec170784d0b?w=500',
  ),
  const Produk(
    kodeProduk: 'PRD-006',
    nama: 'Pisang Goreng Pasir Crispy',
    kategori: 'Snack',
    hargaBeli: 7000,
    hargaJual: 14000,
    stok: 8,
    gambarUrl:
        'https://images.unsplash.com/photo-1566478989037-eec170784d0b?w=500',
  ),
];
