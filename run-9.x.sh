# -----------
# DOCKER 9.X
# -----------

# Create a volume for SonarQube data
docker volume create --name sonarqube9x_data
docker volume create --name sonarqube9x_logs
docker volume create --name sonarqube9x_extensions

# Run SonarQube
docker run -d --name sonarqube9x \
           -e SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true \
           -p 9000:9000 \
           -v sonarqube9x_data:/opt/sonarqube/data \
	         -v sonarqube9x_extensions:/opt/sonarqube/extensions \
	         -v sonarqube9x_logs:/opt/sonarqube/logs \
           sonarqube:9.9.0-community

# Set default java version to 17
sdk default java 17.0.6-ms

# CU: 01 - Run Build and SonarScanner using maven for app in java-17 using java17.
rm -rf /home/codespace/.sonar && mvn clean verify sonar:sonar \
  -Dsonar.projectKey=java-17 \
  -Dsonar.host.url=https://belcebus-obscure-trout-5gp5g4rx97527r9r-9000.preview.app.github.dev \
  -Dsonar.login=admin -Dsonar.password=root \
  -f java-17/pom.xml

# expected output: OK
# real output: OK

# CU: 02 - Run only SonarScanner using maven for app in java-17 using java17.
sdk default java 17.0.6-ms && rm -rf /home/codespace/.sonar && mvn clean sonar:sonar \
  -Dsonar.projectKey=java-17 \
  -Dsonar.host.url=https://belcebus-obscure-trout-5gp5g4rx97527r9r-9000.preview.app.github.dev \
  -Dsonar.login=admin -Dsonar.password=root \
  -f java-17/pom.xml

# expected output: KO  -> pq no ha compilado el proyecto
# real output: [ERROR] Failed to execute goal org.sonarsource.scanner.maven:sonar-maven-plugin:3.9.1.2184:sonar (default-cli) on project sonartest: Your project contains .java files, please provide compiled classes with sonar.java.binaries property, or exclude them from the analysis with sonar.exclusions property. ->

# CU: 03 - Run build and SonarScanner using maven for app in java-11 using java17.
sdk default java 17.0.6-ms && rm -rf /home/codespace/.sonar && mvn clean verify sonar:sonar \
  -Dsonar.projectKey=java-11 \
  -Dsonar.host.url=https://belcebus-obscure-trout-5gp5g4rx97527r9r-9000.preview.app.github.dev \
  -Dsonar.login=admin -Dsonar.password=root \
  -f java-11/pom.xml

# expected output: OK
# real output: OK

# CU: 04 - Run only SonarScanner using maven for app in java-11 using java17.
sdk default java 17.0.6-ms && rm -rf /home/codespace/.sonar && mvn clean sonar:sonar \
  -Dsonar.projectKey=java-11 \
  -Dsonar.host.url=https://belcebus-obscure-trout-5gp5g4rx97527r9r-9000.preview.app.github.dev \
  -Dsonar.login=admin -Dsonar.password=root \
  -f java-11/pom.xml

# expected output: KO -> faltan compilados
# real output: 

# Set default java version to 11
sdk default java 11.0.18-ms

# CU: 05 - Run build and SonarScanner using maven for app in java-17 using java11.
sdk default java 11.0.18-ms && rm -rf /home/codespace/.sonar && mvn clean verify sonar:sonar \
  -Dsonar.projectKey=java-17 \
  -Dsonar.host.url=https://belcebus-obscure-trout-5gp5g4rx97527r9r-9000.preview.app.github.dev \
  -Dsonar.login=admin -Dsonar.password=root \
  -f java-17/pom.xml

# expected output: KO -> error de compilación
# real output: ailed to execute goal org.apache.maven.plugins:maven-compiler-plugin:3.8.0:compile (default-compile) on project sonartest: Fatal error compiling: error: invalid target release: 17 

# CU: 06 - Run only SonarScanner using maven for app in java-17 using java11.
sdk default java 11.0.18-ms && rm -rf /home/codespace/.sonar && mvn clean sonar:sonar \
  -Dsonar.projectKey=java-17 \
  -Dsonar.host.url=https://belcebus-obscure-trout-5gp5g4rx97527r9r-9000.preview.app.github.dev \
  -Dsonar.login=admin -Dsonar.password=root \
  -f java-17/pom.xml

# expected output: KO -> no tiene binarios compilados
# real output: [ERROR] Failed to execute goal org.sonarsource.scanner.maven:sonar-maven-plugin:3.9.1.2184:sonar (default-cli) on project sonartest: Your project contains .java files, please provide compiled classes with sonar.java.binaries property, or exclude them from the analysis with sonar.exclusions property.

# CU: 07 - Run build and SonarScanner using maven for java 11 using java11.
sdk default java 11.0.18-ms && rm -rf /home/codespace/.sonar && mvn clean verify sonar:sonar \
  -Dsonar.projectKey=java-11 \
  -Dsonar.host.url=https://belcebus-obscure-trout-5gp5g4rx97527r9r-9000.preview.app.github.dev \
  -Dsonar.login=admin -Dsonar.password=root \
  -f java-11/pom.xml

# expected output: OK
# real output: OK

# CU: 08 - Run only SonarScanner using maven for java 11 using java11.
sdk default java 11.0.18-ms && rm -rf /home/codespace/.sonar && mvn clean sonar:sonar \
  -Dsonar.projectKey=java-11 \
  -Dsonar.host.url=https://belcebus-obscure-trout-5gp5g4rx97527r9r-9000.preview.app.github.dev \
  -Dsonar.login=admin -Dsonar.password=root \
  -f java-11/pom.xml

# expected output: OK
# real output: OK

# -----------
# DOCKER 8.X
# -----------

docker volume create --name sonarqube8x_data
docker volume create --name sonarqube8x_logs
docker volume create --name sonarqube8x_extensions

docker run -d --name sonarqube8x \
           -e SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true \
           -p 9001:9000 \
           -v sonarqube8x_data:/opt/sonarqube/data \
	         -v sonarqube8x_extensions:/opt/sonarqube/extensions \
	         -v sonarqube8x_logs:/opt/sonarqube/logs \
           sonarqube:8.9.10-community

# CU: 09 - Run Build and SonarScanner using maven for app in java-17 using java17.
sdk default java 17.0.6-ms && rm -rf /home/codespace/.sonar && mvn clean verify sonar:sonar \
  -Dsonar.projectKey=java-17 \
  -Dsonar.host.url=https://belcebus-obscure-trout-5gp5g4rx97527r9r-9001.preview.app.github.dev \
  -Dsonar.login=admin -Dsonar.password=root \
  -f java-17/pom.xml

# expected output: KO -> version de java no soportada por sonar 8.x
# real output: OK

# CU: 10 - Run only SonarScanner using maven for app in java-17 using java17.
sdk default java 17.0.6-ms && rm -rf /home/codespace/.sonar && mvn clean sonar:sonar \
  -Dsonar.projectKey=java-17 \
  -Dsonar.host.url=https://belcebus-obscure-trout-5gp5g4rx97527r9r-9001.preview.app.github.dev \
  -Dsonar.login=admin -Dsonar.password=root \
  -f java-17/pom.xml

# expected output: KO -> por no tener compilados los binarios / versión de java (17) incompatible
# real output: [ERROR] Failed to execute goal org.sonarsource.scanner.maven:sonar-maven-plugin:3.9.1.2184:sonar (default-cli) on project sonartest: Your project contains .java files, please provide compiled classes with sonar.java.binaries property, or exclude them from the analysis with sonar.exclusions property.

# CU: 11 - Run build and SonarScanner using maven for app in java-11 using java17.
sdk default java 17.0.6-ms && rm -rf /home/codespace/.sonar && mvn clean verify sonar:sonar \
  -Dsonar.projectKey=java-11 \
  -Dsonar.host.url=https://belcebus-obscure-trout-5gp5g4rx97527r9r-9001.preview.app.github.dev \
  -Dsonar.login=admin -Dsonar.password=root \
  -f java-11/pom.xml

# expected output: OK
# real output: OK

# CU: 12 - Run only SonarScanner using maven for app in java-11 using java17.
sdk default java 17.0.6-ms && rm -rf /home/codespace/.sonar && mvn clean sonar:sonar \
  -Dsonar.projectKey=java-11 \
  -Dsonar.host.url=https://belcebus-obscure-trout-5gp5g4rx97527r9r-9001.preview.app.github.dev \
  -Dsonar.login=admin -Dsonar.password=root \
  -f java-11/pom.xml

# expected output: KO -> no hay binarios compilados
# real output: OK

# Set default java version to 11
sdk default java 11.0.18-ms

# CU: 13 - Run build and SonarScanner using maven for app in java-17 using java11.
sdk default java 11.0.18-ms && rm -rf /home/codespace/.sonar && mvn clean verify sonar:sonar \
  -Dsonar.projectKey=java-17 \
  -Dsonar.host.url=https://belcebus-obscure-trout-5gp5g4rx97527r9r-9001.preview.app.github.dev \
  -Dsonar.login=admin -Dsonar.password=root \
  -f java-17/pom.xml

# expected output: KO -> Error de compilacion
# real output: [ERROR] Failed to execute goal org.apache.maven.plugins:maven-compiler-plugin:3.8.0:compile (default-compile) on project sonartest: Fatal error compiling: error: invalid target release: 17

# CU: 14 - Run only SonarScanner using maven for app in java-17 using java11.
sdk default java 11.0.18-ms && rm -rf /home/codespace/.sonar && mvn clean sonar:sonar \
  -Dsonar.projectKey=java-17 \
  -Dsonar.host.url=https://belcebus-obscure-trout-5gp5g4rx97527r9r-9001.preview.app.github.dev \
  -Dsonar.login=admin -Dsonar.password=root \
  -f java-17/pom.xml

# expected output: KO -> No binarios compilados (no hacemos compilación para que no falle))
# real output: [ERROR] Failed to execute goal org.sonarsource.scanner.maven:sonar-maven-plugin:3.9.1.2184:sonar (default-cli) on project sonartest: Your project contains .java files, please provide compiled classes with sonar.java.binaries property, or exclude them from the analysis with sonar.exclusions property.

# CU: 15 - Run build and SonarScanner using maven for java 11 using java11.
sdk default java 11.0.18-ms && rm -rf /home/codespace/.sonar && mvn clean verify sonar:sonar \
  -Dsonar.projectKey=java-11 \
  -Dsonar.host.url=https://belcebus-obscure-trout-5gp5g4rx97527r9r-9001.preview.app.github.dev \
  -Dsonar.login=admin -Dsonar.password=root \
  -f java-11/pom.xml

# expected output: OK
# real output: OK

# CU: 16 - Run only SonarScanner using maven for java 11 using java11.
sdk default java 11.0.18-ms && rm -rf /home/codespace/.sonar && mvn clean sonar:sonar \
  -Dsonar.projectKey=java-11 \
  -Dsonar.host.url=https://belcebus-obscure-trout-5gp5g4rx97527r9r-9001.preview.app.github.dev \
  -Dsonar.login=admin -Dsonar.password=root \
  -f java-11/pom.xml

# expected output: KO -> falta de binarios compilados
# real output: OK

# CU: 17 - Run Build and SonarScanner using scanner for app in java-17 using scanner cli Docker.
# primero compilamos y ejecutamos el scanner:
sdk default java 17.0.6-ms && rm -rf /home/codespace/.sonar && mvn clean verify -f java-17/pom.xml && \
docker run \
    --rm \
    -e SONAR_HOST_URL="https://belcebus-obscure-trout-5gp5g4rx97527r9r-9001.preview.app.github.dev" \
    -e SONAR_SCANNER_OPTS="-Dsonar.projectKey=java-17 -Dsonar.java.binaries=/usr/src/target/classes" \
    -e SONAR_LOGIN="admin" \
    -e SONAR_PASSWORD="root" \
    -v "/workspaces/sonarqube/java-17:/usr/src" \
    sonarsource/sonar-scanner-cli

# expected output: KO -> versiones de java (17) imcompatible con sonar 8.x
# real output: OK

# CU: 18 - Run Build and SonarScanner using scanner for app in java-11 using scanner cli Docker.
sdk default java 11.0.18-ms && rm -rf /home/codespace/.sonar && mvn clean verify -f java-11/pom.xml && \
docker run \
    --rm \
    -e SONAR_HOST_URL="https://belcebus-obscure-trout-5gp5g4rx97527r9r-9001.preview.app.github.dev" \
    -e SONAR_SCANNER_OPTS="-Dsonar.projectKey=java-11 -Dsonar.java.binaries=/usr/src/target/classes" \
    -e SONAR_LOGIN="admin" \
    -e SONAR_PASSWORD="root" \
    -v "/workspaces/sonarqube/java-11:/usr/src" \
    sonarsource/sonar-scanner-cli

# expected output: OK
# real output: OK

# CU: 19 - Run Build and SonarScanner using scanner for app in java-17 using scanner cli Docker.
# primero compilamos y ejecutamos el scanner:
sdk default java 11.0.18-ms && rm -rf /home/codespace/.sonar && mvn clean verify -f java-17/pom.xml && \
docker run \
    --rm \
    -e SONAR_HOST_URL="https://belcebus-obscure-trout-5gp5g4rx97527r9r-9001.preview.app.github.dev" \
    -e SONAR_SCANNER_OPTS="-Dsonar.projectKey=java-17 -Dsonar.java.binaries=/usr/src/target/classes" \
    -e SONAR_LOGIN="admin" \
    -e SONAR_PASSWORD="root" \
    -v "/workspaces/sonarqube/java-17:/usr/src" \
    sonarsource/sonar-scanner-cli

# expected output: KO -> java 11 no puede compilar
# real output: [ERROR] Failed to execute goal org.apache.maven.plugins:maven-compiler-plugin:3.8.0:compile (default-compile) on project sonartest: Fatal error compiling: error: invalid target release: 17

# CU: 20 - Run Build and SonarScanner using scanner for app in java-11 using scanner cli Docker.
sdk default java 17.0.6-ms && rm -rf /home/codespace/.sonar && mvn clean verify -f java-11/pom.xml && \
docker run \
    --rm \
    -e SONAR_HOST_URL="https://belcebus-obscure-trout-5gp5g4rx97527r9r-9001.preview.app.github.dev" \
    -e SONAR_SCANNER_OPTS="-Dsonar.projectKey=java-11 -Dsonar.java.binaries=/usr/src/target/classes" \
    -e SONAR_LOGIN="admin" \
    -e SONAR_PASSWORD="root" \
    -v "/workspaces/sonarqube/java-11:/usr/src" \
    sonarsource/sonar-scanner-cli

# expected output: OK
# real output: OK


# CU: 21 - Run Build and SonarScanner using scanner for app in java-17 using scanner cli binary.



### Scanner: Docker

docker run \
    --rm \
    -e SONAR_HOST_URL="https://belcebus-obscure-trout-5gp5g4rx97527r9r-9001.preview.app.github.dev" \
    -e SONAR_SCANNER_OPTS="-Dsonar.projectKey=java-11" \
    -e SONAR_LOGIN="admin" \
    -e SONAR_PASSWORD="root" \
    -v "/workspaces/sonarqube/java-11:/usr/src" \
    sonarsource/sonar-scanner-cli

