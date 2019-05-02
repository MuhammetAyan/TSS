USE [TSSDB]
GO
ALTER TABLE [dbo].[UrunTedarikci] DROP CONSTRAINT [FK_UrunTedarikci_Urunler]
GO
ALTER TABLE [dbo].[UrunTedarikci] DROP CONSTRAINT [FK_UrunTedarikci_Tedarikci]
GO
ALTER TABLE [dbo].[Urunler] DROP CONSTRAINT [FK_Urunler_MalzemeGruplari]
GO
ALTER TABLE [dbo].[TedarikUrunleri] DROP CONSTRAINT [FK_TedarikUrunleri_Urunler]
GO
ALTER TABLE [dbo].[TedarikUrunleri] DROP CONSTRAINT [FK_TedarikUrunleri_Tedarikci]
GO
ALTER TABLE [dbo].[Sonuclar] DROP CONSTRAINT [FK_Sonuclar_Urunler]
GO
ALTER TABLE [dbo].[Sonuclar] DROP CONSTRAINT [FK_Sonuclar_Tedarikci]
GO
ALTER TABLE [dbo].[MalzemeGruplari] DROP CONSTRAINT [FK_MalzemeGruplari_MalzemeGruplari]
GO
ALTER TABLE [dbo].[MalKabul] DROP CONSTRAINT [FK_MalKabul_Urunler]
GO
ALTER TABLE [dbo].[MalKabul] DROP CONSTRAINT [FK_MalKabul_Tedarikci]
GO
ALTER TABLE [dbo].[GrupStratejiler] DROP CONSTRAINT [FK_GrupStratejiler_MalzemeGruplari]
GO
ALTER TABLE [dbo].[UrunTedarikci] DROP CONSTRAINT [DF_UrunTedarikci_TeslimatAgirlik]
GO
ALTER TABLE [dbo].[UrunTedarikci] DROP CONSTRAINT [DF_UrunTedarikci_TeslimatPuan]
GO
ALTER TABLE [dbo].[UrunTedarikci] DROP CONSTRAINT [DF_UrunTedarikci_KaliteAgirlik]
GO
ALTER TABLE [dbo].[UrunTedarikci] DROP CONSTRAINT [DF_UrunTedarikci_KalitePuan]
GO
ALTER TABLE [dbo].[UrunTedarikci] DROP CONSTRAINT [DF_UrunTedarikci_MaliyetAdet]
GO
ALTER TABLE [dbo].[UrunTedarikci] DROP CONSTRAINT [DF_UrunTedarikci_MaliyetPuan]
GO
ALTER TABLE [dbo].[UrunTedarikci] DROP CONSTRAINT [DF_UrunTedarikci_TedarikciId]
GO
ALTER TABLE [dbo].[UrunTedarikci] DROP CONSTRAINT [DF_UrunTedarikci_StokKodu]
GO
ALTER TABLE [dbo].[UrunStratejiler] DROP CONSTRAINT [DF_KriterAgirlik_MemnuniyetPuan]
GO
ALTER TABLE [dbo].[UrunStratejiler] DROP CONSTRAINT [DF_KriterAgirlik_TeslimatPuan]
GO
ALTER TABLE [dbo].[UrunStratejiler] DROP CONSTRAINT [DF_KriterAgirlik_KalitePuan]
GO
ALTER TABLE [dbo].[UrunStratejiler] DROP CONSTRAINT [DF_KriterAgirlik_MaliyetPuan]
GO
ALTER TABLE [dbo].[UrunStratejiler] DROP CONSTRAINT [DF_KriterAgirlik_StokKod]
GO
ALTER TABLE [dbo].[Urunler] DROP CONSTRAINT [DF_Urunler_DefTedId]
GO
ALTER TABLE [dbo].[Urunler] DROP CONSTRAINT [DF_Urunler_GrupId]
GO
ALTER TABLE [dbo].[Urunler] DROP CONSTRAINT [DF_Urunler_StokAdi]
GO
ALTER TABLE [dbo].[Urunler] DROP CONSTRAINT [DF_Urunler_StokKodu]
GO
ALTER TABLE [dbo].[TedarikUrunleri] DROP CONSTRAINT [DF_TedarikUrunleri_BirimFiyat]
GO
ALTER TABLE [dbo].[TedarikUrunleri] DROP CONSTRAINT [DF_TedarikUrunleri_TedarikciId]
GO
ALTER TABLE [dbo].[TedarikUrunleri] DROP CONSTRAINT [DF_TedarikUrunleri_StokKodu]
GO
ALTER TABLE [dbo].[Tedarikci] DROP CONSTRAINT [DF_Tedarikci_MemnuniyetAdedi]
GO
ALTER TABLE [dbo].[Tedarikci] DROP CONSTRAINT [DF_Tedarikci_MemnuniyetPuani]
GO
ALTER TABLE [dbo].[Tedarikci] DROP CONSTRAINT [DF_Tedarikci_TedarikciAdi]
GO
ALTER TABLE [dbo].[Sonuclar] DROP CONSTRAINT [DF_Sonuclar_AHPUyumSirasi]
GO
ALTER TABLE [dbo].[Sonuclar] DROP CONSTRAINT [DF_Sonuclar_AHPPuan]
GO
ALTER TABLE [dbo].[Sonuclar] DROP CONSTRAINT [DF_Sonuclar_TedarikciId]
GO
ALTER TABLE [dbo].[Sonuclar] DROP CONSTRAINT [DF_Sonuclar_StokKod]
GO
ALTER TABLE [dbo].[MalzemeGruplari] DROP CONSTRAINT [DF_MalzemeGruplari_UstGrupId]
GO
ALTER TABLE [dbo].[MalzemeGruplari] DROP CONSTRAINT [DF_MalzemeGruplari_GrupAdi]
GO
ALTER TABLE [dbo].[MalKabul] DROP CONSTRAINT [DF_MalKabul_Adet]
GO
ALTER TABLE [dbo].[MalKabul] DROP CONSTRAINT [DF_MalKabul_MemnuniyetPuan]
GO
ALTER TABLE [dbo].[MalKabul] DROP CONSTRAINT [DF_MalKabul_TeslimatPuan]
GO
ALTER TABLE [dbo].[MalKabul] DROP CONSTRAINT [DF_MalKabul_KalitePuan]
GO
ALTER TABLE [dbo].[MalKabul] DROP CONSTRAINT [DF_MalKabul_MaliyetPuan]
GO
ALTER TABLE [dbo].[MalKabul] DROP CONSTRAINT [DF_MalKabul_TedarikciId]
GO
ALTER TABLE [dbo].[MalKabul] DROP CONSTRAINT [DF_MalKabul_StokKodu]
GO
ALTER TABLE [dbo].[Kullanicilar] DROP CONSTRAINT [DF_Kullanicilar_Rol]
GO
ALTER TABLE [dbo].[Kullanicilar] DROP CONSTRAINT [DF_Table_1_Password]
GO
ALTER TABLE [dbo].[Kullanicilar] DROP CONSTRAINT [DF_Table_1_UserName]
GO
ALTER TABLE [dbo].[GrupStratejiler] DROP CONSTRAINT [DF_Stratejiler_MemnuniyetOrt]
GO
ALTER TABLE [dbo].[GrupStratejiler] DROP CONSTRAINT [DF_Stratejiler_TeslimatOrt]
GO
ALTER TABLE [dbo].[GrupStratejiler] DROP CONSTRAINT [DF_Stratejiler_KaliteOrt]
GO
ALTER TABLE [dbo].[GrupStratejiler] DROP CONSTRAINT [DF_Stratejiler_MaliyetOrt]
GO
ALTER TABLE [dbo].[GrupStratejiler] DROP CONSTRAINT [DF_Stratejiler_GrupId]
GO
ALTER TABLE [dbo].[Ayarlar] DROP CONSTRAINT [DF_Ayarlar_Type]
GO
ALTER TABLE [dbo].[Ayarlar] DROP CONSTRAINT [DF_Ayarlar_Anahtar]
GO
/****** Object:  Table [dbo].[UrunTedarikci]    Script Date: 2.05.2019 12:54:27 ******/
DROP TABLE [dbo].[UrunTedarikci]
GO
/****** Object:  Table [dbo].[UrunStratejiler]    Script Date: 2.05.2019 12:54:27 ******/
DROP TABLE [dbo].[UrunStratejiler]
GO
/****** Object:  Table [dbo].[Urunler]    Script Date: 2.05.2019 12:54:27 ******/
DROP TABLE [dbo].[Urunler]
GO
/****** Object:  Table [dbo].[TedarikUrunleri]    Script Date: 2.05.2019 12:54:27 ******/
DROP TABLE [dbo].[TedarikUrunleri]
GO
/****** Object:  Table [dbo].[Tedarikci]    Script Date: 2.05.2019 12:54:27 ******/
DROP TABLE [dbo].[Tedarikci]
GO
/****** Object:  Table [dbo].[Sonuclar]    Script Date: 2.05.2019 12:54:27 ******/
DROP TABLE [dbo].[Sonuclar]
GO
/****** Object:  Table [dbo].[MalzemeGruplari]    Script Date: 2.05.2019 12:54:27 ******/
DROP TABLE [dbo].[MalzemeGruplari]
GO
/****** Object:  Table [dbo].[MalKabul]    Script Date: 2.05.2019 12:54:27 ******/
DROP TABLE [dbo].[MalKabul]
GO
/****** Object:  Table [dbo].[Kullanicilar]    Script Date: 2.05.2019 12:54:27 ******/
DROP TABLE [dbo].[Kullanicilar]
GO
/****** Object:  Table [dbo].[GrupStratejiler]    Script Date: 2.05.2019 12:54:27 ******/
DROP TABLE [dbo].[GrupStratejiler]
GO
/****** Object:  Table [dbo].[Ayarlar]    Script Date: 2.05.2019 12:54:27 ******/
DROP TABLE [dbo].[Ayarlar]
GO
/****** Object:  Table [dbo].[Ayarlar]    Script Date: 2.05.2019 12:54:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ayarlar](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Anahtar] [varchar](50) NOT NULL,
	[Type] [varchar](15) NOT NULL,
	[TarihDeger] [smalldatetime] NULL,
	[FloatDeger] [float] NULL,
 CONSTRAINT [PK_Ayarlar] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GrupStratejiler]    Script Date: 2.05.2019 12:54:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GrupStratejiler](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[GrupId] [int] NOT NULL,
	[Maliyet] [float] NOT NULL,
	[Kalite] [float] NOT NULL,
	[Teslimat] [float] NOT NULL,
	[Memnuniyet] [float] NOT NULL,
 CONSTRAINT [PK_Stratejiler] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanicilar]    Script Date: 2.05.2019 12:54:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanicilar](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciAdi] [nvarchar](25) NOT NULL,
	[Sifre] [nvarchar](50) NOT NULL,
	[Rol] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_Kullanicilar] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MalKabul]    Script Date: 2.05.2019 12:54:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MalKabul](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[StokKodu] [nvarchar](10) NOT NULL,
	[TedarikciId] [int] NOT NULL,
	[MaliyetPuan] [smallint] NOT NULL,
	[KalitePuan] [smallint] NOT NULL,
	[TeslimatPuan] [smallint] NOT NULL,
	[MemnuniyetPuan] [smallint] NOT NULL,
	[Tarih] [smalldatetime] NULL,
	[Adet] [int] NOT NULL,
 CONSTRAINT [PK_MalKabul] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MalzemeGruplari]    Script Date: 2.05.2019 12:54:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MalzemeGruplari](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[GrupAdi] [varchar](25) NOT NULL,
	[UstGrupId] [int] NOT NULL,
 CONSTRAINT [PK_MalzemeGruplari] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sonuclar]    Script Date: 2.05.2019 12:54:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sonuclar](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[StokKodu] [nvarchar](10) NOT NULL,
	[TedarikciId] [int] NOT NULL,
	[AHPPuan] [float] NOT NULL,
	[AHPUyumSirasi] [smallint] NOT NULL,
 CONSTRAINT [PK_Sonuclar] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tedarikci]    Script Date: 2.05.2019 12:54:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tedarikci](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TedarikciAdi] [nvarchar](50) NULL,
	[Memnuniyet] [float] NOT NULL,
	[MemnuniyetAgirlik] [float] NOT NULL,
 CONSTRAINT [PK_Tedarikci] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TedarikUrunleri]    Script Date: 2.05.2019 12:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TedarikUrunleri](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[StokKodu] [nvarchar](10) NOT NULL,
	[TedarikciId] [int] NOT NULL,
	[BirimFiyat] [float] NOT NULL,
 CONSTRAINT [PK_TedarikUrunleri] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urunler]    Script Date: 2.05.2019 12:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urunler](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[StokKodu] [nvarchar](10) NOT NULL,
	[StokAdi] [nvarchar](90) NOT NULL,
	[GrupId] [int] NOT NULL,
	[DefTedId] [int] NOT NULL,
 CONSTRAINT [PK_Urunler] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UrunStratejiler]    Script Date: 2.05.2019 12:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UrunStratejiler](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[StokKodu] [nvarchar](10) NOT NULL,
	[MaliyetPuan] [float] NOT NULL,
	[KalitePuan] [float] NOT NULL,
	[TeslimatPuan] [float] NOT NULL,
	[MemnuniyetPuan] [float] NOT NULL,
 CONSTRAINT [PK_KriterAgirlik] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UrunTedarikci]    Script Date: 2.05.2019 12:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UrunTedarikci](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[StokKodu] [nvarchar](10) NOT NULL,
	[TedarikciId] [int] NOT NULL,
	[MaliyetPuan] [float] NOT NULL,
	[MaliyetAgirlik] [float] NOT NULL,
	[KalitePuan] [float] NOT NULL,
	[KaliteAgirlik] [float] NOT NULL,
	[TeslimatPuan] [float] NOT NULL,
	[TeslimatAgirlik] [float] NOT NULL,
 CONSTRAINT [PK_UrunTedarikci] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ayarlar] ON 

INSERT [dbo].[Ayarlar] ([id], [Anahtar], [Type], [TarihDeger], [FloatDeger]) VALUES (1, N'SonTarih', N'Tarih', CAST(N'2019-01-15T00:00:00' AS SmallDateTime), NULL)
INSERT [dbo].[Ayarlar] ([id], [Anahtar], [Type], [TarihDeger], [FloatDeger]) VALUES (2, N'MaliyetKS', N'Float', NULL, 0.1)
INSERT [dbo].[Ayarlar] ([id], [Anahtar], [Type], [TarihDeger], [FloatDeger]) VALUES (3, N'KaliteKS', N'Float', NULL, 0.5)
INSERT [dbo].[Ayarlar] ([id], [Anahtar], [Type], [TarihDeger], [FloatDeger]) VALUES (4, N'TeslimatKS', N'Float', NULL, 0.5)
INSERT [dbo].[Ayarlar] ([id], [Anahtar], [Type], [TarihDeger], [FloatDeger]) VALUES (5, N'MemnuniyetKS', N'Float', NULL, 0.5)
INSERT [dbo].[Ayarlar] ([id], [Anahtar], [Type], [TarihDeger], [FloatDeger]) VALUES (6, N'abc', N'dfg', NULL, 3.5)
SET IDENTITY_INSERT [dbo].[Ayarlar] OFF
SET IDENTITY_INSERT [dbo].[GrupStratejiler] ON 

INSERT [dbo].[GrupStratejiler] ([id], [GrupId], [Maliyet], [Kalite], [Teslimat], [Memnuniyet]) VALUES (1, 0, 30, 30, 20, 20)
INSERT [dbo].[GrupStratejiler] ([id], [GrupId], [Maliyet], [Kalite], [Teslimat], [Memnuniyet]) VALUES (2, 1, 25, 25, 25, 25)
INSERT [dbo].[GrupStratejiler] ([id], [GrupId], [Maliyet], [Kalite], [Teslimat], [Memnuniyet]) VALUES (3, 2, 25, 30, 30, 15)
INSERT [dbo].[GrupStratejiler] ([id], [GrupId], [Maliyet], [Kalite], [Teslimat], [Memnuniyet]) VALUES (4, 3, 25, 30, 30, 15)
INSERT [dbo].[GrupStratejiler] ([id], [GrupId], [Maliyet], [Kalite], [Teslimat], [Memnuniyet]) VALUES (5, 4, 25, 25, 25, 25)
INSERT [dbo].[GrupStratejiler] ([id], [GrupId], [Maliyet], [Kalite], [Teslimat], [Memnuniyet]) VALUES (8, 5, 40, 10, 25, 25)
INSERT [dbo].[GrupStratejiler] ([id], [GrupId], [Maliyet], [Kalite], [Teslimat], [Memnuniyet]) VALUES (11, 8, 25, 25, 25, 25)
INSERT [dbo].[GrupStratejiler] ([id], [GrupId], [Maliyet], [Kalite], [Teslimat], [Memnuniyet]) VALUES (12, 9, 5, 50, 20, 25)
INSERT [dbo].[GrupStratejiler] ([id], [GrupId], [Maliyet], [Kalite], [Teslimat], [Memnuniyet]) VALUES (1002, 10, 25, 20, 25, 30)
INSERT [dbo].[GrupStratejiler] ([id], [GrupId], [Maliyet], [Kalite], [Teslimat], [Memnuniyet]) VALUES (2003, 11, 30, 30, 20, 20)
SET IDENTITY_INSERT [dbo].[GrupStratejiler] OFF
SET IDENTITY_INSERT [dbo].[Kullanicilar] ON 

INSERT [dbo].[Kullanicilar] ([id], [KullaniciAdi], [Sifre], [Rol]) VALUES (6, N'Ali', N'1234', N'user')
INSERT [dbo].[Kullanicilar] ([id], [KullaniciAdi], [Sifre], [Rol]) VALUES (7, N'yunus', N'1234', N'admin')
INSERT [dbo].[Kullanicilar] ([id], [KullaniciAdi], [Sifre], [Rol]) VALUES (8, N'muhammet', N'1234', N'admin')
INSERT [dbo].[Kullanicilar] ([id], [KullaniciAdi], [Sifre], [Rol]) VALUES (1007, N'İdris', N'1234', N'admin')
INSERT [dbo].[Kullanicilar] ([id], [KullaniciAdi], [Sifre], [Rol]) VALUES (1008, N'Asım', N'1234', N'user')
SET IDENTITY_INSERT [dbo].[Kullanicilar] OFF
SET IDENTITY_INSERT [dbo].[MalKabul] ON 

INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (1, N'P01', 1, 90, 80, 100, 0, CAST(N'2019-04-20T00:00:00' AS SmallDateTime), 40)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (2, N'D001', 1, 60, 90, 90, 80, CAST(N'2019-04-18T00:00:00' AS SmallDateTime), 5)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (3, N'D001', 2, 80, 90, 50, 100, CAST(N'2019-04-18T00:00:00' AS SmallDateTime), 50)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (4, N'D001', 3, 80, 90, 90, 100, CAST(N'2019-04-12T00:00:00' AS SmallDateTime), 20)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (5, N'P01', 2, 90, 80, 50, 70, CAST(N'2019-04-20T00:00:00' AS SmallDateTime), 20)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (6, N'D001', 1, 80, 80, 80, 80, CAST(N'2019-04-18T00:00:00' AS SmallDateTime), 15)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (7, N'D001', 1, 70, 70, 90, 80, CAST(N'2019-04-18T00:00:00' AS SmallDateTime), 20)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (8, N'P01', 2, 90, 80, 50, 50, CAST(N'2019-04-21T00:00:00' AS SmallDateTime), 10)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (9, N'P01', 1, 80, 80, 60, 80, CAST(N'2019-04-15T00:00:00' AS SmallDateTime), 40)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (10, N'P01', 1, 90, 80, 50, 50, CAST(N'2019-04-10T00:00:00' AS SmallDateTime), 50)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (11, N'P01', 2, 90, 80, 50, 70, CAST(N'2019-04-14T00:00:00' AS SmallDateTime), 30)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (12, N'D001', 3, 80, 90, 90, 100, CAST(N'2019-04-12T00:00:00' AS SmallDateTime), 30)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (13, N'D001', 3, 80, 90, 90, 100, CAST(N'2019-04-12T00:00:00' AS SmallDateTime), 20)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (14, N'D001', 3, 80, 90, 90, 100, CAST(N'2019-03-12T00:00:00' AS SmallDateTime), 50)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (1077, N'D002', 3, 90, 80, 100, 0, CAST(N'2019-04-20T00:00:00' AS SmallDateTime), 40)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (1078, N'D001', 1, 70, 80, 100, 0, CAST(N'2019-04-20T00:00:00' AS SmallDateTime), 30)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (1079, N'P01', 3, 90, 80, 100, 0, CAST(N'2019-04-20T00:00:00' AS SmallDateTime), 40)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (1080, N'D001', 3, 90, 80, 100, 0, CAST(N'2019-04-20T00:00:00' AS SmallDateTime), 30)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (1081, N'D001', 3, 90, 80, 100, 0, CAST(N'2019-04-20T00:00:00' AS SmallDateTime), 40)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (1082, N'D001', 3, 90, 80, 100, 0, CAST(N'2019-04-20T00:00:00' AS SmallDateTime), 30)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (1083, N'P01', 3, 90, 80, 100, 0, CAST(N'2019-04-20T00:00:00' AS SmallDateTime), 40)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (1084, N'P01', 3, 90, 80, 100, 0, CAST(N'2019-04-20T00:00:00' AS SmallDateTime), 30)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (1085, N'D001', 3, 90, 80, 100, 0, CAST(N'2019-04-20T00:00:00' AS SmallDateTime), 40)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (1086, N'P01', 2, 90, 80, 100, 0, CAST(N'2019-04-20T00:00:00' AS SmallDateTime), 30)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (1087, N'P01', 3, 90, 80, 100, 0, CAST(N'2019-04-20T00:00:00' AS SmallDateTime), 40)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (1088, N'P01', 2, 90, 80, 100, 0, CAST(N'2019-04-20T00:00:00' AS SmallDateTime), 30)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (1089, N'D002', 3, 90, 80, 100, 0, CAST(N'2019-04-20T00:00:00' AS SmallDateTime), 40)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (1090, N'D001', 1, 70, 80, 100, 0, CAST(N'2019-04-20T00:00:00' AS SmallDateTime), 30)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (1091, N'P01', 3, 90, 80, 100, 0, CAST(N'2019-04-20T00:00:00' AS SmallDateTime), 40)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (1092, N'D001', 3, 90, 80, 100, 0, CAST(N'2019-04-20T00:00:00' AS SmallDateTime), 30)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (1093, N'D001', 3, 90, 80, 100, 100, CAST(N'2019-04-20T00:00:00' AS SmallDateTime), 40)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (1094, N'D001', 3, 90, 80, 100, 0, CAST(N'2019-04-20T00:00:00' AS SmallDateTime), 30)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (1095, N'P01', 3, 90, 80, 100, 0, CAST(N'2019-04-20T00:00:00' AS SmallDateTime), 40)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (1096, N'P01', 3, 90, 80, 100, 80, CAST(N'2019-04-20T00:00:00' AS SmallDateTime), 30)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (1097, N'D001', 3, 90, 80, 100, 0, CAST(N'2019-04-20T00:00:00' AS SmallDateTime), 40)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (1098, N'P01', 2, 90, 80, 100, 50, CAST(N'2019-04-20T00:00:00' AS SmallDateTime), 30)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (1099, N'P01', 3, 90, 80, 100, 0, CAST(N'2019-04-20T00:00:00' AS SmallDateTime), 40)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (1100, N'P01', 2, 90, 80, 100, 10, CAST(N'2019-04-20T00:00:00' AS SmallDateTime), 30)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (1101, N'D002', 3, 90, 80, 100, 0, CAST(N'2019-04-20T00:00:00' AS SmallDateTime), 40)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (1102, N'D001', 1, 70, 80, 100, 0, CAST(N'2019-04-20T00:00:00' AS SmallDateTime), 30)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (1103, N'P01', 3, 90, 80, 100, 0, CAST(N'2019-04-20T00:00:00' AS SmallDateTime), 40)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (1104, N'D001', 3, 90, 80, 100, 0, CAST(N'2019-04-20T00:00:00' AS SmallDateTime), 30)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (1105, N'D001', 3, 90, 80, 50, 50, CAST(N'2019-04-20T00:00:00' AS SmallDateTime), 40)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (1106, N'D001', 3, 90, 80, 50, 50, CAST(N'2019-04-20T00:00:00' AS SmallDateTime), 30)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (1107, N'P01', 3, 90, 80, 100, 0, CAST(N'2019-04-20T00:00:00' AS SmallDateTime), 40)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (1108, N'P01', 3, 90, 80, 100, 80, CAST(N'2019-04-20T00:00:00' AS SmallDateTime), 30)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (1109, N'D001', 3, 90, 80, 50, 50, CAST(N'2019-04-20T00:00:00' AS SmallDateTime), 40)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (1110, N'P01', 2, 90, 80, 100, 50, CAST(N'2019-04-20T00:00:00' AS SmallDateTime), 30)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (1111, N'P01', 3, 90, 80, 100, 0, CAST(N'2019-04-20T00:00:00' AS SmallDateTime), 40)
INSERT [dbo].[MalKabul] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]) VALUES (1112, N'P01', 2, 90, 80, 100, 10, CAST(N'2019-04-20T00:00:00' AS SmallDateTime), 30)
SET IDENTITY_INSERT [dbo].[MalKabul] OFF
SET IDENTITY_INSERT [dbo].[MalzemeGruplari] ON 

INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (0, N'.', 0)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (3, N'Aynakol', 0)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (1, N'Dış Lastik', 0)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (2, N'Pedal', 0)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (5, N'26Jant Lastik', 1)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (7, N'28Jant Lastik', 1)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (4, N'Sol Kol', 3)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (10, N'26x150Jant Lastik', 5)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (6, N'26x175Jant Lastik', 5)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (11, N'26x200JantLastik', 5)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (9, N'28x150Jant Lastik', 7)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (8, N'28x175Jant Lastik', 7)
SET IDENTITY_INSERT [dbo].[MalzemeGruplari] OFF
SET IDENTITY_INSERT [dbo].[Sonuclar] ON 

INSERT [dbo].[Sonuclar] ([id], [StokKodu], [TedarikciId], [AHPPuan], [AHPUyumSirasi]) VALUES (1, N'P01', 1, 42, 1)
INSERT [dbo].[Sonuclar] ([id], [StokKodu], [TedarikciId], [AHPPuan], [AHPUyumSirasi]) VALUES (3, N'P01', 2, 25, 2)
INSERT [dbo].[Sonuclar] ([id], [StokKodu], [TedarikciId], [AHPPuan], [AHPUyumSirasi]) VALUES (4, N'D002', 3, 27, 1)
INSERT [dbo].[Sonuclar] ([id], [StokKodu], [TedarikciId], [AHPPuan], [AHPUyumSirasi]) VALUES (5, N'D003', 1, 60, 1)
INSERT [dbo].[Sonuclar] ([id], [StokKodu], [TedarikciId], [AHPPuan], [AHPUyumSirasi]) VALUES (1003, N'D005', 1, 80, 1)
INSERT [dbo].[Sonuclar] ([id], [StokKodu], [TedarikciId], [AHPPuan], [AHPUyumSirasi]) VALUES (1004, N'p02', 2, 60, 1)
SET IDENTITY_INSERT [dbo].[Sonuclar] OFF
SET IDENTITY_INSERT [dbo].[Tedarikci] ON 

INSERT [dbo].[Tedarikci] ([id], [TedarikciAdi], [Memnuniyet], [MemnuniyetAgirlik]) VALUES (1, N'Rendecioğlu LTD.ŞTİ', 31, 1.5)
INSERT [dbo].[Tedarikci] ([id], [TedarikciAdi], [Memnuniyet], [MemnuniyetAgirlik]) VALUES (2, N'Ayan LTD.ŞTİ', 47, 1.75)
INSERT [dbo].[Tedarikci] ([id], [TedarikciAdi], [Memnuniyet], [MemnuniyetAgirlik]) VALUES (3, N'Demir LTD.ŞTİ', 18, 1.998046875)
INSERT [dbo].[Tedarikci] ([id], [TedarikciAdi], [Memnuniyet], [MemnuniyetAgirlik]) VALUES (4, N'Destan LTD.ŞTİ', 50, 1)
INSERT [dbo].[Tedarikci] ([id], [TedarikciAdi], [Memnuniyet], [MemnuniyetAgirlik]) VALUES (5, N'Vural LTD.ŞTİ', 90, 12)
SET IDENTITY_INSERT [dbo].[Tedarikci] OFF
SET IDENTITY_INSERT [dbo].[TedarikUrunleri] ON 

INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (1, N'P01', 1, 12)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2, N'D001', 2, 10)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (3, N'D002', 2, 15)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (4, N'D001', 1, 10.5)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (5, N'D003', 1, 50)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (6, N'D003', 3, 48)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (7, N'D004', 4, 41.3)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (8, N'D001', 4, 12)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (10, N'D001', 3, 10.5)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (11, N'P01', 2, 20)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (12, N'P01', 3, 11.6)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (13, N'P01', 4, 12.2)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (15, N'P01', 5, 11.8)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (17, N'P003', 1, 80)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (19, N'P003', 2, 85)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (20, N'P003', 3, 82)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (21, N'P004', 2, 25)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (23, N'P004', 1, 27)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (25, N'P004', 3, 25)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (27, N'P004', 4, 25.5)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (28, N'D007', 4, 75)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (1002, N'D003', 2, 47.5)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (1003, N'D004', 2, 40)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (1004, N'D006', 2, 55)
SET IDENTITY_INSERT [dbo].[TedarikUrunleri] OFF
SET IDENTITY_INSERT [dbo].[Urunler] ON 

INSERT [dbo].[Urunler] ([id], [StokKodu], [StokAdi], [GrupId], [DefTedId]) VALUES (1, N'P01', N'804 BİLYALI PEDAL', 2, 3)
INSERT [dbo].[Urunler] ([id], [StokKodu], [StokAdi], [GrupId], [DefTedId]) VALUES (2, N'D001', N'26 1.75 CST DIŞ LASTİK', 6, 1)
INSERT [dbo].[Urunler] ([id], [StokKodu], [StokAdi], [GrupId], [DefTedId]) VALUES (3, N'D002', N'26 200 CST DIŞ LASTİK', 11, 3)
INSERT [dbo].[Urunler] ([id], [StokKodu], [StokAdi], [GrupId], [DefTedId]) VALUES (4, N'D003', N'26 1.75 CHOUNYOUNG DIŞ LASTİK', 6, 1)
INSERT [dbo].[Urunler] ([id], [StokKodu], [StokAdi], [GrupId], [DefTedId]) VALUES (5, N'D004', N'28 1.75 CST DIŞ LASTİK', 7, 1)
INSERT [dbo].[Urunler] ([id], [StokKodu], [StokAdi], [GrupId], [DefTedId]) VALUES (9, N'D005', N'28 1.75 CHOUNYOUNG DIŞ LASTİK', 7, 1)
INSERT [dbo].[Urunler] ([id], [StokKodu], [StokAdi], [GrupId], [DefTedId]) VALUES (10, N'P02', N'804 BİLYASIZ PEDAL', 2, 1)
INSERT [dbo].[Urunler] ([id], [StokKodu], [StokAdi], [GrupId], [DefTedId]) VALUES (11, N'P003', N'877 BİLYASIZ PEDAL', 2, 1)
INSERT [dbo].[Urunler] ([id], [StokKodu], [StokAdi], [GrupId], [DefTedId]) VALUES (12, N'P004', N'877 BİLYALI PEDAL', 2, 1)
INSERT [dbo].[Urunler] ([id], [StokKodu], [StokAdi], [GrupId], [DefTedId]) VALUES (15, N'D006', N'26 200 CHOUNYPUNGDIŞ LASTİK', 11, 2)
INSERT [dbo].[Urunler] ([id], [StokKodu], [StokAdi], [GrupId], [DefTedId]) VALUES (16, N'D007', N'26x150 CST Jant Lastik', 10, 1)
INSERT [dbo].[Urunler] ([id], [StokKodu], [StokAdi], [GrupId], [DefTedId]) VALUES (17, N'D008', N'26x150 CHOUNYOUNG Jant Lastik', 10, 1)
SET IDENTITY_INSERT [dbo].[Urunler] OFF
SET IDENTITY_INSERT [dbo].[UrunTedarikci] ON 

INSERT [dbo].[UrunTedarikci] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [MaliyetAgirlik], [KalitePuan], [KaliteAgirlik], [TeslimatPuan], [TeslimatAgirlik]) VALUES (1, N'D001', 3, 82, 1.11111111111, 74, 1.99951171875, 72, 1.99951171875)
INSERT [dbo].[UrunTedarikci] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [MaliyetAgirlik], [KalitePuan], [KaliteAgirlik], [TeslimatPuan], [TeslimatAgirlik]) VALUES (2, N'D001', 1, 66, 1.11, 85, 1.75, 103, 1.75)
INSERT [dbo].[UrunTedarikci] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [MaliyetAgirlik], [KalitePuan], [KaliteAgirlik], [TeslimatPuan], [TeslimatAgirlik]) VALUES (3, N'D002', 3, 82, 1.11, 85, 1.75, 103, 1.75)
INSERT [dbo].[UrunTedarikci] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [MaliyetAgirlik], [KalitePuan], [KaliteAgirlik], [TeslimatPuan], [TeslimatAgirlik]) VALUES (4, N'P01', 2, 82, 1.11111, 76, 1.96875, 93, 1.96875)
INSERT [dbo].[UrunTedarikci] ([id], [StokKodu], [TedarikciId], [MaliyetPuan], [MaliyetAgirlik], [KalitePuan], [KaliteAgirlik], [TeslimatPuan], [TeslimatAgirlik]) VALUES (5, N'P01', 3, 82, 1.11111111111, 74, 1.99951171875, 90, 1.99951171875)
SET IDENTITY_INSERT [dbo].[UrunTedarikci] OFF
ALTER TABLE [dbo].[Ayarlar] ADD  CONSTRAINT [DF_Ayarlar_Anahtar]  DEFAULT ('') FOR [Anahtar]
GO
ALTER TABLE [dbo].[Ayarlar] ADD  CONSTRAINT [DF_Ayarlar_Type]  DEFAULT ('Tarih') FOR [Type]
GO
ALTER TABLE [dbo].[GrupStratejiler] ADD  CONSTRAINT [DF_Stratejiler_GrupId]  DEFAULT ((0)) FOR [GrupId]
GO
ALTER TABLE [dbo].[GrupStratejiler] ADD  CONSTRAINT [DF_Stratejiler_MaliyetOrt]  DEFAULT ((0)) FOR [Maliyet]
GO
ALTER TABLE [dbo].[GrupStratejiler] ADD  CONSTRAINT [DF_Stratejiler_KaliteOrt]  DEFAULT ((0)) FOR [Kalite]
GO
ALTER TABLE [dbo].[GrupStratejiler] ADD  CONSTRAINT [DF_Stratejiler_TeslimatOrt]  DEFAULT ((0)) FOR [Teslimat]
GO
ALTER TABLE [dbo].[GrupStratejiler] ADD  CONSTRAINT [DF_Stratejiler_MemnuniyetOrt]  DEFAULT ((0)) FOR [Memnuniyet]
GO
ALTER TABLE [dbo].[Kullanicilar] ADD  CONSTRAINT [DF_Table_1_UserName]  DEFAULT ('') FOR [KullaniciAdi]
GO
ALTER TABLE [dbo].[Kullanicilar] ADD  CONSTRAINT [DF_Table_1_Password]  DEFAULT ('') FOR [Sifre]
GO
ALTER TABLE [dbo].[Kullanicilar] ADD  CONSTRAINT [DF_Kullanicilar_Rol]  DEFAULT ('') FOR [Rol]
GO
ALTER TABLE [dbo].[MalKabul] ADD  CONSTRAINT [DF_MalKabul_StokKodu]  DEFAULT ('') FOR [StokKodu]
GO
ALTER TABLE [dbo].[MalKabul] ADD  CONSTRAINT [DF_MalKabul_TedarikciId]  DEFAULT ((0)) FOR [TedarikciId]
GO
ALTER TABLE [dbo].[MalKabul] ADD  CONSTRAINT [DF_MalKabul_MaliyetPuan]  DEFAULT ((0)) FOR [MaliyetPuan]
GO
ALTER TABLE [dbo].[MalKabul] ADD  CONSTRAINT [DF_MalKabul_KalitePuan]  DEFAULT ((0)) FOR [KalitePuan]
GO
ALTER TABLE [dbo].[MalKabul] ADD  CONSTRAINT [DF_MalKabul_TeslimatPuan]  DEFAULT ((0)) FOR [TeslimatPuan]
GO
ALTER TABLE [dbo].[MalKabul] ADD  CONSTRAINT [DF_MalKabul_MemnuniyetPuan]  DEFAULT ((0)) FOR [MemnuniyetPuan]
GO
ALTER TABLE [dbo].[MalKabul] ADD  CONSTRAINT [DF_MalKabul_Adet]  DEFAULT ((0)) FOR [Adet]
GO
ALTER TABLE [dbo].[MalzemeGruplari] ADD  CONSTRAINT [DF_MalzemeGruplari_GrupAdi]  DEFAULT ('') FOR [GrupAdi]
GO
ALTER TABLE [dbo].[MalzemeGruplari] ADD  CONSTRAINT [DF_MalzemeGruplari_UstGrupId]  DEFAULT ((0)) FOR [UstGrupId]
GO
ALTER TABLE [dbo].[Sonuclar] ADD  CONSTRAINT [DF_Sonuclar_StokKod]  DEFAULT ('') FOR [StokKodu]
GO
ALTER TABLE [dbo].[Sonuclar] ADD  CONSTRAINT [DF_Sonuclar_TedarikciId]  DEFAULT ('') FOR [TedarikciId]
GO
ALTER TABLE [dbo].[Sonuclar] ADD  CONSTRAINT [DF_Sonuclar_AHPPuan]  DEFAULT ((0)) FOR [AHPPuan]
GO
ALTER TABLE [dbo].[Sonuclar] ADD  CONSTRAINT [DF_Sonuclar_AHPUyumSirasi]  DEFAULT ((0)) FOR [AHPUyumSirasi]
GO
ALTER TABLE [dbo].[Tedarikci] ADD  CONSTRAINT [DF_Tedarikci_TedarikciAdi]  DEFAULT ('') FOR [TedarikciAdi]
GO
ALTER TABLE [dbo].[Tedarikci] ADD  CONSTRAINT [DF_Tedarikci_MemnuniyetPuani]  DEFAULT ((50)) FOR [Memnuniyet]
GO
ALTER TABLE [dbo].[Tedarikci] ADD  CONSTRAINT [DF_Tedarikci_MemnuniyetAdedi]  DEFAULT ((1)) FOR [MemnuniyetAgirlik]
GO
ALTER TABLE [dbo].[TedarikUrunleri] ADD  CONSTRAINT [DF_TedarikUrunleri_StokKodu]  DEFAULT ('') FOR [StokKodu]
GO
ALTER TABLE [dbo].[TedarikUrunleri] ADD  CONSTRAINT [DF_TedarikUrunleri_TedarikciId]  DEFAULT ((0)) FOR [TedarikciId]
GO
ALTER TABLE [dbo].[TedarikUrunleri] ADD  CONSTRAINT [DF_TedarikUrunleri_BirimFiyat]  DEFAULT ((0)) FOR [BirimFiyat]
GO
ALTER TABLE [dbo].[Urunler] ADD  CONSTRAINT [DF_Urunler_StokKodu]  DEFAULT ('') FOR [StokKodu]
GO
ALTER TABLE [dbo].[Urunler] ADD  CONSTRAINT [DF_Urunler_StokAdi]  DEFAULT ('') FOR [StokAdi]
GO
ALTER TABLE [dbo].[Urunler] ADD  CONSTRAINT [DF_Urunler_GrupId]  DEFAULT ((0)) FOR [GrupId]
GO
ALTER TABLE [dbo].[Urunler] ADD  CONSTRAINT [DF_Urunler_DefTedId]  DEFAULT ((0)) FOR [DefTedId]
GO
ALTER TABLE [dbo].[UrunStratejiler] ADD  CONSTRAINT [DF_KriterAgirlik_StokKod]  DEFAULT ('') FOR [StokKodu]
GO
ALTER TABLE [dbo].[UrunStratejiler] ADD  CONSTRAINT [DF_KriterAgirlik_MaliyetPuan]  DEFAULT ((0)) FOR [MaliyetPuan]
GO
ALTER TABLE [dbo].[UrunStratejiler] ADD  CONSTRAINT [DF_KriterAgirlik_KalitePuan]  DEFAULT ((0)) FOR [KalitePuan]
GO
ALTER TABLE [dbo].[UrunStratejiler] ADD  CONSTRAINT [DF_KriterAgirlik_TeslimatPuan]  DEFAULT ((0)) FOR [TeslimatPuan]
GO
ALTER TABLE [dbo].[UrunStratejiler] ADD  CONSTRAINT [DF_KriterAgirlik_MemnuniyetPuan]  DEFAULT ((0)) FOR [MemnuniyetPuan]
GO
ALTER TABLE [dbo].[UrunTedarikci] ADD  CONSTRAINT [DF_UrunTedarikci_StokKodu]  DEFAULT ('') FOR [StokKodu]
GO
ALTER TABLE [dbo].[UrunTedarikci] ADD  CONSTRAINT [DF_UrunTedarikci_TedarikciId]  DEFAULT ((0)) FOR [TedarikciId]
GO
ALTER TABLE [dbo].[UrunTedarikci] ADD  CONSTRAINT [DF_UrunTedarikci_MaliyetPuan]  DEFAULT ((0)) FOR [MaliyetPuan]
GO
ALTER TABLE [dbo].[UrunTedarikci] ADD  CONSTRAINT [DF_UrunTedarikci_MaliyetAdet]  DEFAULT ((1)) FOR [MaliyetAgirlik]
GO
ALTER TABLE [dbo].[UrunTedarikci] ADD  CONSTRAINT [DF_UrunTedarikci_KalitePuan]  DEFAULT ((0)) FOR [KalitePuan]
GO
ALTER TABLE [dbo].[UrunTedarikci] ADD  CONSTRAINT [DF_UrunTedarikci_KaliteAgirlik]  DEFAULT ((1)) FOR [KaliteAgirlik]
GO
ALTER TABLE [dbo].[UrunTedarikci] ADD  CONSTRAINT [DF_UrunTedarikci_TeslimatPuan]  DEFAULT ((0)) FOR [TeslimatPuan]
GO
ALTER TABLE [dbo].[UrunTedarikci] ADD  CONSTRAINT [DF_UrunTedarikci_TeslimatAgirlik]  DEFAULT ((1)) FOR [TeslimatAgirlik]
GO
ALTER TABLE [dbo].[GrupStratejiler]  WITH CHECK ADD  CONSTRAINT [FK_GrupStratejiler_MalzemeGruplari] FOREIGN KEY([GrupId])
REFERENCES [dbo].[MalzemeGruplari] ([id])
GO
ALTER TABLE [dbo].[GrupStratejiler] CHECK CONSTRAINT [FK_GrupStratejiler_MalzemeGruplari]
GO
ALTER TABLE [dbo].[MalKabul]  WITH CHECK ADD  CONSTRAINT [FK_MalKabul_Tedarikci] FOREIGN KEY([TedarikciId])
REFERENCES [dbo].[Tedarikci] ([id])
GO
ALTER TABLE [dbo].[MalKabul] CHECK CONSTRAINT [FK_MalKabul_Tedarikci]
GO
ALTER TABLE [dbo].[MalKabul]  WITH CHECK ADD  CONSTRAINT [FK_MalKabul_Urunler] FOREIGN KEY([StokKodu])
REFERENCES [dbo].[Urunler] ([StokKodu])
GO
ALTER TABLE [dbo].[MalKabul] CHECK CONSTRAINT [FK_MalKabul_Urunler]
GO
ALTER TABLE [dbo].[MalzemeGruplari]  WITH CHECK ADD  CONSTRAINT [FK_MalzemeGruplari_MalzemeGruplari] FOREIGN KEY([UstGrupId])
REFERENCES [dbo].[MalzemeGruplari] ([id])
GO
ALTER TABLE [dbo].[MalzemeGruplari] CHECK CONSTRAINT [FK_MalzemeGruplari_MalzemeGruplari]
GO
ALTER TABLE [dbo].[Sonuclar]  WITH CHECK ADD  CONSTRAINT [FK_Sonuclar_Tedarikci] FOREIGN KEY([TedarikciId])
REFERENCES [dbo].[Tedarikci] ([id])
GO
ALTER TABLE [dbo].[Sonuclar] CHECK CONSTRAINT [FK_Sonuclar_Tedarikci]
GO
ALTER TABLE [dbo].[Sonuclar]  WITH CHECK ADD  CONSTRAINT [FK_Sonuclar_Urunler] FOREIGN KEY([StokKodu])
REFERENCES [dbo].[Urunler] ([StokKodu])
GO
ALTER TABLE [dbo].[Sonuclar] CHECK CONSTRAINT [FK_Sonuclar_Urunler]
GO
ALTER TABLE [dbo].[TedarikUrunleri]  WITH CHECK ADD  CONSTRAINT [FK_TedarikUrunleri_Tedarikci] FOREIGN KEY([TedarikciId])
REFERENCES [dbo].[Tedarikci] ([id])
GO
ALTER TABLE [dbo].[TedarikUrunleri] CHECK CONSTRAINT [FK_TedarikUrunleri_Tedarikci]
GO
ALTER TABLE [dbo].[TedarikUrunleri]  WITH CHECK ADD  CONSTRAINT [FK_TedarikUrunleri_Urunler] FOREIGN KEY([StokKodu])
REFERENCES [dbo].[Urunler] ([StokKodu])
GO
ALTER TABLE [dbo].[TedarikUrunleri] CHECK CONSTRAINT [FK_TedarikUrunleri_Urunler]
GO
ALTER TABLE [dbo].[Urunler]  WITH CHECK ADD  CONSTRAINT [FK_Urunler_MalzemeGruplari] FOREIGN KEY([GrupId])
REFERENCES [dbo].[MalzemeGruplari] ([id])
GO
ALTER TABLE [dbo].[Urunler] CHECK CONSTRAINT [FK_Urunler_MalzemeGruplari]
GO
ALTER TABLE [dbo].[UrunTedarikci]  WITH CHECK ADD  CONSTRAINT [FK_UrunTedarikci_Tedarikci] FOREIGN KEY([TedarikciId])
REFERENCES [dbo].[Tedarikci] ([id])
GO
ALTER TABLE [dbo].[UrunTedarikci] CHECK CONSTRAINT [FK_UrunTedarikci_Tedarikci]
GO
ALTER TABLE [dbo].[UrunTedarikci]  WITH CHECK ADD  CONSTRAINT [FK_UrunTedarikci_Urunler] FOREIGN KEY([StokKodu])
REFERENCES [dbo].[Urunler] ([StokKodu])
GO
ALTER TABLE [dbo].[UrunTedarikci] CHECK CONSTRAINT [FK_UrunTedarikci_Urunler]
GO
