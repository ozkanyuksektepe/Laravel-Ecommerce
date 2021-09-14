-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 22 Ağu 2021, 14:49:52
-- Sunucu sürümü: 10.4.18-MariaDB
-- PHP Sürümü: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `eticaret`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ayar`
--

CREATE TABLE `ayar` (
  `id` int(10) UNSIGNED NOT NULL,
  `anahtar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deger` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `ayar`
--

INSERT INTO `ayar` (`id`, `anahtar`, `deger`) VALUES
(1, 'anasayfa_slider_urun_adet', '5'),
(2, 'anasayfa_liste_urun_adet', '5');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategori`
--

CREATE TABLE `kategori` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ust_id` int(11) DEFAULT NULL,
  `kategori_adi` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `olusturulma_tarihi` timestamp NOT NULL DEFAULT current_timestamp(),
  `guncelleme_tarihi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `silinme_tarihi` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `kategori`
--

INSERT INTO `kategori` (`id`, `ust_id`, `kategori_adi`, `slug`, `olusturulma_tarihi`, `guncelleme_tarihi`, `silinme_tarihi`) VALUES
(1, NULL, 'Elektronik', 'elektronik', '2021-07-09 07:38:08', '2021-07-09 07:38:08', NULL),
(2, 1, 'Bilgisayar/Tablet', 'bilgisayar-tablet', '2021-07-09 07:38:08', '2021-07-09 07:38:08', NULL),
(3, 1, 'Telefon', 'telefon', '2021-07-09 07:38:08', '2021-07-09 07:38:08', NULL),
(4, 1, 'Tv ve Ses Sistemleri', 'tv-ses-sistemleri', '2021-07-09 07:38:08', '2021-07-09 07:38:08', NULL),
(5, 1, 'Kamera', 'kamera', '2021-07-09 07:38:08', '2021-07-09 07:38:08', NULL),
(6, NULL, 'Kitap', 'kitap', '2021-07-09 07:38:08', '2021-07-09 07:38:08', NULL),
(7, 6, 'Edebiyat', 'edebiyat', '2021-07-09 07:38:08', '2021-07-09 07:38:08', NULL),
(8, 6, 'Çocuk', 'cocuk', '2021-07-09 07:38:08', '2021-07-09 07:38:08', NULL),
(9, 6, 'Bilgisayar', 'bilgisayar', '2021-07-09 07:38:08', '2021-07-09 07:38:08', NULL),
(10, 6, 'Sınavlara Hazırlık', 'sinavlara-hazirlik', '2021-07-09 07:38:08', '2021-07-09 07:38:08', NULL),
(11, NULL, 'Dergi', 'dergi', '2021-07-09 07:38:08', '2021-07-09 07:38:08', NULL),
(12, NULL, 'Mobilya', 'mobilya', '2021-07-09 07:38:08', '2021-07-09 07:38:08', NULL),
(13, NULL, 'Dekorasyon', 'dekorasyon', '2021-07-09 07:38:08', '2021-07-09 07:38:08', NULL),
(14, NULL, 'Kozmetik', 'kozmetik', '2021-07-09 07:38:08', '2021-07-09 07:38:08', NULL),
(15, NULL, 'Kişisel Bakım', 'kişisel-bakim', '2021-07-09 07:38:08', '2021-07-09 07:38:08', NULL),
(16, NULL, 'Giyim ve Moda', 'giyim-moda', '2021-07-09 07:38:08', '2021-07-09 07:38:08', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategori_urun`
--

CREATE TABLE `kategori_urun` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kategori_id` bigint(20) UNSIGNED NOT NULL,
  `urun_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `kategori_urun`
--

INSERT INTO `kategori_urun` (`id`, `kategori_id`, `urun_id`) VALUES
(8, 1, 31),
(9, 3, 31),
(10, 1, 34),
(11, 2, 34);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanici`
--

CREATE TABLE `kullanici` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `adsoyad` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sifre` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aktivasyon_anahtari` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aktif_mi` tinyint(1) NOT NULL DEFAULT 0,
  `yonetici_mi` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `olusturulma_tarihi` timestamp NOT NULL DEFAULT current_timestamp(),
  `guncelleme_tarihi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `silinme_tarihi` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `kullanici`
--

INSERT INTO `kullanici` (`id`, `adsoyad`, `email`, `sifre`, `aktivasyon_anahtari`, `aktif_mi`, `yonetici_mi`, `remember_token`, `olusturulma_tarihi`, `guncelleme_tarihi`, `silinme_tarihi`) VALUES
(1, 'Özkan Yüksektepe', 'ozkanyuksektepe@gmail.com', '$2y$10$vuQyhGqXWCwDtL97cgfdEetSsolrFq.MCrGwN6nSxFKx2nx2RhCzC', NULL, 1, 1, 'VwZsxehCCkHYaMExx9aEdgFCcVkAjOMpm8oz7qgvvrz3vjWBKlpScv2k82Rv', '2021-07-14 07:48:22', '2021-07-25 13:04:28', NULL),
(2, 'Pansy Will', 'ryan.tatum@example.org', '$2y$10$BR9kG1cduHeJDX.XSAnTq.SNQp5DXSUdDstgauHDwTYuo8sQsEHLO', NULL, 1, 0, NULL, '2021-07-14 07:48:22', '2021-07-14 07:48:22', NULL),
(3, 'Davon Kohler', 'maribel00@example.com', '$2y$10$vYSLlQMANALj2MUPlsOyM.lzwwVHgyKsuNBO3outtCnlrrvmSDX0m', NULL, 1, 0, NULL, '2021-07-14 07:48:22', '2021-07-14 07:48:22', NULL),
(4, 'Dr. Braeden Bogisich DVM', 'ross.schumm@example.org', '$2y$10$CMW76aWCDTHSztyAUz3DyuHAyc52j.eXa/xKD.U2nduJx.2UB.SRi', NULL, 1, 0, NULL, '2021-07-14 07:48:22', '2021-07-14 07:48:22', NULL),
(5, 'Larissa Halvorson', 'crooks.adah@example.net', '$2y$10$6mPjbI8.0JkZIZSAixvOg.uUzV70NoCWF7FRTvKg63cFGr6/Bko4.', NULL, 1, 0, NULL, '2021-07-14 07:48:23', '2021-07-14 07:48:23', NULL),
(6, 'Rowena Yundt', 'grayce.hammes@example.com', '$2y$10$CqiyOpCU4qO9U.6IbUfW.uwt/tFM.Sw3TLICxVoXJNJqqeZ3QKEUa', NULL, 1, 0, NULL, '2021-07-14 07:48:23', '2021-07-14 07:48:23', NULL),
(7, 'Dion Emmerich', 'hintz.electa@example.com', '$2y$10$Agc8BxyUnQu/IKQmSSHCEOfKpfmR6/hijUDfZcu6hUhURB3Uk9hiu', NULL, 1, 0, NULL, '2021-07-14 07:48:23', '2021-07-14 07:48:23', NULL),
(8, 'Amelie Roberts', 'wdach@example.net', '$2y$10$DC2ENu4HP9zLKZhIhL65TOJe523zSpsJ0rFMFONAykfiKyYBRq0QS', NULL, 1, 0, NULL, '2021-07-14 07:48:23', '2021-07-14 07:48:23', NULL),
(9, 'Dr. Leo Mosciski', 'nvon@example.net', '$2y$10$LL/a.tLJVkaEjPx2/fhFbej8P8AzGaQAHSKSKjLYZZYdhFypJJBdq', NULL, 1, 0, NULL, '2021-07-14 07:48:23', '2021-07-14 07:48:23', NULL),
(10, 'Mylene Farrell', 'tmonahan@example.org', '$2y$10$kdvXeRJp1WmYGsfAXTDUOulIoduv8HqPDVllnZP3I3KbuUhVGRdde', NULL, 1, 0, NULL, '2021-07-14 07:48:23', '2021-07-14 07:48:23', NULL),
(11, 'Mr. Judah Feest', 'kaycee.turcotte@example.net', '$2y$10$L1JyDfFutaq3CAuDaKK/4OfEzuu44fn1Ul/a.BOFdYcad2giMBkNW', NULL, 1, 0, NULL, '2021-07-14 07:48:23', '2021-07-14 07:48:23', NULL),
(12, 'Dr. Carolyne Blick DVM', 'anibal.gerhold@example.org', '$2y$10$feBEkh6tbRO99XPIjxOVJ.RZ6ayDYzI8Kiz/USz4ke3LoPeGEB1dC', NULL, 1, 0, NULL, '2021-07-14 07:48:23', '2021-07-14 07:48:23', NULL),
(13, 'Dock Harvey III', 'vsimonis@example.net', '$2y$10$Gj0K8lKGb1Jd9JFfBgeWI.C0M5ISuCElkdAY3OGrwcVfg8ciTDFwu', NULL, 1, 0, NULL, '2021-07-14 07:48:23', '2021-07-14 07:48:23', NULL),
(14, 'Zane Donnelly', 'shaina.halvorson@example.org', '$2y$10$o296ZMZqO18cJ4cWNVRH4.ZLqMihpBSncrU4ouA6qz5ulkFeLNXoi', NULL, 1, 0, NULL, '2021-07-14 07:48:23', '2021-07-14 07:48:23', NULL),
(15, 'Dr. Ericka Will V', 'janis02@example.com', '$2y$10$bQiV4tm0k1u4Sep/N6LHy.jjQOHSJzYTeCoruwDMmcdbGFHwLmU0.', NULL, 1, 0, NULL, '2021-07-14 07:48:23', '2021-07-14 07:48:23', NULL),
(16, 'Brenda Kiehn', 'ceasar72@example.net', '$2y$10$h7fBJNXGWYlc0i16/nEczuqC0RAzSyNbWRaGtkr3t.a8j705HuGqi', NULL, 1, 0, NULL, '2021-07-14 07:48:23', '2021-07-14 07:48:23', NULL),
(17, 'Gavin Morissette', 'delpha.hettinger@example.com', '$2y$10$AzqnMTa99suft0Rornls1e7q6t/eT/87/B3vcdn6rIrA8LQCCGJku', NULL, 1, 0, NULL, '2021-07-14 07:48:24', '2021-07-14 07:48:24', NULL),
(18, 'Ulices Fisher', 'monte.ebert@example.org', '$2y$10$wmQea6zG/NoW/hHP/wb0cO0StixMaScAX9b6RMMXO0nGqbJjBCrwy', NULL, 1, 0, NULL, '2021-07-14 07:48:24', '2021-07-14 07:48:24', NULL),
(19, 'Keven West', 'willis27@example.com', '$2y$10$Re3SvTx0hUWIuqT/XjgOI.FxI9bZZkNHx8tKfg57RLmfBac4UwD0e', NULL, 1, 0, NULL, '2021-07-14 07:48:24', '2021-07-14 07:48:24', NULL),
(20, 'Prof. Seth Nikolaus', 'lilyan74@example.org', '$2y$10$DFCI9MI3ZfpAOYppzJsJRuPs647TgM/TrI93xwv9Z6DGC7bCRzXBm', NULL, 1, 0, NULL, '2021-07-14 07:48:24', '2021-07-14 07:48:24', NULL),
(21, 'Tatyana Koepp V', 'eula.hartmann@example.org', '$2y$10$/v6Nl73HHNy9RykhwqGdJuNdPs6Yl98NACNT4yq/YGYNdSbwBHUIG', NULL, 1, 0, NULL, '2021-07-14 07:48:24', '2021-07-14 07:48:24', NULL),
(22, 'Shawna Schowalter', 'leif.balistreri@example.net', '$2y$10$hGq3tkzxn3qawp3ZR1N1Ru9HSkh29E8f1XGCPG3v07bTCtYzKLhPi', NULL, 1, 0, NULL, '2021-07-14 07:48:24', '2021-07-14 07:48:24', NULL),
(23, 'Jessy Schowalter Sr.', 'schowalter.kasey@example.com', '$2y$10$Ws3bHdkYfgEpsDGGrcB5d.GedJMfPigGl5uPeGT9ZfNBJ3.WI3SzG', NULL, 1, 0, NULL, '2021-07-14 07:48:24', '2021-07-14 07:48:24', NULL),
(24, 'Winfield Hettinger', 'keyshawn63@example.net', '$2y$10$DJhwAyJQHKjucSpRWsfsMOiMHYtCXUtaS8fDauBP5zjf0NZoKv3Yq', NULL, 1, 0, NULL, '2021-07-14 07:48:24', '2021-07-14 07:48:24', NULL),
(25, 'Santos Grady', 'bud52@example.org', '$2y$10$j1R.zQYLrzi09mdrZxUWpOQnRqg9SHAUeDnDllImDD87qzfFgCbUG', NULL, 1, 0, NULL, '2021-07-14 07:48:24', '2021-07-14 07:48:24', NULL),
(26, 'Lela Kulas', 'verona.steuber@example.net', '$2y$10$bwushQ9b0Yoj0ff.uSX6L.VC8Yf2WKGitBBZYT9WonJGLuo4Fxkye', NULL, 1, 0, NULL, '2021-07-14 07:48:24', '2021-07-14 07:48:24', NULL),
(27, 'Eldred Bahringer III', 'romaguera.braxton@example.org', '$2y$10$xMe4mbuTSYQPih9Bein/0eyh/MepEKbeIbJzcybg02t0cWN1cEq0a', NULL, 1, 0, NULL, '2021-07-14 07:48:24', '2021-07-14 07:48:24', NULL),
(28, 'Hugh Lindgren', 'robin32@example.org', '$2y$10$9FlyGtr.W0GQoUgGKnv/Pe4W692/de7V2QEpO/KahS2/BEkRiniL2', NULL, 1, 0, NULL, '2021-07-14 07:48:25', '2021-07-14 07:48:25', NULL),
(29, 'Reinhold Powlowski', 'nienow.lelah@example.net', '$2y$10$z/ObHy/Cgh6wlZvQypuKNusONTZAm22tFlJUomilPwUZsgAj8Z7bm', NULL, 1, 0, NULL, '2021-07-14 07:48:25', '2021-07-14 07:48:25', NULL),
(30, 'Clare Sauer II', 'jacquelyn.bartell@example.net', '$2y$10$ICHzX42CcUlwRWcvI/e0rOt49Oa3FCEiWESGzODzUieTNTLiEsu8C', NULL, 1, 0, NULL, '2021-07-14 07:48:25', '2021-07-14 07:48:25', NULL),
(31, 'Harmony Rolfson', 'krajcik.sigrid@example.net', '$2y$10$42kY5xdJNaCLPv3fn3AHneElHjECNwkcfwXOHoCDHHvnlpYp6pKSu', NULL, 1, 0, NULL, '2021-07-14 07:48:25', '2021-07-14 07:48:25', NULL),
(32, 'Dr. Jettie Rutherford II', 'ivy.oconner@example.net', '$2y$10$xNIsqK0yTIqkTBe4u2Q7kO.O5OUE21JyoJLugj3hFzlJ.Yjsx9J0C', NULL, 1, 0, NULL, '2021-07-14 07:48:25', '2021-07-14 07:48:25', NULL),
(33, 'Blanca Terry', 'shalvorson@example.com', '$2y$10$.JW.KfjcZe0RZehRi1/OcO24Gd.z8lzzbXY/wQeZmrkIP0VCvAWgu', NULL, 1, 0, NULL, '2021-07-14 07:48:25', '2021-07-14 07:48:25', NULL),
(34, 'Garrison Langworth', 'manuel.doyle@example.com', '$2y$10$vYy7HO5G0yianTArIskngOuOBVS4DjoyY/ENTIdcXs7IdQ8GeNRZ6', NULL, 1, 0, NULL, '2021-07-14 07:48:25', '2021-07-14 07:48:25', NULL),
(35, 'Miss Sabina Zulauf II', 'tgutkowski@example.org', '$2y$10$goGzac9iemUM9cLqRjXaTuJYvLTM6V.Dlf8A0t4XiJbqXknZq80kq', NULL, 1, 0, NULL, '2021-07-14 07:48:25', '2021-07-14 07:48:25', NULL),
(36, 'Xzavier Stamm DVM', 'whayes@example.net', '$2y$10$Q5apGtqdt9af/yt2/KOe4.slcX0Eas3pOW3/Gp5F9txGel/LqrOd.', NULL, 1, 0, NULL, '2021-07-14 07:48:25', '2021-07-14 07:48:25', NULL),
(37, 'Dandre Hessel MD', 'alice.gislason@example.com', '$2y$10$FJc9IxqxXbAU7INwV2KBB.TEfuBtKty3njgxdluBxyWbpAYZOcZtC', NULL, 1, 0, NULL, '2021-07-14 07:48:25', '2021-07-14 07:48:25', NULL),
(38, 'Gwen Flatley IV', 'cummerata.asa@example.com', '$2y$10$fPpU4Bd9RnuALC7Oh13GZOAA6bnKawcfQx1MS6S594Gm7cdZ/6gHi', NULL, 1, 0, NULL, '2021-07-14 07:48:25', '2021-07-14 07:48:25', NULL),
(39, 'Rowan Wehner', 'jaylin90@example.net', '$2y$10$vmu2UV0WGSrHm4h7dvag1eysXX4Y12L7ZfvJbC.6gF7gZ0Wgqk.jO', NULL, 1, 0, NULL, '2021-07-14 07:48:25', '2021-07-14 07:48:25', NULL),
(40, 'Maryjane Nikolaus', 'bnader@example.net', '$2y$10$YLPSym4UojuVYGaHh1CMV.LWjJCmJuwYheEN7TEx5PSdBHbWlRIvq', NULL, 1, 0, NULL, '2021-07-14 07:48:26', '2021-07-14 07:48:26', NULL),
(41, 'Prof. Zackery Hayes PhD', 'trisha11@example.com', '$2y$10$1oYMwZIPzcCRfI870qdMse.8x8hXlpOEMDuVUNWwytGA9Y25su1Tu', NULL, 1, 0, NULL, '2021-07-14 07:48:26', '2021-07-14 07:48:26', NULL),
(42, 'Ari O\'Reilly', 'lkulas@example.org', '$2y$10$42Dw/aWH8m99fC34DkEfPe1RVnvQs3cLoLnAPyTg2IAZEiDXNGSXW', NULL, 1, 0, NULL, '2021-07-14 07:48:26', '2021-07-14 07:48:26', NULL),
(43, 'Johann Abernathy III', 'carolina40@example.net', '$2y$10$yHI/U7/Kr8qGF5gdblMJ4uCBcgYPqcOAyoHrdWofSep1t0OAMEdju', NULL, 1, 0, NULL, '2021-07-14 07:48:26', '2021-07-14 07:48:26', NULL),
(44, 'Prof. Emilie Walter', 'harber.allan@example.net', '$2y$10$olO7dJQpzqCVjg6q5VC4EelkamEqPMtkCI6LRMofMgO6.45vjdgLq', NULL, 1, 0, NULL, '2021-07-14 07:48:26', '2021-07-14 07:48:26', NULL),
(45, 'Nedra Lynch', 'pagac.cruz@example.net', '$2y$10$Q6DRql1BaFOQnHapFVeuoeblQhW2NKRK5zHg3wWMVKgynEtdajYfS', NULL, 1, 0, NULL, '2021-07-14 07:48:26', '2021-07-14 07:48:26', NULL),
(46, 'Justice Hickle', 'witting.colleen@example.net', '$2y$10$i2l/Cl2W.aNq8UtpljAXx.oGlHo9Em.pqEyTuy9L0XxvNkGONXg76', NULL, 1, 0, NULL, '2021-07-14 07:48:26', '2021-07-14 07:48:26', NULL),
(47, 'Abbey Beier', 'johns.yasmeen@example.com', '$2y$10$RsFA0neHWYzxvStaz5nI.etn7eYsFYiRUB0Mt..mP/VD7L8ce0BNe', NULL, 1, 0, NULL, '2021-07-14 07:48:26', '2021-07-14 07:48:26', NULL),
(48, 'Hettie Hahn', 'bernardo75@example.net', '$2y$10$JsXr3fujCc1551Kt9cJ7mulMN3a3CVWZCy4.SJlCR6z/c5C9uimJm', NULL, 1, 0, NULL, '2021-07-14 07:48:26', '2021-07-14 07:48:26', NULL),
(49, 'Jaida Langworth', 'sadie.gaylord@example.org', '$2y$10$Js0q2jNeuQGaigY9a4gbCeiJGSBSwxPa7K3N289tl5cpPsYyUBf4a', NULL, 1, 0, NULL, '2021-07-14 07:48:27', '2021-07-14 07:48:27', NULL),
(50, 'Will Schowalter', 'keith.koch@example.net', '$2y$10$7gUFPEzeSt/JJTuv1GLiDu7A9AHrCjfN31JHtE70muFlXBr54neQO', NULL, 1, 0, NULL, '2021-07-14 07:48:27', '2021-07-14 07:48:27', NULL),
(51, 'Darron D\'Amore', 'naomie.rolfson@example.net', '$2y$10$D8ThHJILD4QrEzYq34sguuNlYZcoNcNlahvsVaFgYFBTZeLpA6ub2', NULL, 1, 0, NULL, '2021-07-14 07:48:27', '2021-07-14 07:48:27', NULL),
(52, 'Nursena Yüksektepe', 'nunuykp@gmail.com', '$2y$10$Ok4ve0B/5GoSjJFCcicHD.ls3wEuicJwgcEEoj901Cg1vRgP4BDTq', 'aBPaJjW3EtL1IdRgaV3rvseuApz8puy2rUg7d8XUwtm4mMquJSJSzqnpAHKN', 0, 0, NULL, '2021-07-23 07:17:42', '2021-07-23 07:17:42', NULL),
(53, 'Mahmut Yüksek', 'rizelii@gmail.com', '$2y$10$2sOjCTtEPELBW2ratsHxdeHuVaMqEnPgvm5p7lYyDJNgQbiUXfX..', 'Ej114DeNrFmuCLCPR9n2VndVJCW4qtIZv0W9XfE32gn4GIEjyKhcBSTdZoOA', 0, 0, NULL, '2021-08-20 08:18:03', '2021-08-20 08:18:03', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanici_detay`
--

CREATE TABLE `kullanici_detay` (
  `id` int(10) UNSIGNED NOT NULL,
  `kullanici_id` bigint(20) UNSIGNED NOT NULL,
  `adres` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefon` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ceptelefonu` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `kullanici_detay`
--

INSERT INTO `kullanici_detay` (`id`, `kullanici_id`, `adres`, `telefon`, `ceptelefonu`) VALUES
(1, 1, 'Rize', '(556)554522', '(535)978 91 23'),
(2, 2, '523 Little Crossroad Apt. 962\nMaidachester, KY 62305', '+15864511970', '+14011483653'),
(3, 3, '624 Bogisich Turnpike Suite 503\nLakinbury, KS 56736', '+13203501391', '+16617000938'),
(4, 4, '3068 Schneider Brook Suite 915\nLake Kylechester, CO 86491', '+13419616544', '+14402782437'),
(5, 5, '978 Anastasia Park\nEast Evan, DC 85505', '+16579684519', '+15138824841'),
(6, 6, '9697 Johann Union\nHartmannmouth, CO 41223-5179', '+13377279561', '+12620726235'),
(7, 7, '96150 Luisa Locks Apt. 036\nSwifttown, RI 36947', '+12400658689', '+15513941350'),
(8, 8, '254 Sandy Burg\nSouth Raeganton, PA 03806-0618', '+16677344643', '+19415260688'),
(9, 9, '38067 Lakin Corners\nNorth Vivien, IL 12624-9355', '+16786483617', '+18584669313'),
(10, 10, '28105 Casper Cape\nNew Robin, SC 87513-0276', '+18708215483', '+18389409472'),
(11, 11, '7417 Swift Lake Apt. 230\nEast Ebbaburgh, RI 45190-4568', '+16285348840', '+12690573265'),
(12, 12, '215 Yessenia Meadow\nNew Romaine, ND 79825-1481', '+17542951999', '+18438839029'),
(13, 13, '176 Dietrich Hill Apt. 334\nAnselside, VA 13829', '+16516075610', '+19894960598'),
(14, 14, '300 Treutel Crossroad Suite 622\nHowellberg, NC 87523-5284', '+16670842697', '+19561239314'),
(15, 15, '407 Nora Port Apt. 289\nJaquelinefurt, WV 92751-9366', '+19846392984', '+12287078500'),
(16, 16, '42976 Modesto Rue\nNew Waylonchester, VA 17822', '+12193934149', '+13855461888'),
(17, 17, '89949 Lueilwitz Walk Apt. 435\nKeelingmouth, WA 39171', '+18725316006', '+14237686877'),
(18, 18, '611 Lisette Camp Apt. 130\nWest Edwinburgh, WY 59221-2942', '+18726447354', '+14437351484'),
(19, 19, '72660 Emerald Centers\nEast Katarina, IL 68394', '+13612047185', '+16519713773'),
(20, 20, '7272 Hugh Summit Suite 792\nNorth Dudley, CA 46037', '+14130406649', '+15303779999'),
(21, 21, '1079 Stracke Loop Apt. 558\nMaevebury, OK 49895', '+18388337810', '+17439249654'),
(22, 22, '677 Prohaska Loaf\nMedhurstside, OR 13842-7828', '+15343900918', '+16146676338'),
(23, 23, '26337 Russell Pike\nAlverastad, PA 10981', '+15107581695', '+19150512630'),
(24, 24, '75702 Ziemann Branch\nBarrowsshire, CO 84795-4193', '+14237496346', '+17185066222'),
(25, 25, '511 Wehner Fields\nIsaimouth, KS 49111', '+16784117744', '+16028048381'),
(26, 26, '476 Calista Springs Apt. 643\nBennymouth, MO 45227-8091', '+14632765560', '+18281654778'),
(27, 27, '298 Schuppe Junctions\nAmparochester, MI 42334-4053', '+16303720178', '+14177454611'),
(28, 28, '70236 Bernadine Ridge\nLouchester, NM 49594-2902', '+16784096223', '+17741102793'),
(29, 29, '91099 Jacobi Fields\nEast Lizeth, RI 76347-8346', '+13477688106', '+14586513533'),
(30, 30, '9352 Krajcik Springs Apt. 057\nEast Sophiashire, CT 86690', '+17656268420', '+13097922446'),
(31, 31, '325 Thiel Crest\nSouth Lorafurt, HI 22036-5279', '+19512399451', '+12248634892'),
(32, 32, '89591 Harrison Underpass\nSouth Lamarview, VA 08877-8816', '+14586118531', '+19896753083'),
(33, 33, '848 Boyer Meadows Suite 686\nLemkemouth, OR 01317', '+14252300330', '+17202626260'),
(34, 34, '4124 Runte Place\nStreichview, IL 59610', '+16312469209', '+18323519417'),
(35, 35, '74615 Blaze Well Suite 006\nEast Gregoryborough, MS 86853-3839', '+17274821905', '+17855827499'),
(36, 36, '3738 VonRueden Junctions Apt. 060\nNorth Brett, OH 81275-4166', '+14420758541', '+19145456097'),
(37, 37, '50021 Mallie Orchard Suite 340\nBechtelarburgh, NH 99466', '+15409610217', '+12693532585'),
(38, 38, '8028 Donnelly Plains\nNorth Olga, HI 68342-5569', '+15201064467', '+17076305440'),
(39, 39, '166 VonRueden Village Suite 039\nEast Maximochester, NM 33436', '+15807869563', '+19517051653'),
(40, 40, '103 Ewald Branch\nPort Aletha, SC 16263-4301', '+17701117006', '+12097092113'),
(41, 41, '78155 Goyette Track Apt. 572\nPfannerstillberg, NY 24687-8310', '+14326644853', '+17798555874'),
(42, 42, '27258 Easter Estate Suite 776\nEast Brodymouth, NM 42453-7998', '+13865661621', '+14434990160'),
(43, 43, '78243 Furman Stream\nKirlinland, NY 07132-3466', '+12482860538', '+17548425077'),
(44, 44, '14089 Denesik Club\nKayleighborough, NM 82195-6700', '+13202548537', '+15717228841'),
(45, 45, '3934 Katelin Vista\nSouth Brandy, WA 40252', '+17376697131', '+16814259265'),
(46, 46, '16893 O\'Connell Freeway Suite 376\nLake Nonamouth, IA 40586', '+16512278268', '+19063505444'),
(47, 47, '94141 Langworth Gateway Suite 019\nSchoenhaven, ID 96545', '+19411936667', '+12546613576'),
(48, 48, '78749 Victoria Haven Apt. 962\nO\'Harafurt, WV 56440', '+12767331150', '+19738962745'),
(49, 49, '992 Smitham Common\nNorth Brettborough, DE 55437-6996', '+12677910051', '+18066174403'),
(50, 50, '655 Cronin Crossroad Apt. 687\nNew Yesenia, AZ 12929', '+17852023580', '+18607072278'),
(51, 51, '7875 Frieda Brook Apt. 287\nDooleyshire, KS 78226-3539', '+12622182249', '+15864781059'),
(52, 52, NULL, NULL, NULL),
(53, 53, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2021_06_03_062930_create_kategori_table', 1),
(2, '2021_06_04_064826_create_urun_table', 1),
(3, '2021_06_04_071044_kategori_urun_table', 1),
(4, '2021_06_18_131529_urun_detay_table', 1),
(5, '2021_06_19_111920_create_kullanici_table', 1),
(6, '2021_07_02_063957_create_sepet_table', 1),
(7, '2021_07_02_070025_sepeturun_table', 1),
(8, '2021_07_06_090216_create_siparis_table', 1),
(9, '2021_07_06_091459_create_kullanici_detay_table', 1),
(10, '2021_07_28_095226_ayar_table', 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sepet`
--

CREATE TABLE `sepet` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kullanici_id` bigint(20) UNSIGNED NOT NULL,
  `olusturulma_tarihi` timestamp NOT NULL DEFAULT current_timestamp(),
  `guncelleme_tarihi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `silinme_tarihi` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `sepet`
--

INSERT INTO `sepet` (`id`, `kullanici_id`, `olusturulma_tarihi`, `guncelleme_tarihi`, `silinme_tarihi`) VALUES
(3, 1, '2021-07-14 07:56:17', '2021-07-14 07:56:17', NULL),
(4, 1, '2021-07-23 06:13:48', '2021-07-23 06:13:48', NULL),
(5, 1, '2021-07-23 06:58:37', '2021-07-23 06:58:37', NULL),
(6, 1, '2021-07-23 07:05:28', '2021-07-23 07:05:28', NULL),
(7, 52, '2021-07-23 07:17:52', '2021-07-23 07:17:52', NULL),
(8, 1, '2021-07-23 08:07:01', '2021-07-23 08:07:01', NULL),
(9, 53, '2021-08-20 08:18:23', '2021-08-20 08:18:23', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sepeturun`
--

CREATE TABLE `sepeturun` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sepet_id` bigint(20) UNSIGNED NOT NULL,
  `urun_id` bigint(20) UNSIGNED NOT NULL,
  `adet` int(11) NOT NULL,
  `fiyati` decimal(12,4) NOT NULL,
  `durum` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `olusturulma_tarihi` timestamp NOT NULL DEFAULT current_timestamp(),
  `guncelleme_tarihi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `silinme_tarihi` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `sepeturun`
--

INSERT INTO `sepeturun` (`id`, `sepet_id`, `urun_id`, `adet`, `fiyati`, `durum`, `olusturulma_tarihi`, `guncelleme_tarihi`, `silinme_tarihi`) VALUES
(1, 4, 34, 2, '4000.0000', 'Beklemede', '2021-07-23 06:20:17', '2021-07-23 06:20:17', NULL),
(2, 4, 4, 1, '19.2900', 'Beklemede', '2021-07-23 06:20:37', '2021-07-23 06:20:37', NULL),
(3, 4, 3, 1, '2.3660', 'Beklemede', '2021-07-23 06:44:18', '2021-07-23 06:44:18', NULL),
(4, 4, 1, 1, '16.1270', 'Beklemede', '2021-07-23 06:44:29', '2021-07-23 06:44:29', NULL),
(5, 4, 31, 2, '3500.0000', 'Beklemede', '2021-07-23 06:51:25', '2021-07-23 06:51:25', NULL),
(6, 5, 31, 2, '3500.0000', 'Beklemede', '2021-07-23 06:58:38', '2021-07-23 06:59:18', NULL),
(7, 5, 4, 1, '19.2900', 'Beklemede', '2021-07-23 06:58:46', '2021-07-23 06:58:46', NULL),
(8, 5, 34, 1, '4000.0000', 'Beklemede', '2021-07-23 06:58:56', '2021-07-23 06:58:56', NULL),
(9, 5, 30, 1, '16.4040', 'Beklemede', '2021-07-23 06:59:04', '2021-07-23 06:59:04', NULL),
(10, 6, 34, 1, '4000.0000', 'Beklemede', '2021-07-23 07:05:28', '2021-07-23 07:05:28', NULL),
(11, 6, 31, 1, '3500.0000', 'Beklemede', '2021-07-23 07:05:33', '2021-07-23 07:05:33', NULL),
(12, 7, 34, 2, '4000.0000', 'Beklemede', '2021-07-23 07:17:52', '2021-07-23 07:18:09', NULL),
(13, 7, 31, 2, '3500.0000', 'Beklemede', '2021-07-23 07:17:58', '2021-07-23 07:18:12', NULL),
(14, 7, 3, 1, '2.3660', 'Beklemede', '2021-07-23 07:18:02', '2021-07-23 07:18:02', NULL),
(15, 7, 4, 1, '19.2900', 'Beklemede', '2021-07-23 07:18:06', '2021-07-23 07:18:06', NULL),
(16, 8, 3, 1, '2.3660', 'Beklemede', '2021-07-23 08:07:01', '2021-07-23 08:07:01', NULL),
(17, 8, 34, 1, '4000.0000', 'Beklemede', '2021-07-23 08:07:05', '2021-07-23 08:07:05', NULL),
(18, 8, 5, 1, '5.2860', 'Beklemede', '2021-07-23 08:07:08', '2021-07-23 08:07:08', NULL),
(19, 8, 31, 1, '3500.0000', 'Beklemede', '2021-07-23 08:07:12', '2021-07-23 08:07:12', NULL),
(20, 8, 30, 1, '16.4040', 'Beklemede', '2021-07-23 08:07:16', '2021-07-23 08:07:16', NULL),
(21, 9, 34, 1, '4000.0000', 'Beklemede', '2021-08-20 08:18:23', '2021-08-20 08:18:23', NULL),
(22, 9, 31, 1, '3500.0000', 'Beklemede', '2021-08-20 08:18:52', '2021-08-20 08:18:52', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `siparis`
--

CREATE TABLE `siparis` (
  `id` int(10) UNSIGNED NOT NULL,
  `sepet_id` bigint(20) UNSIGNED NOT NULL,
  `siparis_tutari` decimal(12,4) NOT NULL,
  `durum` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adsoyad` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adres` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefon` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ceptelefonu` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banka` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `taksit_sayisi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `olusturulma_tarihi` timestamp NOT NULL DEFAULT current_timestamp(),
  `guncelleme_tarihi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `silinme_tarihi` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `siparis`
--

INSERT INTO `siparis` (`id`, `sepet_id`, `siparis_tutari`, `durum`, `adsoyad`, `adres`, `telefon`, `ceptelefonu`, `banka`, `taksit_sayisi`, `olusturulma_tarihi`, `guncelleme_tarihi`, `silinme_tarihi`) VALUES
(1, 4, '7.0379', 'Siparişiniz alındı', 'Özkan Yüksektepe', 'İSTANBUL', '(556) 565-46-65', '(412) 241-24-11', 'Garanti', '1', '2021-07-23 06:58:12', '2021-07-23 06:58:12', NULL),
(2, 5, '11.0359', 'Sipariş Tamamlandı', 'Özkan Yüksektepe', 'rize', '(556) 565-46-65', '(458) 949-84-53', 'Garanti', '1', '2021-07-23 06:59:28', '2021-07-28 05:37:18', NULL),
(4, 7, '15.0215', 'Siparişiniz alındı', 'Nursena Yüksektepe', 'Rize', '(341) 241-12-41', '(532) 978-91-23', 'Garanti', '1', '2021-07-23 07:18:30', '2021-07-23 07:18:30', NULL),
(5, 8, '7.5244', 'Siparişiniz alındı', 'Özkan Yüksektepe', 'manisa', '(556) 565-46-65', '(412) 241-24-11', 'Garanti', '1', '2021-07-23 08:07:27', '2021-07-23 08:07:27', NULL),
(7, 6, '7.5004', 'Siparişiniz alındı', 'Özkan Yüksektepe', 'İSTANBUL', '(556) 565-46-65', '(412) 241-24-11', 'Garanti', '1', '2021-07-25 10:00:39', '2021-07-25 10:00:39', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `urun`
--

CREATE TABLE `urun` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
  `urun_adi` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aciklama` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fiyati` decimal(10,3) NOT NULL,
  `olusturulma_tarihi` timestamp NOT NULL DEFAULT current_timestamp(),
  `guncelleme_tarihi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `silinme_tarihi` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `urun`
--

INSERT INTO `urun` (`id`, `slug`, `urun_adi`, `aciklama`, `fiyati`, `olusturulma_tarihi`, `guncelleme_tarihi`, `silinme_tarihi`) VALUES
(1, 'explicabo-saepe', 'Explicabo saepe.', 'Necessitatibus velit et id aut cumque deserunt quis ipsum ut ut soluta magni architecto temporibus dolore aperiam eligendi dolores ducimus assumenda nam pariatur delectus quia quia odit.', '16.127', '2021-07-09 04:38:08', '2021-07-09 04:38:08', NULL),
(2, 'tempora-qui', 'Tempora qui.', 'Pariatur dolorem et sit praesentium autem dolore sunt sint impedit quis id repellat voluptatem quod explicabo reiciendis occaecati voluptatem quia consequatur et consequatur accusantium odio.', '19.110', '2021-07-09 04:38:08', '2021-07-09 04:38:08', NULL),
(3, 'culpa-iste-quibusdam', 'Culpa iste quibusdam.', 'Earum nostrum ut perspiciatis quae corporis dolores quaerat dolore ratione quo porro placeat.', '2.366', '2021-07-09 04:38:08', '2021-07-09 04:38:08', NULL),
(4, 'sed-reprehenderit-sequi', 'Sed reprehenderit sequi.', 'Aspernatur eos atque esse illum non rerum nihil minus eaque corrupti qui ipsa tempore quam illum quis magnam optio et impedit aut officiis voluptas consequatur.', '19.290', '2021-07-09 04:38:08', '2021-07-09 04:38:08', NULL),
(5, 'aperiam-et', 'Aperiam et.', 'Qui veritatis maiores quam qui ipsum autem magnam voluptas quis odit eos et qui unde facere est dolorem et aspernatur reprehenderit excepturi non eos.', '5.286', '2021-07-09 04:38:08', '2021-07-09 04:38:08', NULL),
(6, 'minima-libero-neque', 'Minima libero neque.', 'Accusantium deserunt non adipisci possimus quibusdam qui autem harum ducimus aut harum error sit maxime.', '9.607', '2021-07-09 04:38:08', '2021-07-09 04:38:08', NULL),
(7, 'mollitia-laboriosam-ut', 'Mollitia laboriosam ut.', 'Minus enim dolore quia qui aut aut quae tenetur et vero corporis voluptates laborum.', '17.313', '2021-07-09 04:38:08', '2021-07-09 04:38:08', NULL),
(8, 'et-aut-excepturi', 'Et aut excepturi.', 'Quibusdam dolorum sunt non qui labore sequi omnis molestiae aliquid quisquam reprehenderit consectetur tenetur numquam dignissimos.', '5.542', '2021-07-09 04:38:08', '2021-07-09 04:38:08', NULL),
(9, 'facere-aspernatur', 'Facere aspernatur.', 'Beatae facere repudiandae vero voluptatem et velit enim non sed non error est consequatur atque voluptate consectetur dolore in sunt delectus magnam aut incidunt.', '18.303', '2021-07-09 04:38:08', '2021-07-09 04:38:08', NULL),
(10, 'harum-dolorem-nemo', 'Harum dolorem nemo.', 'Quia cupiditate iure consequatur rerum in amet placeat ea sunt enim expedita qui consequatur voluptatibus eos saepe enim iure unde culpa doloremque eaque soluta animi enim consectetur.', '10.520', '2021-07-09 04:38:08', '2021-07-09 04:38:08', NULL),
(11, 'consectetur-illo-porro', 'Consectetur illo porro.', 'Nulla blanditiis voluptatem assumenda nisi molestiae eligendi sed est eaque sed temporibus suscipit ratione tenetur.', '14.510', '2021-07-09 04:38:08', '2021-07-09 04:38:08', NULL),
(12, 'corporis-culpa', 'Corporis culpa.', 'Nihil error maxime fugiat ea expedita fuga velit sed blanditiis voluptatem molestiae velit nobis officia quaerat sit ipsam vel veniam mollitia voluptatem sequi unde.', '14.804', '2021-07-09 04:38:08', '2021-07-09 04:38:08', NULL),
(13, 'velit-cupiditate-consequatur', 'Velit cupiditate consequatur.', 'Et ipsa hic distinctio sint corrupti eligendi expedita corrupti quaerat nesciunt non est mollitia officiis pariatur sed commodi non est occaecati molestias molestiae iure ut.', '13.280', '2021-07-09 04:38:08', '2021-07-09 04:38:08', NULL),
(14, 'omnis-aut-commodi', 'Omnis aut commodi.', 'Et qui totam voluptate assumenda autem ut ipsum voluptas repellat dolores est perspiciatis natus asperiores.', '3.554', '2021-07-09 04:38:08', '2021-07-09 04:38:08', NULL),
(15, 'sit-nisi-eveniet', 'Sit nisi eveniet.', 'Autem minima error ex et sunt et occaecati et perspiciatis dignissimos vel sint delectus dolorum repudiandae ut nihil magni et temporibus voluptas quia dolorem omnis eius.', '18.992', '2021-07-09 04:38:08', '2021-07-09 04:38:08', NULL),
(16, 'quo-aut', 'Quo aut.', 'Ut sint dolores rerum non voluptatum ratione nam id quaerat aliquam inventore et voluptas neque.', '5.248', '2021-07-09 04:38:08', '2021-07-09 04:38:08', NULL),
(17, 'recusandae-vel-sit', 'Recusandae vel sit.', 'Aspernatur voluptatem quo et molestiae tempora a a tenetur dolorum autem cupiditate rem placeat est nihil vel quae earum sapiente fuga et.', '2.139', '2021-07-09 04:38:08', '2021-07-09 04:38:08', NULL),
(18, 'consequatur-ipsum', 'Consequatur ipsum.', 'Consequuntur magnam aut reprehenderit adipisci blanditiis provident doloribus molestiae dignissimos ratione et consectetur nostrum.', '2.285', '2021-07-09 04:38:08', '2021-07-09 04:38:08', NULL),
(19, 'perferendis-ut-omnis', 'Perferendis ut omnis.', 'Quis earum sequi nisi porro consectetur soluta ab qui mollitia omnis omnis perferendis occaecati sed fugiat accusamus sequi et suscipit doloremque iure.', '10.484', '2021-07-09 04:38:08', '2021-07-09 04:38:08', NULL),
(20, 'doloremque-recusandae-ea', 'Doloremque recusandae ea.', 'Qui libero deleniti sit facere laudantium laborum in sequi ipsa quod recusandae saepe.', '14.337', '2021-07-09 04:38:08', '2021-07-09 04:38:08', NULL),
(21, 'repudiandae-iure-illum', 'Repudiandae iure illum.', 'Ut enim similique expedita voluptatem quas ea non veniam dolore sed voluptatibus in nesciunt nam et assumenda sunt ipsam.', '7.390', '2021-07-09 04:38:08', '2021-07-09 04:38:08', NULL),
(22, 'autem-nostrum', 'Autem nostrum.', 'Et distinctio unde suscipit dolores aliquam nobis doloremque atque modi dolorem dolor quis labore et repudiandae similique sapiente corrupti et qui accusantium voluptas.', '11.293', '2021-07-09 04:38:08', '2021-07-09 04:38:08', NULL),
(23, 'consequatur-id-reprehenderit', 'Consequatur id reprehenderit.', 'Et voluptatem praesentium quae eius deserunt provident voluptate ut id illum odit quibusdam accusantium voluptatibus nihil cumque aspernatur aut fugiat qui quo.', '19.660', '2021-07-09 04:38:08', '2021-07-09 04:38:08', NULL),
(24, 'quae-quam-occaecati', 'Quae quam occaecati.', 'Cupiditate deserunt non placeat unde earum eos officia dolores et fugiat dicta natus sequi blanditiis eveniet tempora.', '9.728', '2021-07-09 04:38:08', '2021-07-09 04:38:08', NULL),
(25, 'officiis-eveniet-est', 'Officiis eveniet est.', 'Veritatis cupiditate consequuntur quasi totam ratione distinctio at neque et animi consectetur voluptatem quas iure.', '11.326', '2021-07-09 04:38:08', '2021-07-09 04:38:08', NULL),
(26, 'dolores-aut-et', 'Dolores aut et.', 'Accusantium debitis nobis porro quia blanditiis consectetur nobis quia harum maiores porro praesentium voluptas commodi quidem id architecto dolorum qui nulla quas ipsa ut quo voluptas.', '15.913', '2021-07-09 04:38:08', '2021-07-09 04:38:08', NULL),
(27, 'voluptatem-consequuntur', 'Voluptatem consequuntur.', 'Aspernatur et atque ut quas dolor et similique fugiat cum amet et commodi expedita voluptas ratione beatae voluptas saepe.', '16.920', '2021-07-09 04:38:08', '2021-07-09 04:38:08', NULL),
(28, 'odio-enim', 'Odio enim.', 'Reprehenderit consequuntur optio nulla occaecati consequatur est dolor autem ea illum tempore harum repellat ut similique ipsam sit nisi incidunt cumque qui maiores sed.', '7.935', '2021-07-09 04:38:08', '2021-07-09 04:38:08', NULL),
(29, 'eius-officiis-reprehenderit', 'Eius officiis reprehenderit.', 'Aliquid omnis eos adipisci voluptatem architecto illo voluptatem aut in voluptatibus nemo vero.', '19.018', '2021-07-09 04:38:08', '2021-07-09 04:38:08', NULL),
(30, 'placeat-iste', 'Placeat iste.', 'Placeat iste.', '16.404', '2021-07-09 04:38:08', '2021-07-22 04:04:21', NULL),
(31, 'xiaomi-redmi-note-9-pro', 'Xiaomi Redmi Note 9 Pro', 'Telefon', '3500.000', '2021-07-22 04:08:29', '2021-07-22 06:01:50', NULL),
(34, 'xbox-series-s', 'Xbox Series S', 'Konsol', '4000.000', '2021-07-22 05:55:57', '2021-07-22 05:55:57', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `urun_detay`
--

CREATE TABLE `urun_detay` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `urun_id` bigint(20) UNSIGNED NOT NULL,
  `goster_slider` tinyint(1) NOT NULL DEFAULT 0,
  `goster_gunun_firsati` tinyint(1) NOT NULL DEFAULT 0,
  `goster_one_cikan` tinyint(1) NOT NULL DEFAULT 0,
  `goster_cok_satan` tinyint(1) NOT NULL DEFAULT 0,
  `goster_indirimli` tinyint(1) NOT NULL DEFAULT 0,
  `urun_resmi` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `urun_detay`
--

INSERT INTO `urun_detay` (`id`, `urun_id`, `goster_slider`, `goster_gunun_firsati`, `goster_one_cikan`, `goster_cok_satan`, `goster_indirimli`, `urun_resmi`) VALUES
(1, 1, 0, 0, 0, 1, 1, NULL),
(2, 2, 1, 1, 0, 1, 1, NULL),
(3, 3, 1, 1, 1, 1, 0, NULL),
(4, 4, 1, 1, 1, 1, 1, NULL),
(5, 5, 0, 0, 1, 1, 1, NULL),
(6, 6, 1, 0, 0, 1, 0, NULL),
(7, 7, 1, 1, 0, 0, 0, NULL),
(8, 8, 0, 1, 1, 0, 1, NULL),
(9, 9, 1, 1, 0, 0, 0, NULL),
(10, 10, 1, 0, 1, 1, 0, NULL),
(11, 11, 1, 0, 1, 1, 0, NULL),
(12, 12, 0, 1, 0, 0, 0, NULL),
(13, 13, 1, 0, 0, 0, 1, NULL),
(14, 14, 0, 0, 0, 0, 0, NULL),
(15, 15, 1, 1, 0, 0, 1, NULL),
(16, 16, 1, 0, 1, 1, 1, NULL),
(17, 17, 0, 1, 0, 1, 0, NULL),
(18, 18, 0, 0, 0, 0, 0, NULL),
(19, 19, 0, 1, 0, 1, 0, NULL),
(20, 20, 0, 1, 1, 1, 0, NULL),
(21, 21, 1, 0, 1, 0, 0, NULL),
(22, 22, 0, 1, 1, 1, 1, NULL),
(23, 23, 1, 1, 1, 1, 1, NULL),
(24, 24, 0, 0, 0, 0, 1, NULL),
(25, 25, 0, 1, 0, 0, 1, NULL),
(26, 26, 0, 0, 1, 0, 1, NULL),
(27, 27, 0, 0, 0, 1, 0, NULL),
(28, 28, 0, 1, 0, 0, 1, NULL),
(29, 29, 0, 1, 0, 0, 0, NULL),
(30, 30, 1, 0, 0, 1, 1, NULL),
(31, 31, 0, 1, 0, 1, 1, '31.1626944510.jpg'),
(34, 34, 1, 0, 1, 0, 0, '34.1626944157.jpg');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `ayar`
--
ALTER TABLE `ayar`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `kategori_urun`
--
ALTER TABLE `kategori_urun`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kategori_urun_kategori_id_foreign` (`kategori_id`),
  ADD KEY `kategori_urun_urun_id_foreign` (`urun_id`);

--
-- Tablo için indeksler `kullanici`
--
ALTER TABLE `kullanici`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kullanici_email_unique` (`email`);

--
-- Tablo için indeksler `kullanici_detay`
--
ALTER TABLE `kullanici_detay`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kullanici_detay_kullanici_id_foreign` (`kullanici_id`);

--
-- Tablo için indeksler `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `sepet`
--
ALTER TABLE `sepet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sepet_kullanici_id_foreign` (`kullanici_id`);

--
-- Tablo için indeksler `sepeturun`
--
ALTER TABLE `sepeturun`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sepeturun_sepet_id_foreign` (`sepet_id`),
  ADD KEY `sepeturun_urun_id_foreign` (`urun_id`);

--
-- Tablo için indeksler `siparis`
--
ALTER TABLE `siparis`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `siparis_sepet_id_unique` (`sepet_id`);

--
-- Tablo için indeksler `urun`
--
ALTER TABLE `urun`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `urun_detay`
--
ALTER TABLE `urun_detay`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `urun_detay_urun_id_unique` (`urun_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `ayar`
--
ALTER TABLE `ayar`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Tablo için AUTO_INCREMENT değeri `kategori_urun`
--
ALTER TABLE `kategori_urun`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Tablo için AUTO_INCREMENT değeri `kullanici`
--
ALTER TABLE `kullanici`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- Tablo için AUTO_INCREMENT değeri `kullanici_detay`
--
ALTER TABLE `kullanici_detay`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- Tablo için AUTO_INCREMENT değeri `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `sepet`
--
ALTER TABLE `sepet`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Tablo için AUTO_INCREMENT değeri `sepeturun`
--
ALTER TABLE `sepeturun`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Tablo için AUTO_INCREMENT değeri `siparis`
--
ALTER TABLE `siparis`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `urun`
--
ALTER TABLE `urun`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Tablo için AUTO_INCREMENT değeri `urun_detay`
--
ALTER TABLE `urun_detay`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `kategori_urun`
--
ALTER TABLE `kategori_urun`
  ADD CONSTRAINT `kategori_urun_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kategori_urun_urun_id_foreign` FOREIGN KEY (`urun_id`) REFERENCES `urun` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `kullanici_detay`
--
ALTER TABLE `kullanici_detay`
  ADD CONSTRAINT `kullanici_detay_kullanici_id_foreign` FOREIGN KEY (`kullanici_id`) REFERENCES `kullanici` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `sepet`
--
ALTER TABLE `sepet`
  ADD CONSTRAINT `sepet_kullanici_id_foreign` FOREIGN KEY (`kullanici_id`) REFERENCES `kullanici` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `sepeturun`
--
ALTER TABLE `sepeturun`
  ADD CONSTRAINT `sepeturun_sepet_id_foreign` FOREIGN KEY (`sepet_id`) REFERENCES `sepet` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sepeturun_urun_id_foreign` FOREIGN KEY (`urun_id`) REFERENCES `urun` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `siparis`
--
ALTER TABLE `siparis`
  ADD CONSTRAINT `siparis_sepet_id_foreign` FOREIGN KEY (`sepet_id`) REFERENCES `sepet` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `urun_detay`
--
ALTER TABLE `urun_detay`
  ADD CONSTRAINT `urun_detay_urun_id_foreign` FOREIGN KEY (`urun_id`) REFERENCES `urun` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
