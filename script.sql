Create database [Cinema2]
GO
USE [Cinema2]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/24/2021 9:22:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [nchar](50) NOT NULL,
	[Password] [nchar](100) NOT NULL,
	[Type] [int] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 7/24/2021 9:22:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[BookingID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nchar](50) NOT NULL,
	[ShowID] [int] NOT NULL,
	[Amount] [float] NOT NULL,
	[SeatStatus] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_Bookings] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 7/24/2021 9:22:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](150) NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Film_Genre]    Script Date: 7/24/2021 9:22:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Film_Genre](
	[FilmID] [int] NULL,
	[GenreID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Films]    Script Date: 7/24/2021 9:22:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Films](
	[FilmID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NULL,
	[Date] [datetime] NULL,
	[CountryID] [int] NULL,
	[Time] [int] NULL,
	[ImageUrl] [nchar](50) NULL,
	[Actor] [nchar](1000) NULL,
	[Director] [nchar](100) NULL,
	[Description] [nchar](2000) NOT NULL,
 CONSTRAINT [PK_Films] PRIMARY KEY CLUSTERED 
(
	[FilmID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 7/24/2021 9:22:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[GenreID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 7/24/2021 9:22:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[RoomID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[NumberRows] [int] NULL,
	[NumberCols] [int] NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shows]    Script Date: 7/24/2021 9:22:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shows](
	[ShowID] [int] IDENTITY(1,1) NOT NULL,
	[RoomID] [int] NOT NULL,
	[FilmID] [int] NOT NULL,
	[ShowDate] [datetime] NOT NULL,
	[Price] [float] NOT NULL,
	[SlotID] [int] NOT NULL,
	[RoomStatus] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Shows] PRIMARY KEY CLUSTERED 
(
	[ShowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slot]    Script Date: 7/24/2021 9:22:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slot](
	[SlotID] [int] NOT NULL,
	[SlotName] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Slot] PRIMARY KEY CLUSTERED 
(
	[SlotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([Username], [Password], [Type]) VALUES (N'admin                                             ', N'admin                                                                                               ', 1)
INSERT [dbo].[Account] ([Username], [Password], [Type]) VALUES (N'user                                              ', N'user                                                                                                ', 0)
SET IDENTITY_INSERT [dbo].[Bookings] ON 

INSERT [dbo].[Bookings] ([BookingID], [Username], [ShowID], [Amount], [SeatStatus]) VALUES (1, N'user                                              ', 27, 500, N'111110000000000000000000000000000000')
INSERT [dbo].[Bookings] ([BookingID], [Username], [ShowID], [Amount], [SeatStatus]) VALUES (2, N'user                                              ', 27, 100, N'000001000000000000000000000000000000')
SET IDENTITY_INSERT [dbo].[Bookings] OFF
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (1, N'America')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (2, N'Viet Nam')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (3, N'Spain')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (4, N'Canada')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (5, N'Campuchia')
SET IDENTITY_INSERT [dbo].[Countries] OFF
INSERT [dbo].[Film_Genre] ([FilmID], [GenreID]) VALUES (1, 1)
INSERT [dbo].[Film_Genre] ([FilmID], [GenreID]) VALUES (1, 2)
INSERT [dbo].[Film_Genre] ([FilmID], [GenreID]) VALUES (2, 1)
INSERT [dbo].[Film_Genre] ([FilmID], [GenreID]) VALUES (2, 3)
INSERT [dbo].[Film_Genre] ([FilmID], [GenreID]) VALUES (2, 4)
INSERT [dbo].[Film_Genre] ([FilmID], [GenreID]) VALUES (6, 6)
INSERT [dbo].[Film_Genre] ([FilmID], [GenreID]) VALUES (6, 7)
INSERT [dbo].[Film_Genre] ([FilmID], [GenreID]) VALUES (8, 8)
INSERT [dbo].[Film_Genre] ([FilmID], [GenreID]) VALUES (8, 5)
INSERT [dbo].[Film_Genre] ([FilmID], [GenreID]) VALUES (8, 9)
INSERT [dbo].[Film_Genre] ([FilmID], [GenreID]) VALUES (9, 1)
INSERT [dbo].[Film_Genre] ([FilmID], [GenreID]) VALUES (9, 5)
INSERT [dbo].[Film_Genre] ([FilmID], [GenreID]) VALUES (3, 5)
INSERT [dbo].[Film_Genre] ([FilmID], [GenreID]) VALUES (12, 1)
INSERT [dbo].[Film_Genre] ([FilmID], [GenreID]) VALUES (12, 2)
INSERT [dbo].[Film_Genre] ([FilmID], [GenreID]) VALUES (12, 4)
INSERT [dbo].[Film_Genre] ([FilmID], [GenreID]) VALUES (13, 1)
INSERT [dbo].[Film_Genre] ([FilmID], [GenreID]) VALUES (13, 2)
INSERT [dbo].[Film_Genre] ([FilmID], [GenreID]) VALUES (13, 4)
SET IDENTITY_INSERT [dbo].[Films] ON 

INSERT [dbo].[Films] ([FilmID], [Title], [Date], [CountryID], [Time], [ImageUrl], [Actor], [Director], [Description]) VALUES (1, N'GODZILLA VS. KONG', CAST(N'2021-03-26T00:00:00.000' AS DateTime), 1, 113, N'~/Images/1.jpg                                    ', N'Millie Bobby Brown, Alexander Skarsgård, Rebecca Hall, Eiza González, Kyle Chandler                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     ', N'Adam Wingard                                                                                        ', N'When two enemies meet each other in a spectacular battle, the fate of the world is still left open ... Taken from Skull Island, Kong, and Jia, an orphan girl have a strong bond with me I and my special security team are heading to the new roof. Suddenly, the group clashes with the mighty Godzilla, creating a wave of destruction across the globe. In fact, the battle between the two giants under the manipulation of invisible forces is just the starting point to discover the mysteries deep in the heart of the Earth.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ')
INSERT [dbo].[Films] ([FilmID], [Title], [Date], [CountryID], [Time], [ImageUrl], [Actor], [Director], [Description]) VALUES (2, N'Chaos Walking', CAST(N'2021-03-19T00:00:00.000' AS DateTime), 1, 109, N'~/Images/2.jpg                                    ', N'Tom Holland, Daisy Ridley, Mads Mikkelsen, Ray McKinnon, David Oyelowo, Nick Jonas, Demián Bichir, Cynthia Erivo, Kurt Sutter                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ', N'Doug Liman                                                                                          ', N'Todd Hewitt (Tom Holland) accidentally discovered Viola (Daisy Ridley) - a girl who survived after her spaceship crashed and fell on his planet. The planet has no female figure, and men are affected by ''Noise'' - a force that expresses their entire thinking to the outside. As the only girl on this strange planet, Viola''s life was in danger. Todd is determined to protect Viola and the two get caught up in a dangerous adventure. From there, Todd gradually discovers his special ability and discovers the dark secrets of the planet that he lives on.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ')
INSERT [dbo].[Films] ([FilmID], [Title], [Date], [CountryID], [Time], [ImageUrl], [Actor], [Director], [Description]) VALUES (3, N'Gai Gia Lam Chieu V - Nhung Cuoc Doi Vuong Gia', CAST(N'2021-03-05T00:00:00.000' AS DateTime), 2, 115, N'~/Images/3.jpg                                    ', N'NSND Le Khanh, Kaity Nguyen, NSND Hong Van, NSND Hoang Dung, Khuong Le, Le Khanh, Anh Dung                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ', N'Bao Nhan – Namcito                                                                                  ', N'The battle "Sister - Sister of blood and love" is just because of the two words LOVE - MONEY of three sisters Ly Gia at Bach Tra Vien Villa in Hue. Because of the "love - money, gain - loss" cycle that makes them turn from sisters to opponents in a close relationship. The story begins on the spring auction night at Bach Tra Vien, Phuong has three tailed beasts - an antique 30 million dollars, Ly Gia''s treasures were stolen. Makes the three sisters begin to doubt each other while exposing many heavenly secrets that seemed to have been hidden for a lifetime.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ')
INSERT [dbo].[Films] ([FilmID], [Title], [Date], [CountryID], [Time], [ImageUrl], [Actor], [Director], [Description]) VALUES (6, N'Bo Gia', CAST(N'2021-03-12T00:00:00.000' AS DateTime), 2, 128, N'~/Images/4.jpg                                    ', N'Tran Thanh, Tuan Tran, Ngan Chi, People''s Artist Ngoc Giau, Le Giang, Lan Phuong, Hoang Meo, La Thanh, Quoc Khanh, Le Trang, A Quay, Bao Phuc, ...                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Vu Ngoc Dang & Tran Thanh                                                                           ', N'The film will revolve around the daily life of a working-poor neighborhood, where a quartet of brothers Giau - Sang - Phu - Quy and Ba Sang will be the main character, often worrying about a lot of money but deeply love their children. The film''s story focuses on father and son Ba Sang (Tran Thanh) and Quan (Tuan Tran). Although they love each other, but the generation gap has brought about great disagreements between father and son. Can the two give each other a chance to understand each other, close the distance and create happiness from the difference?                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ')
INSERT [dbo].[Films] ([FilmID], [Title], [Date], [CountryID], [Time], [ImageUrl], [Actor], [Director], [Description]) VALUES (8, N'Song Song', CAST(N'2021-04-02T00:00:00.000' AS DateTime), 2, 105, N'~/Images/5.jpg                                    ', N'Nha Phuong, Truong The Vinh, Tien Luat, Thuan Phat, Khuong Ngoc, Hoang Phi ...                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ', N'Nguyen Huu Hoang                                                                                    ', N'Because she wants to change the past to save the life of a boy who passed away 21 years ago, Trang accidentally upsets the present and loses the perfect life she currently has. In an attempt to reconnect with the past to correct mistakes, Trang discovers hidden secrets for more than 20 years.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ')
INSERT [dbo].[Films] ([FilmID], [Title], [Date], [CountryID], [Time], [ImageUrl], [Actor], [Director], [Description]) VALUES (9, N'The Vault', CAST(N'2021-04-02T00:00:00.000' AS DateTime), 3, 118, N'~/Images/6.jpg                                    ', N'Freddie Highmore, Astrid Bergefs-Frisbey, Joses Coronado, Liam Cunningham,...                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ', N'Jaume Balagueros                                                                                    ', N'The Bank of Spain is an impenetrable place, not a single thief can walk in. Considered as one of the most mysterious places in the world, this bank has no blueprints, no data saved and no one knows the structure of the safe over a hundred years old. This challenge aroused the curiosity of Thom (Freddie Highmore) - a genius engineer decided to try to break into deep inside this place and open up the mystery of the safe.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ')
INSERT [dbo].[Films] ([FilmID], [Title], [Date], [CountryID], [Time], [ImageUrl], [Actor], [Director], [Description]) VALUES (11, N'HARRY POTTER AND DEMONSTRATION (Part 2)', CAST(N'2021-04-02T00:00:00.000' AS DateTime), 1, 130, N'~/Images/7.jpg                                    ', N'Daniel Radcliffe, Rupert Grint, Emma Watson, Ralph Fiennes                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ', N'David Yates                                                                                         ', N'Without the guidance of the professors, the group of friends Harry (Daniel Radcliffe), Ron (Rupert Grint) and Hermione (Emma Watson) begin their journey to destroy the Horcruxes - items that help Lord Voldemort ( Ralph Fiennes) reaches immortality. At this moment, when all three have to agree with each other more than ever, the dark forces are plotting to divide the group of friends. At the same time, Lord Voldemort''s Death Eaters took over the leadership of the Ministry of Magic and Hogwarts, as well as frantically searching for Harry and his best friends - before the final ultimate war. (PART 2 REVIEW from April 2)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ')
INSERT [dbo].[Films] ([FilmID], [Title], [Date], [CountryID], [Time], [ImageUrl], [Actor], [Director], [Description]) VALUES (12, N'Khi 1', CAST(N'2021-07-24T00:00:00.000' AS DateTime), 1, 112, N'~/Images/8.jpg                                    ', N'djchip                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ', N'djchip                                                                                              ', N'456                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ')
INSERT [dbo].[Films] ([FilmID], [Title], [Date], [CountryID], [Time], [ImageUrl], [Actor], [Director], [Description]) VALUES (13, N'123', CAST(N'2021-07-24T00:00:00.000' AS DateTime), 1, 112, N'~/Images/9.jpg                                    ', N'djchip                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ', N'djchip                                                                                              ', N'1231212                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ')
SET IDENTITY_INSERT [dbo].[Films] OFF
SET IDENTITY_INSERT [dbo].[Genres] ON 

INSERT [dbo].[Genres] ([GenreID], [Name]) VALUES (1, N'Action')
INSERT [dbo].[Genres] ([GenreID], [Name]) VALUES (2, N'Mythology')
INSERT [dbo].[Genres] ([GenreID], [Name]) VALUES (3, N'Science Fiction')
INSERT [dbo].[Genres] ([GenreID], [Name]) VALUES (4, N'Adventure')
INSERT [dbo].[Genres] ([GenreID], [Name]) VALUES (5, N'Nervous')
INSERT [dbo].[Genres] ([GenreID], [Name]) VALUES (6, N'Family')
INSERT [dbo].[Genres] ([GenreID], [Name]) VALUES (7, N'Comedy')
INSERT [dbo].[Genres] ([GenreID], [Name]) VALUES (8, N'Mystery')
INSERT [dbo].[Genres] ([GenreID], [Name]) VALUES (9, N'Psychology')
INSERT [dbo].[Genres] ([GenreID], [Name]) VALUES (10, N'Cartoon')
INSERT [dbo].[Genres] ([GenreID], [Name]) VALUES (11, N'horror')
SET IDENTITY_INSERT [dbo].[Genres] OFF
SET IDENTITY_INSERT [dbo].[Rooms] ON 

INSERT [dbo].[Rooms] ([RoomID], [Name], [NumberRows], [NumberCols]) VALUES (1, N'Room 1', 6, 6)
INSERT [dbo].[Rooms] ([RoomID], [Name], [NumberRows], [NumberCols]) VALUES (2, N'Room 2', 6, 6)
INSERT [dbo].[Rooms] ([RoomID], [Name], [NumberRows], [NumberCols]) VALUES (3, N'Room 3', 5, 5)
SET IDENTITY_INSERT [dbo].[Rooms] OFF
SET IDENTITY_INSERT [dbo].[Shows] ON 

INSERT [dbo].[Shows] ([ShowID], [RoomID], [FilmID], [ShowDate], [Price], [SlotID], [RoomStatus]) VALUES (25, 1, 1, CAST(N'2021-07-24T00:00:00.000' AS DateTime), 500, 1, N'000000000000000000000000000000000000')
INSERT [dbo].[Shows] ([ShowID], [RoomID], [FilmID], [ShowDate], [Price], [SlotID], [RoomStatus]) VALUES (26, 1, 2, CAST(N'2021-07-23T00:00:00.000' AS DateTime), 100, 1, N'000000000000000000000000000000000000')
INSERT [dbo].[Shows] ([ShowID], [RoomID], [FilmID], [ShowDate], [Price], [SlotID], [RoomStatus]) VALUES (27, 1, 1, CAST(N'2021-07-24T00:00:00.000' AS DateTime), 100, 2, N'111111000000000000000000000000000000')
INSERT [dbo].[Shows] ([ShowID], [RoomID], [FilmID], [ShowDate], [Price], [SlotID], [RoomStatus]) VALUES (28, 2, 3, CAST(N'2021-07-24T00:00:00.000' AS DateTime), 600, 1, N'000000000000000000000000000000000000')
INSERT [dbo].[Shows] ([ShowID], [RoomID], [FilmID], [ShowDate], [Price], [SlotID], [RoomStatus]) VALUES (29, 2, 13, CAST(N'2021-07-24T00:00:00.000' AS DateTime), 500, 2, N'000000000000000000000000000000000000')
SET IDENTITY_INSERT [dbo].[Shows] OFF
INSERT [dbo].[Slot] ([SlotID], [SlotName]) VALUES (1, N'6:00 AM - 8:00 AM                                 ')
INSERT [dbo].[Slot] ([SlotID], [SlotName]) VALUES (2, N'8:00 AM - 10:00 AM                                ')
INSERT [dbo].[Slot] ([SlotID], [SlotName]) VALUES (3, N'10:00 AM - 12:00 PM                               ')
INSERT [dbo].[Slot] ([SlotID], [SlotName]) VALUES (4, N'12:00 PM - 2:00 PM                                ')
INSERT [dbo].[Slot] ([SlotID], [SlotName]) VALUES (5, N'2:00 PM - 4:00 PM                                 ')
INSERT [dbo].[Slot] ([SlotID], [SlotName]) VALUES (6, N'4:00 PM - 6:00 PM                                 ')
INSERT [dbo].[Slot] ([SlotID], [SlotName]) VALUES (7, N'6:00 PM - 8:00 PM                                 ')
INSERT [dbo].[Slot] ([SlotID], [SlotName]) VALUES (8, N'8:00 PM - 10:00 PM                                ')
INSERT [dbo].[Slot] ([SlotID], [SlotName]) VALUES (9, N'10:00 PM - 12:00 AM                               ')
INSERT [dbo].[Slot] ([SlotID], [SlotName]) VALUES (10, N'12:00 AM - 2:00 AM                                ')
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_Account]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Shows] FOREIGN KEY([ShowID])
REFERENCES [dbo].[Shows] ([ShowID])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_Shows]
GO
ALTER TABLE [dbo].[Film_Genre]  WITH CHECK ADD  CONSTRAINT [FK_Film_Genre_Films] FOREIGN KEY([FilmID])
REFERENCES [dbo].[Films] ([FilmID])
GO
ALTER TABLE [dbo].[Film_Genre] CHECK CONSTRAINT [FK_Film_Genre_Films]
GO
ALTER TABLE [dbo].[Film_Genre]  WITH CHECK ADD  CONSTRAINT [FK_Film_Genre_Genres] FOREIGN KEY([GenreID])
REFERENCES [dbo].[Genres] ([GenreID])
GO
ALTER TABLE [dbo].[Film_Genre] CHECK CONSTRAINT [FK_Film_Genre_Genres]
GO
ALTER TABLE [dbo].[Films]  WITH CHECK ADD  CONSTRAINT [FK_Films_Countries] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Countries] ([CountryID])
GO
ALTER TABLE [dbo].[Films] CHECK CONSTRAINT [FK_Films_Countries]
GO
ALTER TABLE [dbo].[Shows]  WITH CHECK ADD  CONSTRAINT [FK_Shows_Films] FOREIGN KEY([FilmID])
REFERENCES [dbo].[Films] ([FilmID])
GO
ALTER TABLE [dbo].[Shows] CHECK CONSTRAINT [FK_Shows_Films]
GO
ALTER TABLE [dbo].[Shows]  WITH CHECK ADD  CONSTRAINT [FK_Shows_Rooms] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Rooms] ([RoomID])
GO
ALTER TABLE [dbo].[Shows] CHECK CONSTRAINT [FK_Shows_Rooms]
GO
ALTER TABLE [dbo].[Shows]  WITH CHECK ADD  CONSTRAINT [FK_Shows_Slot] FOREIGN KEY([SlotID])
REFERENCES [dbo].[Slot] ([SlotID])
GO
ALTER TABLE [dbo].[Shows] CHECK CONSTRAINT [FK_Shows_Slot]
GO
