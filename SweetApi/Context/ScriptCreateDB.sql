USE [DbSweet]
GO
/****** Object:  Table [dbo].[ASSICURAZIONI]    Script Date: 17/03/2021 13:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ASSICURAZIONI](
	[pk_assicurazione] [bigint] IDENTITY(1,1) NOT NULL,
	[CodAss] [nchar](200) NULL,
	[Nome] [nchar](250) NULL,
	[Sede] [nchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Auth]    Script Date: 17/03/2021 13:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auth](
	[pk_user] [int] IDENTITY(1,1) NOT NULL,
	[password] [nvarchar](250) NULL,
	[email] [nvarchar](250) NULL,
	[token] [nvarchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Auto]    Script Date: 17/03/2021 13:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auto](
	[pk_auto] [bigint] IDENTITY(1,1) NOT NULL,
	[Targa] [nchar](50) NULL,
	[Marca] [nchar](250) NULL,
	[Cilindrata] [int] NULL,
	[Potenza] [int] NULL,
	[CodF] [nchar](16) NULL,
	[CodAss] [nchar](250) NULL,
 CONSTRAINT [PK_Auto] PRIMARY KEY CLUSTERED 
(
	[pk_auto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AUTOCOINVOLTE]    Script Date: 17/03/2021 13:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AUTOCOINVOLTE](
	[pk_autoCoinvolte] [bigint] IDENTITY(1,1) NOT NULL,
	[CodS] [nchar](200) NULL,
	[Targa] [nchar](200) NULL,
	[ImportoDelDanno] [money] NULL,
 CONSTRAINT [PK_AUTOCOINVOLTE] PRIMARY KEY CLUSTERED 
(
	[pk_autoCoinvolte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dolce]    Script Date: 17/03/2021 13:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dolce](
	[Pk_Dolce] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](200) NULL,
	[Descrizione] [nvarchar](max) NULL,
	[Data] [datetime] NULL,
	[Prezzo] [money] NULL,
 CONSTRAINT [PK_Sweets] PRIMARY KEY CLUSTERED 
(
	[Pk_Dolce] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingrediente]    Script Date: 17/03/2021 13:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingrediente](
	[Pk_ingrediente] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](500) NULL,
 CONSTRAINT [PK_Ingrediente] PRIMARY KEY CLUSTERED 
(
	[Pk_ingrediente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Misura]    Script Date: 17/03/2021 13:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Misura](
	[PK_Misura] [int] IDENTITY(1,1) NOT NULL,
	[Descrizione] [nchar](250) NULL,
 CONSTRAINT [PK_Misura] PRIMARY KEY CLUSTERED 
(
	[PK_Misura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROPRIETARI]    Script Date: 17/03/2021 13:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROPRIETARI](
	[pk_propretario] [bigint] IDENTITY(1,1) NOT NULL,
	[CodF] [nchar](16) NULL,
	[Nome] [nchar](250) NULL,
	[Residenza] [nchar](250) NULL,
 CONSTRAINT [PK_PROPRIETARI] PRIMARY KEY CLUSTERED 
(
	[pk_propretario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ricetta]    Script Date: 17/03/2021 13:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ricetta](
	[Pk_Ricetta] [int] IDENTITY(1,1) NOT NULL,
	[Fk_Ingrediente] [int] NULL,
	[Fk_Dolce] [int] NULL,
	[FK_Misura] [int] NULL,
	[Quantita] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Ricetta] PRIMARY KEY CLUSTERED 
(
	[Pk_Ricetta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SINISTRI]    Script Date: 17/03/2021 13:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SINISTRI](
	[pk_sinistri] [bigint] IDENTITY(1,1) NOT NULL,
	[CodS] [nchar](200) NULL,
	[Localita] [nchar](200) NULL,
	[Data] [date] NULL,
 CONSTRAINT [PK_SINISTRI] PRIMARY KEY CLUSTERED 
(
	[pk_sinistri] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vetrina]    Script Date: 17/03/2021 13:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vetrina](
	[Pk_Vetrina] [int] IDENTITY(1,1) NOT NULL,
	[Fk_Dolce] [int] NULL,
	[Data] [datetime] NULL,
	[Stato] [nchar](250) NULL,
	[Prezzo] [money] NULL,
 CONSTRAINT [PK_Vetrina] PRIMARY KEY CLUSTERED 
(
	[Pk_Vetrina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ASSICURAZIONI] ON 

INSERT [dbo].[ASSICURAZIONI] ([pk_assicurazione], [CodAss], [Nome], [Sede]) VALUES (1, N'1                                                                                                                                                                                                       ', N'SARA                                                                                                                                                                                                                                                      ', N'COSENZA                                                                                                                                                                                                                                                   ')
INSERT [dbo].[ASSICURAZIONI] ([pk_assicurazione], [CodAss], [Nome], [Sede]) VALUES (2, N'2                                                                                                                                                                                                       ', N'HDI                                                                                                                                                                                                                                                       ', N'ROMA                                                                                                                                                                                                                                                      ')
INSERT [dbo].[ASSICURAZIONI] ([pk_assicurazione], [CodAss], [Nome], [Sede]) VALUES (3, N'3                                                                                                                                                                                                       ', N'ADMIRAL                                                                                                                                                                                                                                                   ', N'FIRENZE                                                                                                                                                                                                                                                   ')
INSERT [dbo].[ASSICURAZIONI] ([pk_assicurazione], [CodAss], [Nome], [Sede]) VALUES (4, N'4                                                                                                                                                                                                       ', N'GENERALI                                                                                                                                                                                                                                                  ', N'MILANO                                                                                                                                                                                                                                                    ')
INSERT [dbo].[ASSICURAZIONI] ([pk_assicurazione], [CodAss], [Nome], [Sede]) VALUES (5, N'5                                                                                                                                                                                                       ', N'LOYD                                                                                                                                                                                                                                                      ', N'PISA                                                                                                                                                                                                                                                      ')
SET IDENTITY_INSERT [dbo].[ASSICURAZIONI] OFF
GO
SET IDENTITY_INSERT [dbo].[Auth] ON 

INSERT [dbo].[Auth] ([pk_user], [password], [email], [token]) VALUES (1, N'12345678', N'luana@gmail.com', N'token19')
INSERT [dbo].[Auth] ([pk_user], [password], [email], [token]) VALUES (2, N'12345678', N'maria@gmail.com', NULL)
SET IDENTITY_INSERT [dbo].[Auth] OFF
GO
SET IDENTITY_INSERT [dbo].[Auto] ON 

INSERT [dbo].[Auto] ([pk_auto], [Targa], [Marca], [Cilindrata], [Potenza], [CodF], [CodAss]) VALUES (1, N'DL600SK                                           ', N'FIAT                                                                                                                                                                                                                                                      ', 2800, 100, N'AVACGA40F19S135V', N'1                                                                                                                                                                                                                                                         ')
INSERT [dbo].[Auto] ([pk_auto], [Targa], [Marca], [Cilindrata], [Potenza], [CodF], [CodAss]) VALUES (2, N'WD120SF                                           ', N'BMW                                                                                                                                                                                                                                                       ', 2200, 160, N'BDSVAL42D10R135S', N'2                                                                                                                                                                                                                                                         ')
INSERT [dbo].[Auto] ([pk_auto], [Targa], [Marca], [Cilindrata], [Potenza], [CodF], [CodAss]) VALUES (3, N'SP119BO                                           ', N'SEAT                                                                                                                                                                                                                                                      ', 1600, 100, N'ABCDEF12G34H567I', N'3                                                                                                                                                                                                                                                         ')
INSERT [dbo].[Auto] ([pk_auto], [Targa], [Marca], [Cilindrata], [Potenza], [CodF], [CodAss]) VALUES (4, N'IT000MI                                           ', N'OPEL                                                                                                                                                                                                                                                      ', 800, 100, N'AVACGA40F19S135V', N'5                                                                                                                                                                                                                                                         ')
INSERT [dbo].[Auto] ([pk_auto], [Targa], [Marca], [Cilindrata], [Potenza], [CodF], [CodAss]) VALUES (5, N'MO109CF                                           ', N'FERRARI                                                                                                                                                                                                                                                   ', 3800, 480, N'AVACGA40F19S135V', N'1                                                                                                                                                                                                                                                         ')
SET IDENTITY_INSERT [dbo].[Auto] OFF
GO
SET IDENTITY_INSERT [dbo].[AUTOCOINVOLTE] ON 

INSERT [dbo].[AUTOCOINVOLTE] ([pk_autoCoinvolte], [CodS], [Targa], [ImportoDelDanno]) VALUES (1, N'1                                                                                                                                                                                                       ', N'DL600SK                                                                                                                                                                                                 ', 250.0000)
INSERT [dbo].[AUTOCOINVOLTE] ([pk_autoCoinvolte], [CodS], [Targa], [ImportoDelDanno]) VALUES (2, N'2                                                                                                                                                                                                       ', N'WD120SF                                                                                                                                                                                                 ', 100.0000)
INSERT [dbo].[AUTOCOINVOLTE] ([pk_autoCoinvolte], [CodS], [Targa], [ImportoDelDanno]) VALUES (3, N'3                                                                                                                                                                                                       ', N'SP119BO                                                                                                                                                                                                 ', 300.0000)
INSERT [dbo].[AUTOCOINVOLTE] ([pk_autoCoinvolte], [CodS], [Targa], [ImportoDelDanno]) VALUES (4, N'4                                                                                                                                                                                                       ', N'DL600SK                                                                                                                                                                                                 ', 500.0000)
INSERT [dbo].[AUTOCOINVOLTE] ([pk_autoCoinvolte], [CodS], [Targa], [ImportoDelDanno]) VALUES (5, N'5                                                                                                                                                                                                       ', N'IT000MI                                                                                                                                                                                                 ', 600.0000)
SET IDENTITY_INSERT [dbo].[AUTOCOINVOLTE] OFF
GO
SET IDENTITY_INSERT [dbo].[Dolce] ON 

INSERT [dbo].[Dolce] ([Pk_Dolce], [Nome], [Descrizione], [Data], [Prezzo]) VALUES (1, N'Torta Paradiso', N'Torta Paradiso', CAST(N'2021-03-10T13:22:16.287' AS DateTime), 1000.0000)
INSERT [dbo].[Dolce] ([Pk_Dolce], [Nome], [Descrizione], [Data], [Prezzo]) VALUES (2, N'Torta Di Mele', N'Torta Di Mele', CAST(N'2021-03-10T13:22:16.287' AS DateTime), 19.3000)
INSERT [dbo].[Dolce] ([Pk_Dolce], [Nome], [Descrizione], [Data], [Prezzo]) VALUES (3, N'Crostata di Frutta', N'Crostata di Frutta', CAST(N'2021-03-10T13:22:16.287' AS DateTime), 19.3000)
SET IDENTITY_INSERT [dbo].[Dolce] OFF
GO
SET IDENTITY_INSERT [dbo].[Ingrediente] ON 

INSERT [dbo].[Ingrediente] ([Pk_ingrediente], [Nome]) VALUES (1, N'Farina')
INSERT [dbo].[Ingrediente] ([Pk_ingrediente], [Nome]) VALUES (2, N'Latte')
INSERT [dbo].[Ingrediente] ([Pk_ingrediente], [Nome]) VALUES (3, N'Uova')
INSERT [dbo].[Ingrediente] ([Pk_ingrediente], [Nome]) VALUES (4, N'Acqua')
INSERT [dbo].[Ingrediente] ([Pk_ingrediente], [Nome]) VALUES (5, N'Zucchero')
INSERT [dbo].[Ingrediente] ([Pk_ingrediente], [Nome]) VALUES (6, N'Sale')
INSERT [dbo].[Ingrediente] ([Pk_ingrediente], [Nome]) VALUES (7, N'Vaniglia')
INSERT [dbo].[Ingrediente] ([Pk_ingrediente], [Nome]) VALUES (8, N'Mela')
INSERT [dbo].[Ingrediente] ([Pk_ingrediente], [Nome]) VALUES (9, N'Lievito')
INSERT [dbo].[Ingrediente] ([Pk_ingrediente], [Nome]) VALUES (10, N'Fragole')
INSERT [dbo].[Ingrediente] ([Pk_ingrediente], [Nome]) VALUES (11, N'Crema')
SET IDENTITY_INSERT [dbo].[Ingrediente] OFF
GO
SET IDENTITY_INSERT [dbo].[Misura] ON 

INSERT [dbo].[Misura] ([PK_Misura], [Descrizione]) VALUES (1, N'Cucchiaio                                                                                                                                                                                                                                                 ')
INSERT [dbo].[Misura] ([PK_Misura], [Descrizione]) VALUES (2, N'Cucchiaino                                                                                                                                                                                                                                                ')
INSERT [dbo].[Misura] ([PK_Misura], [Descrizione]) VALUES (3, N'Bicchiere                                                                                                                                                                                                                                                 ')
INSERT [dbo].[Misura] ([PK_Misura], [Descrizione]) VALUES (4, N'G                                                                                                                                                                                                                                                         ')
INSERT [dbo].[Misura] ([PK_Misura], [Descrizione]) VALUES (5, N'Cl                                                                                                                                                                                                                                                        ')
INSERT [dbo].[Misura] ([PK_Misura], [Descrizione]) VALUES (6, N'Ml                                                                                                                                                                                                                                                        ')
INSERT [dbo].[Misura] ([PK_Misura], [Descrizione]) VALUES (7, N'Unità                                                                                                                                                                                                                                                     ')
SET IDENTITY_INSERT [dbo].[Misura] OFF
GO
SET IDENTITY_INSERT [dbo].[PROPRIETARI] ON 

INSERT [dbo].[PROPRIETARI] ([pk_propretario], [CodF], [Nome], [Residenza]) VALUES (1, N'AVACGA40F19S135V', N'Giovanni                                                                                                                                                                                                                                                  ', N'ROMA                                                                                                                                                                                                                                                      ')
INSERT [dbo].[PROPRIETARI] ([pk_propretario], [CodF], [Nome], [Residenza]) VALUES (2, N'BDSVAL42D10R135S', N'Sandro                                                                                                                                                                                                                                                    ', N'FIRENZE                                                                                                                                                                                                                                                   ')
INSERT [dbo].[PROPRIETARI] ([pk_propretario], [CodF], [Nome], [Residenza]) VALUES (3, N'ABCDEF12G34H567I', N'Maria                                                                                                                                                                                                                                                     ', N'MILANO                                                                                                                                                                                                                                                    ')
SET IDENTITY_INSERT [dbo].[PROPRIETARI] OFF
GO
SET IDENTITY_INSERT [dbo].[Ricetta] ON 

INSERT [dbo].[Ricetta] ([Pk_Ricetta], [Fk_Ingrediente], [Fk_Dolce], [FK_Misura], [Quantita]) VALUES (1, 1, 1, 4, CAST(500 AS Decimal(18, 0)))
INSERT [dbo].[Ricetta] ([Pk_Ricetta], [Fk_Ingrediente], [Fk_Dolce], [FK_Misura], [Quantita]) VALUES (2, 3, 1, 7, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[Ricetta] ([Pk_Ricetta], [Fk_Ingrediente], [Fk_Dolce], [FK_Misura], [Quantita]) VALUES (3, 2, 1, 3, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[Ricetta] ([Pk_Ricetta], [Fk_Ingrediente], [Fk_Dolce], [FK_Misura], [Quantita]) VALUES (4, 5, 1, 4, CAST(250 AS Decimal(18, 0)))
INSERT [dbo].[Ricetta] ([Pk_Ricetta], [Fk_Ingrediente], [Fk_Dolce], [FK_Misura], [Quantita]) VALUES (5, 9, 1, 4, CAST(25 AS Decimal(18, 0)))
INSERT [dbo].[Ricetta] ([Pk_Ricetta], [Fk_Ingrediente], [Fk_Dolce], [FK_Misura], [Quantita]) VALUES (6, 1, 2, 4, CAST(500 AS Decimal(18, 0)))
INSERT [dbo].[Ricetta] ([Pk_Ricetta], [Fk_Ingrediente], [Fk_Dolce], [FK_Misura], [Quantita]) VALUES (7, 3, 2, 7, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[Ricetta] ([Pk_Ricetta], [Fk_Ingrediente], [Fk_Dolce], [FK_Misura], [Quantita]) VALUES (8, 2, 2, 3, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[Ricetta] ([Pk_Ricetta], [Fk_Ingrediente], [Fk_Dolce], [FK_Misura], [Quantita]) VALUES (9, 5, 2, 4, CAST(250 AS Decimal(18, 0)))
INSERT [dbo].[Ricetta] ([Pk_Ricetta], [Fk_Ingrediente], [Fk_Dolce], [FK_Misura], [Quantita]) VALUES (10, 8, 2, 4, CAST(250 AS Decimal(18, 0)))
INSERT [dbo].[Ricetta] ([Pk_Ricetta], [Fk_Ingrediente], [Fk_Dolce], [FK_Misura], [Quantita]) VALUES (11, 9, 2, 4, CAST(25 AS Decimal(18, 0)))
INSERT [dbo].[Ricetta] ([Pk_Ricetta], [Fk_Ingrediente], [Fk_Dolce], [FK_Misura], [Quantita]) VALUES (12, 1, 3, 4, CAST(500 AS Decimal(18, 0)))
INSERT [dbo].[Ricetta] ([Pk_Ricetta], [Fk_Ingrediente], [Fk_Dolce], [FK_Misura], [Quantita]) VALUES (13, 3, 3, 7, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[Ricetta] ([Pk_Ricetta], [Fk_Ingrediente], [Fk_Dolce], [FK_Misura], [Quantita]) VALUES (14, 2, 3, 3, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[Ricetta] ([Pk_Ricetta], [Fk_Ingrediente], [Fk_Dolce], [FK_Misura], [Quantita]) VALUES (15, 5, 3, 4, CAST(250 AS Decimal(18, 0)))
INSERT [dbo].[Ricetta] ([Pk_Ricetta], [Fk_Ingrediente], [Fk_Dolce], [FK_Misura], [Quantita]) VALUES (16, 8, 3, 4, CAST(250 AS Decimal(18, 0)))
INSERT [dbo].[Ricetta] ([Pk_Ricetta], [Fk_Ingrediente], [Fk_Dolce], [FK_Misura], [Quantita]) VALUES (17, 9, 3, 4, CAST(25 AS Decimal(18, 0)))
INSERT [dbo].[Ricetta] ([Pk_Ricetta], [Fk_Ingrediente], [Fk_Dolce], [FK_Misura], [Quantita]) VALUES (18, 10, 3, 4, CAST(250 AS Decimal(18, 0)))
INSERT [dbo].[Ricetta] ([Pk_Ricetta], [Fk_Ingrediente], [Fk_Dolce], [FK_Misura], [Quantita]) VALUES (19, 11, 3, 4, CAST(300 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Ricetta] OFF
GO
SET IDENTITY_INSERT [dbo].[SINISTRI] ON 

INSERT [dbo].[SINISTRI] ([pk_sinistri], [CodS], [Localita], [Data]) VALUES (6, N'1                                                                                                                                                                                                       ', N'COSENZA                                                                                                                                                                                                 ', CAST(N'2002-01-20' AS Date))
INSERT [dbo].[SINISTRI] ([pk_sinistri], [CodS], [Localita], [Data]) VALUES (7, N'2                                                                                                                                                                                                       ', N'ROMA                                                                                                                                                                                                    ', CAST(N'2002-02-01' AS Date))
INSERT [dbo].[SINISTRI] ([pk_sinistri], [CodS], [Localita], [Data]) VALUES (8, N'3                                                                                                                                                                                                       ', N'FIRENZE                                                                                                                                                                                                 ', CAST(N'2002-01-19' AS Date))
INSERT [dbo].[SINISTRI] ([pk_sinistri], [CodS], [Localita], [Data]) VALUES (9, N'4                                                                                                                                                                                                       ', N'MILANO                                                                                                                                                                                                  ', CAST(N'2004-01-20' AS Date))
INSERT [dbo].[SINISTRI] ([pk_sinistri], [CodS], [Localita], [Data]) VALUES (10, N'5                                                                                                                                                                                                       ', N'PISA                                                                                                                                                                                                    ', CAST(N'2002-01-20' AS Date))
SET IDENTITY_INSERT [dbo].[SINISTRI] OFF
GO
SET IDENTITY_INSERT [dbo].[Vetrina] ON 

INSERT [dbo].[Vetrina] ([Pk_Vetrina], [Fk_Dolce], [Data], [Stato], [Prezzo]) VALUES (1, 1, CAST(N'2021-03-16T11:30:36.797' AS DateTime), N'InVendita                                                                                                                                                                                                                                                 ', 1000.0000)
INSERT [dbo].[Vetrina] ([Pk_Vetrina], [Fk_Dolce], [Data], [Stato], [Prezzo]) VALUES (2, 1, CAST(N'2021-03-10T06:22:16.287' AS DateTime), N'NonCommestibile                                                                                                                                                                                                                                           ', 0.0000)
INSERT [dbo].[Vetrina] ([Pk_Vetrina], [Fk_Dolce], [Data], [Stato], [Prezzo]) VALUES (3, 1, CAST(N'2021-03-08T12:36:26.997' AS DateTime), N'NonCommestibile                                                                                                                                                                                                                                           ', 0.0000)
INSERT [dbo].[Vetrina] ([Pk_Vetrina], [Fk_Dolce], [Data], [Stato], [Prezzo]) VALUES (4, 2, CAST(N'2021-03-07T12:34:29.497' AS DateTime), N'NonCommestibile                                                                                                                                                                                                                                           ', 0.0000)
INSERT [dbo].[Vetrina] ([Pk_Vetrina], [Fk_Dolce], [Data], [Stato], [Prezzo]) VALUES (5, 3, CAST(N'2021-03-10T06:22:16.287' AS DateTime), N'NonCommestibile                                                                                                                                                                                                                                           ', 0.0000)
INSERT [dbo].[Vetrina] ([Pk_Vetrina], [Fk_Dolce], [Data], [Stato], [Prezzo]) VALUES (7, 1, CAST(N'2021-03-14T18:04:16.090' AS DateTime), N'InVendita                                                                                                                                                                                                                                                 ', 800.0000)
INSERT [dbo].[Vetrina] ([Pk_Vetrina], [Fk_Dolce], [Data], [Stato], [Prezzo]) VALUES (8, 2, CAST(N'2021-03-14T18:19:44.543' AS DateTime), N'InVendita                                                                                                                                                                                                                                                 ', 15.4400)
INSERT [dbo].[Vetrina] ([Pk_Vetrina], [Fk_Dolce], [Data], [Stato], [Prezzo]) VALUES (9, 2, CAST(N'2021-03-14T18:22:08.060' AS DateTime), N'InVendita                                                                                                                                                                                                                                                 ', 15.4400)
INSERT [dbo].[Vetrina] ([Pk_Vetrina], [Fk_Dolce], [Data], [Stato], [Prezzo]) VALUES (10, 1, CAST(N'2021-03-14T18:41:43.497' AS DateTime), N'InVendita                                                                                                                                                                                                                                                 ', 800.0000)
INSERT [dbo].[Vetrina] ([Pk_Vetrina], [Fk_Dolce], [Data], [Stato], [Prezzo]) VALUES (11, 3, CAST(N'2021-03-14T18:51:49.093' AS DateTime), N'InVendita                                                                                                                                                                                                                                                 ', 19.3000)
INSERT [dbo].[Vetrina] ([Pk_Vetrina], [Fk_Dolce], [Data], [Stato], [Prezzo]) VALUES (12, 2, CAST(N'2021-03-14T18:58:13.227' AS DateTime), N'InVendita                                                                                                                                                                                                                                                 ', 19.3000)
INSERT [dbo].[Vetrina] ([Pk_Vetrina], [Fk_Dolce], [Data], [Stato], [Prezzo]) VALUES (13, 3, CAST(N'2021-03-15T16:31:37.997' AS DateTime), N'InVendita                                                                                                                                                                                                                                                 ', 19.3000)
INSERT [dbo].[Vetrina] ([Pk_Vetrina], [Fk_Dolce], [Data], [Stato], [Prezzo]) VALUES (14, 3, CAST(N'2021-03-15T18:59:18.567' AS DateTime), N'InVendita                                                                                                                                                                                                                                                 ', 19.3000)
INSERT [dbo].[Vetrina] ([Pk_Vetrina], [Fk_Dolce], [Data], [Stato], [Prezzo]) VALUES (15, 2, CAST(N'2021-03-16T09:47:15.360' AS DateTime), N'InVendita                                                                                                                                                                                                                                                 ', 19.3000)
INSERT [dbo].[Vetrina] ([Pk_Vetrina], [Fk_Dolce], [Data], [Stato], [Prezzo]) VALUES (16, 2, CAST(N'2021-03-16T09:48:22.093' AS DateTime), N'InVendita                                                                                                                                                                                                                                                 ', 19.3000)
INSERT [dbo].[Vetrina] ([Pk_Vetrina], [Fk_Dolce], [Data], [Stato], [Prezzo]) VALUES (17, 1, CAST(N'2021-03-16T09:58:43.943' AS DateTime), N'InVendita                                                                                                                                                                                                                                                 ', 1000.0000)
INSERT [dbo].[Vetrina] ([Pk_Vetrina], [Fk_Dolce], [Data], [Stato], [Prezzo]) VALUES (18, 1, CAST(N'2021-03-16T11:18:28.690' AS DateTime), N'InVendita                                                                                                                                                                                                                                                 ', 1000.0000)
INSERT [dbo].[Vetrina] ([Pk_Vetrina], [Fk_Dolce], [Data], [Stato], [Prezzo]) VALUES (19, 3, CAST(N'2021-03-16T11:31:32.157' AS DateTime), N'InVendita                                                                                                                                                                                                                                                 ', 19.3000)
INSERT [dbo].[Vetrina] ([Pk_Vetrina], [Fk_Dolce], [Data], [Stato], [Prezzo]) VALUES (20, 2, CAST(N'2021-03-16T11:47:06.787' AS DateTime), N'InVendita                                                                                                                                                                                                                                                 ', 19.3000)
INSERT [dbo].[Vetrina] ([Pk_Vetrina], [Fk_Dolce], [Data], [Stato], [Prezzo]) VALUES (21, 2, CAST(N'2021-03-16T11:58:27.520' AS DateTime), N'InVendita                                                                                                                                                                                                                                                 ', 19.3000)
INSERT [dbo].[Vetrina] ([Pk_Vetrina], [Fk_Dolce], [Data], [Stato], [Prezzo]) VALUES (22, 3, CAST(N'2021-03-16T18:12:26.703' AS DateTime), N'InVendita                                                                                                                                                                                                                                                 ', 19.3000)
SET IDENTITY_INSERT [dbo].[Vetrina] OFF
GO
ALTER TABLE [dbo].[Ricetta]  WITH CHECK ADD  CONSTRAINT [FK_Ricetta_Dolce] FOREIGN KEY([Fk_Dolce])
REFERENCES [dbo].[Dolce] ([Pk_Dolce])
GO
ALTER TABLE [dbo].[Ricetta] CHECK CONSTRAINT [FK_Ricetta_Dolce]
GO
ALTER TABLE [dbo].[Ricetta]  WITH CHECK ADD  CONSTRAINT [FK_Ricetta_Ingrediente] FOREIGN KEY([Fk_Ingrediente])
REFERENCES [dbo].[Ingrediente] ([Pk_ingrediente])
GO
ALTER TABLE [dbo].[Ricetta] CHECK CONSTRAINT [FK_Ricetta_Ingrediente]
GO
