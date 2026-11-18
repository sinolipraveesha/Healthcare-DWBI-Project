USE Synthea_DW;
GO

/* =========================================
   DIMENSION: Procedure
   ========================================= */

CREATE TABLE dbo.DimProcedure
(
    ProcedureKey INT IDENTITY(1,1) PRIMARY KEY,
    ProcedureCode VARCHAR(50) NOT NULL,
    ProcedureDescription VARCHAR(255) NULL
);
GO


/* =========================================
   FACT: Procedure
   Grain: One row per procedure performed
          for one patient
   ========================================= */

CREATE TABLE dbo.FactProcedure
(
    ProcedureFactKey INT IDENTITY(1,1) PRIMARY KEY,

    ProcedureID INT NOT NULL,

    ProcedureKey INT NOT NULL,
    PatientKey INT NOT NULL,

    EncounterID VARCHAR(100) NOT NULL,

    StartDateKey INT NOT NULL,
    EndDateKey INT NULL,

    StartDateTime DATETIME2 NULL,
    EndDateTime DATETIME2 NULL,

    ReasonCode VARCHAR(50) NULL,
    ReasonDescription VARCHAR(255) NULL,

    ProcedureCount INT NOT NULL DEFAULT 1,
    BaseCost DECIMAL(18,2) NULL,

    CONSTRAINT UQ_FactProcedure_ProcedureID
        UNIQUE (ProcedureID),

    CONSTRAINT FK_FactProcedure_Procedure
        FOREIGN KEY (ProcedureKey)
        REFERENCES dbo.DimProcedure(ProcedureKey),

    CONSTRAINT FK_FactProcedure_Patient
        FOREIGN KEY (PatientKey)
        REFERENCES dbo.DimPatient(PatientKey),

    CONSTRAINT FK_FactProcedure_StartDate
        FOREIGN KEY (StartDateKey)
        REFERENCES dbo.DimDate(DateKey),

    CONSTRAINT FK_FactProcedure_EndDate
        FOREIGN KEY (EndDateKey)
        REFERENCES dbo.DimDate(DateKey)
);
GO