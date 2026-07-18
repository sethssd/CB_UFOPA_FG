<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_unique_constraint_bookings extends CI_Migration {

    public function up()
    {
        // Add a unique constraint to prevent double bookings on the same room, period, and date for active bookings.
        // It uses MySQL 8.0+ functional index expression.
        $this->db->query('CREATE UNIQUE INDEX unique_active_booking ON bookings (room_id, period_id, date, (IF(status = 10, 1, NULL)))');
    }

    public function down()
    {
        $this->db->query('ALTER TABLE bookings DROP INDEX unique_active_booking');
    }
}
