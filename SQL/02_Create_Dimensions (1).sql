USE Synthea_DW;
GO

USE Synthea_DW;
GO

-- =============================================
-- 1. DIM PATIENT
-- =============================================
CREATE TABLE DimPatient (
    PatientKey INT IDENTITY(1,1) PRIMARY KEY,
    PatientID VARCHAR(100) NOT NULL,
    BirthDate DATE NULL,
    DeathDate DATE NULL,
    Gender VARCHAR(20) NULL,
    Race VARCHAR(50) NULL,
    Ethnicity VARCHAR(50) NULL,
    MaritalStatus VARCHAR(20) NULL,
    BirthPlace VARCHAR(150) NULL,
    City VARCHAR(100) NULL,
    State VARCHAR(100) NULL,
    County VARCHAR(100) NULL,
    ZipCode VARCHAR(20) NULL,

    CONSTRAINT UQ_DimPatient_PatientID UNIQUE (PatientID)
);
GO


-- =============================================
-- 2. DIM PROVIDER
-- =============================================
CREATE TABLE DimProvider (
    ProviderKey INT IDENTITY(1,1) PRIMARY KEY,
    ProviderID VARCHAR(100) NOT NULL,
    ProviderName VARCHAR(200) NULL,
    Gender VARCHAR(20) NULL,
    Speciality VARCHAR(100) NULL,
    Address VARCHAR(200) NULL,
    City VARCHAR(100) NULL,
    State VARCHAR(100) NULL,
    ZipCode VARCHAR(20) NULL,
    Latitude DECIMAL(9,6) NULL,
    Longitude DECIMAL(9,6) NULL,

    CONSTRAINT UQ_DimProvider_ProviderID UNIQUE (ProviderID)
);
GO


-- =============================================
-- 3. DIM ORGANIZATION
-- =============================================
CREATE TABLE DimOrganization (
    OrganizationKey INT IDENTITY(1,1) PRIMARY KEY,
    OrganizationID VARCHAR(100) NOT NULL,
    OrganizationName VARCHAR(200) NULL,
    Address VARCHAR(200) NULL,
    City VARCHAR(100) NULL,
    State VARCHAR(100) NULL,
    ZipCode VARCHAR(20) NULL,
    Phone VARCHAR(50) NULL,
    Latitude DECIMAL(9,6) NULL,
    Longitude DECIMAL(9,6) NULL,

    CONSTRAINT UQ_DimOrganization_OrganizationID UNIQUE (OrganizationID)
);
GO


-- =============================================
-- 4. DIM PAYER
-- =============================================
CREATE TABLE DimPayer (
    PayerKey INT IDENTITY(1,1) PRIMARY KEY,
    PayerID VARCHAR(100) NOT NULL,
    PayerName VARCHAR(200) NULL,
    Address VARCHAR(200) NULL,
    City VARCHAR(100) NULL,
    State VARCHAR(100) NULL,
    ZipCode VARCHAR(20) NULL,
    Phone VARCHAR(50) NULL,

    CONSTRAINT UQ_DimPayer_PayerID UNIQUE (PayerID)
);
GO


-- =============================================
-- 5. DIM DATE
-- =============================================
CREATE TABLE DimDate (
    DateKey INT PRIMARY KEY,
    FullDate DATE NOT NULL,
    DayNumber TINYINT NOT NULL,
    DayName VARCHAR(10) NOT NULL,
    MonthNumber TINYINT NOT NULL,
    MonthName VARCHAR(10) NOT NULL,
    QuarterNumber TINYINT NOT NULL,
    QuarterName VARCHAR(2) NOT NULL,
    Year SMALLINT NOT NULL,
    IsWeekend BIT NOT NULL,

    CONSTRAINT UQ_DimDate_FullDate UNIQUE (FullDate)
);
GO


-- =============================================
-- 6. DIM ENCOUNTER TYPE
-- =============================================
CREATE TABLE DimEncounterType (
    EncounterTypeKey INT IDENTITY(1,1) PRIMARY KEY,
    EncounterClass VARCHAR(50) NULL,
    EncounterCode VARCHAR(50) NULL,
    EncounterDescription VARCHAR(255) NULL
);
GO