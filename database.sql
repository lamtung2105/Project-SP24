USE [master]
GO
/****** Object:  Database [Project_PRJ301]    Script Date: 5/21/2024 9:32:24 PM ******/
CREATE DATABASE [Project_PRJ301]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Project_PRJ301', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Project_PRJ301.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Project_PRJ301_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Project_PRJ301_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Project_PRJ301] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Project_PRJ301].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Project_PRJ301] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Project_PRJ301] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Project_PRJ301] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Project_PRJ301] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Project_PRJ301] SET ARITHABORT OFF 
GO
ALTER DATABASE [Project_PRJ301] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Project_PRJ301] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Project_PRJ301] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Project_PRJ301] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Project_PRJ301] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Project_PRJ301] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Project_PRJ301] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Project_PRJ301] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Project_PRJ301] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Project_PRJ301] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Project_PRJ301] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Project_PRJ301] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Project_PRJ301] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Project_PRJ301] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Project_PRJ301] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Project_PRJ301] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Project_PRJ301] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Project_PRJ301] SET RECOVERY FULL 
GO
ALTER DATABASE [Project_PRJ301] SET  MULTI_USER 
GO
ALTER DATABASE [Project_PRJ301] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Project_PRJ301] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Project_PRJ301] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Project_PRJ301] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Project_PRJ301] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Project_PRJ301] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Project_PRJ301', N'ON'
GO
ALTER DATABASE [Project_PRJ301] SET QUERY_STORE = OFF
GO
USE [Project_PRJ301]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 5/21/2024 9:32:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[email] [nvarchar](100) NULL,
	[address] [nvarchar](max) NULL,
	[roleId] [int] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/21/2024 9:32:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 5/21/2024 9:32:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[amount] [int] NULL,
	[accountId] [int] NOT NULL,
	[createAt] [datetime] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 5/21/2024 9:32:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NULL,
	[productId] [int] NOT NULL,
	[orderId] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/21/2024 9:32:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[image] [nvarchar](max) NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
	[description] [nvarchar](max) NULL,
	[categoryId] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 5/21/2024 9:32:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 
GO
INSERT [dbo].[Account] ([id], [username], [password], [email], [address], [roleId]) VALUES (1, N'user', N'1', N'123', N'123', 2)
GO
INSERT [dbo].[Account] ([id], [username], [password], [email], [address], [roleId]) VALUES (2, N'admin', N'1', N'123', N'123', 1)
GO
INSERT [dbo].[Account] ([id], [username], [password], [email], [address], [roleId]) VALUES (3, N'user1', N'1', NULL, NULL, 2)
GO
INSERT [dbo].[Account] ([id], [username], [password], [email], [address], [roleId]) VALUES (4, N'user2', N'123', NULL, NULL, 2)
GO
INSERT [dbo].[Account] ([id], [username], [password], [email], [address], [roleId]) VALUES (5, N'user3', N'1', NULL, NULL, 2)
GO
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (1, N'Mainboard')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'CPU')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'GPU')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (4, N'RAM')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (5, N'PSU')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (6, N'Storage')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (7, N'Cooling')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (8, N'Case')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 
GO
INSERT [dbo].[Order] ([id], [amount], [accountId], [createAt]) VALUES (2, 800, 1, CAST(N'2024-03-16T03:03:30.870' AS DateTime))
GO
INSERT [dbo].[Order] ([id], [amount], [accountId], [createAt]) VALUES (3, 1500, 1, CAST(N'2024-03-16T03:34:21.810' AS DateTime))
GO
INSERT [dbo].[Order] ([id], [amount], [accountId], [createAt]) VALUES (4, 300, 1, CAST(N'2024-03-16T03:34:42.510' AS DateTime))
GO
INSERT [dbo].[Order] ([id], [amount], [accountId], [createAt]) VALUES (5, 0, 1, CAST(N'2024-03-16T03:35:43.510' AS DateTime))
GO
INSERT [dbo].[Order] ([id], [amount], [accountId], [createAt]) VALUES (6, 1000, 1, CAST(N'2024-03-16T03:37:11.247' AS DateTime))
GO
INSERT [dbo].[Order] ([id], [amount], [accountId], [createAt]) VALUES (7, 0, 1, CAST(N'2024-03-16T03:47:40.997' AS DateTime))
GO
INSERT [dbo].[Order] ([id], [amount], [accountId], [createAt]) VALUES (8, 1000, 1, CAST(N'2024-03-16T17:37:12.287' AS DateTime))
GO
INSERT [dbo].[Order] ([id], [amount], [accountId], [createAt]) VALUES (9, 100, 1, CAST(N'2024-03-16T17:42:52.637' AS DateTime))
GO
INSERT [dbo].[Order] ([id], [amount], [accountId], [createAt]) VALUES (10, 200, 1, CAST(N'2024-03-16T17:45:51.453' AS DateTime))
GO
INSERT [dbo].[Order] ([id], [amount], [accountId], [createAt]) VALUES (11, 160, 1, CAST(N'2024-03-17T03:54:39.323' AS DateTime))
GO
INSERT [dbo].[Order] ([id], [amount], [accountId], [createAt]) VALUES (12, 260, 1, CAST(N'2024-03-17T03:59:51.627' AS DateTime))
GO
INSERT [dbo].[Order] ([id], [amount], [accountId], [createAt]) VALUES (13, 1000, 3, CAST(N'2024-03-17T22:57:46.170' AS DateTime))
GO
INSERT [dbo].[Order] ([id], [amount], [accountId], [createAt]) VALUES (14, 330, 3, CAST(N'2024-03-18T15:56:22.120' AS DateTime))
GO
INSERT [dbo].[Order] ([id], [amount], [accountId], [createAt]) VALUES (15, 1800, 4, CAST(N'2024-03-23T22:04:56.973' AS DateTime))
GO
INSERT [dbo].[Order] ([id], [amount], [accountId], [createAt]) VALUES (16, 2500, 5, CAST(N'2024-04-17T06:33:46.397' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 
GO
INSERT [dbo].[OrderDetails] ([id], [quantity], [productId], [orderId]) VALUES (2, 1, 2, 2)
GO
INSERT [dbo].[OrderDetails] ([id], [quantity], [productId], [orderId]) VALUES (3, 3, 1, 3)
GO
INSERT [dbo].[OrderDetails] ([id], [quantity], [productId], [orderId]) VALUES (4, 2, 6, 4)
GO
INSERT [dbo].[OrderDetails] ([id], [quantity], [productId], [orderId]) VALUES (5, 2, 4, 5)
GO
INSERT [dbo].[OrderDetails] ([id], [quantity], [productId], [orderId]) VALUES (6, 2, 1, 6)
GO
INSERT [dbo].[OrderDetails] ([id], [quantity], [productId], [orderId]) VALUES (7, 2, 8, 7)
GO
INSERT [dbo].[OrderDetails] ([id], [quantity], [productId], [orderId]) VALUES (8, 2, 1, 8)
GO
INSERT [dbo].[OrderDetails] ([id], [quantity], [productId], [orderId]) VALUES (9, 1, 7, 9)
GO
INSERT [dbo].[OrderDetails] ([id], [quantity], [productId], [orderId]) VALUES (10, 1, 8, 10)
GO
INSERT [dbo].[OrderDetails] ([id], [quantity], [productId], [orderId]) VALUES (11, 1, 103, 11)
GO
INSERT [dbo].[OrderDetails] ([id], [quantity], [productId], [orderId]) VALUES (12, 2, 102, 12)
GO
INSERT [dbo].[OrderDetails] ([id], [quantity], [productId], [orderId]) VALUES (13, 2, 1, 13)
GO
INSERT [dbo].[OrderDetails] ([id], [quantity], [productId], [orderId]) VALUES (14, 2, 3, 14)
GO
INSERT [dbo].[OrderDetails] ([id], [quantity], [productId], [orderId]) VALUES (15, 1, 6, 14)
GO
INSERT [dbo].[OrderDetails] ([id], [quantity], [productId], [orderId]) VALUES (16, 2, 2, 15)
GO
INSERT [dbo].[OrderDetails] ([id], [quantity], [productId], [orderId]) VALUES (17, 1, 8, 15)
GO
INSERT [dbo].[OrderDetails] ([id], [quantity], [productId], [orderId]) VALUES (18, 3, 2, 16)
GO
INSERT [dbo].[OrderDetails] ([id], [quantity], [productId], [orderId]) VALUES (19, 1, 7, 16)
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (1, N'Intel Core i9-10900K', N'/Store/images/Intel Core i9-10900K.jpg', 100, 600, N'10-core processor for high-performance computing tasks', 2)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (2, N'NVIDIA GeForce RTX 3080', N'/Store/images/NVIDIA GeForce RTX 3080.png', 30, 800, N'Powerful GPU for gaming and rendering applications', 3)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (3, N'Corsair Vengeance LPX 16GB DDR4 RAM', N'/Store/images/Corsair Vengeance LPX 16GB DDR4 RAM.jpg', 100, 90, N'High-speed memory module for gaming PCs', 4)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (4, N'Samsung 970 EVO Plus 1TB NVMe SSD', N'/Store/images/Samsung 970 EVO Plus 1TB NVMe SSD.webp', 80, 150, N'Fast storage solution for data-intensive applications', 6)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (5, N'Corsair RM750x 750W 80+ Gold PSU', N'/Store/images/Corsair RM750x 750W 80+ Gold PSU.webp', 70, 130, N'Efficient power supply unit for gaming rigs', 5)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (6, N'NZXT Kraken X63 RGB AIO Cooler', N'/Store/images/NZXT Kraken X63 RGB AIO Cooler.jpg', 40, 150, N'Liquid cooling solution with RGB lighting for CPUs', 7)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (7, N'NZXT H510i Compact ATX Mid-Tower Case', N'/Store/images/NZXT H510i Compact ATX Mid-Tower Case.jpg', 60, 100, N'Sleek case with tempered glass side panel and built-in RGB lighting', 8)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (8, N'ASUS ROG Strix B550-F Gaming Motherboard', N'/Store/images/ASUS ROG Strix B550-F Gaming Motherboard.jpg', 35, 200, N'Feature-rich motherboard for gaming builds', 1)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (9, N'AMD Ryzen 9 5900X', N'/Store/images/AMD Ryzen 9 5900X.jpg', 25, 550, N'High-performance CPU with 12 cores for multitasking', 2)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (10, N'EVGA GeForce RTX 3070 FTW3 Ultra Gaming', N'/Store/images/EVGA GeForce RTX 3070 FTW3 Ultra Gaming.jpg', 20, 700, N'Highly overclocked GPU for smooth gaming experiences', 3)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (11, N'G.SKILL Trident Z RGB 32GB DDR4 RAM', N'/Store/images/G.SKILL Trident Z RGB 32GB DDR4 RAM.jpg', 60, 170, N'RGB RAM kit with high-speed performance for enthusiasts', 4)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (12, N'Crucial MX500 2TB SATA SSD', NULL, 45, 250, N'Reliable solid-state drive with large capacity for storage needs', 6)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (13, N'Seasonic Focus GX-850, 850W 80+ Gold PSU', NULL, 50, 160, N'Efficient power supply unit with fully modular design', 5)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (14, N'Noctua NH-D15 chromax.black CPU Cooler', NULL, 30, 100, N'Dual-tower air cooler with excellent cooling performance', 7)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (15, N'Fractal Design Meshify C Tempered Glass Case', NULL, 40, 90, N'Compact mid-tower case with excellent airflow design', 8)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (16, N'MSI MAG B550 TOMAHAWK Motherboard', NULL, 28, 180, N'High-quality motherboard with excellent features for gaming and productivity', 1)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (17, N'Intel Core i7-11700K', NULL, 20, 400, N'Powerful processor with high clock speeds for gaming and content creation', 2)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (18, N'AMD Radeon RX 6800 XT', NULL, 15, 850, N'Top-tier graphics card with exceptional performance for gaming and rendering', 3)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (19, N'Crucial Ballistix 32GB DDR4 RAM', NULL, 50, 130, N'Reliable memory kit with high-speed performance for gaming and multitasking', 4)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (20, N'Western Digital WD Black 4TB NVMe SSD', NULL, 10, 600, N'High-capacity SSD with ultra-fast NVMe interface for storage-intensive tasks', 6)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (21, N'Corsair HX850i 850W 80+ Platinum PSU', NULL, 35, 200, N'Premium power supply unit with high efficiency and modular cables', 5)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (22, N'be quiet! Dark Rock Pro 4 CPU Cooler', NULL, 25, 90, N'Silent and powerful air cooler for efficient CPU cooling', 7)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (23, N'NZXT H710i ATX Mid-Tower Case', NULL, 30, 150, N'Spacious case with smart features and sleek design for high-end builds', 8)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (24, N'Gigabyte Z490 AORUS ELITE AC Motherboard', NULL, 18, 220, N'Feature-rich motherboard with Wi-Fi 6 and robust power delivery', 1)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (25, N'AMD Ryzen 5 5600X', NULL, 35, 300, N'Powerful 6-core CPU with high single-core performance for gaming and productivity', 2)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (26, N'NVIDIA GeForce RTX 3060 Ti', NULL, 25, 500, N'Mid-range GPU with excellent performance for 1440p gaming and content creation', 3)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (27, N'Corsair Vengeance RGB Pro 32GB DDR4 RAM', NULL, 45, 150, N'RGB memory kit with high-speed performance and stylish design', 4)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (28, N'Samsung 980 PRO 2TB NVMe SSD', NULL, 15, 400, N'Ultra-fast SSD with PCIe 4.0 interface for blazing-fast storage speeds', 6)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (29, N'EVGA SuperNOVA 750 G5 750W 80+ Gold PSU', NULL, 40, 130, N'High-quality power supply unit with compact design and silent operation', 5)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (30, N'Cooler Master Hyper 212 RGB Black Edition CPU Cooler', NULL, 20, 45, N'Popular air cooler with RGB lighting and efficient heat dissipation', 7)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (31, N'Phanteks Eclipse P400A ATX Mid-Tower Case', NULL, 35, 80, N'Airflow-optimized case with tempered glass side panel for a clean build showcase', 8)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (32, N'ASRock B550M Steel Legend Motherboard', NULL, 22, 160, N'Micro-ATX motherboard with robust features and aesthetics for compact builds', 1)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (33, N'Intel Core i5-11600K', NULL, 30, 270, N'6-core processor with overclocking capabilities for gaming and multitasking', 2)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (34, N'AMD Radeon RX 6700 XT', NULL, 18, 580, N'Mid-range graphics card with excellent performance for 1440p gaming and VR', 3)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (35, N'Crucial Ballistix MAX 64GB DDR4 RAM', NULL, 10, 280, N'High-capacity memory kit with overclocking potential for enthusiasts', 4)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (36, N'WD Blue SN550 1TB NVMe SSD', NULL, 50, 100, N'Affordable NVMe SSD with fast read/write speeds for everyday computing', 6)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (37, N'Corsair CX650M 650W 80+ Bronze PSU', NULL, 60, 80, N'Reliable power supply unit with modular cables and efficient performance', 5)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (38, N'NZXT Kraken Z63 280mm AIO Liquid Cooler', NULL, 12, 250, N'Advanced liquid cooler with customizable LCD display and RGB lighting', 7)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (39, N'Lian Li Lancool II Mesh RGB Mid-Tower Case', NULL, 28, 110, N'Mesh-front case with RGB lighting and excellent airflow for gaming builds', 8)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (40, N'MSI MPG B550 GAMING PLUS Motherboard', NULL, 17, 160, N'Gaming-oriented motherboard with ample connectivity and RGB lighting', 1)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (41, N'AMD Ryzen 7 5800X', NULL, 25, 450, N'8-core CPU with high clock speeds and multi-threaded performance for gaming and content creation', 2)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (42, N'NVIDIA GeForce GTX 1660 SUPER', NULL, 20, 300, N'Mid-range GPU with excellent 1080p gaming performance and Turing architecture', 3)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (43, N'G.SKILL Trident Z Neo 64GB DDR4 RAM', NULL, 8, 320, N'High-capacity RGB memory kit optimized for AMD Ryzen platforms', 4)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (44, N'Samsung 870 EVO 4TB SATA SSD', NULL, 5, 580, N'Large-capacity SATA SSD with reliable performance and durability', 6)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (45, N'EVGA SuperNOVA 850 G6 850W 80+ Gold PSU', NULL, 30, 160, N'High-efficiency power supply unit with fully modular design and quiet operation', 5)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (46, N'Corsair iCUE H150i ELITE CAPELLIX 360mm AIO Liquid Cooler', NULL, 15, 200, N'Advanced liquid cooler with customizable RGB lighting and powerful cooling performance', 7)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (47, N'Fractal Design Define 7 Compact ATX Mid-Tower Case', NULL, 22, 130, N'Minimalist case with sound-dampened panels and versatile cooling options', 8)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (48, N'ASUS TUF Gaming B550-PLUS Motherboard', NULL, 14, 170, N'Durable motherboard with military-grade components and comprehensive cooling options', 1)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (49, N'Intel Core i3-10100', NULL, 30, 130, N'Quad-core processor with hyper-threading for entry-level gaming and everyday computing', 2)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (50, N'NVIDIA GeForce RTX 3050 Ti', NULL, 25, 300, N'Budget-friendly GPU with solid 1080p gaming performance and ray tracing support', 3)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (51, N'Corsair Vengeance LPX 8GB DDR4 RAM', NULL, 40, 60, N'Basic memory module with reliable performance for budget builds', 4)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (52, N'Crucial P2 500GB NVMe SSD', NULL, 20, 70, N'Affordable NVMe SSD with fast read/write speeds for system boot and application loading', 6)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (53, N'EVGA BR 500W 80+ Bronze PSU', NULL, 50, 50, N'Entry-level power supply unit with quiet operation and reliable performance', 5)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (54, N'Cooler Master Hyper 212 EVO CPU Cooler', NULL, 18, 35, N'Popular air cooler with direct-contact heat pipes for efficient CPU cooling', 7)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (55, N'NZXT H510 Compact ATX Mid-Tower Case', NULL, 35, 70, N'Sleek case with tempered glass side panel and cable management features', 8)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (56, N'Gigabyte B450 AORUS ELITE Motherboard', NULL, 10, 130, N'Solid motherboard with RGB lighting and ample connectivity for gaming builds', 1)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (57, N'AMD Ryzen 3 3300X', NULL, 15, 150, N'Quad-core CPU with Zen 2 architecture for budget gaming and productivity tasks', 2)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (58, N'MSI GeForce GTX 1650 SUPER', NULL, 20, 200, N'Entry-level GPU with good performance for 1080p gaming and multimedia tasks', 3)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (59, N'TeamGroup T-Force Vulcan Z 16GB DDR4 RAM', NULL, 25, 80, N'Affordable memory kit with reliable performance for mainstream users', 4)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (60, N'ADATA SU800 1TB SATA SSD', NULL, 10, 100, N'Budget-friendly SATA SSD with decent read/write speeds for everyday use', 6)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (61, N'Thermaltake Smart 600W 80+ PSU', NULL, 30, 60, N'Entry-level power supply unit with reliable performance and quiet fan operation', 5)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (62, N'Noctua NH-U12S chromax.black CPU Cooler', NULL, 22, 70, N'Quiet and efficient air cooler with excellent compatibility and cooling performance', 7)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (63, N'Phanteks Eclipse P300A ATX Mid-Tower Case', NULL, 28, 60, N'Budget-friendly case with mesh front panel and clean interior layout', 8)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (64, N'MSI MPG X570 GAMING PLUS Motherboard', NULL, 15, 200, N'High-performance motherboard with PCIe 4.0 support and advanced cooling solutions', 1)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (65, N'AMD Ryzen 9 5950X', NULL, 10, 800, N'16-core processor with extreme performance for demanding workloads and gaming', 2)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (66, N'NVIDIA GeForce RTX 3090', NULL, 5, 1500, N'Flagship GPU with unparalleled gaming performance and ray tracing capabilities', 3)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (67, N'Corsair Dominator Platinum RGB 64GB DDR4 RAM', NULL, 8, 400, N'Premium RGB memory kit with high-speed performance and luxurious design', 4)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (68, N'Samsung 980 PRO 2TB NVMe SSD', NULL, 20, 400, N'Ultra-fast NVMe SSD with PCIe 4.0 interface for professional workloads and gaming', 6)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (69, N'Seasonic Prime TX-1000 1000W 80+ Titanium PSU', NULL, 12, 350, N'High-efficiency power supply unit with top-tier components for stability and reliability', 5)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (70, N'NZXT Kraken Z73 360mm AIO Liquid Cooler', NULL, 7, 280, N'Advanced liquid cooler with customizable LCD display and superior cooling performance', 7)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (71, N'Fractal Design Meshify 2 XL ATX Full Tower Case', NULL, 10, 190, N'Spacious full tower case with exceptional airflow and modular design for enthusiast builds', 8)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (72, N'Gigabyte Z590 AORUS MASTER Motherboard', NULL, 18, 350, N'Feature-packed motherboard with robust power delivery and extensive connectivity options', 1)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (73, N'Intel Core i9-11900K', NULL, 8, 600, N'Flagship processor with high clock speeds and advanced multi-core performance for enthusiasts and professionals', 2)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (74, N'ASUS ROG Strix GeForce RTX 3070', NULL, 15, 900, N'High-end graphics card with overclocking capabilities and advanced cooling solutions for gaming', 3)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (75, N'Corsair Vengeance RGB Pro SL 32GB DDR4 RAM', NULL, 25, 190, N'RGB memory kit with optimized performance and stylish design for gaming setups', 4)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (76, N'Western Digital WD Black SN850 1TB NVMe SSD', NULL, 30, 200, N'High-speed NVMe SSD with PCIe Gen4 interface for blazing-fast storage performance', 6)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (77, N'EVGA SuperNOVA 1000 G6 1000W 80+ Gold PSU', NULL, 10, 200, N'Premium power supply unit with high efficiency and silent operation for enthusiast rigs', 5)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (78, N'Cooler Master MasterLiquid ML240L RGB V2 AIO Liquid Cooler', NULL, 20, 80, N'Budget-friendly liquid cooler with RGB lighting and efficient cooling performance', 7)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (79, N'NZXT H710i ATX Mid-Tower Case', NULL, 15, 170, N'Mid-tower case with integrated RGB lighting and smart features for modern builds', 8)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (80, N'ASRock B550M Pro4 Motherboard', NULL, 20, 130, N'Micro-ATX motherboard with ample features and solid performance for budget builds', 1)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (81, N'Intel Core i5-11400', NULL, 25, 250, N'6-core CPU with strong single-threaded performance and affordability for mainstream users', 2)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (82, N'NVIDIA GeForce GTX 1660', NULL, 15, 240, N'Entry-level GPU with good 1080p gaming performance and power efficiency', 3)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (83, N'TeamGroup T-Force Delta RGB 16GB DDR4 RAM', NULL, 30, 90, N'RGB memory module with decent performance and vibrant lighting effects', 4)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (84, N'Crucial BX500 1TB SATA SSD', NULL, 25, 90, N'Budget-friendly SATA SSD with reliable performance for everyday computing tasks', 6)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (85, N'EVGA 600 W1 600W 80+ White PSU', NULL, 20, 50, N'Basic power supply unit with decent reliability and affordability for entry-level systems', 5)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (86, N'Cooler Master Hyper 212 RGB CPU Cooler', NULL, 15, 40, N'Popular air cooler with RGB lighting and efficient heat dissipation for budget builds', 7)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (87, N'NZXT H510i Compact ATX Mid-Tower Case', NULL, 18, 100, N'Sleek mid-tower case with integrated RGB lighting and tempered glass side panel', 8)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (88, N'MSI MAG B460M Mortar Motherboard', NULL, 12, 110, N'Micro-ATX motherboard with strong feature set and solid performance for gaming and productivity', 1)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (89, N'AMD Ryzen 5 3600', NULL, 20, 200, N'Hexa-core CPU with excellent multi-threaded performance and overclocking potential', 2)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (90, N'GIGABYTE GeForce GTX 1650', NULL, 18, 150, N'Entry-level GPU with compact design and good performance for casual gaming and multimedia tasks', 3)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (91, N'Corsair Vengeance LPX 32GB DDR4 RAM', NULL, 35, 160, N'High-capacity memory module with reliable performance and low-profile design', 4)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (92, N'Samsung 870 QVO 2TB SATA SSD', NULL, 10, 200, N'Large-capacity SATA SSD with decent performance and high storage density', 6)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (93, N'Thermaltake Smart 500W 80+ White PSU', NULL, 22, 40, N'Basic power supply unit with quiet operation and stable performance for entry-level systems', 5)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (94, N'ARCTIC Freezer 34 eSports DUO CPU Cooler', NULL, 17, 50, N'Dual-fan air cooler with compact design and excellent cooling performance for gaming', 7)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (95, N'Phanteks Eclipse P400 ATX Mid-Tower Case', NULL, 20, 80, N'Mid-tower case with clean interior layout and tempered glass side panel for budget builds', 8)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (96, N'ASUS ROG Crosshair VIII Hero Motherboard', NULL, 8, 380, N'High-end motherboard with extensive overclocking features and premium components', 1)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (97, N'Intel Core i7-11700KF', NULL, 15, 400, N'High-performance CPU with 8 cores and unlocked multiplier for gaming and content creation', 2)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (98, N'NVIDIA GeForce RTX 3060', NULL, 12, 500, N'Mid-range GPU with ray tracing support and DLSS technology for smooth gaming experiences', 3)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (99, N'G.SKILL Trident Z Royal 64GB DDR4 RAM', NULL, 6, 500, N'Luxurious memory kit with dazzling RGB lighting and high-speed performance for enthusiasts', 4)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (100, N'Samsung 970 EVO Plus 500GB NVMe SSD', NULL, 20, 90, N'High-speed NVMe SSD with PCIe 3.0 interface for fast system boot and application loading', 6)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (101, N'Corsair RM850x 850W 80+ Gold PSU', N'/Store/images/Corsair RM850x 850W 80+ Gold PSU.jpg', 10, 140, N'High-efficiency power supply unit with fully modular cables and quiet operation', 5)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (102, N'NZXT Kraken X53 240mm AIO Liquid Cooler', N'/Store/images/NZXT Kraken X53 240mm AIO Liquid Cooler.jpg', 8, 130, N'Compact liquid cooler with customizable RGB lighting and efficient cooling performance', 7)
GO
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [categoryId]) VALUES (103, N'Fractal Design Define 7 ATX Mid-Tower Case', N'/Store/images/Fractal Design Define 7 ATX Mid-Tower Case.webp', 10, 160, N'Premium mid-tower case with sound-dampened panels and excellent cable management', 8)
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 
GO
INSERT [dbo].[Role] ([id], [name]) VALUES (1, N'admin')
GO
INSERT [dbo].[Role] ([id], [name]) VALUES (2, N'user')
GO
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([roleId])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Account] FOREIGN KEY([accountId])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Account]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY([orderId])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Order]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Product] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
USE [master]
GO
ALTER DATABASE [Project_PRJ301] SET  READ_WRITE 
GO
