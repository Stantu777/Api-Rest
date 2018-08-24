-- Part 1
-- Create a schema to store our tables and other objects in it
CREATE SCHEMA [Genesis];

-- Missing:
-- Degree titles
-- Thesis files
-- Thesis remarks
-- User avatar
-- Thesis defense before examiners
-- Examiners
-- Sequences
-- End
GO

-- Part 2
-- Create tables
CREATE TABLE [Genesis].[School] (
    id INTEGER NOT NULL PRIMARY KEY,
    name NVARCHAR(128) NOT NULL,
    address NVARCHAR(255) NULL,
    website NVARCHAR(255) NULL,
    phone_number NVARCHAR(32) NULL,
    principal_id BIGINT NULL,

    is_deleted BIT NULL DEFAULT 0,
    created_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    updated_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    deleted_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time'
);

CREATE TABLE [Genesis].[Person] (
    id BIGINT NOT NULL PRIMARY KEY,
    id_type SMALLINT NOT NULL,
    name NVARCHAR(128) NOT NULL,
    last_name NVARCHAR(128) NOT NULL,
    age SMALLINT NULL,
    sex SMALLINT NULL,
    address NVARCHAR(255) NULL,
    email NVARCHAR(64) NULL,
    phone NVARCHAR(32) NULL,
    school_id INTEGER NULL,

    is_deleted BIT NULL DEFAULT 0,
    created_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    updated_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    deleted_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time'
);

CREATE TABLE [Genesis].[User] (
    id BIGINT NOT NULL PRIMARY KEY,
    role_id INTEGER NULL,
    password NVARCHAR(255) NOT NULL,
    active SMALLINT NOT NULL,

    is_deleted BIT NULL DEFAULT 0,
    created_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    updated_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    deleted_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time'
);

CREATE TABLE [Genesis].[Inquiry] (
    id INTEGER NOT NULL PRIMARY KEY,
    line_name NVARCHAR(255) NOT NULL,

    is_deleted BIT NULL DEFAULT 0,
    created_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    updated_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    deleted_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time'
);

CREATE TABLE [Genesis].[Thesis] (
    id INTEGER NOT NULL PRIMARY KEY,
    advisor_id BIGINT NOT NULL,
    inquiry_id INTEGER NULL,
    title NVARCHAR(255) NOT NULL,
    is_archived BIT NULL DEFAULT 0,

    is_deleted BIT NULL DEFAULT 0,
    created_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    updated_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    deleted_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time'
);

CREATE TABLE [Genesis].[Author] (
    id BIGINT NOT NULL,
    thesis_id INTEGER NOT NULL,

    is_deleted BIT NULL DEFAULT 0,
    created_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    updated_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    deleted_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',

    PRIMARY KEY(id, thesis_id)
);

CREATE TABLE [Genesis].[Meeting] (
    id INTEGER NOT NULL PRIMARY KEY,
    thesis_id INTEGER NOT NULL,
    topic NVARCHAR(255) NULL,

    is_deleted BIT NULL DEFAULT 0,
    created_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    updated_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    deleted_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time'
);

CREATE TABLE [Genesis].[Attendant] (
    id BIGINT NOT NULL,
    meeting_id INTEGER NOT NULL,

    is_deleted BIT NULL DEFAULT 0,
    created_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    updated_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    deleted_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',

    PRIMARY KEY(id, meeting_id)
);

CREATE TABLE [Genesis].[Action] (
    id INTEGER NOT NULL PRIMARY KEY,
    meeting_id INTEGER NOT NULL,
    author_id BIGINT NOT NULL,
    content NVARCHAR(max) NULL,

    is_deleted BIT NULL DEFAULT 0,
    created_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    updated_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    deleted_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time'
);

CREATE TABLE [Genesis].[Role] (
    id INTEGER NOT NULL PRIMARY KEY,
    school_id INTEGER NOT NULL,
    name NVARCHAR(64) NOT NULL,

    is_deleted BIT NULL DEFAULT 0,
    created_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    updated_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    deleted_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time'
);

CREATE TABLE [Genesis].[RolePermission] (
    role_id INTEGER NOT NULL,
    permission_id INTEGER NOT NULL,

    is_deleted BIT NULL DEFAULT 0,
    created_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    updated_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    deleted_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',

    PRIMARY KEY (role_id, permission_id)
);

CREATE TABLE [Genesis].[Permission] (
    id INTEGER NOT NULL PRIMARY KEY,
    name NVARCHAR(64) NOT NULL,
    description NVARCHAR(255) NULL

    -- This table does not have log attributes, this is because you aren't supposed
    -- to manage this table through the application, also changing values through a rdbms client
    -- may lead to issues if said changes aren't backed with changes in the code and behavior of
    -- the application.
);

CREATE TABLE [Genesis].[Invite] (
    id INTEGER NOT NULL PRIMARY KEY,
    thesis_id INTEGER NOT NULL,
    author_id BIGINT NOT NULL,
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

-- End
GO

-- Part 3
-- Create sequences for auto-incrementing primary keys
CREATE SEQUENCE [Genesis].[seq_school_id] START WITH 1 INCREMENT BY 1 NO CYCLE;

-- End
GO

-- Part 4
-- Add sequences
ALTER TABLE [Genesis].[School] ADD CONSTRAINT def_school_id DEFAULT NEXT VALUE FOR [Genesis].[seq_school_id] FOR id;

-- End
GO

-- Part 5
-- Add foreign keys
ALTER TABLE [Genesis].[School] ADD CONSTRAINT fk_school_principal_id FOREIGN KEY (principal_id) REFERENCES [Genesis].[Person](id);
ALTER TABLE [Genesis].[Person] ADD CONSTRAINT fk_person_school_id FOREIGN KEY (school_id) REFERENCES [Genesis].[School](id);
ALTER TABLE [Genesis].[User] ADD CONSTRAINT fk_user_id FOREIGN KEY (id) REFERENCES [Genesis].[Person](id);
ALTER TABLE [Genesis].[User] ADD CONSTRAINT fk_user_role_id FOREIGN KEY (role_id) REFERENCES [Genesis].[Role](id);
ALTER TABLE [Genesis].[Thesis] ADD CONSTRAINT fk_thesis_advisor_id FOREIGN KEY (advisor_id) REFERENCES [Genesis].[User](id);
ALTER TABLE [Genesis].[Thesis] ADD CONSTRAINT fk_thesis_inquiry_id FOREIGN KEY (inquiry_id) REFERENCES [Genesis].[Inquiry](id);
ALTER TABLE [Genesis].[Author] ADD CONSTRAINT fk_author_id FOREIGN KEY (id) REFERENCES [Genesis].[Person](id);
ALTER TABLE [Genesis].[Author] ADD CONSTRAINT fk_author_thesis_id FOREIGN KEY (thesis_id) REFERENCES [Genesis].[Thesis](id);
ALTER TABLE [Genesis].[Meeting] ADD CONSTRAINT fk_meeting_thesis_id FOREIGN KEY (thesis_id) REFERENCES [Genesis].[Thesis](id);
ALTER TABLE [Genesis].[Attendant] ADD CONSTRAINT fk_attendant_id FOREIGN KEY (id) REFERENCES [Genesis].[Person](id);
ALTER TABLE [Genesis].[Attendant] ADD CONSTRAINT fk_attendant_meeting_id FOREIGN KEY (meeting_id) REFERENCES [Genesis].[Meeting](id);
ALTER TABLE [Genesis].[Action] ADD CONSTRAINT fk_action_meeting_id FOREIGN KEY (meeting_id) REFERENCES [Genesis].[Meeting](id);
ALTER TABLE [Genesis].[Action] ADD CONSTRAINT fk_action_author_id FOREIGN KEY (author_id) REFERENCES [Genesis].[Person](id);
ALTER TABLE [Genesis].[Role] ADD CONSTRAINT fk_role_school_id FOREIGN KEY (school_id) REFERENCES [Genesis].[School](id);
ALTER TABLE [Genesis].[RolePermission] ADD CONSTRAINT fk_rolepermission_role_id FOREIGN KEY (role_id) REFERENCES [Genesis].[Role](id);
ALTER TABLE [Genesis].[RolePermission] ADD CONSTRAINT fk_rolepermission_permission_id FOREIGN KEY (permission_id) REFERENCES [Genesis].[Permission](id);
