-- Created by Prabhat Kumar, Copyright © 2019.
-- Last modification date: 2019-03-25 04:08:44.444

-- Enable pgcrypto for UUID support.
CREATE EXTENSION pgcrypto;

-- tables
-- Table: inboxes
CREATE TABLE inboxes (
	slug text NOT NULL,
	auth_id text NOT NULL,
	enabled bool NULL DEFAULT true,
	email_enabled bool NULL DEFAULT true,
	CONSTRAINT inboxes_pk PRIMARY KEY (auth_id)
);

-- Table: notes
CREATE TABLE notes (
    uuid UUID DEFAULT gen_random_uuid(),
    inboxes_auth_id text  NOT NULL,
    body text  NOT NULL,
    byline text,
    CONSTRAINT notes_pk PRIMARY KEY (uuid)
);

-- foreign keys
-- Reference: notes_inboxes (table: notes)
ALTER TABLE notes ADD CONSTRAINT notes_inboxes
    FOREIGN KEY (inboxes_auth_id)
    REFERENCES inboxes (auth_id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Experiment with timestamps.
ALTER TABLE notes ADD timestamp timestamp default timestamp;
ALTER TABLE inboxes ADD timestamp timestamp default timestamp;

-- ALTER TABLE notes ADD COLUMN "archived" boolean not null default false;
ALTER TABLE notes ADD COLUMN archived BOOLEAN;
UPDATE notes SET archived = 'f';
ALTER TABLE notes ALTER COLUMN archived SET NOT NULL;
ALTER TABLE notes ALTER COLUMN archived SET DEFAULT FALSE;

-- End of file.
