<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Alter_bookings_add_approval_fields extends CI_Migration
{

	public function up()
	{
		$fields = [
			'approved_at' => [
				'type' => 'DATETIME',
				'null' => TRUE,
				'after' => 'notes',
			],
			'approved_by' => [
				'type' => 'INT',
				'constraint' => 6,
				'unsigned' => TRUE,
				'null' => TRUE,
				'after' => 'approved_at',
			],
			'decline_reason' => [
				'type' => 'TEXT',
				'null' => TRUE,
				'after' => 'approved_by',
			],
		];

		$this->dbforge->add_column('bookings', $fields);
	}


	public function down()
	{
	}

}
