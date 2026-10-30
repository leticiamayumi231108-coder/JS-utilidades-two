# =============================================
# Estágio 1: Build com Maven + JDK
# =============================================
FROM maven:3.9-eclipse-temurin-21 AS builder

WORKDIR /app

# Copia apenas os arquivos de dependência primeiro (cache de camadas)
COPY pom.xml ./
COPY .mvn .mvn
COPY mvnw mvnw.cmd ./

# Baixa dependências offline (aproveita cache do Docker)
RUN mvn dependency:go-offline -B

# Copia o código fonte e compila
COPY src ./src
RUN mvn package -B -DskipTests

# =============================================
# Estágio 2: Imagem runtime enxuta com JRE
# =============================================
FROM eclipse-temurin:21-jre-alpine

# Metadados
LABEL maintainer="dev@papelaria.com" \
      version="1.0.0" \
      description="Papelaria API - Spring Boot"

# Cria usuário não-root para segurança
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app

# Copia o JAR do estágio de build
COPY --from=builder /app/target/papelaria-1.0.0.jar app.jar

# [CORREÇÃO #57] Removidas credenciais hardcoded — devem ser passadas em runtime via docker-compose ou env vars
# SPRING_DATASOURCE_URL, SPRING_DATASOURCE_USERNAME, SPRING_DATASOURCE_PASSWORD devem ser definidos ao executar

# [CORREÇÃO #58] Healthcheck usa /actuator/health (dependência spring-boot-starter-actuator adicionada ao pom.xml)
HEALTHCHECK --interval=30s --timeout=3s --start-period=40s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:8080/actuator/health || exit 1

# Expoe a porta da aplicação
EXPOSE 8080

# Muda para usuário não-root
USER appuser

# Executa a aplicação
ENTRYPOINT ["java", "-jar", "app.jar"]
