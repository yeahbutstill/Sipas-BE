DROP TABLE IF EXISTS "orang_tua";
CREATE TABLE IF NOT EXISTS "orang_tua"(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    nama_ibu VARCHAR(255) NOT NULL DEFAULT '',
    nama_ayah VARCHAR(255) NOT NULL DEFAULT '',
    email VARCHAR(255) NOT NULL DEFAULT '',
    password VARCHAR(255) NOT NULL DEFAULT '',
    is_connect_faskes BOOLEAN NOT NULL DEFAULT false,

    -- Helper
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);

DROP TABLE IF EXISTS "data_kehamilan";
CREATE TABLE IF NOT EXISTS "data_kehamilan"(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    nama_calon_bayi VARCHAR(255) NOT NULL DEFAULT '',
    tanggal_pertama_haid TIMESTAMP,
    fk_ortu_id BIGINT,

    -- Helper
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);

DROP TABLE IF EXISTS "data_anak";
CREATE TABLE IF NOT EXISTS "data_anak"(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    nama_anak VARCHAR(255) NOT NULL DEFAULT '',
    tanggal_lahir_anak DATE,
    jenis_kelamin SMALLINT NOT NULL DEFAULT 0,
    kondisi_lahir SMALLINT NOT NULL DEFAULT 0,
    berat_badan_lahir FLOAT NOT NULL DEFAULT 0,
    panjang_badan_lahir FLOAT NOT NULL DEFAULT 0,
    lingkar_kepala FLOAT NOT NULL DEFAULT 0,
    fk_ortu_id BIGINT,

    -- Helper
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);

DROP TABLE IF EXISTS "orang_tua_faskes";
CREATE TABLE IF NOT EXISTS "orang_tua_faskes"(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    fk_ortu_id BIGINT NOT NULL,
    fk_faskes_id BIGINT NOT NULL,

    -- Helper
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);

DROP TABLE IF EXISTS "ajukan_bantuan";
CREATE TABLE IF NOT EXISTS "ajukan_bantuan"(
   id BIGSERIAL NOT NULL PRIMARY KEY,
    judul VARCHAR(255) NOT NULL DEFAULT '',
    deskripsi VARCHAR(255) NOT NULL DEFAULT '',
    status VARCHAR(255) NOT NULL DEFAULT '',
    pesan_tambahan VARCHAR(255) NOT NULL DEFAULT '',
    fk_ortu_id BIGINT NOT NULL,
    fk_faskes_id BIGINT NOT NULL,

    -- Helper
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);

DROP TABLE IF EXISTS "data_pemeriksaan_kehamilan";
CREATE TABLE IF NOT EXISTS "data_pemeriksaan_kehamilan"(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    tanggal_pemeriksaan DATE,
    tempat_pemeriksaan VARCHAR(255) NOT NULL DEFAULT '',
    nama_pemeriksa VARCHAR(255) NOT NULL DEFAULT '',
    usia_kandungan INT NOT NULL DEFAULT 0,
    tekanan_darah VARCHAR(255) NOT NULL DEFAULT '',
    berat_badan_ibu FLOAT NOT NULL DEFAULT 0,
    status_kehamilan SMALLINT NOT NULL DEFAULT 0,
    pesan_tambahan VARCHAR(255) NOT NULL DEFAULT '',
    fk_ortu_id BIGINT NOT NULL,
    fk_faskes_id BIGINT NOT NULL,

    -- Helper
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);

DROP TABLE IF EXISTS "grup_whatsapp";
CREATE TABLE IF NOT EXISTS "grup_whatsapp"(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    nama_grup_whatsapp VARCHAR(255) NOT NULL DEFAULT '',
    link_grup_whatsapp VARCHAR(255) NOT NULL DEFAULT '',
    fk_faskes_id BIGINT NOT NULL,

    -- Helper
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);

DROP TABLE IF EXISTS "resep_makanan";
CREATE TABLE IF NOT EXISTS "resep_makanan"(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    url_gambar VARCHAR(255) NOT NULL DEFAULT '',
    judul_resep VARCHAR(255) NOT NULL DEFAULT '',
    target_resep VARCHAR(255) NOT NULL DEFAULT '',
    target_usia_resep VARCHAR(255) NOT NULL DEFAULT '',
    jenis VARCHAR(255) NOT NULL DEFAULT '',
    bahan_utama VARCHAR(255) NOT NULL DEFAULT '',
    durasi_memasak VARCHAR(255) NOT NULL DEFAULT '',
    bahan_text TEXT,
    cara_membuat_text TEXT,
    nilai_gizi_text TEXT,
    fk_faskes_id BIGINT NOT NULL,

    -- Helper
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);

DROP TABLE IF EXISTS "fasilitas_kesehatan";
CREATE TABLE IF NOT EXISTS "fasilitas_kesehatan"(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    email VARCHAR(255) NOT NULL DEFAULT '',
    password VARCHAR(255) NOT NULL DEFAULT '',
    username VARCHAR(255) NOT NULL DEFAULT '',
    kode_unik VARCHAR(255) NOT NULL DEFAULT '',

    -- Helper
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);