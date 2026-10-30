# Sistema de Papelaria — Projeto completo

Projeto organizado com **frontend Angular** e **backend Java/Spring Boot**, integrados por API REST e banco de dados PostgreSQL.

## Estrutura

```text
papelaria_completa/
├── backend/                 # API Java + Spring Boot + PostgreSQL
│   ├── src/
│   ├── .mvn/
│   ├── pom.xml
│   ├── Dockerfile
│   ├── docker-compose.yml
│   └── .env.example
├── frontend/                # Aplicação Angular
│   ├── src/
│   ├── public/
│   ├── package.json
│   └── package-lock.json
├── INICIAR.bat              # Inicialização assistida no Windows
├── INICIAR.ps1
├── .gitignore
├── RELATORIO_BACKEND.docx
└── RELATORIO_TECNICO.docx
```

## Requisitos

- Windows 10/11
- Docker Desktop instalado e aberto
- Node.js 22.12 ou superior e npm
- Navegador atualizado

Para executar o backend sem Docker, também é necessário JDK 21.

## Como executar no Windows

### Opção 1 — Inicialização automática

1. Extraia o ZIP para uma pasta do computador.
2. Abra o Docker Desktop e aguarde ficar pronto.
3. Dê dois cliques em `INICIAR.bat`.
4. Na primeira execução, o script cria `backend/.env` a partir do exemplo e instala as dependências do frontend.
5. Aguarde o Angular iniciar e abra `http://localhost:4200`.

O script inicia PostgreSQL e API pelo Docker Compose e depois inicia o Angular no terminal.

### Opção 2 — Inicialização manual

**1. Banco de dados e backend**

Abra um PowerShell na pasta `backend`:

```powershell
Copy-Item .env.example .env
docker compose up --build
```

A API ficará em `http://localhost:8080`.

**2. Frontend**

Abra outro PowerShell na pasta `frontend`:

```powershell
npm ci
npm start
```

Acesse `http://localhost:4200`.

## Endereços úteis

| Serviço | Endereço |
|---|---|
| Sistema (Angular) | http://localhost:4200 |
| API | http://localhost:8080 |
| Swagger / documentação da API | http://localhost:8080/swagger-ui/index.html |
| Saúde da API | http://localhost:8080/actuator/health |

O frontend está configurado para acessar a API em `http://localhost:8080`. Essa configuração está em `frontend/src/environments/`.

## Como encerrar

- No terminal do Angular, pressione `Ctrl + C`.
- Para parar os containers, abra um PowerShell na pasta `backend` e execute:

```powershell
docker compose down
```

Para apagar também os dados persistidos do banco (ação irreversível):

```powershell
docker compose down -v
```

## Executar o backend sem Docker (alternativa)

Com JDK 21 e PostgreSQL instalados e configurados, abra um PowerShell na pasta `backend`:

```powershell
.\mvnw.cmd spring-boot:run
```

## GitHub

Para enviar o projeto completo, inicialize ou abra o repositório na pasta `papelaria_completa` (a pasta que contém `backend`, `frontend` e este README). O `.gitignore` da raiz evita enviar dependências, arquivos compilados e configurações locais.

Exemplo de comandos:

```bash
git init
git add .
git commit -m "Organiza projeto completo da papelaria"
git branch -M main
git remote add origin URL_DO_SEU_REPOSITORIO
git push -u origin main
```

Se o repositório já estiver configurado, não repita `git remote add origin`; use `git remote -v` para conferir.

## Observações de segurança

- O arquivo `backend/.env` contém credenciais locais e não deve ser enviado ao GitHub.
- As credenciais do `.env.example` são somente para desenvolvimento. Troque-as antes de qualquer uso compartilhado.
- A revisão dos arquivos não substitui testes completos em execução. Valide o build e os fluxos principais no seu computador.
- A autenticação e o armazenamento de senhas precisam de revisão antes de usar dados reais ou publicar o sistema. Não utilize senhas reais neste estado sem corrigir esses pontos.
