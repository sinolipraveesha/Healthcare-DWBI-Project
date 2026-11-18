USE Synthea_DW;
GO

/* =========================================
   1. CHECK ALL DW TABLES
   ========================================= */
SELECT 
    TABLE_SCHEMA,
    TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;
GO


/* =========================================
   2. CHECK PRIMARY KEYS
   ========================================= */
SELECT
    t.name AS TableName,
    kc.name AS PrimaryKeyName,
    c.name AS PrimaryKeyColumn
FROM sys.tables t
INNER JOIN sys.key_constraints kc
    ON t.object_id = kc.parent_object_id
INNER JOIN sys.index_columns ic
    ON kc.parent_object_id = ic.object_id
    AND kc.unique_index_id = ic.index_id
INNER JOIN sys.columns c
    ON ic.object_id = c.object_id
    AND ic.column_id = c.column_id
WHERE kc.type = 'PK'
ORDER BY t.name;
GO


/* =========================================
   3. CHECK FOREIGN KEY RELATIONSHIPS
   ========================================= */
SELECT
    fk.name AS ForeignKeyName,
    OBJECT_NAME(fk.parent_object_id) AS FactTable,
    pc.name AS ForeignKeyColumn,
    OBJECT_NAME(fk.referenced_object_id) AS DimensionTable,
    rc.name AS ReferencedColumn
FROM sys.foreign_keys fk
INNER JOIN sys.foreign_key_columns fkc
    ON fk.object_id = fkc.constraint_object_id
INNER JOIN sys.columns pc
    ON fkc.parent_object_id = pc.object_id
    AND fkc.parent_column_id = pc.column_id
INNER JOIN sys.columns rc
    ON fkc.referenced_object_id = rc.object_id
    AND fkc.referenced_column_id = rc.column_id
ORDER BY FactTable, ForeignKeyName;
GO


/* =========================================
   4. CHECK FACT TABLE COLUMNS / DATATYPES
   ========================================= */
SELECT
    TABLE_NAME,
    ORDINAL_POSITION,
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH,
    NUMERIC_PRECISION,
    NUMERIC_SCALE,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME IN
(
    'FactEncounter',
    'FactCondition',
    'FactProcedure',
    'FactMedication'
)
ORDER BY TABLE_NAME, ORDINAL_POSITION;
GO