<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Grant_booking_approve_to_room_owners extends CI_Migration
{

	public function up()
	{
		$sql = "INSERT INTO auth_acl_permissions (acl_id, permission_id)
				SELECT acl.acl_id, perm.permission_id
				FROM auth_acl acl
				INNER JOIN auth_permissions perm ON perm.name = 'booking.approve'
				WHERE acl.entity_type = 'room'
				AND acl.context_type = 'user'
				AND NOT EXISTS (
					SELECT 1 FROM auth_acl_permissions ap
					WHERE ap.acl_id = acl.acl_id AND ap.permission_id = perm.permission_id
				)";

		$this->db->query($sql);
	}


	public function down()
	{
	}

}
