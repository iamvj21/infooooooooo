
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/09/2023 21:33:32
-- Generated from EDMX file: C:\Users\hdara\Downloads\Online-Examination-System-asp.net-mvc--master\Online-Examination-System-asp.net-mvc--master\Online_Exam_Project_Main\Online_Exam_Project_Main\Models\Online_Exam_Model.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Exam_Quiz];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Questions_tbl_Admin_tbl]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Questions_tbl] DROP CONSTRAINT [FK_Questions_tbl_Admin_tbl];
GO
IF OBJECT_ID(N'[dbo].[FK_Result_tbl_Candidate_tbl]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Result_tbl] DROP CONSTRAINT [FK_Result_tbl_Candidate_tbl];
GO
IF OBJECT_ID(N'[dbo].[FK_Exam_tbl_Subject_tbl]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Exam_tbl] DROP CONSTRAINT [FK_Exam_tbl_Subject_tbl];
GO
IF OBJECT_ID(N'[dbo].[FK_Questions_tbl_Exam_tbl]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Questions_tbl] DROP CONSTRAINT [FK_Questions_tbl_Exam_tbl];
GO
IF OBJECT_ID(N'[dbo].[FK_Result_tbl_Exam_tbl1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Result_tbl] DROP CONSTRAINT [FK_Result_tbl_Exam_tbl1];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Admin_tbl]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Admin_tbl];
GO
IF OBJECT_ID(N'[dbo].[Candidate_tbl]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Candidate_tbl];
GO
IF OBJECT_ID(N'[dbo].[Exam_tbl]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Exam_tbl];
GO
IF OBJECT_ID(N'[dbo].[Questions_tbl]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Questions_tbl];
GO
IF OBJECT_ID(N'[dbo].[Result_tbl]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Result_tbl];
GO
IF OBJECT_ID(N'[dbo].[Subject_tbl]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Subject_tbl];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Admin_tbl'
CREATE TABLE [dbo].[Admin_tbl] (
    [admin_id] int IDENTITY(1,1) NOT NULL,
    [admin_name] varchar(50)  NULL,
    [admin_password] varchar(50)  NULL
);
GO

-- Creating table 'Candidate_tbl'
CREATE TABLE [dbo].[Candidate_tbl] (
    [candidate_id] int IDENTITY(1,1) NOT NULL,
    [candidate_name] varchar(50)  NULL,
    [candidate_password] varchar(50)  NULL,
    [candidate_email] varchar(50)  NULL,
    [candidate_contact] decimal(18,0)  NULL,
    [candidate_institution] varchar(50)  NULL
);
GO

-- Creating table 'Exam_tbl'
CREATE TABLE [dbo].[Exam_tbl] (
    [exam_id] int IDENTITY(1,1) NOT NULL,
    [subject_id] int  NULL,
    [exam_title] varchar(100)  NULL
);
GO

-- Creating table 'Questions_tbl'
CREATE TABLE [dbo].[Questions_tbl] (
    [all_qus_id] int IDENTITY(1,1) NOT NULL,
    [qus_id] int  NULL,
    [admin_id] int  NULL,
    [exam_id] int  NULL,
    [qus_title] varchar(100)  NULL,
    [ans1] varchar(50)  NULL,
    [ans2] varchar(50)  NULL,
    [ans3] varchar(50)  NULL,
    [ans4] varchar(50)  NULL,
    [correct_ans] int  NULL
);
GO

-- Creating table 'Result_tbl'
CREATE TABLE [dbo].[Result_tbl] (
    [result_id] int IDENTITY(1,1) NOT NULL,
    [exam_id] int  NULL,
    [candidate_id] int  NULL,
    [total] int  NULL,
    [grade] varchar(10)  NULL,
    [quality] varchar(10)  NULL
);
GO

-- Creating table 'Subject_tbl'
CREATE TABLE [dbo].[Subject_tbl] (
    [subject_id] int IDENTITY(1,1) NOT NULL,
    [subject_title] varchar(50)  NULL,
    [subject_code] varchar(20)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [admin_id] in table 'Admin_tbl'
ALTER TABLE [dbo].[Admin_tbl]
ADD CONSTRAINT [PK_Admin_tbl]
    PRIMARY KEY CLUSTERED ([admin_id] ASC);
GO

-- Creating primary key on [candidate_id] in table 'Candidate_tbl'
ALTER TABLE [dbo].[Candidate_tbl]
ADD CONSTRAINT [PK_Candidate_tbl]
    PRIMARY KEY CLUSTERED ([candidate_id] ASC);
GO

-- Creating primary key on [exam_id] in table 'Exam_tbl'
ALTER TABLE [dbo].[Exam_tbl]
ADD CONSTRAINT [PK_Exam_tbl]
    PRIMARY KEY CLUSTERED ([exam_id] ASC);
GO

-- Creating primary key on [all_qus_id] in table 'Questions_tbl'
ALTER TABLE [dbo].[Questions_tbl]
ADD CONSTRAINT [PK_Questions_tbl]
    PRIMARY KEY CLUSTERED ([all_qus_id] ASC);
GO

-- Creating primary key on [result_id] in table 'Result_tbl'
ALTER TABLE [dbo].[Result_tbl]
ADD CONSTRAINT [PK_Result_tbl]
    PRIMARY KEY CLUSTERED ([result_id] ASC);
GO

-- Creating primary key on [subject_id] in table 'Subject_tbl'
ALTER TABLE [dbo].[Subject_tbl]
ADD CONSTRAINT [PK_Subject_tbl]
    PRIMARY KEY CLUSTERED ([subject_id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [admin_id] in table 'Questions_tbl'
ALTER TABLE [dbo].[Questions_tbl]
ADD CONSTRAINT [FK_Questions_tbl_Admin_tbl]
    FOREIGN KEY ([admin_id])
    REFERENCES [dbo].[Admin_tbl]
        ([admin_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Questions_tbl_Admin_tbl'
CREATE INDEX [IX_FK_Questions_tbl_Admin_tbl]
ON [dbo].[Questions_tbl]
    ([admin_id]);
GO

-- Creating foreign key on [candidate_id] in table 'Result_tbl'
ALTER TABLE [dbo].[Result_tbl]
ADD CONSTRAINT [FK_Result_tbl_Candidate_tbl]
    FOREIGN KEY ([candidate_id])
    REFERENCES [dbo].[Candidate_tbl]
        ([candidate_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Result_tbl_Candidate_tbl'
CREATE INDEX [IX_FK_Result_tbl_Candidate_tbl]
ON [dbo].[Result_tbl]
    ([candidate_id]);
GO

-- Creating foreign key on [subject_id] in table 'Exam_tbl'
ALTER TABLE [dbo].[Exam_tbl]
ADD CONSTRAINT [FK_Exam_tbl_Subject_tbl]
    FOREIGN KEY ([subject_id])
    REFERENCES [dbo].[Subject_tbl]
        ([subject_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Exam_tbl_Subject_tbl'
CREATE INDEX [IX_FK_Exam_tbl_Subject_tbl]
ON [dbo].[Exam_tbl]
    ([subject_id]);
GO

-- Creating foreign key on [exam_id] in table 'Questions_tbl'
ALTER TABLE [dbo].[Questions_tbl]
ADD CONSTRAINT [FK_Questions_tbl_Exam_tbl]
    FOREIGN KEY ([exam_id])
    REFERENCES [dbo].[Exam_tbl]
        ([exam_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Questions_tbl_Exam_tbl'
CREATE INDEX [IX_FK_Questions_tbl_Exam_tbl]
ON [dbo].[Questions_tbl]
    ([exam_id]);
GO

-- Creating foreign key on [exam_id] in table 'Result_tbl'
ALTER TABLE [dbo].[Result_tbl]
ADD CONSTRAINT [FK_Result_tbl_Exam_tbl1]
    FOREIGN KEY ([exam_id])
    REFERENCES [dbo].[Exam_tbl]
        ([exam_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Result_tbl_Exam_tbl1'
CREATE INDEX [IX_FK_Result_tbl_Exam_tbl1]
ON [dbo].[Result_tbl]
    ([exam_id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------