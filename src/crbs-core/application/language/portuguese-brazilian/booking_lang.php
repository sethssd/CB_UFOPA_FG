<?php

$lang['booking.bookings'] = 'Reservas';
$lang['booking.booking'] = 'Reserva';
$lang['booking.bookings_in_series'] = 'Reservas em série recorrente';
$lang['booking.details'] = 'Detalhes da reserva';
$lang['booking.and_others'] = 'e outros';

$lang['booking.slot'] = 'Horário';
$lang['booking.start'] = 'Início';
$lang['booking.end'] = 'Fim';
$lang['booking.book'] = 'Reservar';
$lang['booking.do_not_book'] = 'Não reservar';

$lang['booking.booking_status'] = 'Status da reserva';
$lang['booking.active_bookings'] = 'Reservas ativas';
$lang['booking.all_bookings'] = 'Todas as reservas';
$lang['booking.bookings_this_session'] = 'Reservas deste período';
$lang['booking.max_active_bookings'] = 'Limite de reservas ativas';
$lang['booking.bookings_you_can_create'] = 'Reservas que você pode criar';
$lang['booking.in_my_rooms'] = 'Reservas nas minhas salas';
$lang['booking.existing_booking'] = 'Reserva existente';
$lang['booking.recurs'] = 'Recorrência';
$lang['booking.recur_start'] = 'Início da recorrência';
$lang['booking.recur_end'] = 'Fim da recorrência';
$lang['booking.date_start'] = 'Data de início';
$lang['booking.date_end'] = 'Data de término';
$lang['booking.create_booking'] = 'Criar reserva';
$lang['booking.create_bookings'] = 'Criar reservas';
$lang['booking.create_multiple_bookings'] = 'Criar múltiplas reservas';
$lang['booking.no_conflicts'] = 'Sem conflitos';
$lang['booking.conflict'] = 'Conflito';
$lang['booking.conflicts'] = 'Conflitos';

$lang['booking.action.replace'] = 'Substituir reserva existente';
$lang['booking.action.keep'] = 'Manter reserva existente';

$lang['booking.conflict.one'] = 'Existe um conflito de reserva para revisar.';
$lang['booking.conflict.multiple'] = 'Existem %d conflitos de reserva para revisar.';

$lang['booking.add.title'] = 'Criar nova reserva';
$lang['booking.edit.title'] = 'Atualizar reserva';
$lang['booking.edit.action'] = 'Atualizar reserva';

$lang['booking.add.single.action'] = 'Criar reserva única';
$lang['booking.add.recurring.action'] = 'Criar reserva recorrente';
$lang['booking.recurring.repeat_description'] = 'A cada %s na %s';
$lang['booking.recurring.starting_from'] = 'Começando de...';
$lang['booking.recurring.until'] = 'Até...';
$lang['booking.recurring.start_of_session'] = 'Início do período';
$lang['booking.recurring.end_of_session'] = 'Fim do período';
$lang['booking.recurring.specific_date'] = 'Data específica';
$lang['booking.recurring.preview'] = 'Visualizar reservas recorrentes';

$lang['booking.add.multi.single.action'] = 'Criar reservas únicas selecionadas';
$lang['booking.add.multi.recurring.action'] = 'Criar reservas recorrentes selecionadas';

$lang['booking.selection.this_only'] = 'Apenas esta reserva';
$lang['booking.selection.future'] = 'Esta e as futuras reservas da série';
$lang['booking.selection.all'] = 'Todas as reservas da série';

$lang['booking.edit.recurring.title'] = 'Atualizar reserva recorrente';
$lang['booking.edit.single.hint'] = 'As alterações feitas abaixo serão aplicadas apenas à reserva selecionada.';
$lang['booking.edit.future.hint'] = 'As alterações feitas abaixo serão aplicadas à reserva selecionada e a todas as futuras na série.';
$lang['booking.edit.all.hint'] = 'As alterações feitas abaixo serão aplicadas a todas as reservas da série.';

$lang['booking.cancel.recurring.title'] = 'Cancelar reserva recorrente';
$lang['booking.cancel.single.title'] = 'Cancelar reserva única';
$lang['booking.cancel.single.action'] = 'Sim, cancelar reserva';
$lang['booking.cancel.abort'] = 'Não, manter reserva';

$lang['booking.action.cancel_booking'] = 'Cancelar reserva';
$lang['booking.action.cancel_bookings'] = 'Cancelar reservas';
$lang['booking.series.go_back'] = 'Voltar aos detalhes da reserva';

$lang['booking.occurs'] = 'Ocorre';
$lang['booking.occurs.once'] = 'Uma vez';
$lang['booking.booked_by'] = 'Reservado por';
$lang['booking.notes'] = "Observações";

$lang['booking.legend.legend'] = 'Legenda';
$lang['booking.legend.free'] = 'Disponível';
$lang['booking.legend.static'] = 'Reserva recorrente';
$lang['booking.legend.staff'] = 'Reserva única';

$lang['booking.type_single'] = 'Única';
$lang['booking.type_recurring'] = 'Recorrente';

$lang['booking.warning.not_own'] = 'Esta não é uma reserva sua.';

$lang['booking.error.not_found'] = 'Não foi possível encontrar os detalhes da reserva solicitada.';
$lang['booking.error.bad_type'] = 'Tipo de reserva inválido.';
$lang['booking.error.bad_form'] = 'Seleção inválida.';
$lang['booking.error.not_cancelable'] = 'A reserva não pode ser cancelada.';
$lang['booking.error.bad_session'] = 'O período solicitado não está disponível.';
$lang['booking.error.no_permission_room_date'] = 'Você não tem permissão para criar reservas nesta sala nesta data.';
$lang['booking.error.no_permission_room'] = 'Você não tem permissão para criar reservas deste tipo nesta sala.';
$lang['booking.error.no_slots_selected'] = "Você não selecionou nenhum horário livre para reservar.";
$lang['booking.error.multibooking_create_error'] = "Não foi possível criar a entrada de reserva múltipla.";
$lang['booking.error.some_invalid_values'] = 'Uma ou mais reservas continham valores inválidos. Verifique e tente novamente.';
$lang['booking.error.none_created'] = 'Nenhuma reserva foi criada.';
$lang['booking.error.generic'] = 'Não foi possível criar uma ou mais reservas.';
$lang['booking.error.not_created'] = 'Não foi possível criar a reserva solicitada.';
$lang['booking.error.must_select_fewer'] = 'Por favor, desmarque algumas reservas para ficar dentro do seu limite.';
$lang['booking.error.too_many_instances'] = 'Você só pode criar até %d eventos na sua reserva recorrente. Desmarque %d horários para continuar.';
$lang['booking.error.no_recurring_dates'] = 'O período não possui datas disponíveis para suportar reservas recorrentes.';
$lang['booking.error.invalid_recurring_dates'] = 'A data de término da recorrência (%s) deve ser posterior à data de início %s.';
$lang['booking.error.no_dates'] = 'Nenhuma data selecionada.';

$lang['booking.error.constraint.range_min_only'] = 'Reservas únicas devem ser feitas com pelo menos %d dias de antecedência.';
$lang['booking.error.constraint.range_max_only'] = 'Reservas únicas só podem ser criadas com até %d dias de antecedência.';
$lang['booking.error.constraint.range_min'] = "Reservas únicas devem ter pelo menos %d dias de antecedência.\nA data mais próxima permitida é %s.";
$lang['booking.error.constraint.range_max'] = "Reservas únicas só podem ser criadas com até %d dias de antecedência.\nA data limite permitida é %s.";
$lang['booking.error.constraint.max_reached'] = 'Você atingiu o número máximo de reservas ativas (%d). Aguarde até que sua próxima reserva aconteça ou cancele uma futura.';
$lang['booking.error.period_wrong_day'] = '%s não está disponível em %s.';
$lang['booking.error.date_not_in_range'] = "Esta data não está dentro do limite de datas permitido ou está no passado.";

$lang['booking.success.created'] = 'A reserva foi criada com sucesso.';
$lang['booking.success.created.multiple'] = 'As reservas foram criadas com sucesso.';
$lang['booking.success.some_created'] = '%d reservas foram criadas.';
$lang['booking.success.recurring.some_created'] = '%d reservas recorrentes foram criadas com sucesso.';

$lang['booking.warning.permitted_limit'] = 'O número máximo de reservas que você pode criar é %d.';
$lang['booking.warning.permitted_limit_with_active'] = 'O número máximo de reservas que você pode criar é %d. Seu limite de reservas ativas é %d e você possui %d reservas ativas.';

$lang['booking.error.cancelling'] = 'Ocorreu um erro ao cancelar a reserva.';

$lang['booking.notice.instances_to_create'] = 'Esta reserva recorrente gerará %d ocorrências.';

$lang['booking.cancel.one.success'] = 'A reserva foi cancelada com sucesso.';
$lang['booking.cancel.future.success'] = 'A reserva selecionada e todas as futuras ocorrências da série foram canceladas.';
$lang['booking.cancel.all.success'] = 'Todas as reservas da série recorrente foram canceladas.';
$lang['booking.cancel.invalid_type.error'] = 'Tipo de cancelamento inválido.';

$lang['booking.cancel_multi.title'] = 'Cancelar múltiplas reservas';
$lang['booking.cancel_multi.action'] = 'Cancelar reservas selecionadas';
$lang['booking.cancel_multi.error.none_selected'] = 'Nenhuma reserva foi selecionada para cancelamento.';
$lang['booking.cancel_multi.number_cancelled'] = '%d reservas foram canceladas.';
$lang['booking.cancel_multi.none_cancelled'] = 'Nenhuma reserva foi cancelada.';

$lang['booking.edit.one.success'] = 'A reserva foi atualizada com sucesso.';
$lang['booking.edit.future.success'] = 'A reserva e todas as futuras da série foram atualizadas.';
$lang['booking.edit.all.success'] = 'Todas as reservas da série foram atualizadas.';

$lang['booking.edit.error'] = 'Não foi possível atualizar a reserva.';

$lang['booking.session.current'] = 'Atuais e futuras';
$lang['booking.session.past'] = 'Passadas';

$lang['booking.nav.back'] = 'Voltar';
$lang['booking.nav.next'] = 'Avançar';
$lang['booking.nav.week_prev'] = 'Semana anterior';
$lang['booking.nav.week_next'] = 'Próxima semana';
$lang['booking.nav.week_commencing'] = 'Semana de %s';

$lang['booking.slot.unavailable_period'] = 'Horário indisponível';
$lang['booking.toggle_multi_select'] = 'Marcar seleção múltipla';

$lang['booking.status.booked'] = 'Reservado';
$lang['booking.status.cancelled'] = 'Cancelado';
$lang['booking.status.pending'] = 'Pendente de aprovação';
$lang['booking.status.declined'] = 'Recusado';

$lang['booking.approvals'] = 'Aprovações';
$lang['booking.approval.none_pending'] = 'Não há nenhuma reserva pendente da sua aprovação.';
$lang['booking.approval.action.approve'] = 'Aceitar Reserva';
$lang['booking.approval.action.decline'] = 'Recusar Reserva';
$lang['booking.approval.confirm_approve'] = 'Tem certeza de que deseja aceitar esta reserva?';
$lang['booking.approval.confirm_decline'] = 'Tem certeza de que deseja recusar esta reserva?';
$lang['booking.approval.reason_placeholder'] = 'Motivo da recusa (obrigatório)...';
$lang['booking.approval.approved'] = 'A reserva foi aceita com sucesso.';
$lang['booking.approval.declined'] = 'A reserva foi recusada.';
$lang['booking.approval.error.already_decided'] = 'Esta reserva já foi decidida por outra pessoa.';
$lang['booking.approval.error.no_permission'] = 'Você não tem permissão para aprovar ou recusar esta reserva.';
