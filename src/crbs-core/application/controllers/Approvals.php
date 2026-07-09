<?php
defined('BASEPATH') OR exit('No direct script access allowed');


class Approvals extends MY_Controller
{


	public function __construct()
	{
		parent::__construct();

		$this->require_logged_in();

		$this->load->model('bookings_model');
	}


	/**
	 * List all bookings pending approval for the current user.
	 *
	 */
	public function index()
	{
		$bookings = $this->bookings_model->find_pending_for_approver(
			$this->userauth->user->user_id
		);

		$this->data['bookings'] = $bookings;
		$this->data['title'] = lang('booking.approvals');
		$this->data['showtitle'] = lang('booking.approvals');

		$msg = $this->session->flashdata('approvals');

		$body = $msg ?: '';
		$body .= $this->load->view('approvals/index', $this->data, TRUE);

		$this->data['body'] = $body;

		return $this->render();
	}


	/**
	 * Approve a pending booking.
	 *
	 */
	public function approve($booking_id = null)
	{
		if ( ! $booking_id) {
			$this->session->set_flashdata('approvals', msgbox('error', lang('booking.error.not_found')));
			redirect('approvals');
			return;
		}

		$booking = $this->bookings_model->get($booking_id);

		if ( ! $booking) {
			$this->session->set_flashdata('approvals', msgbox('error', lang('booking.error.not_found')));
			redirect('approvals');
			return;
		}

		// Check permission for this specific room
		if ( ! has_permission(Permission::BOOKING_APPROVE, $booking->room_id)) {
			$this->session->set_flashdata('approvals', msgbox('error', lang('booking.approval.error.no_permission')));
			redirect('approvals');
			return;
		}

		$result = $this->bookings_model->approve($booking_id);

		if ($result && $this->db->affected_rows() > 0) {
			$this->session->set_flashdata('approvals', msgbox('info', lang('booking.approval.approved')));
		} else {
			$this->session->set_flashdata('approvals', msgbox('error', lang('booking.approval.error.already_decided')));
		}

		redirect('approvals');
	}


	/**
	 * Decline a pending booking (with optional reason).
	 *
	 */
	public function decline($booking_id = null)
	{
		if ( ! $booking_id) {
			$this->session->set_flashdata('approvals', msgbox('error', lang('booking.error.not_found')));
			redirect('approvals');
			return;
		}

		$booking = $this->bookings_model->get($booking_id);

		if ( ! $booking) {
			$this->session->set_flashdata('approvals', msgbox('error', lang('booking.error.not_found')));
			redirect('approvals');
			return;
		}

		// Check permission for this specific room
		if ( ! has_permission(Permission::BOOKING_APPROVE, $booking->room_id)) {
			$this->session->set_flashdata('approvals', msgbox('error', lang('booking.approval.error.no_permission')));
			redirect('approvals');
			return;
		}

		$reason = $this->input->post('reason');

		$result = $this->bookings_model->decline($booking_id, $reason);

		if ($result && $this->db->affected_rows() > 0) {
			$this->session->set_flashdata('approvals', msgbox('info', lang('booking.approval.declined')));
		} else {
			$this->session->set_flashdata('approvals', msgbox('error', lang('booking.approval.error.already_decided')));
		}

		redirect('approvals');
	}


}
