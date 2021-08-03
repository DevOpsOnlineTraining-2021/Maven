      1. Maven lifecycle phases

         validate
         compile
         test
         package
         verify
         install
         deploy

      1. skip tests execution: -DskipTests=true 

         ex: mvn clean install -DskipTests=true 

      1. skip tests compilation: -Dmaven.test.skip=true

         ex: mvn clean install -Dmaven.test.skip=true

      1. Run checkstyle goal on your project: mvn clean install checkstyle:checkstyle

      1. Run checkstyle goal on your project & fail the build if any errors/violations: mvn clean install checkstyle:checkstyle checkstyle:check

      1. Run checkstyle goal on your project & abd check the error but dont fail the build: mvn clean compile checkstyle:checkstyle checkstyle:check -Dcheckstyle.failOnViolation=false

      1. mvn dependency:tree

      1. mvn versions:set -DnewVersion=2.0.0-SNAPSHOT

      1. mvn versions:revert

      1. mvn versions:set -DnewVersion=2.0.0-SNAPSHOT -DgenerateBackupPoms=false

      1. deploy the file to nexus(Make sure the nexus credentials and repos configured in settings.xml): mvn deploy:deploy-file -Dversion=1.0.0 -DgeneratePom=true -Dpackaging=zip -Dfile=package.zip -DgroupId=com.devops.sample.zip -DartifactId=SampleZip -DrepositoryId=releases -Durl=http://nexus:8081/nexus/content/repositories/releases

      1. Download the package from nexus(Make sure the nexus credentials and repos configured in settings.xml): mvn org.apache.maven.plugins:maven-dependency-plugin:3.1.1:get -DrepoUrl=http://nexus:8081/nexus/content/repositories/releases -DgroupId=com.devops.sample.zip -DartifactId=SampleZip -Dversion=1.0.0 -Dpackaging=zip -DrepoId=releases -Ddest=SampleZip.zip

      1. Generate website for maven project: mvn clean install org.apache.maven.plugins:maven-site-plugin:3.7.1:site

      1. mvn clean install -Dmaven.repo.local=/local/repo/path
      
      1. 
         mvn --settings path/YourOwnSettings.xml clean install

         or

         mvn -s path/YourOwnSettings.xml clean install


