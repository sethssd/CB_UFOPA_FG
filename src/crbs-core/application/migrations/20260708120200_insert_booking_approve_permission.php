<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Insert_booking_approve_permission extends CI_Migration
{

	public function up()
	{
		$sql = "INSERT INTO `auth_permissions` (`name`) VALUES ('booking.approve')";
		$this->db->query($sql);
	}


	public function down()
	{
	}

}
