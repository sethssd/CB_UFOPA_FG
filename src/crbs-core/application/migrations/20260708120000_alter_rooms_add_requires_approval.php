<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Alter_rooms_add_requires_approval extends CI_Migration
{

	public function up()
	{
		$fields = [
			'requires_approval' => [
				'type' => 'TINYINT',
				'constraint' => 1,
				'unsigned' => TRUE,
				'default' => 0,
				'null' => FALSE,
				'after' => 'user_id',
			],
		];

		$this->dbforge->add_column('rooms', $fields);
	}


	public function down()
	{
	}

}
