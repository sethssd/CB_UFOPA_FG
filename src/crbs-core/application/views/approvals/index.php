<?php

if (empty($bookings)):

?>

<p style="padding:16px 0; color: #666; text-align: center;">
	<?= lang('booking.approval.none_pending') ?>
</p>

<?php else: ?>

<table
	width="100%"
	cellpadding="4"
	cellspacing="2"
	border="0"
	class="border-table"
>

	<col /><col /><col /><col /><col /><col /><col />

	<thead>
		<tr class="heading">
			<th class="h" title="<?= lang('room.room') ?>"><?= lang('room.room') ?></th>
			<th class="h" title="<?= lang('app.date') ?>"><?= lang('app.date') ?></th>
			<th class="h" title="<?= lang('period.period') ?>"><?= lang('period.period') ?></th>
			<th class="h" title="<?= lang('booking.booked_by') ?>"><?= lang('booking.booked_by') ?></th>
			<th class="h" title="<?= lang('department.department') ?>"><?= lang('department.department') ?></th>
			<th class="h" title="<?= lang('booking.notes') ?>"><?= lang('booking.notes') ?></th>
			<th class="h" title="<?= lang('app.actions') ?>"><?= lang('app.actions') ?></th>
		</tr>
	</thead>

	<tbody>
	<?php foreach ($bookings as $booking): ?>
		<tr>
			<td><?= html_escape(isset($booking->room) ? $booking->room->name : '') ?></td>

			<td><?= is_object($booking->date) ? date_output_long($booking->date) : html_escape($booking->date) ?></td>

			<td>
			<?php
				$period_name = isset($booking->period) ? $booking->period->name : '';
				$time_start = isset($booking->period) ? $booking->period->time_start : (isset($booking->time_start) ? $booking->time_start : '');
				$time_end = isset($booking->period) ? $booking->period->time_end : (isset($booking->time_end) ? $booking->time_end : '');
				if (!empty($period_name)) {
					echo html_escape($period_name);
				}
				if (is_object($time_start)) {
					echo ' (' . $time_start->format('H:i') . ' - ' . $time_end->format('H:i') . ')';
				}
			?>
			</td>

			<td>
			<?php
				if (isset($booking->user) && is_object($booking->user)) {
					echo html_escape(!empty($booking->user->displayname) ? $booking->user->displayname : $booking->user->username);
				}
			?>
			</td>

			<td><?= html_escape(isset($booking->department) ? $booking->department->name : '') ?></td>

			<td><?= html_escape($booking->notes ?? '') ?></td>

			<td style="white-space: nowrap;">
				<a href="<?= site_url('approvals/approve/' . $booking->booking_id) ?>"
					onclick="return confirm('<?= lang('booking.approval.confirm_approve') ?>')"
					class="button"
					style="display: inline-block; margin-bottom: 4px;"
				>
					<?= lang('booking.approval.action.approve') ?>
				</a>

				<form method="post" action="<?= site_url('approvals/decline/' . $booking->booking_id) ?>"
					style="display: inline-block;"
					onsubmit="var r = this.querySelector('textarea'); if (!r.value) { r.style.display = 'block'; r.focus(); return false; } return confirm('<?= lang('booking.approval.confirm_decline') ?>');"
				>
					<textarea name="reason"
						placeholder="<?= lang('booking.approval.reason_placeholder') ?>"
						rows="2"
						cols="25"
						style="display: none; margin-bottom: 4px;"
					></textarea>
					<button type="submit" class="button"><?= lang('booking.approval.action.decline') ?></button>
				</form>
			</td>
		</tr>
	<?php endforeach; ?>
	</tbody>

</table>

<?php endif; ?>
