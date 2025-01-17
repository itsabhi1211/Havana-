USE [master]
GO
/****** Object:  Database [HavanaRealEstate]    Script Date: 25-04-2019 13:54:05 ******/
CREATE DATABASE [HavanaRealEstate]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HavanaRealEstate', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\HavanaRealEstate.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HavanaRealEstate_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\HavanaRealEstate_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [HavanaRealEstate] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HavanaRealEstate].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HavanaRealEstate] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HavanaRealEstate] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HavanaRealEstate] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HavanaRealEstate] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HavanaRealEstate] SET ARITHABORT OFF 
GO
ALTER DATABASE [HavanaRealEstate] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HavanaRealEstate] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HavanaRealEstate] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HavanaRealEstate] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HavanaRealEstate] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HavanaRealEstate] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HavanaRealEstate] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HavanaRealEstate] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HavanaRealEstate] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HavanaRealEstate] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HavanaRealEstate] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HavanaRealEstate] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HavanaRealEstate] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HavanaRealEstate] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HavanaRealEstate] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HavanaRealEstate] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HavanaRealEstate] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HavanaRealEstate] SET RECOVERY FULL 
GO
ALTER DATABASE [HavanaRealEstate] SET  MULTI_USER 
GO
ALTER DATABASE [HavanaRealEstate] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HavanaRealEstate] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HavanaRealEstate] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HavanaRealEstate] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HavanaRealEstate] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HavanaRealEstate', N'ON'
GO
ALTER DATABASE [HavanaRealEstate] SET QUERY_STORE = OFF
GO
USE [HavanaRealEstate]
GO
USE [HavanaRealEstate]
GO
/****** Object:  Sequence [dbo].[InvoiceNumber]    Script Date: 25-04-2019 13:54:05 ******/
CREATE SEQUENCE [dbo].[InvoiceNumber] 
 AS [bigint]
 START WITH 1000000
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Table [dbo].[FeebackRply]    Script Date: 25-04-2019 13:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeebackRply](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RplyId] [int] NULL,
	[Rply] [varchar](500) NULL,
	[Updt] [datetime] NULL,
	[Crdt] [datetime] NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblavailableblocks]    Script Date: 25-04-2019 13:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblavailableblocks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BlockId] [int] NULL,
	[BlockNo] [int] NULL,
	[IsBooked] [bit] NULL,
	[Crdt] [datetime] NULL,
	[Updt] [datetime] NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblbank]    Script Date: 25-04-2019 13:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblbank](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RegId] [int] NULL,
	[BankName] [varchar](50) NULL,
	[BankBranch] [varchar](50) NULL,
	[IFSC] [varchar](11) NULL,
	[AccountNo] [bigint] NULL,
	[Updt] [datetime] NULL,
	[Crdt] [datetime] NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblblockcategory]    Script Date: 25-04-2019 13:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblblockcategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BlockName] [varchar](50) NULL,
	[Crdt] [datetime] NULL,
	[Updt] [datetime] NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblcontactus]    Script Date: 25-04-2019 13:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblcontactus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Contact] [bigint] NULL,
	[Email] [varchar](50) NULL,
	[Message] [varchar](500) NULL,
	[Updt] [datetime] NULL,
	[Crdt] [datetime] NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmiMode]    Script Date: 25-04-2019 13:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmiMode](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PropertyId] [int] NULL,
	[PlanMasterId] [int] NULL,
	[PlanChargeId] [int] NULL,
	[Mode] [int] NULL,
	[Installment] [int] NULL,
	[Amount] [decimal](10, 2) NULL,
	[Crdt] [datetime2](7) NULL,
	[Updt] [datetime2](7) NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblfeedback]    Script Date: 25-04-2019 13:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblfeedback](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[ContactNo] [bigint] NULL,
	[Msg] [varchar](500) NULL,
	[Rating] [char](1) NULL,
	[Updt] [datetime] NULL,
	[Crdt] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK__tblfeedb__3214EC074034A161] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblInvoice]    Script Date: 25-04-2019 13:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblInvoice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[InvoiceNo] [bigint] NULL,
	[Crdt] [datetime2](7) NULL,
	[Updt] [datetime2](7) NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblkyc]    Script Date: 25-04-2019 13:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblkyc](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RegId] [int] NULL,
	[Pan] [varchar](10) NULL,
	[Aadhaar] [bigint] NULL,
	[Updt] [date] NULL,
	[Crdt] [date] NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPayment]    Script Date: 25-04-2019 13:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPayment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[EMiModeId] [int] NULL,
	[TotalAmount] [decimal](18, 2) NULL,
	[PaidAmount] [decimal](18, 2) NULL,
	[DueAmount] [decimal](18, 2) NULL,
	[ExtraCharge] [decimal](18, 2) NULL,
	[InstallmentNo] [int] NULL,
	[NextDate] [datetime2](7) NULL,
	[PaymentDate] [datetime2](7) NULL,
	[Updt] [datetime2](7) NULL,
	[IsActive] [bit] NULL,
	[IsPaymentCompleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPaymentHistory]    Script Date: 25-04-2019 13:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPaymentHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[EMiModeId] [int] NULL,
	[InvoiceNo] [bigint] NULL,
	[TotalAmount] [decimal](18, 2) NULL,
	[PaidAmount] [decimal](18, 2) NULL,
	[DueAmount] [decimal](18, 2) NULL,
	[ExtraCharge] [decimal](18, 2) NULL,
	[InstallmentNo] [int] NULL,
	[NextDate] [datetime2](7) NULL,
	[PaymentDate] [datetime2](7) NULL,
	[Updt] [datetime2](7) NULL,
	[IsActive] [bit] NULL,
	[IsPaymentCompleted] [bit] NULL,
 CONSTRAINT [PK__tblPayme__3214EC071956E32F] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPaymentMode]    Script Date: 25-04-2019 13:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPaymentMode](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Mode] [int] NULL,
	[BankName] [varchar](50) NULL,
	[BankBranch] [varchar](50) NULL,
	[Check] [bigint] NULL,
	[DD] [bigint] NULL,
	[TransactionID] [varchar](50) NULL,
	[Crdt] [datetime2](7) NULL,
	[Updt] [datetime2](7) NULL,
	[IsActive] [bit] NULL,
	[EMiModeId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPlanCharges]    Script Date: 25-04-2019 13:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPlanCharges](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PlanId] [int] NULL,
	[EMI] [decimal](18, 0) NULL,
	[Total_EMI] [decimal](18, 0) NULL,
	[Tax] [decimal](18, 0) NULL,
	[Taxed_Amount] [decimal](18, 0) NULL,
	[Monthly_Amount] [decimal](18, 0) NULL,
	[Total_Amount] [decimal](18, 0) NULL,
	[Updt] [datetime] NULL,
	[Crdt] [datetime] NULL,
	[IsActive] [bit] NULL,
	[Price] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPlansMaster]    Script Date: 25-04-2019 13:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPlansMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PlanName] [varchar](50) NULL,
	[Updt] [datetime] NULL,
	[Crdt] [datetime] NULL,
	[IsActive] [bit] NULL,
	[PropertyId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblprofile]    Script Date: 25-04-2019 13:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblprofile](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RegId] [int] NULL,
	[Picture] [varchar](max) NULL,
	[Gender] [char](1) NULL,
	[State] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Address] [varchar](100) NULL,
	[Pin] [bigint] NULL,
	[DOB] [date] NULL,
	[Updt] [datetime] NULL,
	[Crdt] [datetime] NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProperties]    Script Date: 25-04-2019 13:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Address] [varchar](100) NULL,
	[Price] [bigint] NULL,
	[Bedroom] [int] NULL,
	[Bathroom] [int] NULL,
	[Area] [bigint] NULL,
	[For] [varchar](16) NULL,
	[Updt] [datetime] NULL,
	[Crdt] [datetime] NULL,
	[IsActive] [bit] NULL,
	[Image] [varchar](max) NULL,
	[FlatId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblreg]    Script Date: 25-04-2019 13:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblreg](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RegNo] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[ContactNo] [bigint] NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](16) NULL,
	[IsVerified] [bit] NULL,
	[Updt] [date] NULL,
	[Crdt] [date] NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[RegNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ContactNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblrplycontact]    Script Date: 25-04-2019 13:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblrplycontact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ContactId] [int] NULL,
	[Rply] [varchar](500) NULL,
	[Crdt] [datetime] NULL,
	[Updt] [datetime] NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FeebackRply]  WITH CHECK ADD  CONSTRAINT [FK__FeebackRp__RplyI__60A75C0F] FOREIGN KEY([RplyId])
REFERENCES [dbo].[tblfeedback] ([Id])
GO
ALTER TABLE [dbo].[FeebackRply] CHECK CONSTRAINT [FK__FeebackRp__RplyI__60A75C0F]
GO
ALTER TABLE [dbo].[tblavailableblocks]  WITH CHECK ADD FOREIGN KEY([BlockId])
REFERENCES [dbo].[tblblockcategory] ([Id])
GO
ALTER TABLE [dbo].[tblbank]  WITH CHECK ADD FOREIGN KEY([RegId])
REFERENCES [dbo].[tblreg] ([Id])
GO
ALTER TABLE [dbo].[tblEmiMode]  WITH CHECK ADD FOREIGN KEY([PlanChargeId])
REFERENCES [dbo].[tblPlanCharges] ([Id])
GO
ALTER TABLE [dbo].[tblEmiMode]  WITH CHECK ADD FOREIGN KEY([PlanMasterId])
REFERENCES [dbo].[tblPlansMaster] ([Id])
GO
ALTER TABLE [dbo].[tblEmiMode]  WITH CHECK ADD FOREIGN KEY([PropertyId])
REFERENCES [dbo].[tblProperties] ([Id])
GO
ALTER TABLE [dbo].[tblInvoice]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[tblreg] ([Id])
GO
ALTER TABLE [dbo].[tblkyc]  WITH CHECK ADD FOREIGN KEY([RegId])
REFERENCES [dbo].[tblreg] ([Id])
GO
ALTER TABLE [dbo].[tblPayment]  WITH CHECK ADD FOREIGN KEY([EMiModeId])
REFERENCES [dbo].[tblEmiMode] ([Id])
GO
ALTER TABLE [dbo].[tblPayment]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[tblreg] ([Id])
GO
ALTER TABLE [dbo].[tblPaymentHistory]  WITH CHECK ADD  CONSTRAINT [FK__tblPaymen__EMiMo__32AB8735] FOREIGN KEY([EMiModeId])
REFERENCES [dbo].[tblEmiMode] ([Id])
GO
ALTER TABLE [dbo].[tblPaymentHistory] CHECK CONSTRAINT [FK__tblPaymen__EMiMo__32AB8735]
GO
ALTER TABLE [dbo].[tblPaymentHistory]  WITH CHECK ADD  CONSTRAINT [FK__tblPaymen__UserI__31B762FC] FOREIGN KEY([UserId])
REFERENCES [dbo].[tblreg] ([Id])
GO
ALTER TABLE [dbo].[tblPaymentHistory] CHECK CONSTRAINT [FK__tblPaymen__UserI__31B762FC]
GO
ALTER TABLE [dbo].[tblPaymentMode]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[tblreg] ([Id])
GO
ALTER TABLE [dbo].[tblPaymentMode]  WITH CHECK ADD  CONSTRAINT [Fk_tblpaymentmode_EmiModeId] FOREIGN KEY([EMiModeId])
REFERENCES [dbo].[tblEmiMode] ([Id])
GO
ALTER TABLE [dbo].[tblPaymentMode] CHECK CONSTRAINT [Fk_tblpaymentmode_EmiModeId]
GO
ALTER TABLE [dbo].[tblPlanCharges]  WITH CHECK ADD FOREIGN KEY([PlanId])
REFERENCES [dbo].[tblPlansMaster] ([Id])
GO
ALTER TABLE [dbo].[tblPlansMaster]  WITH CHECK ADD  CONSTRAINT [Fk_tblPlanMaster_PropertyId] FOREIGN KEY([PropertyId])
REFERENCES [dbo].[tblProperties] ([Id])
GO
ALTER TABLE [dbo].[tblPlansMaster] CHECK CONSTRAINT [Fk_tblPlanMaster_PropertyId]
GO
ALTER TABLE [dbo].[tblprofile]  WITH CHECK ADD FOREIGN KEY([RegId])
REFERENCES [dbo].[tblreg] ([Id])
GO
ALTER TABLE [dbo].[tblProperties]  WITH CHECK ADD  CONSTRAINT [fk_tblproperties_FlatId] FOREIGN KEY([FlatId])
REFERENCES [dbo].[tblavailableblocks] ([Id])
GO
ALTER TABLE [dbo].[tblProperties] CHECK CONSTRAINT [fk_tblproperties_FlatId]
GO
ALTER TABLE [dbo].[tblrplycontact]  WITH CHECK ADD FOREIGN KEY([ContactId])
REFERENCES [dbo].[tblcontactus] ([Id])
GO
/****** Object:  StoredProcedure [dbo].[Sp_Invoice]    Script Date: 25-04-2019 13:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Sp_Invoice]
  @UserId int ,
  @InvoiceNo Bigint,
@Message varchar(100) output
As
Begin 
 Begin Try
  Begin Transaction
   insert into tblInvoice values(@UserId,@InvoiceNo,GETDATE(),GETDATE(),1)
   set @Message='Details Had Been Added Successfully.'
   Print @Message
  Commit Transaction
 End Try
 Begin Catch
    RollBack Transaction
	set @Message='Connectivity Issue.Try After Sometime.'
	Print @Message
 End Catch
End
GO
/****** Object:  StoredProcedure [dbo].[Sp_PaymentMode]    Script Date: 25-04-2019 13:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Sp_PaymentMode]
  @UserId int ,
  @Mode int,
  @BankName varchar(50),
  @BankBranch varchar(50),
  @Check bigint,
  @DD bigint,
  @TransactionID varchar(50),
  @EmiModeId int,
@Message varchar(100) output
As
Begin 
 Begin Try
  Begin Transaction
   insert into tblPaymentMode values(@UserId,@Mode,@BankName,@BankBranch,@Check,@DD,@TransactionID,GETDATE(),GETDATE(),1,@EmiModeId)
   set @Message='Details Had Been Added Successfully.'
   Print @Message
  Commit Transaction
 End Try
 Begin Catch
    RollBack Transaction
	set @Message='Connectivity Issue.Try After Sometime.'
	Print @Message
 End Catch
End
GO
/****** Object:  StoredProcedure [dbo].[sp_propertydetails]    Script Date: 25-04-2019 13:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_propertydetails]
as 
begin
select Id,[Address],Price,Bedroom,Bathroom,Area  ,Image ,
case 
when [For]='R' then 'Rent'
 else 'Sale'
end
 as PType from tblProperties
  where IsActive='1'
 end
GO
/****** Object:  StoredProcedure [dbo].[sp_rating]    Script Date: 25-04-2019 13:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_rating]
as
begin
SELECT Rating,Count(Rating) as Total
from tblfeedback
group by Rating
order By count(Rating) Desc
end
GO
/****** Object:  StoredProcedure [dbo].[spPaymentHistory]    Script Date: 25-04-2019 13:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spPaymentHistory]
@UserId int,
@EmiMode int,
@TotalAmount decimal(18,2),
@PaidAmount decimal(18,2),
@DueAmount decimal(18,2),
@ExtraCharge decimal(18,2),
@InstallmentNo int,
@NextDate datetime,
@PaymentDate datetime,
@PrintInvoiceNo bigint output
As
Begin
   declare @InvoiceNo bigint
   set @InvoiceNo=next value for InvoiceNumber
   insert into tblPaymentHistory values(@UserId,@EmiMode,@InvoiceNo,@TotalAmount,@PaidAmount,@DueAmount,@ExtraCharge,@InstallmentNo,@NextDate,@PaymentDate,getdate(),1,0)
   set @PrintInvoiceNo=@InvoiceNo
   print @PrintInvoiceNo
End
GO
/****** Object:  StoredProcedure [dbo].[spPaymentMode]    Script Date: 25-04-2019 13:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spPaymentMode]
@UserId int,
@Mode int,
@BankName varchar(50),
@BankBranch varchar(50),
@Cheque int,
@DD int,
@TransactionId Varchar(50),
@EmiModeId int
As
Begin
  
   insert into tblPaymentMode values(@UserId,@Mode,@BankName,@BankBranch,@Cheque,@DD,@TransactionId,GetDate(),GetDate(),1,@EmiModeId)
 
End
GO
/****** Object:  StoredProcedure [dbo].[spPropertyDetails]    Script Date: 25-04-2019 13:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[spPropertyDetails]   
  
@PropertyId int  
as  
Begin  
  
select PM.PlanName,P.Price,  
case   
When EM.Mode=5 then 'One Time Payment'  
When EM.Mode=4 then 'Half-Yearly'  
When EM.Mode=3 then 'Quarterly'  
When EM.Mode=2 then 'Two-Month'  
When EM.Mode=1 then 'Monthly'  
else 'Not Defined'  
End as EmiMode,  
Em.Id as EmiModeId,Em.InstallMent,Em.Amount,EM.PropertyId,Em.PlanMasterId,Em.PlanchargeId,PC.Total_Amount,P.FlatId 
from tblEmiMode EM  
inner join tblProperties P on P.Id=EM.PropertyId  
inner join tblPlansMaster Pm on Pm.Id=EM.PlanMasterId  
inner join tblPlanCharges PC on PC.Id=EM.PlanChargeId  
where EM.IsActive=1 and Em.PropertyId=@PropertyId  
End  
GO
/****** Object:  StoredProcedure [dbo].[spUpdatePayment]    Script Date: 25-04-2019 13:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spUpdatePayment]
@UserId int,
@EmiMode int,
@TotalAmount decimal(18,2),
@PaidAmount decimal(18,2),
@DueAmount decimal(18,2),
@ExtraCharge decimal(18,2),
@InstallmentNo int,
@NextDate datetime,
@PaymentDate datetime,
@Message varchar(100) output
As
Begin
   insert into tblPayment values(@UserId,@EmiMode,@TotalAmount,@PaidAmount,@DueAmount,@ExtraCharge,@InstallmentNo,@NextDate,@PaymentDate,getdate(),1,0)
   set @Message='Congratulations! Payment Completed.Pending For Approval Now'
   print @Message
End
GO
/****** Object:  StoredProcedure [dbo].[spViewAllBlocks]    Script Date: 25-04-2019 13:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spViewAllBlocks]
@BlockName varchar(50)=null,
@BlockNo int=null
As
Begin
select B.BlockName,A.* from tblavailableblocks A
inner join
tblblockcategory B on B.Id=A.BlockId
where B.IsActive=1 and A.IsActive=1 and (B.BlockName like '%'+@BlockName+'%' or @BlockName is null) and (A.BlockNo=@BlockNo or @BlockNo is Null)
End
GO
USE [master]
GO
ALTER DATABASE [HavanaRealEstate] SET  READ_WRITE 
GO
