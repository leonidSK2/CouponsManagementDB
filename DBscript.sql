USE [CouponsManagement]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 02/06/2019 22:04:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[ID] [bigint] NOT NULL,
	[COMPANY_NAME] [nvarchar](max) NULL,
	[PASSWORD] [nvarchar](max) NULL,
	[EMAIL] [nvarchar](max) NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company_Coupon]    Script Date: 02/06/2019 22:04:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company_Coupon](
	[compid] [bigint] NOT NULL,
	[couponid] [bigint] NOT NULL,
 CONSTRAINT [PK_Company_Coupon] PRIMARY KEY CLUSTERED 
(
	[compid] ASC,
	[couponid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupon]    Script Date: 02/06/2019 22:04:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupon](
	[ID] [bigint] NOT NULL,
	[TITLE] [nvarchar](max) NULL,
	[START_DATE] [date] NULL,
	[END_DATE] [date] NULL,
	[AMOUNT] [bigint] NULL,
	[TYPE_ENUM] [nvarchar](max) NULL,
	[MESSAGE] [nvarchar](max) NULL,
	[PRICE] [float] NULL,
	[IMAGE] [nvarchar](max) NULL,
 CONSTRAINT [PK_Coupon] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cust_Coupon]    Script Date: 02/06/2019 22:04:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cust_Coupon](
	[customerID] [bigint] NOT NULL,
	[couponID] [bigint] NOT NULL,
 CONSTRAINT [PK_cust_coupom] PRIMARY KEY CLUSTERED 
(
	[customerID] ASC,
	[couponID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 02/06/2019 22:04:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [bigint] NOT NULL,
	[CUSTOMER_NAME] [nvarchar](max) NULL,
	[PASSWORD] [nvarchar](max) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Company_Coupon]  WITH NOCHECK ADD  CONSTRAINT [FK_Company_Coupon_Company] FOREIGN KEY([compid])
REFERENCES [dbo].[Company] ([ID])
GO
ALTER TABLE [dbo].[Company_Coupon] CHECK CONSTRAINT [FK_Company_Coupon_Company]
GO
ALTER TABLE [dbo].[Company_Coupon]  WITH CHECK ADD  CONSTRAINT [FK_Company_Coupon_Coupon] FOREIGN KEY([couponid])
REFERENCES [dbo].[Coupon] ([ID])
GO
ALTER TABLE [dbo].[Company_Coupon] CHECK CONSTRAINT [FK_Company_Coupon_Coupon]
GO
ALTER TABLE [dbo].[Cust_Coupon]  WITH CHECK ADD  CONSTRAINT [FK_Cust_Coupon_Coupon] FOREIGN KEY([couponID])
REFERENCES [dbo].[Coupon] ([ID])
GO
ALTER TABLE [dbo].[Cust_Coupon] CHECK CONSTRAINT [FK_Cust_Coupon_Coupon]
GO
ALTER TABLE [dbo].[Cust_Coupon]  WITH CHECK ADD  CONSTRAINT [FK_Cust_Coupon_Customer] FOREIGN KEY([customerID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[Cust_Coupon] CHECK CONSTRAINT [FK_Cust_Coupon_Customer]
GO
