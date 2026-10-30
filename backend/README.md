# Gerenciamento de Papelaria 📚

Sistema de gerenciamento para papelarias desenvolvido com **Java** e **Spring Boot**. O projeto visa controlar o fluxo de vendas, estoque de produtos, cadastro de clientes e fornecedores.

## 🚀 Tecnologias Utilizadas

*   **Java 17+**
*   **Spring Boot 3**
    *   Spring Data JPA
    *   Spring Web
    *   Spring Validation
*   **PostgreSQL** (Banco de Dados)
*   **Lombok** (Produtividade)
*   **Maven** (Gerenciador de Dependências)
*   **Docker** & **Jenkins** (CI/CD)
*   **SonarQube** (Qualidade de Código)

## 🏗️ Arquitetura e Padrões

O projeto segue uma arquitetura em camadas para melhor manutenção e escalabilidade:

1.  **Domain (Entidades):** Mapeamento direto com o banco de dados via JPA. Focado exclusivamente na persistência.
2.  **DTO (Data Transfer Objects):**
    *   **Request:** Classes para captura e validação de dados de entrada (`@Valid`).
    *   **Response:** Classes para formatação e exposição controlada de dados de saída.
3.  **Repository:** Interface de comunicação com o banco de dados (Spring Data JPA).
4.  **Service:** Camada de regras de negócio e conversão entre Entidades e DTOs.
5.  **Controller:** Pontos de entrada da API REST, utilizando `ResponseEntity` para controle de status HTTP.

## 📊 Modelo de Domínio

O sistema é composto pelas seguintes entidades principais:

*   **Cliente:** Cadastro de compradores.
*   **Fornecedor:** Cadastro de empresas fornecedoras.
*   **Produto:** Itens à venda com controle de estoque.
*   **Venda:** Registro de transações comerciais.
*   **ItemVenda:** Detalhes dos produtos em cada venda.

## 📖 Documentação Adicional

Para uma explicação detalhada linha a linha sobre a implementação do padrão DTO, consulte o arquivo:
*   `explicacao_projeto.txt` (Localizado na raiz do projeto).

## 🛠️ Como Executar

1.  **Pré-requisitos:** Java 17+, PostgreSQL, Maven.
2.  **Configuração:** Ajuste o `application.properties` ou `application.yaml`.
3.  **Execução:**
    ```bash
    ./mvnw spring-boot:run
    ```

---
Desenvolvido como projeto de estudo em Java/Spring.
