USE [master]
GO
/****** Object:  Database [user16Starodubtsev]    Script Date: 09.11.2023 14:04:33 ******/
CREATE DATABASE [user16Starodubtsev]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'user16Starodubtsev', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\user16Starodubtsev.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'user16Starodubtsev_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\user16Starodubtsev_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [user16Starodubtsev] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [user16Starodubtsev].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [user16Starodubtsev] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [user16Starodubtsev] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [user16Starodubtsev] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [user16Starodubtsev] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [user16Starodubtsev] SET ARITHABORT OFF 
GO
ALTER DATABASE [user16Starodubtsev] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [user16Starodubtsev] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [user16Starodubtsev] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [user16Starodubtsev] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [user16Starodubtsev] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [user16Starodubtsev] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [user16Starodubtsev] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [user16Starodubtsev] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [user16Starodubtsev] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [user16Starodubtsev] SET  DISABLE_BROKER 
GO
ALTER DATABASE [user16Starodubtsev] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [user16Starodubtsev] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [user16Starodubtsev] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [user16Starodubtsev] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [user16Starodubtsev] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [user16Starodubtsev] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [user16Starodubtsev] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [user16Starodubtsev] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [user16Starodubtsev] SET  MULTI_USER 
GO
ALTER DATABASE [user16Starodubtsev] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [user16Starodubtsev] SET DB_CHAINING OFF 
GO
ALTER DATABASE [user16Starodubtsev] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [user16Starodubtsev] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [user16Starodubtsev] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [user16Starodubtsev] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [user16Starodubtsev] SET QUERY_STORE = OFF
GO
USE [user16Starodubtsev]
GO
/****** Object:  Table [dbo].[Coins]    Script Date: 09.11.2023 14:04:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coins](
	[IdCoins] [int] IDENTITY(1,1) NOT NULL,
	[Valuta] [int] NOT NULL,
 CONSTRAINT [PK_Coins] PRIMARY KEY CLUSTERED 
(
	[IdCoins] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Drinks]    Script Date: 09.11.2023 14:04:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drinks](
	[IdDrinks] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NULL,
	[Cost] [int] NOT NULL,
 CONSTRAINT [PK_Drinks] PRIMARY KEY CLUSTERED 
(
	[IdDrinks] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendingMachineCoins]    Script Date: 09.11.2023 14:04:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendingMachineCoins](
	[IdVendingMachineCoins] [int] IDENTITY(1,1) NOT NULL,
	[VendingMachinesId] [int] NOT NULL,
	[CoinsId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[IsActive] [int] NOT NULL,
 CONSTRAINT [PK_VendingMachineCoins] PRIMARY KEY CLUSTERED 
(
	[IdVendingMachineCoins] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendingMachineDrinks]    Script Date: 09.11.2023 14:04:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendingMachineDrinks](
	[IdVendingMachineDrinks] [int] IDENTITY(1,1) NOT NULL,
	[VendingMachinesId] [int] NOT NULL,
	[DrinksId] [int] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_VendingMachineDrinks] PRIMARY KEY CLUSTERED 
(
	[IdVendingMachineDrinks] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendingMachines]    Script Date: 09.11.2023 14:04:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendingMachines](
	[IdVendingMachines] [int] IDENTITY(1,1) NOT NULL,
	[SecretCode] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_VendingMachines] PRIMARY KEY CLUSTERED 
(
	[IdVendingMachines] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Coins] ON 

INSERT [dbo].[Coins] ([IdCoins], [Valuta]) VALUES (1, 50)
INSERT [dbo].[Coins] ([IdCoins], [Valuta]) VALUES (2, 324)
INSERT [dbo].[Coins] ([IdCoins], [Valuta]) VALUES (3, 32)
INSERT [dbo].[Coins] ([IdCoins], [Valuta]) VALUES (4, 453)
INSERT [dbo].[Coins] ([IdCoins], [Valuta]) VALUES (5, 4)
SET IDENTITY_INSERT [dbo].[Coins] OFF
GO
SET IDENTITY_INSERT [dbo].[Drinks] ON 

INSERT [dbo].[Drinks] ([IdDrinks], [Name], [Image], [Cost]) VALUES (1, N'Pepsi', N'\Photo\pepsi.jpg', 60)
INSERT [dbo].[Drinks] ([IdDrinks], [Name], [Image], [Cost]) VALUES (2, N'Cola', N'\Photo\cola.jpg', 65)
INSERT [dbo].[Drinks] ([IdDrinks], [Name], [Image], [Cost]) VALUES (3, N'Fanta', N'\Photo\fanta.jpg', 58)
INSERT [dbo].[Drinks] ([IdDrinks], [Name], [Image], [Cost]) VALUES (4, N'Sprite', N'\Photo\sprite.jpg', 63)
SET IDENTITY_INSERT [dbo].[Drinks] OFF
GO
SET IDENTITY_INSERT [dbo].[VendingMachineCoins] ON 

INSERT [dbo].[VendingMachineCoins] ([IdVendingMachineCoins], [VendingMachinesId], [CoinsId], [Count], [IsActive]) VALUES (1, 1, 1, 45, 21)
INSERT [dbo].[VendingMachineCoins] ([IdVendingMachineCoins], [VendingMachinesId], [CoinsId], [Count], [IsActive]) VALUES (3, 2, 2, 34, 20)
INSERT [dbo].[VendingMachineCoins] ([IdVendingMachineCoins], [VendingMachinesId], [CoinsId], [Count], [IsActive]) VALUES (4, 3, 3, 50, 37)
SET IDENTITY_INSERT [dbo].[VendingMachineCoins] OFF
GO
SET IDENTITY_INSERT [dbo].[VendingMachineDrinks] ON 

INSERT [dbo].[VendingMachineDrinks] ([IdVendingMachineDrinks], [VendingMachinesId], [DrinksId], [Count]) VALUES (1, 1, 1, 50)
INSERT [dbo].[VendingMachineDrinks] ([IdVendingMachineDrinks], [VendingMachinesId], [DrinksId], [Count]) VALUES (2, 2, 2, 50)
INSERT [dbo].[VendingMachineDrinks] ([IdVendingMachineDrinks], [VendingMachinesId], [DrinksId], [Count]) VALUES (3, 3, 3, 60)
INSERT [dbo].[VendingMachineDrinks] ([IdVendingMachineDrinks], [VendingMachinesId], [DrinksId], [Count]) VALUES (4, 4, 4, 70)
SET IDENTITY_INSERT [dbo].[VendingMachineDrinks] OFF
GO
SET IDENTITY_INSERT [dbo].[VendingMachines] ON 

INSERT [dbo].[VendingMachines] ([IdVendingMachines], [SecretCode]) VALUES (1, N'232')
INSERT [dbo].[VendingMachines] ([IdVendingMachines], [SecretCode]) VALUES (2, N'233')
INSERT [dbo].[VendingMachines] ([IdVendingMachines], [SecretCode]) VALUES (3, N'234')
INSERT [dbo].[VendingMachines] ([IdVendingMachines], [SecretCode]) VALUES (4, N'235')
INSERT [dbo].[VendingMachines] ([IdVendingMachines], [SecretCode]) VALUES (5, N'236')
SET IDENTITY_INSERT [dbo].[VendingMachines] OFF
GO
ALTER TABLE [dbo].[VendingMachineCoins]  WITH CHECK ADD  CONSTRAINT [FK_VendingMachineCoins_Coins] FOREIGN KEY([CoinsId])
REFERENCES [dbo].[Coins] ([IdCoins])
GO
ALTER TABLE [dbo].[VendingMachineCoins] CHECK CONSTRAINT [FK_VendingMachineCoins_Coins]
GO
ALTER TABLE [dbo].[VendingMachineCoins]  WITH CHECK ADD  CONSTRAINT [FK_VendingMachineCoins_VendingMachines] FOREIGN KEY([VendingMachinesId])
REFERENCES [dbo].[VendingMachines] ([IdVendingMachines])
GO
ALTER TABLE [dbo].[VendingMachineCoins] CHECK CONSTRAINT [FK_VendingMachineCoins_VendingMachines]
GO
ALTER TABLE [dbo].[VendingMachineDrinks]  WITH CHECK ADD  CONSTRAINT [FK_VendingMachineDrinks_VendingMachines] FOREIGN KEY([VendingMachinesId])
REFERENCES [dbo].[VendingMachines] ([IdVendingMachines])
GO
ALTER TABLE [dbo].[VendingMachineDrinks] CHECK CONSTRAINT [FK_VendingMachineDrinks_VendingMachines]
GO
USE [master]
GO
ALTER DATABASE [user16Starodubtsev] SET  READ_WRITE 
GO
