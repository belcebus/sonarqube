docker run -d --name sonarqube \
           -e SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true \
           -p 9000:9000 \
           sonarqube:9.9.0-community

docker run -d --name sonarqube8 \
           -e SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true \
           -p 9001:9000 \
           sonarqube:8.9.0-community


           sqp_40c8ac9aa3ee7a9a97faed50492db06cfe6de14f
sqp_c719dac4b4603a13ed8f83594446e8f48a2535d2


docker mvn clean verify sonar:sonar \
  -Dsonar.projectKey=java-17 \
    -Dsonar.host.url=http://localhost:9000 \
      -Dsonar.login=sqp_40c8ac9aa3ee7a9a97faed50492db06cfe6de14f

mvn clean verify sonar:sonar \
  -Dsonar.projectKey=java-17 \
  -Dsonar.host.url=http://belcebus-obscure-trout-5gp5g4rx97527r9r-9000.preview.app.github.dev \
  -Dsonar.login=sqp_40c8ac9aa3ee7a9a97faed50492db06cfe6de14f

mvn sonar:sonar \
  -Dsonar.projectKey=java-17 \
  -Dsonar.host.url=https://belcebus-obscure-trout-5gp5g4rx97527r9r-9001.preview.app.github.dev \
  -Dsonar.login=admin -Dsonar.password=root