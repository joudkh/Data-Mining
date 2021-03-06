USE [Doctor Assistant DW]
GO
/****** Object:  Table [dbo].[DimAddress]    Script Date: 3/12/2017 1:12:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimAddress](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Street] [nvarchar](50) NOT NULL,
	[ID_OLEDB] [int] NULL,
	[ID_ExcelDB] [int] NULL,
 CONSTRAINT [PK_DimAddress] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DimBirthInformation]    Script Date: 3/12/2017 1:12:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimBirthInformation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Weight] [float] NOT NULL,
	[Length] [float] NOT NULL,
	[Birth_Place] [nvarchar](50) NOT NULL,
	[Head_Circumference] [float] NOT NULL,
	[Birth_Type] [nvarchar](50) NOT NULL,
	[ID_OLEDB] [int] NULL,
	[ID_ExcelDB] [int] NULL,
 CONSTRAINT [PK_DimBirthInformation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DimDate]    Script Date: 3/12/2017 1:12:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DimDate](
	[DateKey] [int] NOT NULL,
	[Date] [datetime] NULL,
	[FullDateUK] [char](10) NULL,
	[FullDateUSA] [char](10) NULL,
	[DayOfMonth] [varchar](2) NULL,
	[DaySuffix] [varchar](4) NULL,
	[DayName] [varchar](9) NULL,
	[DayOfWeekUSA] [char](1) NULL,
	[DayOfWeekUK] [char](1) NULL,
	[DayOfWeekInMonth] [varchar](2) NULL,
	[DayOfWeekInYear] [varchar](2) NULL,
	[DayOfQuarter] [varchar](3) NULL,
	[DayOfYear] [varchar](3) NULL,
	[WeekOfMonth] [varchar](1) NULL,
	[WeekOfQuarter] [varchar](2) NULL,
	[WeekOfYear] [varchar](2) NULL,
	[Month] [varchar](2) NULL,
	[MonthName] [varchar](9) NULL,
	[MonthOfQuarter] [varchar](2) NULL,
	[Quarter] [char](1) NULL,
	[QuarterName] [varchar](9) NULL,
	[Year] [char](4) NULL,
	[YearName] [char](7) NULL,
	[MonthYear] [char](10) NULL,
	[MMYYYY] [char](6) NULL,
	[FirstDayOfMonth] [date] NULL,
	[LastDayOfMonth] [date] NULL,
	[FirstDayOfQuarter] [date] NULL,
	[LastDayOfQuarter] [date] NULL,
	[FirstDayOfYear] [date] NULL,
	[LastDayOfYear] [date] NULL,
	[IsHolidayUSA] [bit] NULL,
	[IsWeekday] [bit] NULL,
	[HolidayUSA] [varchar](50) NULL,
	[IsHolidayUK] [bit] NULL,
	[HolidayUK] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DimDisease]    Script Date: 3/12/2017 1:12:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDisease](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
	[ID_OLEDB] [int] NULL,
	[ID_ExcelDB] [int] NULL,
 CONSTRAINT [PK_DimDisease] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DimMedicine]    Script Date: 3/12/2017 1:12:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimMedicine](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Dose] [int] NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
	[ID_OLEDB] [int] NULL,
	[ID_ExcelDB] [int] NULL,
 CONSTRAINT [PK_DimMedicine] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DimPatient]    Script Date: 3/12/2017 1:12:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimPatient](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[First_Name] [nvarchar](50) NOT NULL,
	[Last_Name] [nvarchar](50) NOT NULL,
	[Date_of_Birth] [datetime] NOT NULL,
	[Gender] [nvarchar](50) NOT NULL,
	[Children_Number] [int] NOT NULL,
	[Blood_Relation] [int] NOT NULL,
	[Child_Order] [int] NOT NULL,
	[Address_ID] [int] NULL,
	[Birth_ID] [int] NULL,
	[ID_OLEDB] [int] NULL,
	[ID_ExcelDB] [int] NULL,
 CONSTRAINT [PK_DimPatient] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DimVaccine]    Script Date: 3/12/2017 1:12:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimVaccine](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[ID_OLEDB] [int] NULL,
	[ID_ExcelDB] [int] NULL,
 CONSTRAINT [PK_DimVaccine] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FactPatientVaccine]    Script Date: 3/12/2017 1:12:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactPatientVaccine](
	[Patient_ID] [int] NOT NULL,
	[Vaccine_ID] [int] NOT NULL,
	[Date_ID] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[Side_Effects] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FactVisit]    Script Date: 3/12/2017 1:12:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactVisit](
	[Patient_ID] [int] NOT NULL,
	[Medicine_ID] [int] NOT NULL,
	[Disease_ID] [int] NOT NULL,
	[Date_ID] [int] NOT NULL,
	[Weight] [float] NOT NULL,
	[Length] [float] NOT NULL,
	[Price] [int] NOT NULL,
	[Heart] [nvarchar](max) NOT NULL,
	[Chest] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[DimPatient]  WITH CHECK ADD  CONSTRAINT [FK_DimPatient_DimAddress] FOREIGN KEY([Address_ID])
REFERENCES [dbo].[DimAddress] ([ID])
GO
ALTER TABLE [dbo].[DimPatient] CHECK CONSTRAINT [FK_DimPatient_DimAddress]
GO
ALTER TABLE [dbo].[DimPatient]  WITH CHECK ADD  CONSTRAINT [FK_DimPatient_DimBirthInformation] FOREIGN KEY([Birth_ID])
REFERENCES [dbo].[DimBirthInformation] ([ID])
GO
ALTER TABLE [dbo].[DimPatient] CHECK CONSTRAINT [FK_DimPatient_DimBirthInformation]
GO
ALTER TABLE [dbo].[FactPatientVaccine]  WITH CHECK ADD  CONSTRAINT [FK_FactPatientVaccine_DimDate] FOREIGN KEY([Date_ID])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[FactPatientVaccine] CHECK CONSTRAINT [FK_FactPatientVaccine_DimDate]
GO
ALTER TABLE [dbo].[FactPatientVaccine]  WITH CHECK ADD  CONSTRAINT [FK_FactPatientVaccine_DimPatient] FOREIGN KEY([Patient_ID])
REFERENCES [dbo].[DimPatient] ([ID])
GO
ALTER TABLE [dbo].[FactPatientVaccine] CHECK CONSTRAINT [FK_FactPatientVaccine_DimPatient]
GO
ALTER TABLE [dbo].[FactPatientVaccine]  WITH CHECK ADD  CONSTRAINT [FK_FactPatientVaccine_DimVaccine] FOREIGN KEY([Vaccine_ID])
REFERENCES [dbo].[DimVaccine] ([ID])
GO
ALTER TABLE [dbo].[FactPatientVaccine] CHECK CONSTRAINT [FK_FactPatientVaccine_DimVaccine]
GO
ALTER TABLE [dbo].[FactVisit]  WITH CHECK ADD  CONSTRAINT [FK_FactVisit_DimDate] FOREIGN KEY([Date_ID])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[FactVisit] CHECK CONSTRAINT [FK_FactVisit_DimDate]
GO
ALTER TABLE [dbo].[FactVisit]  WITH CHECK ADD  CONSTRAINT [FK_FactVisit_DimDisease] FOREIGN KEY([Disease_ID])
REFERENCES [dbo].[DimDisease] ([ID])
GO
ALTER TABLE [dbo].[FactVisit] CHECK CONSTRAINT [FK_FactVisit_DimDisease]
GO
ALTER TABLE [dbo].[FactVisit]  WITH CHECK ADD  CONSTRAINT [FK_FactVisit_DimMedicine] FOREIGN KEY([Medicine_ID])
REFERENCES [dbo].[DimMedicine] ([ID])
GO
ALTER TABLE [dbo].[FactVisit] CHECK CONSTRAINT [FK_FactVisit_DimMedicine]
GO
ALTER TABLE [dbo].[FactVisit]  WITH CHECK ADD  CONSTRAINT [FK_FactVisit_DimPatient] FOREIGN KEY([Patient_ID])
REFERENCES [dbo].[DimPatient] ([ID])
GO
ALTER TABLE [dbo].[FactVisit] CHECK CONSTRAINT [FK_FactVisit_DimPatient]
GO
