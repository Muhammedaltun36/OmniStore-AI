-- =================================================================
-- OmniStore-AI Relational Database Schema
-- =================================================================

CREATE TABLE Tbl_Lokasyonlar (
    LokasyonID INT PRIMARY KEY IDENTITY(1,1),
    LokasyonAdi NVARCHAR(100) NOT NULL,
    Tip NVARCHAR(50) NOT NULL -- 'Depo' veya 'Magaza'
);

CREATE TABLE Tbl_Urunler (
    UrunID INT PRIMARY KEY IDENTITY(1,1),
    SKU NVARCHAR(50) UNIQUE NOT NULL,
    UrunAdi NVARCHAR(150) NOT NULL,
    Beden NVARCHAR(10),
    Kategori NVARCHAR(50)
);

CREATE TABLE Tbl_Stok (
    StokID INT PRIMARY KEY IDENTITY(1,1),
    LokasyonID INT FOREIGN KEY REFERENCES Tbl_Lokasyonlar(LokasyonID),
    UrunID INT FOREIGN KEY REFERENCES Tbl_Urunler(UrunID),
    MevcutStok INT NOT NULL DEFAULT 0,
    RezerveStok INT NOT NULL DEFAULT 0, -- Online sipariş çakışmalarını önlemek için
    SonGuncelleme DATETIME DEFAULT GETDATE()
);

-- Performans Optimizasyonu için Covering Index Örneği
CREATE NONCLUSTERED INDEX IX_Stok_Lokasyon_Urun 
ON Tbl_Stok (LokasyonID, UrunID) 
INCLUDE (MevcutStok, RezerveStok);
