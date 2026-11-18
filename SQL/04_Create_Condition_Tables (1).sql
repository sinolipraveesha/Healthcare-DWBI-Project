USE Synthea_DW;
GO

/* =========================================
   DIMENSION: Condition
   ========================================= */

CREATE TABLE dbo.DimCondition
(
    ConditionKey INT IDENTITY(1,1) PRIMARY KEY,
    ConditionCode VARCHAR(50) NOT NULL,
    ConditionDescription VARCHAR(255) NULL
);
GO


/* =========================================
   FACT: Condition
   Grain: One row per recorded condition
          for one patient
   ========================================= */

CREATE TABLE dbo.FactCondition
(
    ConditionFactKey INT IDENTITY(1,1) PRIMARY KEY,

    ConditionID INT NOT NULL,

    ConditionKey INT NOT NULL,
    PatientKey INT NOT NULL,

    EncounterID VARCHAR(100) NOT NULL,

    StartDateKey INT NOT NULL,
    EndDateKey INT NULL,

    ConditionCount INT NOT NULL DEFAULT 1,

    CONSTRAINT UQ_FactCondition_ConditionID
        UNIQUE (ConditionID),

    CONSTRAINT FK_FactCondition_Condition
        FOREIGN KEY (ConditionKey)
        REFERENCES dbo.DimCondition(ConditionKey),

    CONSTRAINT FK_FactCondition_Patient
        FOREIGN KEY (PatientKey)
        REFERENCES dbo.DimPatient(PatientKey),

    CONSTRAINT FK_FactCondition_StartDate
        FOREIGN KEY (StartDateKey)
        REFERENCES dbo.DimDate(DateKey),

    CONSTRAINT FK_FactCondition_EndDate
        FOREIGN KEY (EndDateKey)
        REFERENCES dbo.DimDate(DateKey)
);
GO