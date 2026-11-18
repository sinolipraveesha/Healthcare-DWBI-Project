USE Synthea_DW;
GO

-- =============================================
-- FACT ENCOUNTER
-- Grain:
-- One row represents one unique healthcare
-- encounter for one patient.
-- =============================================

CREATE TABLE dbo.FactEncounter
(
    -- Warehouse surrogate key
    EncounterKey INT IDENTITY(1,1) PRIMARY KEY,

    -- Original encounter ID from Synthea
    EncounterID VARCHAR(100) NOT NULL,

    -- Dimension foreign keys
    PatientKey INT NOT NULL,
    ProviderKey INT NULL,
    OrganizationKey INT NULL,
    PayerKey INT NULL,
    EncounterTypeKey INT NULL,
    StartDateKey INT NOT NULL,
    EndDateKey INT NULL,

    -- Original timestamps
    StartDateTime DATETIME2 NULL,
    EndDateTime DATETIME2 NULL,

    -- Encounter reason
    ReasonCode VARCHAR(50) NULL,
    ReasonDescription VARCHAR(255) NULL,

    -- Measures
    EncounterCount INT NOT NULL DEFAULT 1,
    BaseEncounterCost DECIMAL(18,2) NULL,
    TotalClaimCost DECIMAL(18,2) NULL,
    PayerCoverage DECIMAL(18,2) NULL,

    -- Derived measures
    PatientResponsibility DECIMAL(18,2) NULL,
    EncounterDurationMinutes INT NULL,
    AgeAtEncounter INT NULL,

    -- Prevent duplicate source encounters
    CONSTRAINT UQ_FactEncounter_EncounterID
        UNIQUE (EncounterID),

    -- Foreign key relationships
    CONSTRAINT FK_FactEncounter_Patient
        FOREIGN KEY (PatientKey)
        REFERENCES dbo.DimPatient(PatientKey),

    CONSTRAINT FK_FactEncounter_Provider
        FOREIGN KEY (ProviderKey)
        REFERENCES dbo.DimProvider(ProviderKey),

    CONSTRAINT FK_FactEncounter_Organization
        FOREIGN KEY (OrganizationKey)
        REFERENCES dbo.DimOrganization(OrganizationKey),

    CONSTRAINT FK_FactEncounter_Payer
        FOREIGN KEY (PayerKey)
        REFERENCES dbo.DimPayer(PayerKey),

    CONSTRAINT FK_FactEncounter_EncounterType
        FOREIGN KEY (EncounterTypeKey)
        REFERENCES dbo.DimEncounterType(EncounterTypeKey),

    CONSTRAINT FK_FactEncounter_StartDate
        FOREIGN KEY (StartDateKey)
        REFERENCES dbo.DimDate(DateKey),

    CONSTRAINT FK_FactEncounter_EndDate
        FOREIGN KEY (EndDateKey)
        REFERENCES dbo.DimDate(DateKey)
);
GO