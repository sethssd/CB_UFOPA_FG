<?php

$lang['auth.log_in'] = 'Entrar';
$lang['auth.log_out'] = 'Sair';

$lang['auth.bad_credentials'] = 'Usuário e/ou senha incorretos.';
$lang['auth.login_required'] = 'Você precisa estar logado para acessar essa página.';
$lang['auth.permission_required'] = 'Você não tem permissão para acessar essa página.';

$lang['auth.authentication'] = 'Autenticação';
$lang['auth.ldap.ldap'] = 'LDAP';
$lang['auth.ldap.connection'] = 'Conexão';
$lang['auth.ldap.search'] = 'Busca';
$lang['auth.ldap.user_attribute_mapping'] = 'Mapeamento de atributos de usuário';
$lang['auth.ldap.user_assignments'] = 'Atribuições padrão de usuário';

$lang['auth.ldap.user_attribute_mapping.hint.1'] = 'Ao usar um filtro de busca para encontrar o usuário, você pode preencher as informações de perfil do classroombookings com atributos do LDAP cada vez que logarem.';
$lang['auth.ldap.user_attribute_mapping.hint.2'] = 'Combine vários atributos LDAP adicionando dois-pontos antes do nome do atributo, por exemplo - ';
$lang['auth.ldap.user_attribute_mapping.hint.3'] = 'Deixe esses campos em branco para desativar o preenchimento automático.';

$lang['auth.ldap.demo_notice'] = "No modo de demonstração, o recurso de verificação e a possibilidade de ativar a autenticação LDAP estão desativados para evitar bloqueios de contas.";

$lang['auth.ldap.field.ldap_enabled'] = 'Habilitar';
$lang['auth.ldap.field.ldap_enabled.title'] = 'Usar LDAP para autenticar usuários.';

$lang['auth.ldap.field.ldap_create_users'] = 'Criar usuários';
$lang['auth.ldap.field.ldap_create_users.title'] = 'Criar automaticamente contas de usuário na autenticação bem-sucedida.';
$lang['auth.ldap.field.ldap_create_users.hint.1'] = 'Quando ativado, credenciais válidas retornadas por uma tentativa de autenticação LDAP criarão automaticamente uma conta no classroombookings com a Função e/ou Departamento especificados abaixo.';
$lang['auth.ldap.field.ldap_create_users.hint.2'] = 'Quando desativado, apenas usuários que já possuem uma conta no classroombookings serão autenticados.';

$lang['auth.ldap.field.ldap_server'] = 'Servidor';
$lang['auth.ldap.field.ldap_server.hint'] = 'Nome de host ou endereço IP.';

$lang['auth.ldap.field.ldap_port'] = 'Porta';
$lang['auth.ldap.field.ldap_port.hint'] = 'Portas padrão são 389 (sem SSL) ou 636 (SSL).';

$lang['auth.ldap.field.ldap_version'] = 'Versão do protocolo';
$lang['auth.ldap.field.ldap_version.hint'] = 'Geralmente 3.';

$lang['auth.ldap.field.ldap_use_tls'] = 'Usar TLS';
$lang['auth.ldap.field.ldap_ignore_cert'] = 'Ignorar certificado';
$lang['auth.ldap.field.ldap_bind_dn_format'] = 'Formato Bind DN';
$lang['auth.ldap.field.ldap_bind_dn_format.hint'] = 'Isso varia de acordo com o seu servidor e configuração. A tag `:user` será substituída pelo usuário autenticando. Alguns formatos comuns são:';

$lang['auth.ldap.field.ldap_base_dn'] = 'DN Base';
$lang['auth.ldap.field.ldap_search_filter'] = 'Filtro de busca';
$lang['auth.ldap.field.ldap_search_filter.hint'] = 'A tag `:user` será substituída pelo usuário logando.';

$lang['auth.ldap.test.title'] = 'Verificar configurações';
$lang['auth.ldap.test.hint.1'] = "Configure as definições à esquerda e insira um usuário e senha neste campo para verificar o acesso. Não é necessário clicar em Salvar antes de testar.";
$lang['auth.ldap.test.hint.2'] = "Estas credenciais são transmitidas diretamente ao servidor LDAP especificado e nunca são armazenadas pelo classroombookings.";
$lang['auth.ldap.test.verify'] = "Verificar credenciais";
$lang['auth.ldap.test.verifying'] = "Testando conexão";

$lang['auth.ldap.test.bind_dn'] = 'Bind DN';
$lang['auth.ldap.test.search_filter'] = 'Filtro de busca';
$lang['auth.ldap.test.auth_success'] = 'Autenticação bem-sucedida!';

$lang['auth.ldap.save.success'] = 'As configurações do LDAP foram atualizadas.';

$lang['auth.ldap.error.demo_mode'] = 'Recurso desativado no modo demonstração.';
$lang['auth.ldap.error.no_module'] = 'O módulo PHP LDAP não está instalado ou ativo.';
$lang['auth.ldap.error.no_server_or_port'] = 'Servidor e/ou porta não informados.';
$lang['auth.ldap.error.no_socket_connection'] = 'Erro de conexão ou tempo limite esgotado.';
$lang['auth.ldap.error.invalid_ldap_uri'] = 'URI de conexão LDAP inválida.';
$lang['auth.ldap.error.no_username_or_password'] = 'Usuário e/ou senha em branco.';
$lang['auth.ldap.error.bind_error'] = 'Erro de bind LDAP ou usuário e/ou senha incorretos.';
$lang['auth.ldap.error.search_error'] = 'Erro de busca LDAP.';
$lang['auth.ldap.error.search_num_results_error'] = 'A busca LDAP não retornou exatamente um resultado.';
$lang['auth.ldap.error.search_get_entry_error'] = 'Erro ao obter registro do resultado de busca LDAP.';
$lang['auth.ldap.error.search_get_attributes_error'] = 'Erro ao obter atributos do usuário LDAP.';
