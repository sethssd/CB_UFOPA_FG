<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Create_bookings_audit_log_table extends CI_Migration {

    public function up()
    {
        $sql = "CREATE TABLE IF NOT EXISTS `bookings_audit_log` (
            `audit_id` int unsigned NOT NULL AUTO_INCREMENT,
            `booking_id` int unsigned NOT NULL,
            `action` varchar(50) NOT NULL,
            `previous_status` tinyint unsigned DEFAULT NULL,
            `new_status` tinyint unsigned NOT NULL,
            `actor_user_id` int unsigned DEFAULT NULL,
            `reason` text DEFAULT NULL,
            `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
            PRIMARY KEY (`audit_id`),
            KEY `idx_booking_id` (`booking_id`),
            KEY `idx_actor_user_id` (`actor_user_id`),
            CONSTRAINT `fk_bookings_audit_log_booking_id` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`) ON DELETE CASCADE,
            CONSTRAINT `fk_bookings_audit_log_actor_user_id` FOREIGN KEY (`actor_user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8;";

        $this->db->query($sql);
    }

    public function down()
    {
        $this->db->query('DROP TABLE IF EXISTS `bookings_audit_log`');
    }
}
