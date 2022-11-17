-- modify "users" table
ALTER TABLE `users` DROP COLUMN `age`, ADD COLUMN `number` bigint NOT NULL;
