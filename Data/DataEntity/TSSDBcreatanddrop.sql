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
/****** Object:  Index [IX_UrunTedarikci]    Script Date: 14.05.2019 13:01:05 ******/
DROP INDEX [IX_UrunTedarikci] ON [dbo].[UrunTedarikci]
GO
/****** Object:  Index [IX_Urunler]    Script Date: 14.05.2019 13:01:05 ******/
DROP INDEX [IX_Urunler] ON [dbo].[Urunler]
GO
/****** Object:  Index [IX_TedarikUrunleri]    Script Date: 14.05.2019 13:01:05 ******/
DROP INDEX [IX_TedarikUrunleri] ON [dbo].[TedarikUrunleri]
GO
/****** Object:  Index [IX_Sonuclar]    Script Date: 14.05.2019 13:01:05 ******/
DROP INDEX [IX_Sonuclar] ON [dbo].[Sonuclar]
GO
/****** Object:  Index [IX_MalzemeGruplari]    Script Date: 14.05.2019 13:01:05 ******/
DROP INDEX [IX_MalzemeGruplari] ON [dbo].[MalzemeGruplari]
GO
/****** Object:  Index [IX_Kullanicilar]    Script Date: 14.05.2019 13:01:05 ******/
DROP INDEX [IX_Kullanicilar] ON [dbo].[Kullanicilar]
GO
/****** Object:  Index [IX_Stratejiler]    Script Date: 14.05.2019 13:01:05 ******/
DROP INDEX [IX_Stratejiler] ON [dbo].[GrupStratejiler]
GO
/****** Object:  Index [IX_Ayarlar]    Script Date: 14.05.2019 13:01:05 ******/
DROP INDEX [IX_Ayarlar] ON [dbo].[Ayarlar]
GO
/****** Object:  Table [dbo].[UrunTedarikci]    Script Date: 14.05.2019 13:01:05 ******/
DROP TABLE [dbo].[UrunTedarikci]
GO
/****** Object:  Table [dbo].[UrunStratejiler]    Script Date: 14.05.2019 13:01:05 ******/
DROP TABLE [dbo].[UrunStratejiler]
GO
/****** Object:  Table [dbo].[Urunler]    Script Date: 14.05.2019 13:01:05 ******/
DROP TABLE [dbo].[Urunler]
GO
/****** Object:  Table [dbo].[TedarikUrunleri]    Script Date: 14.05.2019 13:01:05 ******/
DROP TABLE [dbo].[TedarikUrunleri]
GO
/****** Object:  Table [dbo].[Tedarikci]    Script Date: 14.05.2019 13:01:05 ******/
DROP TABLE [dbo].[Tedarikci]
GO
/****** Object:  Table [dbo].[Sonuclar]    Script Date: 14.05.2019 13:01:05 ******/
DROP TABLE [dbo].[Sonuclar]
GO
/****** Object:  Table [dbo].[MalzemeGruplari]    Script Date: 14.05.2019 13:01:05 ******/
DROP TABLE [dbo].[MalzemeGruplari]
GO
/****** Object:  Table [dbo].[MalKabul]    Script Date: 14.05.2019 13:01:05 ******/
DROP TABLE [dbo].[MalKabul]
GO
/****** Object:  Table [dbo].[Kullanicilar]    Script Date: 14.05.2019 13:01:05 ******/
DROP TABLE [dbo].[Kullanicilar]
GO
/****** Object:  Table [dbo].[GrupStratejiler]    Script Date: 14.05.2019 13:01:05 ******/
DROP TABLE [dbo].[GrupStratejiler]
GO
/****** Object:  Table [dbo].[Ayarlar]    Script Date: 14.05.2019 13:01:05 ******/
DROP TABLE [dbo].[Ayarlar]
GO
USE [master]
GO
/****** Object:  Database [TSSDB]    Script Date: 14.05.2019 13:01:05 ******/
DROP DATABASE [TSSDB]
GO
/****** Object:  Database [TSSDB]    Script Date: 14.05.2019 13:01:05 ******/
CREATE DATABASE [TSSDB]
GO
ALTER DATABASE [TSSDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TSSDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TSSDB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [TSSDB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [TSSDB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [TSSDB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [TSSDB] SET ARITHABORT OFF
GO
ALTER DATABASE [TSSDB] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [TSSDB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [TSSDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [TSSDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [TSSDB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [TSSDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [TSSDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [TSSDB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [TSSDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [TSSDB] SET  DISABLE_BROKER
GO
ALTER DATABASE [TSSDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [TSSDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [TSSDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [TSSDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [TSSDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [TSSDB] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [TSSDB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [TSSDB] SET RECOVERY FULL
GO
ALTER DATABASE [TSSDB] SET  MULTI_USER
GO
ALTER DATABASE [TSSDB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [TSSDB] SET DB_CHAINING OFF
GO
ALTER DATABASE [TSSDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF )
GO
ALTER DATABASE [TSSDB] SET TARGET_RECOVERY_TIME = 60 SECONDS
GO
ALTER DATABASE [TSSDB] SET DELAYED_DURABILITY = DISABLED
GO
EXEC sys.sp_db_vardecimal_storage_format N'TSSDB', N'ON'
GO
ALTER DATABASE [TSSDB] SET QUERY_STORE = OFF
GO
USE [TSSDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [TSSDB]
GO
/****** Object:  Table [dbo].[Ayarlar]    Script Date: 14.05.2019 13:01:06 ******/
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
/****** Object:  Table [dbo].[GrupStratejiler]    Script Date: 14.05.2019 13:01:06 ******/
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
/****** Object:  Table [dbo].[Kullanicilar]    Script Date: 14.05.2019 13:01:07 ******/
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
/****** Object:  Table [dbo].[MalKabul]    Script Date: 14.05.2019 13:01:07 ******/
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
/****** Object:  Table [dbo].[MalzemeGruplari]    Script Date: 14.05.2019 13:01:07 ******/
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
/****** Object:  Table [dbo].[Sonuclar]    Script Date: 14.05.2019 13:01:07 ******/
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
/****** Object:  Table [dbo].[Tedarikci]    Script Date: 14.05.2019 13:01:07 ******/
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
/****** Object:  Table [dbo].[TedarikUrunleri]    Script Date: 14.05.2019 13:01:07 ******/
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
/****** Object:  Table [dbo].[Urunler]    Script Date: 14.05.2019 13:01:07 ******/
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
/****** Object:  Table [dbo].[UrunStratejiler]    Script Date: 14.05.2019 13:01:07 ******/
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
/****** Object:  Table [dbo].[UrunTedarikci]    Script Date: 14.05.2019 13:01:07 ******/
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

INSERT [dbo].[GrupStratejiler] ([id], [GrupId], [Maliyet], [Kalite], [Teslimat], [Memnuniyet]) VALUES (1, 0, 25, 25, 25, 25)
SET IDENTITY_INSERT [dbo].[GrupStratejiler] OFF
SET IDENTITY_INSERT [dbo].[Kullanicilar] ON

INSERT [dbo].[Kullanicilar] ([id], [KullaniciAdi], [Sifre], [Rol]) VALUES (6, N'Ali', N'1234', N'user')
INSERT [dbo].[Kullanicilar] ([id], [KullaniciAdi], [Sifre], [Rol]) VALUES (7, N'yunus', N'1234', N'admin')
INSERT [dbo].[Kullanicilar] ([id], [KullaniciAdi], [Sifre], [Rol]) VALUES (8, N'muhammet', N'1234', N'admin')
INSERT [dbo].[Kullanicilar] ([id], [KullaniciAdi], [Sifre], [Rol]) VALUES (1007, N'idris', N'1234', N'user')
INSERT [dbo].[Kullanicilar] ([id], [KullaniciAdi], [Sifre], [Rol]) VALUES (1008, N'Asım', N'1234', N'user')
SET IDENTITY_INSERT [dbo].[Kullanicilar] OFF
SET IDENTITY_INSERT [dbo].[MalzemeGruplari] ON

INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (0, N'.', 0)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (3, N'Aynakol', 0)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (21, N'Fren Grubu', 0)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (16, N'Kadro', 0)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (14, N'Ön Takım', 0)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (2, N'Pedal', 0)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (15, N'Sele Bölgesi', 0)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (1, N'Teker', 0)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (17, N'Vites Grubu', 0)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (5, N'26Jant Lastik', 1)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (7, N'28Jant Lastik', 1)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (4, N'Sol Kol', 3)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (19, N'Tekli Aynakol', 3)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (20, N'Üçlü Aynakol', 3)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (10, N'26x150Jant Lastik', 5)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (6, N'26x175Jant Lastik', 5)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (11, N'26x200JantLastik', 5)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (9, N'28x150Jant Lastik', 7)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (8, N'28x175Jant Lastik', 7)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (26, N'Amortisör', 14)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (25, N'Elcik', 14)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (28, N'Gidon', 14)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (29, N'Gidon Boğazı', 14)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (27, N'Maşa', 14)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (24, N'Çocuk Sele', 15)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (23, N'Mtb Sele', 15)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (22, N'Sele Borusu', 15)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (18, N'Dişli Grubu', 17)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (30, N'Vites Kolu', 17)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (31, N'6lı Dişli', 18)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (32, N'7li Dişli', 18)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (33, N'12 Maşa', 27)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (34, N'20 Maşa', 27)
INSERT [dbo].[MalzemeGruplari] ([id], [GrupAdi], [UstGrupId]) VALUES (35, N'26 Maşa', 27)
SET IDENTITY_INSERT [dbo].[MalzemeGruplari] OFF
SET IDENTITY_INSERT [dbo].[Tedarikci] ON

INSERT [dbo].[Tedarikci] ([id], [TedarikciAdi], [Memnuniyet], [MemnuniyetAgirlik]) VALUES (1, N'Rendecioğlu LTD.ŞTİ', 50, 1)
INSERT [dbo].[Tedarikci] ([id], [TedarikciAdi], [Memnuniyet], [MemnuniyetAgirlik]) VALUES (2, N'Ayan LTD.ŞTİ', 50, 1)
INSERT [dbo].[Tedarikci] ([id], [TedarikciAdi], [Memnuniyet], [MemnuniyetAgirlik]) VALUES (3, N'Demir LTD.ŞTİ', 50, 1)
INSERT [dbo].[Tedarikci] ([id], [TedarikciAdi], [Memnuniyet], [MemnuniyetAgirlik]) VALUES (4, N'Destan LTD.ŞTİ', 50, 1)
INSERT [dbo].[Tedarikci] ([id], [TedarikciAdi], [Memnuniyet], [MemnuniyetAgirlik]) VALUES (5, N'Vural LTD.ŞTİ', 50, 1)
INSERT [dbo].[Tedarikci] ([id], [TedarikciAdi], [Memnuniyet], [MemnuniyetAgirlik]) VALUES (6, N'Canbaz LTD.ŞTİ', 50, 1)
INSERT [dbo].[Tedarikci] ([id], [TedarikciAdi], [Memnuniyet], [MemnuniyetAgirlik]) VALUES (7, N'Dönmez LTD.ŞTİ', 50, 1)
INSERT [dbo].[Tedarikci] ([id], [TedarikciAdi], [Memnuniyet], [MemnuniyetAgirlik]) VALUES (8, N'Keskin LTD.ŞTİ', 50, 1)
INSERT [dbo].[Tedarikci] ([id], [TedarikciAdi], [Memnuniyet], [MemnuniyetAgirlik]) VALUES (9, N'Seyfi LTD.ŞTİ', 50, 1)
INSERT [dbo].[Tedarikci] ([id], [TedarikciAdi], [Memnuniyet], [MemnuniyetAgirlik]) VALUES (10, N'Sönmez LTD.ŞTİ', 50, 1)
INSERT [dbo].[Tedarikci] ([id], [TedarikciAdi], [Memnuniyet], [MemnuniyetAgirlik]) VALUES (11, N'Yakup LTD.ŞTİ', 50, 1)
INSERT [dbo].[Tedarikci] ([id], [TedarikciAdi], [Memnuniyet], [MemnuniyetAgirlik]) VALUES (12, N'Hayri LTD.ŞTİ', 50, 1)
INSERT [dbo].[Tedarikci] ([id], [TedarikciAdi], [Memnuniyet], [MemnuniyetAgirlik]) VALUES (13, N'Ahmet LTD.ŞTİ', 50, 1)
INSERT [dbo].[Tedarikci] ([id], [TedarikciAdi], [Memnuniyet], [MemnuniyetAgirlik]) VALUES (14, N'Ramiz LTD.ŞTİ', 50, 1)
INSERT [dbo].[Tedarikci] ([id], [TedarikciAdi], [Memnuniyet], [MemnuniyetAgirlik]) VALUES (15, N'Kaleli LTD.ŞTİ', 50, 1)
INSERT [dbo].[Tedarikci] ([id], [TedarikciAdi], [Memnuniyet], [MemnuniyetAgirlik]) VALUES (16, N'Kaçmaz LTD.ŞTİ', 50, 1)
INSERT [dbo].[Tedarikci] ([id], [TedarikciAdi], [Memnuniyet], [MemnuniyetAgirlik]) VALUES (17, N'Durmuş LTD.ŞTİ', 50, 1)
INSERT [dbo].[Tedarikci] ([id], [TedarikciAdi], [Memnuniyet], [MemnuniyetAgirlik]) VALUES (18, N'Sarraf LTD.ŞTİ', 50, 1)
INSERT [dbo].[Tedarikci] ([id], [TedarikciAdi], [Memnuniyet], [MemnuniyetAgirlik]) VALUES (19, N'Hasan LTD.ŞTİ', 50, 1)
INSERT [dbo].[Tedarikci] ([id], [TedarikciAdi], [Memnuniyet], [MemnuniyetAgirlik]) VALUES (20, N'Keser LTD.ŞTİ', 50, 1)
SET IDENTITY_INSERT [dbo].[Tedarikci] OFF
SET IDENTITY_INSERT [dbo].[TedarikUrunleri] ON

INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (1, N'P01', 1, 12)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2, N'D001', 2, 10)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (3, N'D002', 2, 15)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (4, N'D001', 1, 12)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (5, N'D003', 1, 50.5)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (6, N'D003', 3, 49)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (7, N'D004', 4, 41.3)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (8, N'D001', 4, 12)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (10, N'D001', 3, 10.5)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (11, N'P01', 2, 15)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (12, N'P01', 3, 11)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (13, N'P01', 4, 13)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (15, N'P01', 5, 11)
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
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2003, N'M001', 4, 30)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2004, N'M001', 5, 28)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2005, N'M001', 6, 29)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2006, N'M002', 5, 20)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2007, N'M002', 8, 22)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2008, N'M002', 9, 25)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2009, N'M002', 10, 28)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2010, N'M003', 3, 55)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2011, N'M003', 4, 60)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2012, N'M003', 8, 65)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2013, N'DSL01', 5, 30)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2014, N'DSL01', 6, 33)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2015, N'DSL01', 7, 35)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2016, N'DSL02', 3, 25)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2017, N'DSL02', 4, 23)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2018, N'DSL02', 5, 25)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2019, N'DSL02', 10, 28)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2020, N'ELC01', 10, 12)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2021, N'ELC01', 8, 10)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2022, N'ELC01', 9, 12)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2023, N'ELC02', 1, 12)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2024, N'ELC02', 2, 16)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2025, N'ELC02', 3, 14)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2026, N'ELC02', 4, 17)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2027, N'A001', 5, 25)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2028, N'A001', 6, 24)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2029, N'A001', 7, 28)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2030, N'A001', 8, 30)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2031, N'A002', 9, 30)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2032, N'A002', 10, 34)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2033, N'A002', 7, 30)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2034, N'A002', 6, 32)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2035, N'A003', 5, 20)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2036, N'A003', 6, 22)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2037, N'A003', 10, 25)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2038, N'D002', 3, 18)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2039, N'D002', 7, 16)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2040, N'D002', 10, 16.5)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2041, N'D004', 5, 45)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2042, N'D005', 1, 29)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2043, N'D005', 3, 32)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2044, N'D005', 5, 32)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2046, N'P02', 1, 20)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2047, N'P02', 2, 22)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2048, N'P02', 10, 25)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2049, N'P02', 4, 23)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2050, N'D006', 3, 54)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2051, N'D006', 5, 56)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2052, N'D006', 7, 53)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2053, N'D007', 5, 70)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2054, N'D007', 6, 78)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2055, N'D007', 10, 68)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2056, N'D008', 1, 44)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2057, N'D008', 2, 50)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2058, N'D008', 7, 46)
INSERT [dbo].[TedarikUrunleri] ([id], [StokKodu], [TedarikciId], [BirimFiyat]) VALUES (2059, N'D008', 5, 45)
SET IDENTITY_INSERT [dbo].[TedarikUrunleri] OFF
SET IDENTITY_INSERT [dbo].[Urunler] ON

INSERT [dbo].[Urunler] ([id], [StokKodu], [StokAdi], [GrupId], [DefTedId]) VALUES (1, N'P01', N'804 BİLYALI PEDAL', 2, 5)
INSERT [dbo].[Urunler] ([id], [StokKodu], [StokAdi], [GrupId], [DefTedId]) VALUES (2, N'D001', N'26 1.75 CST DIŞ LASTİK', 6, 2)
INSERT [dbo].[Urunler] ([id], [StokKodu], [StokAdi], [GrupId], [DefTedId]) VALUES (3, N'D002', N'26 200 CST DIŞ LASTİK', 11, 7)
INSERT [dbo].[Urunler] ([id], [StokKodu], [StokAdi], [GrupId], [DefTedId]) VALUES (4, N'D003', N'26 1.75 CHOUNYOUNG DIŞ LASTİK', 6, 1)
INSERT [dbo].[Urunler] ([id], [StokKodu], [StokAdi], [GrupId], [DefTedId]) VALUES (5, N'D004', N'28 1.75 CST DIŞ LASTİK', 7, 2)
INSERT [dbo].[Urunler] ([id], [StokKodu], [StokAdi], [GrupId], [DefTedId]) VALUES (9, N'D005', N'28 1.75 CHOUNYOUNG DIŞ LASTİK', 7, 1)
INSERT [dbo].[Urunler] ([id], [StokKodu], [StokAdi], [GrupId], [DefTedId]) VALUES (10, N'P02', N'804 BİLYASIZ PEDAL', 2, 1)
INSERT [dbo].[Urunler] ([id], [StokKodu], [StokAdi], [GrupId], [DefTedId]) VALUES (11, N'P003', N'877 BİLYASIZ PEDAL', 2, 3)
INSERT [dbo].[Urunler] ([id], [StokKodu], [StokAdi], [GrupId], [DefTedId]) VALUES (12, N'P004', N'877 BİLYALI PEDAL', 2, 3)
INSERT [dbo].[Urunler] ([id], [StokKodu], [StokAdi], [GrupId], [DefTedId]) VALUES (15, N'D006', N'26 200 CHOUNYPUNGDIŞ LASTİK', 11, 7)
INSERT [dbo].[Urunler] ([id], [StokKodu], [StokAdi], [GrupId], [DefTedId]) VALUES (16, N'D007', N'26x150 CST Jant Lastik', 10, 10)
INSERT [dbo].[Urunler] ([id], [StokKodu], [StokAdi], [GrupId], [DefTedId]) VALUES (17, N'D008', N'26x150 CHOUNYOUNG Jant Lastik', 10, 1)
INSERT [dbo].[Urunler] ([id], [StokKodu], [StokAdi], [GrupId], [DefTedId]) VALUES (1013, N'M001', N'26 Alm Maşa', 35, 5)
INSERT [dbo].[Urunler] ([id], [StokKodu], [StokAdi], [GrupId], [DefTedId]) VALUES (1014, N'M002', N'26 Çelik Maşa', 35, 5)
INSERT [dbo].[Urunler] ([id], [StokKodu], [StokAdi], [GrupId], [DefTedId]) VALUES (1015, N'M003', N'26 Karbon Maşa', 35, 3)
INSERT [dbo].[Urunler] ([id], [StokKodu], [StokAdi], [GrupId], [DefTedId]) VALUES (1016, N'DSL01', N'Shimano 6 lı Dişli', 31, 5)
INSERT [dbo].[Urunler] ([id], [StokKodu], [StokAdi], [GrupId], [DefTedId]) VALUES (1017, N'DSL02', N'Shufenl 6 lı Kaset Dişli', 31, 4)
INSERT [dbo].[Urunler] ([id], [StokKodu], [StokAdi], [GrupId], [DefTedId]) VALUES (1018, N'ELC01', N'Sünger Elcik', 25, 8)
INSERT [dbo].[Urunler] ([id], [StokKodu], [StokAdi], [GrupId], [DefTedId]) VALUES (1021, N'ELC02', N'Kauçuk Elcik ', 25, 3)
INSERT [dbo].[Urunler] ([id], [StokKodu], [StokAdi], [GrupId], [DefTedId]) VALUES (1022, N'A001', N'600 Amortisör', 26, 6)
INSERT [dbo].[Urunler] ([id], [StokKodu], [StokAdi], [GrupId], [DefTedId]) VALUES (1029, N'A002', N'800 Amortisör', 26, 7)
INSERT [dbo].[Urunler] ([id], [StokKodu], [StokAdi], [GrupId], [DefTedId]) VALUES (1030, N'A003', N'1000 Amortisör', 26, 5)
SET IDENTITY_INSERT [dbo].[Urunler] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Ayarlar]    Script Date: 14.05.2019 13:01:07 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Ayarlar] ON [dbo].[Ayarlar]
(
	[Anahtar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Stratejiler]    Script Date: 14.05.2019 13:01:07 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Stratejiler] ON [dbo].[GrupStratejiler]
(
	[GrupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Kullanicilar]    Script Date: 14.05.2019 13:01:07 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Kullanicilar] ON [dbo].[Kullanicilar]
(
	[KullaniciAdi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_MalzemeGruplari]    Script Date: 14.05.2019 13:01:07 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_MalzemeGruplari] ON [dbo].[MalzemeGruplari]
(
	[UstGrupId] ASC,
	[GrupAdi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Sonuclar]    Script Date: 14.05.2019 13:01:07 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Sonuclar] ON [dbo].[Sonuclar]
(
	[StokKodu] ASC,
	[TedarikciId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TedarikUrunleri]    Script Date: 14.05.2019 13:01:07 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TedarikUrunleri] ON [dbo].[TedarikUrunleri]
(
	[TedarikciId] ASC,
	[StokKodu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Urunler]    Script Date: 14.05.2019 13:01:07 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Urunler] ON [dbo].[Urunler]
(
	[StokKodu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UrunTedarikci]    Script Date: 14.05.2019 13:01:07 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_UrunTedarikci] ON [dbo].[UrunTedarikci]
(
	[StokKodu] ASC,
	[TedarikciId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
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
USE [master]
GO
ALTER DATABASE [TSSDB] SET  READ_WRITE 
GO
