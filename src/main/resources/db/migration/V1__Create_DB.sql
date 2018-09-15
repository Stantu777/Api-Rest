-- Part 1
-- Create a schema to store our tables and other objects in it
CREATE SCHEMA [Genesis];

GO

-- Part 2
-- Create tables
CREATE TABLE [Genesis].[School] (
    id INTEGER NOT NULL PRIMARY KEY,
    name NVARCHAR(128) NOT NULL,
    address NVARCHAR(255) NULL,
    website NVARCHAR(255) NULL,
    phone NVARCHAR(32) NULL,
    principal_id BIGINT NULL,

    is_deleted BIT NULL DEFAULT 0,
    created_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    updated_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    deleted_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time'
);

CREATE TABLE [Genesis].[Title] (
    id INTEGER NOT NULL PRIMARY KEY,
    description NVARCHAR(128) NULL,
    default_prefix NVARCHAR(8) NULL,
    female_prefix NVARCHAR(8) NULL,
    male_prefix NVARCHAR(8) NULL,

    is_deleted BIT NULL DEFAULT 0,
    created_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    updated_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    deleted_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time'
);

CREATE TABLE [Genesis].[Person] (
    id BIGINT NOT NULL PRIMARY KEY,
    id_type SMALLINT NOT NULL,
    first_name NVARCHAR(128) NOT NULL,
    last_name NVARCHAR(128) NOT NULL,
    age SMALLINT NULL,
    sex SMALLINT NULL,
    address NVARCHAR(255) NULL,
    email NVARCHAR(64) NULL,
    phone NVARCHAR(32) NULL,
    active_thesis_id INTEGER NULL,
    role_id INTEGER NULL,
    avatar_id INTEGER NULL,
    school_id INTEGER NULL,
    title_id INTEGER NULL,

    is_deleted BIT NULL DEFAULT 0,
    created_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    updated_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    deleted_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',

    CONSTRAINT unq_person_email UNIQUE (email)
);

CREATE TABLE [Genesis].[Account] (
    person_id BIGINT NOT NULL PRIMARY KEY,
    role_id INTEGER NULL,
    password NVARCHAR(255) NOT NULL,
    active BIT NULL DEFAULT 1,

    is_deleted BIT NULL DEFAULT 0,
    created_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    updated_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    deleted_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time'
);

CREATE TABLE [Genesis].[File] (
    id INTEGER NOT NULL PRIMARY KEY,
    name NVARCHAR(128) NOT NULL,
    extension NVARCHAR(8) NOT NULL,
    data VARBINARY(max) NOT NULL,

    is_deleted BIT NULL DEFAULT 0,
    created_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    updated_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    deleted_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time'
);

CREATE TABLE [Genesis].[LineOfInvestigation] (
    id INTEGER NOT NULL PRIMARY KEY,
    school_id INTEGER NOT NULL,
    description NVARCHAR(128) NOT NULL,

    is_deleted BIT NULL DEFAULT 0,
    created_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    updated_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    deleted_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time'
)

CREATE TABLE [Genesis].[Thesis] (
    id INTEGER NOT NULL PRIMARY KEY,
    topic NVARCHAR(255) NOT NULL,
    line_of_investigation_id INTEGER NOT NULL,
    description NVARCHAR(max) NOT NULL,
    is_archived BIT NULL DEFAULT 0,

    is_deleted BIT NULL DEFAULT 0,
    created_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    updated_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    deleted_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time'
);

CREATE TABLE [Genesis].[ThesisInvitation] (
    id INTEGER NOT NULL PRIMARY KEY,
    thesis_id INTEGER NOT NULL,
    invitee_id BIGINT NOT NULL,
    is_accepted BIT NULL DEFAULT 0,

    is_deleted BIT NULL DEFAULT 0,
    created_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    updated_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    deleted_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time'
);

CREATE TABLE [Genesis].[Notification] (
    id INTEGER NOT NULL PRIMARY KEY,
    owner_id BIGINT NOT NULL,
    message_key NVARCHAR(32) NOT NULL,
    is_read BIT NULL DEFAULT 0,

    is_deleted BIT NULL DEFAULT 0,
    created_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    updated_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    deleted_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time'
);

-- End
GO

-- Part 3
-- Create sequences for auto-incrementing primary keys
CREATE SEQUENCE [Genesis].[seq_file_id] START WITH 1 INCREMENT BY 1 NO CYCLE;
CREATE SEQUENCE [Genesis].[seq_title_id] START WITH 1 INCREMENT BY 1 NO CYCLE;
CREATE SEQUENCE [Genesis].[seq_school_id] START WITH 1 INCREMENT BY 1 NO CYCLE;
CREATE SEQUENCE [Genesis].[seq_thesis_id] START WITH 1 INCREMENT BY 1 NO CYCLE;
CREATE SEQUENCE [Genesis].[seq_notification_id] START WITH 1 INCREMENT BY 1 NO CYCLE;
CREATE SEQUENCE [Genesis].[seq_thesisinvitation_id] START WITH 1 INCREMENT BY 1 NO CYCLE;
CREATE SEQUENCE [Genesis].[seq_lineofinvestigation_id] START WITH 1 INCREMENT BY 1 NO CYCLE;

-- End
GO

-- Part 4
-- Add sequences
ALTER TABLE [Genesis].[File] ADD CONSTRAINT def_file_id DEFAULT NEXT VALUE FOR [Genesis].[seq_file_id] FOR id;
ALTER TABLE [Genesis].[Title] ADD CONSTRAINT def_title_id DEFAULT NEXT VALUE FOR [Genesis].[seq_title_id] FOR id;
ALTER TABLE [Genesis].[Thesis] ADD CONSTRAINT def_thesis_id DEFAULT NEXT VALUE FOR [Genesis].[seq_thesis_id] FOR id;
ALTER TABLE [Genesis].[School] ADD CONSTRAINT def_school_id DEFAULT NEXT VALUE FOR [Genesis].[seq_school_id] FOR id;
ALTER TABLE [Genesis].[Notification] ADD CONSTRAINT def_notification_id DEFAULT NEXT VALUE FOR [Genesis].[seq_notification_id] FOR id;
ALTER TABLE [Genesis].[ThesisInvitation] ADD CONSTRAINT def_thesisinvitation_id DEFAULT NEXT VALUE FOR [Genesis].[seq_thesisinvitation_id] FOR id;
ALTER TABLE [Genesis].[LineOfInvestigation] ADD CONSTRAINT def_lineofinvestigation_id DEFAULT NEXT VALUE FOR [Genesis].[seq_lineofinvestigation_id] FOR id;

-- End
GO

-- Part 5
-- Add foreign keys
ALTER TABLE [Genesis].[Account] ADD CONSTRAINT fk_account_id FOREIGN KEY (person_id) REFERENCES [Genesis].[Person](id);
ALTER TABLE [Genesis].[Person] ADD CONSTRAINT fk_person_title_id FOREIGN KEY (title_id) REFERENCES [Genesis].[Title](id);
ALTER TABLE [Genesis].[Person] ADD CONSTRAINT fk_person_avatar_id FOREIGN KEY (avatar_id) REFERENCES [Genesis].[File](id);
ALTER TABLE [Genesis].[Person] ADD CONSTRAINT fk_person_school_id FOREIGN KEY (school_id) REFERENCES [Genesis].[School](id);
ALTER TABLE [Genesis].[School] ADD CONSTRAINT fk_school_principal_id FOREIGN KEY (principal_id) REFERENCES [Genesis].[Person](id);
ALTER TABLE [Genesis].[Person] ADD CONSTRAINT fk_person_active_thesis_id FOREIGN KEY (active_thesis_id) REFERENCES [Genesis].[Thesis](id);
ALTER TABLE [Genesis].[Notification] ADD CONSTRAINT fk_notification_owner_id FOREIGN KEY (owner_id) REFERENCES [Genesis].[Account](person_id);
ALTER TABLE [Genesis].[ThesisInvitation] ADD CONSTRAINT fk_thesisinvitation_thesis_id FOREIGN KEY (thesis_id) REFERENCES [Genesis].[Thesis](id);
ALTER TABLE [Genesis].[ThesisInvitation] ADD CONSTRAINT fk_thesisinvitation_invitee_id FOREIGN KEY (invitee_id) REFERENCES [Genesis].[Person](id);
ALTER TABLE [Genesis].[Thesis] ADD CONSTRAINT fk_thesis_line_of_investigation_id FOREIGN KEY (line_of_investigation_id) REFERENCES [Genesis].[LineOfInvestigation](id);