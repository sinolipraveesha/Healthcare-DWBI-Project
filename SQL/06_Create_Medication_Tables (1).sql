USE Synthea_DW;
GO

/* =========================================
   DIMENSION: Medication
   ========================================= */

CREATE TABLE dbo.DimMedication
(
    MedicationKey INT IDENTITY(1,1) PRIMARY KEY,
    MedicationCode VARCHAR(50) NOT NULL,
    MedicationDescription VARCHAR(255) NULL
);
GO


/* =========================================
   FACT: Medication
   Grain: One row per medication record
          for one patient
   ========================================= */

CREATE TABLE dbo.FactMedication
(
    MedicationFactKey INT IDENTITY(1,1) PRIMARY KEY,

    MedicationID INT NOT NULL,

    MedicationKey INT NOT NULL,
    PatientKey INT NOT NULL,
    PayerKey INT NULL,

    EncounterID VARCHAR(100) NOT NULL,

    StartDateKey INT NOT NULL,
    EndDateKey INT NULL,

    StartDateTime DATETIME2 NULL,
    EndDateTime DATETIME2 NULL,

    ReasonCode VARCHAR(50) NULL,
    ReasonDescription VARCHAR(255) NULL,

    MedicationCount INT NOT NULL DEFAULT 1,

    BaseCost DECIMAL(18,2) NULL,
    PayerCoverage DECIMAL(18,2) NULL,
    Dispenses INT NULL,
    TotalCost DECIMAL(18,2) NULL,
    PatientMedicationCost DECIMAL(18,2) NULL,

    CONSTRAINT UQ_FactMedication_MedicationID
        UNIQUE (MedicationID),

    CONSTRAINT FK_FactMedication_Medication
        FOREIGN KEY (MedicationKey)
        REFERENCES dbo.DimMedication(MedicationKey),

    CONSTRAINT FK_FactMedication_Patient
        FOREIGN KEY (PatientKey)
        REFERENCES dbo.DimPatient(PatientKey),

    CONSTRAINT FK_FactMedication_Payer
        FOREIGN KEY (PayerKey)
        REFERENCES dbo.DimPayer(PayerKey),

    CONSTRAINT FK_FactMedication_StartDate
        FOREIGN KEY (StartDateKey)
        REFERENCES dbo.DimDate(DateKey),

    CONSTRAINT FK_FactMedication_EndDate
        FOREIGN KEY (EndDateKey)
        REFERENCES dbo.DimDate(DateKey)
);
GO