# CB_UFOPA — Portal de Reservas de Salas e Laboratórios

Sistema de reservas de espaços (salas de aula, laboratórios, auditórios) para
a Universidade Federal do Oeste do Pará. Baseado no
[classroombookings/CRBS](https://github.com/craigrodway/classroombookings)
(AGPLv3), com customizações de fluxo de aprovação e localização pt-BR.

> ⚠️ Status: projeto em desenvolvimento, rodando localmente via Docker.
> Ainda não está em produção institucional.

## Stack

- PHP 8.4 + CodeIgniter 3
- MySQL 8.0
- Docker / Docker Compose

## Funcionalidades

- **Reservas**: criação de reserva única ou recorrente, edição, cancelamento
  individual ou em lote, visualização de série recorrente.
- **Fluxo de aprovação**: reservas de determinados espaços podem exigir
  aprovação de um responsável antes de serem confirmadas (aceitar/recusar
  com motivo).
- **Salas e grupos de salas**: cada sala tem agenda própria; salas podem ser
  agrupadas para gestão e permissão em massa (ex: "Labs de Informática").
- **Horários e calendário**: períodos do dia configuráveis, grades de
  horário diferentes por grupo de sala, feriados que bloqueiam reserva
  automaticamente.
- **Departamentos e permissões**: usuários pertencem a um departamento;
  roles customizáveis com permissões finas (ex: um coordenador pode
  aprovar apenas reservas do próprio departamento).
- **Exportação**: exportação de reservas para relatórios de uso de espaço.
- **Reserva múltipla**: reservar vários slots/salas de uma vez.

## Rodando localmente

### Pré-requisitos
- Docker e Docker Compose instalados

### Passo a passo

1. Clone o repositório:
   ```bash
   git clone https://github.com/sethssd/CB_UFOPA_FG.git
   cd CB_UFOPA_FG
   ```

2. Copie o arquivo de variáveis de ambiente de exemplo e preencha com
   valores reais (nunca use os valores de exemplo em produção):
   ```bash
   cp .env.example .env
   ```
   Edite o `.env` e defina:
   ```
   MYSQL_ROOT_PASSWORD=<uma senha forte>
   MYSQL_DATABASE=cb_db
   ENCRYPTION_KEY=<gere com: php -r "echo bin2hex(random_bytes(32));">
   ```

3. Suba os containers:
   ```bash
   docker-compose up -d --build
   ```

4. Acesse a aplicação em [http://localhost:8080](http://localhost:8080).

5. Para rodar migrations pendentes (ex: após atualizar o código):
   ```bash
   docker-compose exec app php index.php migrate
   ```

### Parando o ambiente
```bash
docker-compose down
```
Os dados do banco ficam persistidos em `./mysql_data` entre execuções.

## Estrutura do projeto

```
CB_UFOPA_FG/
├── docker-compose.yml      # Orquestração dos containers (app + db)
├── Dockerfile               # Imagem PHP 8.4 + Apache
├── init.sql                 # Schema inicial do banco
├── .env.example              # Modelo de variáveis de ambiente
└── src/
    ├── index.php             # Entry point
    ├── crbs-core/            # Núcleo da aplicação (CodeIgniter 3)
    │   └── application/
    │       ├── controllers/  # Rotas/ações (Bookings, Approvals, Rooms...)
    │       ├── models/       # Acesso a dados (Bookings_model e demais)
    │       ├── views/        # Templates
    │       ├── permissions/  # Regras de permissão por ação
    │       └── migrations/   # Alterações de schema versionadas
    └── local/                # Estado local gerado em runtime
        (config, cache, logs, sessions — não versionado)
```

## Segurança

- Nenhuma credencial deve ser commitada no repositório. Toda configuração
  sensível vive em `.env` (ignorado pelo git) — veja `.env.example` para
  o modelo.
- A aplicação falha propositalmente ao subir se `ENCRYPTION_KEY` não
  estiver definida, para evitar rodar com criptografia de sessão fraca.
- Reservas conflitantes (mesma sala, mesmo horário, mesma data) são
  bloqueadas a nível de banco de dados por uma constraint única, além da
  validação em nível de aplicação — protege contra condição de corrida em
  reservas simultâneas.

## Contribuindo

1. Crie uma branch a partir de `main`.
2. Faça commits atômicos e descritivos.
3. Rode `docker-compose up -d --build` e valide localmente antes de abrir PR.
4. Nunca commite arquivos de `src/local/` (sessions, logs, cache) ou o
   `.env` real.

## Licença

Baseado em [classroombookings](https://github.com/craigrodway/classroombookings),
licenciado sob AGPLv3.