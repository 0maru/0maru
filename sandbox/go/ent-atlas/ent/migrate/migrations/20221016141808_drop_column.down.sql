-- reverse: modify "users" table
ALTER TABLE `users` DROP COLUMN `number`, ADD COLUMN `age` bigint NOT NULL;
