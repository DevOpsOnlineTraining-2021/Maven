### pom.xml file root tag/element

    <project>

        everything we have to configure under this tag

    </project>


### Project details

	<groupId>com.devops.calculator.addition</groupId>
	<artifactId>Addition</artifactId>
	<version>1.0.2</version>
	<packaging>jar</packaging>



### Properties

	<properties>
		<project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
		<sonar.host.url>http://3.84.135.178:9000</sonar.host.url>
    <nexus.ip.address>3.84.135.178</nexus.ip.address>
	</properties>


### build section - we can configure maven plugins

	<build>
		<plugins>
			<plugin>
				<groupId>org.apache.maven.plugins</groupId>
				<artifactId>maven-jar-plugin</artifactId>
				<configuration>
					<archive>
						<manifest>
							<mainClass>com.devops.calculator.main.MainClass</mainClass>
							<!-- java -jar target/Addition-1.0.0-SNAPSHOT.jar -->
						</manifest>
					</archive>
				</configuration>
			</plugin>
		</plugins>
	</build>
  
### project dependencies

	<dependencies>
		<dependency>
			<groupId>junit</groupId>
			<artifactId>junit</artifactId>
			<version>3.8.1</version>
			<scope>test</scope>
		</dependency>
	</dependencies>
  

### dependencyManagement

    <dependencyManagement>
        ----
        ----
    </dependencyManagement>
  
  
### distributionManagement section - to upload the maven build artifacts to repository manager (Sonatype Nexus or Jforg artifactory)

	See the sample one: https://github.com/CalculatorApps/Addition/blob/master/pom.xml

	<distributionManagement>
		<repository>
			<id>deployment</id> <!-- this ID should match with server id which we configure in settings.xml file. -->
			<name>Nexus Release Repository</name>
			<url>http://18.234.200.162:8081/nexus/content/repositories/my-release-repo/</url>
		</repository>
		<snapshotRepository>
			<id>deployment</id>
			<name>Nexus Snapshots Repository</name>
			<url>http://18.234.200.162:8081/repository/maven-snapshots/</url>
		</snapshotRepository>
	</distributionManagement>
  

### repositories

	see sample one https://github.com/DevOpsOnlineTraining-2021/Maven/blob/master/settings-repo-and-pluginRepo.xml

    <repositories>
        <repository>
            <releases>
                ----
                ----
            </releases>
            
            <snapshots>
                ----
                ----           
            </snapshots>
        </repository>
        
    </repositories>


### pluginRepositories

	see sample one https://github.com/DevOpsOnlineTraining-2021/Maven/blob/master/settings-repo-and-pluginRepo.xml

    <pluginRepositories>
        <pluginRepository>
            <releases>
                ----
                ----
            </releases>
            
            <snapshots>
                ----
                ----           
            </snapshots>
        </pluginRepository>
        
    </pluginRepositories>
    
    
### profiles

  	<profiles>
      <profile>
        <id>profile-name</id>
        
        <properties>
            ....
            ....
        </properties>
        
        <distributionManagement>
            ----
            ----
        </distributionManagement>
        
        <build>
            ----
            ----
        </build>
        
        
        <dependencies>
            ----
            ----
        </dependencies>
        
        <dependencyManagement>
            ----
            ----
        </dependencyManagement>
        
      </profile>
    </profiles>
     
