docker run -d --name sonarqube9x \
           -e SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true \
           -p 9000:9000 \
           sonarqube:9.9.0-community

docker run -d --name sonarqube8 \
           -e SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true \
           -p 9001:9000 \
           sonarqube:8.9.0-community


mvn sonar:sonar \
  -Dsonar.projectKey=java-17 \
  -Dsonar.host.url=https://belcebus-obscure-trout-5gp5g4rx97527r9r-9000.preview.app.github.dev \
  -Dsonar.login=admin -Dsonar.password=root \
  --f 9.x/pom.xml

mvn clean compile sonar:sonar \
  -Dsonar.projectKey=java-11 \
  -Dsonar.host.url=https://belcebus-obscure-trout-5gp5g4rx97527r9r-9001.preview.app.github.dev \
  -Dsonar.login=admin -Dsonar.password=root \
  -f 8.x/pom.xml


  