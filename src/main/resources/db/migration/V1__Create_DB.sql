-- Part 1
-- Create a schema to store our tables and other objects in it
CREATE SCHEMA [Genesis];

-- Missing:
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
    first_name NVARCHAR(128) NOT NULL,
    last_name NVARCHAR(128) NOT NULL,
    age SMALLINT NULL,
    sex BIT NULL,
    address NVARCHAR(255) NULL,
    email NVARCHAR(64) NULL,
    phone NVARCHAR(32) NULL,
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
    description NVARCHAR(max) NULL,

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

CREATE TABLE [Genesis].[ThesisFile] (
    thesis_id INTEGER NOT NULL,
    file_id INTEGER NOT NULL,

    is_deleted BIT NULL DEFAULT 0,
    created_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    updated_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    deleted_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',

    PRIMARY KEY (thesis_id, file_id)
);

CREATE TABLE [Genesis].[Avatar] (
    account_id BIGINT NOT NULL,
    file_id INTEGER NOT NULL,

    is_deleted BIT NULL DEFAULT 0,
    created_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    updated_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    deleted_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',

    PRIMARY KEY (account_id, file_id)
);

CREATE TABLE [Genesis].[Remark] (
    id INTEGER NOT NULL PRIMARY KEY,
    thesis_id INTEGER NOT NULL,
    author_id BIGINT NOT NULL,
    ref_file INTEGER NULL,
    description NVARCHAR(max) NULL,

    is_deleted BIT NULL DEFAULT 0,
    created_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    updated_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    deleted_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time'
);

CREATE TABLE [Genesis].[Defense] (
    id INTEGER NOT NULL PRIMARY KEY,
    thesis_id INTEGER NOT NULL,
    presentation_date DATETIMEOFFSET(0) NULL,
    is_successful BIT NULL,

    is_deleted BIT NULL DEFAULT 0,
    created_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    updated_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    deleted_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time'
);

CREATE TABLE [Genesis].[Examiner] (
    id BIGINT NOT NULL,
    defense_id INTEGER NOT NULL,
    score SMALLINT NULL,

    is_deleted BIT NULL DEFAULT 0,
    created_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    updated_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    deleted_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',

    PRIMARY KEY (id, defense_id)
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

CREATE TABLE [Genesis].[Submission] (
    id INTEGER NOT NULL PRIMARY KEY,
    account_id BIGINT NOT NULL,
    thesis_id INTEGER NOT NULL,
    is_approved BIT NULL DEFAULT 0,

    is_deleted BIT NULL DEFAULT 0,
    created_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    updated_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    deleted_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time'
);

CREATE TABLE [Genesis].[Attachment] (
    submission_id INTEGER NOT NULL,
    file_id INTEGER NOT NULL,

    is_deleted BIT NULL DEFAULT 0,
    created_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    updated_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',
    deleted_at DATETIMEOFFSET(0) NULL DEFAULT CAST(GETUTCDATE() as datetimeoffset(0)) AT TIME ZONE 'SA Pacific Standard Time',

    PRIMARY KEY (submission_id, file_id)
);

-- End
GO

-- Part 3
-- Create sequences for auto-incrementing primary keys
CREATE SEQUENCE [Genesis].[seq_school_id] START WITH 1 INCREMENT BY 1 NO CYCLE;
CREATE SEQUENCE [Genesis].[seq_inquiry_id] START WITH 1 INCREMENT BY 1 NO CYCLE;
CREATE SEQUENCE [Genesis].[seq_thesis_id] START WITH 1 INCREMENT BY 1 NO CYCLE;
CREATE SEQUENCE [Genesis].[seq_meeting_id] START WITH 1 INCREMENT BY 1 NO CYCLE;
CREATE SEQUENCE [Genesis].[seq_action_id] START WITH 1 INCREMENT BY 1 NO CYCLE;
CREATE SEQUENCE [Genesis].[seq_role_id] START WITH 1 INCREMENT BY 1 NO CYCLE;
CREATE SEQUENCE [Genesis].[seq_permission_id] START WITH 1 INCREMENT BY 1 NO CYCLE;
CREATE SEQUENCE [Genesis].[seq_invite_id] START WITH 1 INCREMENT BY 1 NO CYCLE;
CREATE SEQUENCE [Genesis].[seq_notification_id] START WITH 1 INCREMENT BY 1 NO CYCLE;
CREATE SEQUENCE [Genesis].[seq_file_id] START WITH 1 INCREMENT BY 1 NO CYCLE;
CREATE SEQUENCE [Genesis].[seq_remark_id] START WITH 1 INCREMENT BY 1 NO CYCLE;
CREATE SEQUENCE [Genesis].[seq_defense_id] START WITH 1 INCREMENT BY 1 NO CYCLE;
CREATE SEQUENCE [Genesis].[seq_title_id] START WITH 1 INCREMENT BY 1 NO CYCLE;
CREATE SEQUENCE [Genesis].[seq_submission_id] START WITH 1 INCREMENT BY 1 NO CYCLE;

-- End
GO

-- Part 4
-- Add sequences
ALTER TABLE [Genesis].[School] ADD CONSTRAINT def_school_id DEFAULT NEXT VALUE FOR [Genesis].[seq_school_id] FOR id;
ALTER TABLE [Genesis].[Inquiry] ADD CONSTRAINT def_inquiry_id DEFAULT NEXT VALUE FOR [Genesis].[seq_inquiry_id] FOR id;
ALTER TABLE [Genesis].[Thesis] ADD CONSTRAINT def_thesis_id DEFAULT NEXT VALUE FOR [Genesis].[seq_thesis_id] FOR id;
ALTER TABLE [Genesis].[Meeting] ADD CONSTRAINT def_meeting_id DEFAULT NEXT VALUE FOR [Genesis].[seq_meeting_id] FOR id;
ALTER TABLE [Genesis].[Action] ADD CONSTRAINT def_action_id DEFAULT NEXT VALUE FOR [Genesis].[seq_action_id] FOR id;
ALTER TABLE [Genesis].[Role] ADD CONSTRAINT def_role_id DEFAULT NEXT VALUE FOR [Genesis].[seq_role_id] FOR id;
ALTER TABLE [Genesis].[Permission] ADD CONSTRAINT def_permission_id DEFAULT NEXT VALUE FOR [Genesis].[seq_permission_id] FOR id;
ALTER TABLE [Genesis].[Invite] ADD CONSTRAINT def_invite_id DEFAULT NEXT VALUE FOR [Genesis].[seq_invite_id] FOR id;
ALTER TABLE [Genesis].[Notification] ADD CONSTRAINT def_notification_id DEFAULT NEXT VALUE FOR [Genesis].[seq_notification_id] FOR id;
ALTER TABLE [Genesis].[File] ADD CONSTRAINT def_file_id DEFAULT NEXT VALUE FOR [Genesis].[seq_file_id] FOR id;
ALTER TABLE [Genesis].[Remark] ADD CONSTRAINT def_remark_id DEFAULT NEXT VALUE FOR [Genesis].[seq_remark_id] FOR id;
ALTER TABLE [Genesis].[Defense] ADD CONSTRAINT def_defense_id DEFAULT NEXT VALUE FOR [Genesis].[seq_defense_id] FOR id;
ALTER TABLE [Genesis].[Title] ADD CONSTRAINT def_title_id DEFAULT NEXT VALUE FOR [Genesis].[seq_title_id] FOR id;
ALTER TABLE [Genesis].[Submission] ADD CONSTRAINT def_submission_id DEFAULT NEXT VALUE FOR [Genesis].[seq_submission_id] FOR id;

-- End
GO

-- Part 5
-- Add foreign keys
ALTER TABLE [Genesis].[School] ADD CONSTRAINT fk_school_principal_id FOREIGN KEY (principal_id) REFERENCES [Genesis].[Person](id);
ALTER TABLE [Genesis].[Person] ADD CONSTRAINT fk_person_school_id FOREIGN KEY (school_id) REFERENCES [Genesis].[School](id);
ALTER TABLE [Genesis].[Person] ADD CONSTRAINT fk_person_title_id FOREIGN KEY (title_id) REFERENCES [Genesis].[Title](id);
ALTER TABLE [Genesis].[Account] ADD CONSTRAINT fk_account_id FOREIGN KEY (person_id) REFERENCES [Genesis].[Person](id);
ALTER TABLE [Genesis].[Account] ADD CONSTRAINT fk_account_role_id FOREIGN KEY (role_id) REFERENCES [Genesis].[Role](id);
ALTER TABLE [Genesis].[Thesis] ADD CONSTRAINT fk_thesis_advisor_id FOREIGN KEY (advisor_id) REFERENCES [Genesis].[Account](person_id);
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
ALTER TABLE [Genesis].[Invite] ADD CONSTRAINT fk_invite_thesis_id FOREIGN KEY (thesis_id) REFERENCES [Genesis].[Thesis](id);
ALTER TABLE [Genesis].[Invite] ADD CONSTRAINT fk_invite_author_id FOREIGN KEY (author_id) REFERENCES [Genesis].[Person](id);
ALTER TABLE [Genesis].[Invite] ADD CONSTRAINT fk_invite_invitee_id FOREIGN KEY (invitee_id) REFERENCES [Genesis].[Person](id);
ALTER TABLE [Genesis].[Notification] ADD CONSTRAINT fk_notification_owner_id FOREIGN KEY (owner_id) REFERENCES [Genesis].[Account](person_id);
ALTER TABLE [Genesis].[ThesisFile] ADD CONSTRAINT fk_thesisfile_thesis_id FOREIGN KEY (thesis_id) REFERENCES [Genesis].[Thesis](id);
ALTER TABLE [Genesis].[ThesisFile] ADD CONSTRAINT fk_thesisfile_file_id FOREIGN KEY (file_id) REFERENCES [Genesis].[File](id);
ALTER TABLE [Genesis].[Avatar] ADD CONSTRAINT fk_avatar_account_id FOREIGN KEY (account_id) REFERENCES [Genesis].[Account](person_id);
ALTER TABLE [Genesis].[Avatar] ADD CONSTRAINT fk_avatar_file_id FOREIGN KEY (file_id) REFERENCES [Genesis].[File](id);
ALTER TABLE [Genesis].[Remark] ADD CONSTRAINT fk_remark_thesis_id FOREIGN KEY (thesis_id) REFERENCES [Genesis].[Thesis](id);
ALTER TABLE [Genesis].[Remark] ADD CONSTRAINT fk_remark_author_id FOREIGN KEY (author_id) REFERENCES [Genesis].[Person](id);
ALTER TABLE [Genesis].[Remark] ADD CONSTRAINT fk_remark_ref_file FOREIGN KEY (ref_file) REFERENCES [Genesis].[File](id);
ALTER TABLE [Genesis].[Defense] ADD CONSTRAINT fk_defense_thesis_id FOREIGN KEY (thesis_id) REFERENCES [Genesis].[Thesis](id);
ALTER TABLE [Genesis].[Examiner] ADD CONSTRAINT fk_examiner_id FOREIGN KEY (id) REFERENCES [Genesis].[Person](id);
ALTER TABLE [Genesis].[Examiner] ADD CONSTRAINT fk_examiner_defense_id FOREIGN KEY (defense_id) REFERENCES [Genesis].[Defense](id);
ALTER TABLE [Genesis].[Submission] ADD CONSTRAINT fk_submission_account_id FOREIGN KEY (account_id) REFERENCES [Genesis].[Account](person_id);
ALTER TABLE [Genesis].[Submission] ADD CONSTRAINT fk_submission_thesis_id FOREIGN KEY (thesis_id) REFERENCES [Genesis].[Thesis](id);
ALTER TABLE [Genesis].[Attachment] ADD CONSTRAINT fk_attachment_submission_id FOREIGN KEY (submission_id) REFERENCES [Genesis].[Submission](id);
ALTER TABLE [Genesis].[Attachment] ADD CONSTRAINT fk_attachment_file_id FOREIGN KEY (file_id) REFERENCES [Genesis].[File](id);
