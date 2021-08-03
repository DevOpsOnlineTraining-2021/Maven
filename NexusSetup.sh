#Nexus setup: http://clusterfrak.com/sysops/app_installs/nexus_install/#download-nexus-repository-oss

#Create an AWS EC2 Red Hat instance with t2.micro for this practice

#go to root user: sudo -i or sudo su
sudo -i

#This is optional command. Only to know the current usage of disk space before install nexus tool.
df -h /

#This is optional command. Only to know the current usage of total RAM and CPU before install nexus tool.
top

#Install the packages that are needed to support Nexus Repository OSS
#yum clean all (no need to run on EC2 instance)
#yum update -y (no need to run on EC2 instance)

yum install wget java-1.8.0-openjdk.x86_64 -y 

java -version

#Create Installation Directory
mkdir /opt/nexus
cd /opt/nexus

#Download Nexus Repository OSS
wget http://www.sonatype.org/downloads/nexus-latest-bundle.tar.gz

#Unzip the nexus package
tar -xzvf nexus-latest-bundle.tar.gz

#Copy Init Script: Crosscheck the below source path before you run thios command
cp /opt/nexus/nexus-2.14.20-02/bin/nexus /etc/init.d/

#Change the Init Script with NEXUS_HOME path : Manual update
#vi /etc/init.d/nexus
#NEXUS_HOME="/opt/nexus/nexus-2.14.20-02"

#Add the Nexus User & set direcxtory permissions.
useradd nexus
chown -R nexus:nexus /opt/nexus/
chown nexus:nexus /etc/init.d/nexus

#cat /opt/nexus/nexus-2.14.20-02/conf/nexus.properties : Crosscheck this path & nexus.properties content.
#nexus-webapp-context-path=/nexus

#Login to nexus user & start nexus
su nexus
/etc/init.d/nexus start
service nexus status

#This is optional command. Only to know the current usage of disk space after install java, nexus tool.
df -h /

echo'
example ouput of above command
[nexus@ip-172-31-88-136 nexus]$ df -h /
Filesystem      Size  Used Avail Use% Mounted on
/dev/xvda2       15G  1.7G   14G  12% /
'

#This is optional command. Only to know the current usage of total RAM and CPU after install java, nexus tool.
top

echo'
example ouput of above command
[nexus@ip-172-31-88-136 nexus]$ top
top - 14:42:29 up 15 min,  1 user,  load average: 0.00, 0.08, 0.11
Tasks:  88 total,   1 running,  87 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
MiB Mem :    805.8 total,    121.4 free,    496.1 used,    188.3 buff/cache
MiB Swap:      0.0 total,      0.0 free,      0.0 used.    177.5 avail Mem

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
  13203 nexus     20   0   18392   2008   1848 S   0.3   0.2   0:00.24 wrapper
  13205 nexus     20   0 2840380 372604  14452 S   0.3  45.2   0:31.79 java
  13352 nexus     20   0   65396   4832   4044 R   0.3   0.6   0:00.15 top
      1 root      20   0  179424   9496   5068 S   0.0   1.2   0:02.82 systemd

'

#Launch the URL in any browser: http://<PublicIP>:8081/nexus


#Note:
#Note-1: Marked with the workds "Crosscheck" & "Update" for manual actions. Search for those workds in this file and take an action accordingly.
#Note-2:Please "Crosscheck" whether those details are correct are not. Update the paths if they are different.

#Installation Procedure:
#Step-1: Copy the lines from 4 to 21, and then paste it on yout terminal. All the commands will be executed one by one.
#Step-2: Manually you need to update the file /etc/init.d/nexus with NEXUS HOME as instructed in line number 22-25.
#Step-3: Copy the lines from 27 to 38, and then paste it on yout terminal. All the commands will be executed one by one.
#Step-4: Login with below default credentials.
#default user credentials
#Full admin access: Username/pwd: admin/admin123
#Partial admin access: Username/pwd: deployment/deployment123

#Go to maven home & update the settings.xml file with nexus user details.
#Example: vi /root/apache-maven-3.5.3/conf/settings.xml: update this settings file with below nexus credentials.
echo'
	<server>
		<id>deployment</id>
		<username>deployment</username>
		<password>deployment123</password>
	</server>
'
#Add the below details in your project pom.xml file. Make sure the IP is correct.
echo'
<distributionManagement>
	<repository>
		<id>deployment</id> <!-- this ID should match with server id which we configure in settings.xml file. -->
		<name>Nexus Release Repository</name>
		<url>http://18.219.252.49:8081/nexus/content/repositories/releases/</url>
	</repository>
	<snapshotRepository>
		<id>deployment</id>
		<name>Nexus Snapshots Repository</name>
		<url>http://18.219.252.49:8081/nexus/content/repositories/snapshots/</url>
	</snapshotRepository>
</distributionManagement>
'
