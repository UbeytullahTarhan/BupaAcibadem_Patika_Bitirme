USE [master]
GO
/****** Object:  Database [BupaAcibadem]    Script Date: 13.02.2022 20:30:17 ******/
CREATE DATABASE [BupaAcibadem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BupaAcibadem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BupaAcibadem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BupaAcibadem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BupaAcibadem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BupaAcibadem] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BupaAcibadem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BupaAcibadem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BupaAcibadem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BupaAcibadem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BupaAcibadem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BupaAcibadem] SET ARITHABORT OFF 
GO
ALTER DATABASE [BupaAcibadem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BupaAcibadem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BupaAcibadem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BupaAcibadem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BupaAcibadem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BupaAcibadem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BupaAcibadem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BupaAcibadem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BupaAcibadem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BupaAcibadem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BupaAcibadem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BupaAcibadem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BupaAcibadem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BupaAcibadem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BupaAcibadem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BupaAcibadem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BupaAcibadem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BupaAcibadem] SET RECOVERY FULL 
GO
ALTER DATABASE [BupaAcibadem] SET  MULTI_USER 
GO
ALTER DATABASE [BupaAcibadem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BupaAcibadem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BupaAcibadem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BupaAcibadem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BupaAcibadem] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BupaAcibadem', N'ON'
GO
ALTER DATABASE [BupaAcibadem] SET QUERY_STORE = OFF
GO
USE [BupaAcibadem]
GO
/****** Object:  UserDefinedFunction [dbo].[FUpper]    Script Date: 13.02.2022 20:30:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[FUpper](@text varchar(100))
returns varchar(100)
as
    begin

       return CONCAT(UPPER(SUBSTRING(@text, 1, 1)), SUBSTRING(@text, 2, LEN(@text)))
    end
GO
/****** Object:  UserDefinedFunction [dbo].[SigortaliInsert]    Script Date: 13.02.2022 20:30:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[SigortaliInsert](@SEId int,@SCinsiyet char(1),@SYakinlik varchar(10))
returns int

as
    begin
	declare @SECinsiyet nchar(1)=(select @SCinsiyet from SigortaEttiren where SEId=@SEId)
	declare @YE int=(select count(SYakınlık) from Sigortalı where SEId=@SEId and SYakınlık='Esi')
	declare @YK int =(select count(SYakınlık) from Sigortalı where SEId=@SEId and SYakınlık='Kendisi')
	if(@SYakinlik='Esi'and @SECinsiyet!=@SCinsiyet and @YE=0)
	begin
	 return 1;
	end
	if(@SYakinlik='Kendisi'and @SECinsiyet=@SCinsiyet and @YK=0)
	begin
	return 1;
	end
	if(@SYakinlik='Çocugu')
	begin
	return 1;
	end

	return 0;
    end
GO
/****** Object:  Table [dbo].[Fatura]    Script Date: 13.02.2022 20:30:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fatura](
	[FId] [int] IDENTITY(1,1) NOT NULL,
	[SEId] [int] NOT NULL,
 CONSTRAINT [PK_Fatura] PRIMARY KEY CLUSTERED 
(
	[FId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prim]    Script Date: 13.02.2022 20:30:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prim](
	[PId] [int] IDENTITY(1,1) NOT NULL,
	[PFiyat] [decimal](8, 2) NULL,
	[PTaksit] [int] NULL,
	[SEId] [int] NOT NULL,
 CONSTRAINT [PK_Prim] PRIMARY KEY CLUSTERED 
(
	[PId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SigortaEttiren]    Script Date: 13.02.2022 20:30:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SigortaEttiren](
	[SEId] [int] IDENTITY(1,1) NOT NULL,
	[SETc] [varchar](11) NULL,
	[SEAdi] [varchar](50) NULL,
	[SESoyadi] [varchar](50) NULL,
	[SECinsiyet] [nchar](1) NULL,
	[SEDogumTarihi] [date] NULL,
	[SETelefon] [varchar](20) NULL,
	[SEEposta] [varchar](50) NULL,
	[SEUlke] [varchar](50) NULL,
	[SEAdres] [varchar](100) NULL,
 CONSTRAINT [PK_SigortaEttiren] PRIMARY KEY CLUSTERED 
(
	[SEId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sigortalı]    Script Date: 13.02.2022 20:30:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sigortalı](
	[SId] [int] IDENTITY(1,1) NOT NULL,
	[STc] [varchar](11) NULL,
	[SAdi] [varchar](50) NULL,
	[SSoyadi] [varchar](50) NULL,
	[SCinsiyet] [char](1) NULL,
	[SDogumTarihi] [date] NULL,
	[STelefon] [varchar](20) NULL,
	[SEposta] [varchar](50) NULL,
	[SUlke] [varchar](50) NULL,
	[SAdres] [varchar](100) NULL,
	[SMeslek] [varchar](20) NULL,
	[SYakınlık] [varchar](10) NULL,
	[SKilo] [decimal](5, 0) NULL,
	[SBoy] [decimal](3, 0) NULL,
	[SEId] [int] NULL,
 CONSTRAINT [PK_Sigortalı] PRIMARY KEY CLUSTERED 
(
	[SId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Fatura] ON 

INSERT [dbo].[Fatura] ([FId], [SEId]) VALUES (3, 63)
INSERT [dbo].[Fatura] ([FId], [SEId]) VALUES (4, 64)
INSERT [dbo].[Fatura] ([FId], [SEId]) VALUES (5, 65)
INSERT [dbo].[Fatura] ([FId], [SEId]) VALUES (6, 68)
INSERT [dbo].[Fatura] ([FId], [SEId]) VALUES (7, 72)
INSERT [dbo].[Fatura] ([FId], [SEId]) VALUES (8, 75)
INSERT [dbo].[Fatura] ([FId], [SEId]) VALUES (9, 76)
INSERT [dbo].[Fatura] ([FId], [SEId]) VALUES (10, 77)
INSERT [dbo].[Fatura] ([FId], [SEId]) VALUES (11, 78)
INSERT [dbo].[Fatura] ([FId], [SEId]) VALUES (12, 79)
INSERT [dbo].[Fatura] ([FId], [SEId]) VALUES (13, 80)
SET IDENTITY_INSERT [dbo].[Fatura] OFF
SET IDENTITY_INSERT [dbo].[Prim] ON 

INSERT [dbo].[Prim] ([PId], [PFiyat], [PTaksit], [SEId]) VALUES (7, CAST(6750.00 AS Decimal(8, 2)), 5, 63)
INSERT [dbo].[Prim] ([PId], [PFiyat], [PTaksit], [SEId]) VALUES (8, CAST(2250.00 AS Decimal(8, 2)), 5, 64)
INSERT [dbo].[Prim] ([PId], [PFiyat], [PTaksit], [SEId]) VALUES (9, CAST(0.00 AS Decimal(8, 2)), 5, 65)
INSERT [dbo].[Prim] ([PId], [PFiyat], [PTaksit], [SEId]) VALUES (10, CAST(2250.00 AS Decimal(8, 2)), 3, 68)
INSERT [dbo].[Prim] ([PId], [PFiyat], [PTaksit], [SEId]) VALUES (11, CAST(2250.00 AS Decimal(8, 2)), 3, 72)
INSERT [dbo].[Prim] ([PId], [PFiyat], [PTaksit], [SEId]) VALUES (12, CAST(3000.00 AS Decimal(8, 2)), 3, 75)
INSERT [dbo].[Prim] ([PId], [PFiyat], [PTaksit], [SEId]) VALUES (13, CAST(2500.00 AS Decimal(8, 2)), 3, 76)
INSERT [dbo].[Prim] ([PId], [PFiyat], [PTaksit], [SEId]) VALUES (14, CAST(4500.00 AS Decimal(8, 2)), 5, 77)
INSERT [dbo].[Prim] ([PId], [PFiyat], [PTaksit], [SEId]) VALUES (15, CAST(2500.00 AS Decimal(8, 2)), 4, 78)
INSERT [dbo].[Prim] ([PId], [PFiyat], [PTaksit], [SEId]) VALUES (16, CAST(3000.00 AS Decimal(8, 2)), 3, 79)
INSERT [dbo].[Prim] ([PId], [PFiyat], [PTaksit], [SEId]) VALUES (17, CAST(3000.00 AS Decimal(8, 2)), 4, 80)
INSERT [dbo].[Prim] ([PId], [PFiyat], [PTaksit], [SEId]) VALUES (18, CAST(1250.00 AS Decimal(8, 2)), 0, 81)
INSERT [dbo].[Prim] ([PId], [PFiyat], [PTaksit], [SEId]) VALUES (19, CAST(1000.00 AS Decimal(8, 2)), 0, 82)
SET IDENTITY_INSERT [dbo].[Prim] OFF
SET IDENTITY_INSERT [dbo].[SigortaEttiren] ON 

INSERT [dbo].[SigortaEttiren] ([SEId], [SETc], [SEAdi], [SESoyadi], [SECinsiyet], [SEDogumTarihi], [SETelefon], [SEEposta], [SEUlke], [SEAdres]) VALUES (63, N'41526589785', N'Cengiz', N'Halim', N'E', CAST(N'1988-12-12' AS Date), N'05396756678', N'wshuwhsh@gmail.com', N'Türkiye', N'Test')
INSERT [dbo].[SigortaEttiren] ([SEId], [SETc], [SEAdi], [SESoyadi], [SECinsiyet], [SEDogumTarihi], [SETelefon], [SEEposta], [SEUlke], [SEAdres]) VALUES (64, N'63589856745', N'Narin', N'Kaya', N'K', CAST(N'2000-05-12' AS Date), N'05396756678', N'wshuwhsh@gmail.com', N'Türkiye', N'Test')
INSERT [dbo].[SigortaEttiren] ([SEId], [SETc], [SEAdi], [SESoyadi], [SECinsiyet], [SEDogumTarihi], [SETelefon], [SEEposta], [SEUlke], [SEAdres]) VALUES (65, N'41586321523', N'Leyla', N'Kaçmaz', N'K', CAST(N'1995-12-12' AS Date), N'05396756678', N'wshuwhsh@gmail.com', N'Türkiye', N'Test')
INSERT [dbo].[SigortaEttiren] ([SEId], [SETc], [SEAdi], [SESoyadi], [SECinsiyet], [SEDogumTarihi], [SETelefon], [SEEposta], [SEUlke], [SEAdres]) VALUES (66, N'52369856215', N'Kenan', N'Kurt', N'E', CAST(N'1990-12-12' AS Date), N'05396756678', N'wshuwhsh@gmail.com', N'Türkiye', N'Test')
INSERT [dbo].[SigortaEttiren] ([SEId], [SETc], [SEAdi], [SESoyadi], [SECinsiyet], [SEDogumTarihi], [SETelefon], [SEEposta], [SEUlke], [SEAdres]) VALUES (67, N'41323654783', N'Geylani', N'Konar', N'E', CAST(N'1995-12-12' AS Date), N'05396756678', N'wshuwhsh@gmail.com', N'Türkiye', N'Test')
INSERT [dbo].[SigortaEttiren] ([SEId], [SETc], [SEAdi], [SESoyadi], [SECinsiyet], [SEDogumTarihi], [SETelefon], [SEEposta], [SEUlke], [SEAdres]) VALUES (68, N'36325485698', N'Ahmet', N'Kaçmaz', N'E', CAST(N'1998-12-12' AS Date), N'05396756678', N'wshuwhsh@gmail.com', N'Türkiye', N'Test')
INSERT [dbo].[SigortaEttiren] ([SEId], [SETc], [SEAdi], [SESoyadi], [SECinsiyet], [SEDogumTarihi], [SETelefon], [SEEposta], [SEUlke], [SEAdres]) VALUES (69, N'58659689782', N'Banu', N'Alkan', N'K', CAST(N'1970-12-12' AS Date), N'05396756678', N'wshuwhsh@gmail.com', N'Türkiye', N'Test')
INSERT [dbo].[SigortaEttiren] ([SEId], [SETc], [SEAdi], [SESoyadi], [SECinsiyet], [SEDogumTarihi], [SETelefon], [SEEposta], [SEUlke], [SEAdres]) VALUES (70, N'23568695877', N'Meral', N'Ala', N'K', CAST(N'1978-12-12' AS Date), N'05396756678', N'wshuwhsh@gmail.com', N'Türkiye', N'Test')
INSERT [dbo].[SigortaEttiren] ([SEId], [SETc], [SEAdi], [SESoyadi], [SECinsiyet], [SEDogumTarihi], [SETelefon], [SEEposta], [SEUlke], [SEAdres]) VALUES (71, N'23654587965', N'Elza', N'Kar', N'K', CAST(N'1980-12-12' AS Date), N'05396756678', N'wshuwhsh@gmail.com', N'Türkiye', N'Test')
INSERT [dbo].[SigortaEttiren] ([SEId], [SETc], [SEAdi], [SESoyadi], [SECinsiyet], [SEDogumTarihi], [SETelefon], [SEEposta], [SEUlke], [SEAdres]) VALUES (72, N'25365478965', N'Ali', N'Cengiz', N'E', CAST(N'1988-12-12' AS Date), N'05396756678', N'wshuwhsh@gmail.com', N'Türkiye', N'Test')
INSERT [dbo].[SigortaEttiren] ([SEId], [SETc], [SEAdi], [SESoyadi], [SECinsiyet], [SEDogumTarihi], [SETelefon], [SEEposta], [SEUlke], [SEAdres]) VALUES (73, N'58696578965', N'Murat', N'Kaçmaz', N'E', CAST(N'2000-12-12' AS Date), N'05396756678', N'wshuwhsh@gmail.com', N'Türkiye', N'Test')
INSERT [dbo].[SigortaEttiren] ([SEId], [SETc], [SEAdi], [SESoyadi], [SECinsiyet], [SEDogumTarihi], [SETelefon], [SEEposta], [SEUlke], [SEAdres]) VALUES (74, N'23698545877', N'Narin', N'Kurtoglu', N'K', CAST(N'2000-05-12' AS Date), N'05396756678', N'wshuwhsh@gmail.com', N'Türkiye', N'Test')
INSERT [dbo].[SigortaEttiren] ([SEId], [SETc], [SEAdi], [SESoyadi], [SECinsiyet], [SEDogumTarihi], [SETelefon], [SEEposta], [SEUlke], [SEAdres]) VALUES (75, N'23659878965', N'Mazlum', N'Kazan', N'E', CAST(N'1987-11-22' AS Date), N'05396756678', N'wshuwhsh@gmail.com', N'Türkiye', N'Test')
INSERT [dbo].[SigortaEttiren] ([SEId], [SETc], [SEAdi], [SESoyadi], [SECinsiyet], [SEDogumTarihi], [SETelefon], [SEEposta], [SEUlke], [SEAdres]) VALUES (76, N'52365478523', N'Nuri', N'Kaçmaz', N'E', CAST(N'1975-01-02' AS Date), N'05396756678', N'wshuwhsh@gmail.com', N'Türkiye', N'Test')
INSERT [dbo].[SigortaEttiren] ([SEId], [SETc], [SEAdi], [SESoyadi], [SECinsiyet], [SEDogumTarihi], [SETelefon], [SEEposta], [SEUlke], [SEAdres]) VALUES (77, N'56987456852', N'Kazim', N'Karabekir', N'E', CAST(N'2000-05-12' AS Date), N'05396756678', N'wshuwhsh@gmail.com', N'Türkiye', N'Test')
INSERT [dbo].[SigortaEttiren] ([SEId], [SETc], [SEAdi], [SESoyadi], [SECinsiyet], [SEDogumTarihi], [SETelefon], [SEEposta], [SEUlke], [SEAdres]) VALUES (78, N'23658545872', N'Kerim', N'Elbey', N'E', CAST(N'1982-01-02' AS Date), N'05396756678', N'wshuwhsh@gmail.com', N'Türkiye', N'Test')
INSERT [dbo].[SigortaEttiren] ([SEId], [SETc], [SEAdi], [SESoyadi], [SECinsiyet], [SEDogumTarihi], [SETelefon], [SEEposta], [SEUlke], [SEAdres]) VALUES (79, N'36321256856', N'Baran', N'Muhammed', N'E', CAST(N'1990-05-01' AS Date), N'05396756678', N'wshuwhsh@gmail.com', N'Türkiye', N'Test')
INSERT [dbo].[SigortaEttiren] ([SEId], [SETc], [SEAdi], [SESoyadi], [SECinsiyet], [SEDogumTarihi], [SETelefon], [SEEposta], [SEUlke], [SEAdres]) VALUES (80, N'69652458632', N'Derya', N'Lale', N'K', CAST(N'1996-09-25' AS Date), N'05396756678', N'wshuwhsh@gmail.com', N'Türkiye', N'Test')
INSERT [dbo].[SigortaEttiren] ([SEId], [SETc], [SEAdi], [SESoyadi], [SECinsiyet], [SEDogumTarihi], [SETelefon], [SEEposta], [SEUlke], [SEAdres]) VALUES (81, N'45852352145', N'Fazilet', N'Dogan', N'K', CAST(N'1998-06-05' AS Date), N'05396758678', N'fazdogan@gmail.com', N'Türkiye', N'Test')
INSERT [dbo].[SigortaEttiren] ([SEId], [SETc], [SEAdi], [SESoyadi], [SECinsiyet], [SEDogumTarihi], [SETelefon], [SEEposta], [SEUlke], [SEAdres]) VALUES (82, N'58696563212', N'Ferhat', N'Celil', N'E', CAST(N'1965-09-05' AS Date), N'05396756678', N'wshuwhsh@gmail.com', N'Türkiye', N'Test')
SET IDENTITY_INSERT [dbo].[SigortaEttiren] OFF
SET IDENTITY_INSERT [dbo].[Sigortalı] ON 

INSERT [dbo].[Sigortalı] ([SId], [STc], [SAdi], [SSoyadi], [SCinsiyet], [SDogumTarihi], [STelefon], [SEposta], [SUlke], [SAdres], [SMeslek], [SYakınlık], [SKilo], [SBoy], [SEId]) VALUES (26, N'53698578565', N'Nergiz', N'Basak', N'K', CAST(N'1996-11-14' AS Date), N'05396756678', N'tarhanubeyt@gmail.com', N'Türkiye', N'Test', N'Doktar', N'Çocugu', CAST(78 AS Decimal(5, 0)), CAST(182 AS Decimal(3, 0)), 63)
INSERT [dbo].[Sigortalı] ([SId], [STc], [SAdi], [SSoyadi], [SCinsiyet], [SDogumTarihi], [STelefon], [SEposta], [SUlke], [SAdres], [SMeslek], [SYakınlık], [SKilo], [SBoy], [SEId]) VALUES (27, N'45879689652', N'Melih', N'Kurt', N'E', CAST(N'1990-02-12' AS Date), N'05396756678', N'tarhanubeyt@gmail.com', N'Türkiye', N'Test', N'Ögretmen', N'Esi', CAST(78 AS Decimal(5, 0)), CAST(182 AS Decimal(3, 0)), 63)
INSERT [dbo].[Sigortalı] ([SId], [STc], [SAdi], [SSoyadi], [SCinsiyet], [SDogumTarihi], [STelefon], [SEposta], [SUlke], [SAdres], [SMeslek], [SYakınlık], [SKilo], [SBoy], [SEId]) VALUES (28, N'45856965321', N'Mahmut', N'Baran', N'E', CAST(N'1985-12-12' AS Date), N'05396756678', N'tarhanubeyt@gmail.com', N'Türkiye', N'Test', N'Çiftçi', N'Esi', CAST(78 AS Decimal(5, 0)), CAST(182 AS Decimal(3, 0)), 63)
INSERT [dbo].[Sigortalı] ([SId], [STc], [SAdi], [SSoyadi], [SCinsiyet], [SDogumTarihi], [STelefon], [SEposta], [SUlke], [SAdres], [SMeslek], [SYakınlık], [SKilo], [SBoy], [SEId]) VALUES (29, N'56987423142', N'Neriman', N'Kaya', N'K', CAST(N'2021-02-12' AS Date), N'05396756678', N'tarhanubeyt@gmail.com', N'Türkiye', N'Test', N'Memur', N'Çocugu', CAST(78 AS Decimal(5, 0)), CAST(182 AS Decimal(3, 0)), 64)
INSERT [dbo].[Sigortalı] ([SId], [STc], [SAdi], [SSoyadi], [SCinsiyet], [SDogumTarihi], [STelefon], [SEposta], [SUlke], [SAdres], [SMeslek], [SYakınlık], [SKilo], [SBoy], [SEId]) VALUES (30, N'23658954123', N'Nergiz', N'Kaya', N'K', CAST(N'1996-12-12' AS Date), N'05396756678', N'tarhanubeyt@gmail.com', N'Türkiye', N'Test', N'Memur', N'Esi', CAST(78 AS Decimal(5, 0)), CAST(182 AS Decimal(3, 0)), 68)
INSERT [dbo].[Sigortalı] ([SId], [STc], [SAdi], [SSoyadi], [SCinsiyet], [SDogumTarihi], [STelefon], [SEposta], [SUlke], [SAdres], [SMeslek], [SYakınlık], [SKilo], [SBoy], [SEId]) VALUES (31, N'25365478966', N'Helin', N'Yazi', N'K', CAST(N'1985-12-12' AS Date), N'05396756678', N'tarhanubeyt@gmail.com', N'Türkiye', N'Test', N'Memur', N'Esi', CAST(78 AS Decimal(5, 0)), CAST(182 AS Decimal(3, 0)), 72)
INSERT [dbo].[Sigortalı] ([SId], [STc], [SAdi], [SSoyadi], [SCinsiyet], [SDogumTarihi], [STelefon], [SEposta], [SUlke], [SAdres], [SMeslek], [SYakınlık], [SKilo], [SBoy], [SEId]) VALUES (32, N'58696547856', N'Kadir', N'Elmas', N'E', CAST(N'2000-01-12' AS Date), N'05396756678', N'tarhanubeyt@gmail.com', N'Türkiye', N'Test', N'Memur', N'Çocugu', CAST(78 AS Decimal(5, 0)), CAST(182 AS Decimal(3, 0)), 75)
INSERT [dbo].[Sigortalı] ([SId], [STc], [SAdi], [SSoyadi], [SCinsiyet], [SDogumTarihi], [STelefon], [SEposta], [SUlke], [SAdres], [SMeslek], [SYakınlık], [SKilo], [SBoy], [SEId]) VALUES (33, N'23658987456', N'Hazal', N'Kaya', N'K', CAST(N'2021-01-12' AS Date), N'05396756678', N'tarhanubeyt@gmail.com', N'Türkiye', N'Test', N'Memur', N'Kendisi', CAST(78 AS Decimal(5, 0)), CAST(182 AS Decimal(3, 0)), 75)
INSERT [dbo].[Sigortalı] ([SId], [STc], [SAdi], [SSoyadi], [SCinsiyet], [SDogumTarihi], [STelefon], [SEposta], [SUlke], [SAdres], [SMeslek], [SYakınlık], [SKilo], [SBoy], [SEId]) VALUES (34, N'32658987456', N'Hamdiye', N'Yildiz', N'K', CAST(N'1978-03-25' AS Date), N'05396756678', N'tarhanubeyt@gmail.com', N'Türkiye', N'Test', N'Doktar', N'Esi', CAST(65 AS Decimal(5, 0)), CAST(175 AS Decimal(3, 0)), 76)
INSERT [dbo].[Sigortalı] ([SId], [STc], [SAdi], [SSoyadi], [SCinsiyet], [SDogumTarihi], [STelefon], [SEposta], [SUlke], [SAdres], [SMeslek], [SYakınlık], [SKilo], [SBoy], [SEId]) VALUES (35, N'36548932145', N'Hamza', N'Yildiz', N'E', CAST(N'2021-12-12' AS Date), N'05396756678', N'tarhanubeyt@gmail.com', N'Türkiye', N'Test', N'Memur', N'Çocugu', CAST(12 AS Decimal(5, 0)), CAST(50 AS Decimal(3, 0)), 76)
INSERT [dbo].[Sigortalı] ([SId], [STc], [SAdi], [SSoyadi], [SCinsiyet], [SDogumTarihi], [STelefon], [SEposta], [SUlke], [SAdres], [SMeslek], [SYakınlık], [SKilo], [SBoy], [SEId]) VALUES (36, N'25659878965', N'Nuran', N'Karabekir', N'K', CAST(N'2000-02-02' AS Date), N'05396756678', N'tarhanubeyt@gmail.com', N'Türkiye', N'Test', N'Doktar', N'Esi', CAST(78 AS Decimal(5, 0)), CAST(182 AS Decimal(3, 0)), 77)
INSERT [dbo].[Sigortalı] ([SId], [STc], [SAdi], [SSoyadi], [SCinsiyet], [SDogumTarihi], [STelefon], [SEposta], [SUlke], [SAdres], [SMeslek], [SYakınlık], [SKilo], [SBoy], [SEId]) VALUES (37, N'56985263212', N'Hamza', N'Karabekir', N'E', CAST(N'2021-01-01' AS Date), N'05396756678', N'tarhanubeyt@gmail.com', N'Türkiye', N'Test', N'Memur', N'Çocugu', CAST(21 AS Decimal(5, 0)), CAST(50 AS Decimal(3, 0)), 77)
INSERT [dbo].[Sigortalı] ([SId], [STc], [SAdi], [SSoyadi], [SCinsiyet], [SDogumTarihi], [STelefon], [SEposta], [SUlke], [SAdres], [SMeslek], [SYakınlık], [SKilo], [SBoy], [SEId]) VALUES (38, N'58696365214', N'Zuhal', N'Elbey', N'K', CAST(N'1996-01-01' AS Date), N'05396756678', N'tarhanubeyt@gmail.com', N'Türkiye', N'Test', N'Doktar', N'Esi', CAST(78 AS Decimal(5, 0)), CAST(182 AS Decimal(3, 0)), 78)
INSERT [dbo].[Sigortalı] ([SId], [STc], [SAdi], [SSoyadi], [SCinsiyet], [SDogumTarihi], [STelefon], [SEposta], [SUlke], [SAdres], [SMeslek], [SYakınlık], [SKilo], [SBoy], [SEId]) VALUES (39, N'63654785985', N'Jale', N'Elbey', N'K', CAST(N'2020-12-12' AS Date), N'05396756678', N'tarhanubeyt@gmail.com', N'Türkiye', N'Test', N'Çiftçi', N'Çocugu', CAST(25 AS Decimal(5, 0)), CAST(50 AS Decimal(3, 0)), 78)
INSERT [dbo].[Sigortalı] ([SId], [STc], [SAdi], [SSoyadi], [SCinsiyet], [SDogumTarihi], [STelefon], [SEposta], [SUlke], [SAdres], [SMeslek], [SYakınlık], [SKilo], [SBoy], [SEId]) VALUES (40, N'32569852314', N'Hazal', N'Muhammed', N'K', CAST(N'1992-12-12' AS Date), N'05396756678', N'tarhanubeyt@gmail.com', N'Türkiye', N'Test', N'Ögretmen', N'Esi', CAST(65 AS Decimal(5, 0)), CAST(165 AS Decimal(3, 0)), 79)
INSERT [dbo].[Sigortalı] ([SId], [STc], [SAdi], [SSoyadi], [SCinsiyet], [SDogumTarihi], [STelefon], [SEposta], [SUlke], [SAdres], [SMeslek], [SYakınlık], [SKilo], [SBoy], [SEId]) VALUES (41, N'56987456853', N'Mahmut', N'Muhammed', N'E', CAST(N'2020-12-12' AS Date), N'05396756678', N'tarhanubeyt@gmail.com', N'Türkiye', N'Test', N'Avukat', N'Çocugu', CAST(35 AS Decimal(5, 0)), CAST(120 AS Decimal(3, 0)), 79)
INSERT [dbo].[Sigortalı] ([SId], [STc], [SAdi], [SSoyadi], [SCinsiyet], [SDogumTarihi], [STelefon], [SEposta], [SUlke], [SAdres], [SMeslek], [SYakınlık], [SKilo], [SBoy], [SEId]) VALUES (42, N'69856321479', N'Ümit', N'Lale', N'E', CAST(N'1990-06-30' AS Date), N'05396756678', N'tarhanubeyt@gmail.com', N'Türkiye', N'Test', N'Memur', N'Esi', CAST(85 AS Decimal(5, 0)), CAST(178 AS Decimal(3, 0)), 80)
INSERT [dbo].[Sigortalı] ([SId], [STc], [SAdi], [SSoyadi], [SCinsiyet], [SDogumTarihi], [STelefon], [SEposta], [SUlke], [SAdres], [SMeslek], [SYakınlık], [SKilo], [SBoy], [SEId]) VALUES (43, N'36521456985', N'Merve', N'Lale', N'K', CAST(N'2021-03-03' AS Date), N'05396756678', N'tarhanubeyt@gmail.com', N'Türkiye', N'Test', N'Yok', N'Çocugu', CAST(23 AS Decimal(5, 0)), CAST(70 AS Decimal(3, 0)), 80)
INSERT [dbo].[Sigortalı] ([SId], [STc], [SAdi], [SSoyadi], [SCinsiyet], [SDogumTarihi], [STelefon], [SEposta], [SUlke], [SAdres], [SMeslek], [SYakınlık], [SKilo], [SBoy], [SEId]) VALUES (44, N'45632145859', N'Fitnat', N'Dogan', N'K', CAST(N'2017-12-12' AS Date), N'05396756678', N'fazdogan@gmail.com', N'Türkiye', N'Test', N'Yok', N'Çocugu', CAST(30 AS Decimal(5, 0)), CAST(150 AS Decimal(3, 0)), 81)
INSERT [dbo].[Sigortalı] ([SId], [STc], [SAdi], [SSoyadi], [SCinsiyet], [SDogumTarihi], [STelefon], [SEposta], [SUlke], [SAdres], [SMeslek], [SYakınlık], [SKilo], [SBoy], [SEId]) VALUES (45, N'56965287458', N'Derya', N'Yigit', N'K', CAST(N'1980-05-05' AS Date), N'05396756678', N'derya@gmail.com', N'Türkiye', N'Test', N'Avukat', N'Esi', CAST(56 AS Decimal(5, 0)), CAST(165 AS Decimal(3, 0)), 82)
SET IDENTITY_INSERT [dbo].[Sigortalı] OFF
ALTER TABLE [dbo].[Fatura]  WITH CHECK ADD  CONSTRAINT [FK_Fatura_SigortaEttiren] FOREIGN KEY([SEId])
REFERENCES [dbo].[SigortaEttiren] ([SEId])
GO
ALTER TABLE [dbo].[Fatura] CHECK CONSTRAINT [FK_Fatura_SigortaEttiren]
GO
ALTER TABLE [dbo].[Prim]  WITH CHECK ADD  CONSTRAINT [FK_Prim_SigortaEttiren] FOREIGN KEY([SEId])
REFERENCES [dbo].[SigortaEttiren] ([SEId])
GO
ALTER TABLE [dbo].[Prim] CHECK CONSTRAINT [FK_Prim_SigortaEttiren]
GO
ALTER TABLE [dbo].[Sigortalı]  WITH CHECK ADD  CONSTRAINT [FK_Sigortalı_SigortaEttiren] FOREIGN KEY([SEId])
REFERENCES [dbo].[SigortaEttiren] ([SEId])
GO
ALTER TABLE [dbo].[Sigortalı] CHECK CONSTRAINT [FK_Sigortalı_SigortaEttiren]
GO
/****** Object:  StoredProcedure [dbo].[AdminSelect]    Script Date: 13.02.2022 20:30:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[AdminSelect](
@SEId int=0,
@SETc varchar(11)='',
@SEAdi varchar(50)='',
@SESoyadi varchar(50)='',
@StatementType nvarchar(20) = '')
as 
	begin
		if (@StatementType='Select')
			begin
			SELECT  SigortaEttiren.SETc,SigortaEttiren.SEAdi,SigortaEttiren.SESoyadi,SigortaEttiren.SECinsiyet,SigortaEttiren.SEDogumTarihi,SigortaEttiren.SETelefon,SigortaEttiren.SEEposta,SigortaEttiren.SEUlke,SigortaEttiren.SEAdres,isnull(Prim.PFiyat,0) as PFiyat,isnull(Prim.PTaksit,0) as PTaksit,isnull (Fatura.FId,0) as FId FROM SigortaEttiren  LEFT JOIN Prim ON SigortaEttiren.SEId=Prim.SEId  FULL OUTER JOIN Fatura on SigortaEttiren.SEId=Fatura.SEId   where SigortaEttiren.SEAdi LIKE '%'+ @SEAdi +'%' and SigortaEttiren.SETc LIKE '%' + @SETc +'%' and SigortaEttiren.SESoyadi LIKE '%' + @SESoyadi +'%'
			end
		
  end
 
GO
/****** Object:  StoredProcedure [dbo].[BupaAcibademCRUD]    Script Date: 13.02.2022 20:30:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[BupaAcibademCRUD](
@SEId int,
@SETc varchar(11),
@SEAdi varchar(50),
@SESoyadi varchar(50),
@SECinsiyet nchar(1),
@SEDogumTarihi date,
@SETelefon varchar(20),
@SEEposta varchar(50),
@SEUlke varchar(50),
@SEAdres varchar(100),
@StatementType NVARCHAR(20) = '')
as 
	begin
		if (@StatementType='Insert')
			begin
				insert into SigortaEttiren(SEId,SETc,SEAdi,SESoyadi,SECinsiyet,SEDogumTarihi,SETelefon,SEEposta,SEUlke,SEAdres)
				values(@SEId,@SETc,@SEAdi,@SESoyadi,@SECinsiyet,@SEDogumTarihi,@SETelefon,@SEEposta,@SEUlke,@SEAdres)
			end
		

		if (@StatementType='Select')
			begin
				select * from SigortaEttiren
			end


		if (@StatementType='Update')
			begin
			update SigortaEttiren
			set SETc=@SETc,
				SEAdi=@SEAdi,
				SESoyadi=@SESoyadi,
				SECinsiyet=@SECinsiyet,
				SEDogumTarihi=@SEDogumTarihi,
				SETelefon=@SETelefon,
				SEEposta=@SEEposta,
				SEUlke=@SEAdres,
				SEAdres=@SEAdres
			where SEId=@SEId
			end

		if (@StatementType='Find')
			begin
				select * from SigortaEttiren where SEId=@SEId
			end

		else if (@StatementType = 'Delete')
        begin
            delete from SigortaEttiren
            where   SEId=@SEId
        end
  end

GO
/****** Object:  StoredProcedure [dbo].[FaturaCrud]    Script Date: 13.02.2022 20:30:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[FaturaCrud](
@FId int=0,
@SEId int=null,
@StatementType nvarchar(20) = '')
as 
	begin
		if (@StatementType='Insert')
			begin
				insert into Fatura(SEId)
				values(@SEId)
			end
		

		


		

		if (@StatementType='Find')
			begin
				select * from Fatura where FId=@FId or SEId=@SEId
			end


		else if (@StatementType = 'Delete')
        begin
            delete from Fatura
            where   SEId=@SEId OR FId=@FId
        end
  end
GO
/****** Object:  StoredProcedure [dbo].[PrimCrud]    Script Date: 13.02.2022 20:30:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PrimCrud](
@PId int=0,
@PFiyat decimal(8,2)=null,

@PTaksit int=null,

@SEId int=null,

@StatementType nvarchar(20) = '')
as 
	begin
		if (@StatementType='Insert')
			begin
				insert into Prim(PFiyat,PTaksit,SEId)
				values(@PFiyat,@PTaksit,@SEId)
			end
		

		if (@StatementType='Select')
			begin
				select * from Prim where SEId=@SEId
			end


		if (@StatementType='Update')
			begin
			update Prim
			set PFiyat=@PFiyat,
				PTaksit=@PTaksit,
				SEId=@SEId
				
			where PId=@PId
			end

		if (@StatementType='Find')
			begin
				select * from Prim where PId=@PId
			end

		else if (@StatementType = 'Delete')
        begin
            delete from Prim
            where   PId=@PId
        end
  end

GO
/****** Object:  StoredProcedure [dbo].[SigortaEttirenCrud]    Script Date: 13.02.2022 20:30:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SigortaEttirenCrud](
@SEId int=0,
@SETc varchar(11)=null,
@SEAdi varchar(50)=null,
@SESoyadi varchar(50)=null,
@SECinsiyet nchar(1)=null,
@SEDogumTarihi date=null,
@SETelefon varchar(20)=null,
@SEEposta varchar(50)=null,
@SEUlke varchar(50)=null,
@SEAdres varchar(100)=null,
@StatementType nvarchar(20) = '')
as 
	begin
		if (@StatementType='Insert')
			begin
				insert into SigortaEttiren(SETc,SEAdi,SESoyadi,SECinsiyet,SEDogumTarihi,SETelefon,SEEposta,SEUlke,SEAdres)
				values( @SETc,dbo.FUpper( @SEAdi),dbo.FUpper(@SESoyadi),dbo.FUpper(@SECinsiyet),@SEDogumTarihi,@SETelefon,LOWER(@SEEposta),dbo.FUpper(@SEUlke),dbo.FUpper(@SEAdres))
			end


			if (@StatementType='Admin')
			begin
				SELECT  SigortaEttiren.SETc,SigortaEttiren.SEAdi,SigortaEttiren.SESoyadi,SigortaEttiren.SECinsiyet,SigortaEttiren.SEDogumTarihi,SigortaEttiren.SETelefon,SigortaEttiren.SEEposta,SigortaEttiren.SEUlke,SigortaEttiren.SEAdres,Prim.PFiyat,Prim.PTaksit,Fatura.FId FROM SigortaEttiren LEFT JOIN Prim ON SigortaEttiren.SEId=Prim.SEId  FULL OUTER JOIN Fatura on SigortaEttiren.SEId=Fatura.SEId
			end
		

		if (@StatementType='Select')
			begin
				select * from SigortaEttiren
			end


		if (@StatementType='Update')
			begin
			update SigortaEttiren
			set SETc=@SETc,
				SEAdi=dbo.FUpper(@SEAdi),
				SESoyadi=dbo.FUpper(@SESoyadi),
				SECinsiyet=dbo.FUpper(@SECinsiyet),
				SEDogumTarihi=@SEDogumTarihi,
				SETelefon=@SETelefon,
				SEEposta=LOWER(@SEEposta),
				SEUlke=dbo.FUpper(@SEAdres),
				SEAdres=dbo.FUpper(@SEAdres)
			where SEId=@SEId
			end

		if (@StatementType='Find')
			begin
				select * from SigortaEttiren where SEId=@SEId or SETc=@SETc
			end

		else if (@StatementType = 'Delete')
        begin
            delete from SigortaEttiren
            where   SEId=@SEId
        end
  end

GO
/****** Object:  StoredProcedure [dbo].[SigortalıCrud]    Script Date: 13.02.2022 20:30:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SigortalıCrud](
@SId int=0,
@STc varchar(11)=null,
@SAdi varchar(50)=null,
@SSoyadi varchar(50)=null,
@SCinsiyet nchar(1)=null,
@SDogumTarihi date=null,
@STelefon varchar(20)=null,
@SEposta varchar(50)=null,
@SUlke varchar(50)=null,
@SAdres varchar(100)=null,
@SMeslek varchar(20)=null,
@SYakınlık varchar(10)=null,
@SKilo decimal(3,0)=null,
@SBoy decimal(3,0)=null,
@SEId int=null,
@StatementType nvarchar(20) = '')
as 
	begin
		if (@StatementType='Insert')
			begin
			
				insert into Sigortalı(STc,SAdi,SSoyadi,SCinsiyet,SDogumTarihi,STelefon,SEposta,SUlke,SAdres,SMeslek,SYakınlık,SKilo,SBoy,SEId)
				values(@STc,dbo.FUpper(@SAdi),dbo.FUpper(@SSoyadi),dbo.FUpper(@SCinsiyet),@SDogumTarihi,@STelefon,LOWER(@SEposta),dbo.FUpper(@SUlke),dbo.FUpper(@SAdres),dbo.FUpper(@SMeslek),dbo.FUpper(@SYakınlık),@SKilo,@SBoy,@SEId)
			
			end
		

		if (@StatementType='Select')
			begin
				select * from Sigortalı where SEId=@SEId
			end


		if (@StatementType='Update')
			begin
			update Sigortalı
			set STc=@STc,
				SAdi=dbo.FUpper(@SAdi),
				SSoyadi=dbo.FUpper(@SSoyadi),
				SCinsiyet=dbo.FUpper(@SCinsiyet),
				SDogumTarihi=@SDogumTarihi,
				STelefon=@STelefon,
				SEposta=LOWER(@SEposta),
				SUlke=dbo.FUpper(@SUlke),
				SAdres=dbo.FUpper(@SAdres),
				SMeslek=dbo.FUpper(@SMeslek),
				SYakınlık=dbo.FUpper(@SYakınlık),
				SKilo=@SKilo,
				SBoy=@SBoy,
				SEId=@SEId
			where SEId=@SEId
			end

		if (@StatementType='Find')
			begin
				select * from Sigortalı where SId=@SId or STc=@STc
			end

		else if (@StatementType = 'Delete')
        begin
            delete from Sigortalı
            where   SId=@SId
        end
  end
GO
USE [master]
GO
ALTER DATABASE [BupaAcibadem] SET  READ_WRITE 
GO
