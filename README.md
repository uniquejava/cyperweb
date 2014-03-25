#cyperweb

Try [`http://cyperweb.ng.bluemix.net`](http://cyperweb.ng.bluemix.net) to see what this app looks like,
you can fork this project [`@github`](https://github.com/uniquejava/cyperweb)
or [`@oschina`](http://git.oschina.net/uniquejava/cyperweb).
###Technique stacks
To name but a few:

1. Spring MVC
* Spring JDBC
* Spring Cloud
* Maven
* Websphere Liberty Profile 8.5.5 or Tomcat 7
* MySQL


###How to deploy the app to Bluemix.

You can either install `cloud foundry` plugin from 
Eclipse marketplace, or you can use cloud foundry CLI like this:
```shell
$cf login -a https://api.ng.bluemix.net
API endpoint: https://api.ng.bluemix.net

Username> your username
Password> your password

$cf create-service mysql 100 mysql-cyper

$cf services

$cf bind-service cyperweb mysql-cyper

$cf push cyperweb --no-manifest --no-start -p ./cyperweb.war

$cf start cyperweb

```
###Maven
You can use below command to generate a war package for bluemix.
```shell
mvn clean package
```
the generated file will be `cyperweb.war` for this project. Be careful when you are using maven eclipse plug-in.
#####a. Don't use below maven archetects in Eclipse JEE, they are meant for RAD.

* webapp-jee5-was
* webapp-jee5-liberty

Nevertheless, use maven-archetype-webapp honestly.


#####b. Use Maven -> Update Project..(Alt +F5) `with caution!` Below error can be occurred：
```java
[AUDIT   ] CWWKF0011I: The server DemoServer is ready to run a smarter planet.
[ERROR   ] SRVE0293E: [Servlet Error]-[Failed to load listener: org.springframework.web.context.ContextLoaderListener]: java.lang.ClassNotFoundException: org/springframework/web/context/ContextLoaderListener
    at java.lang.Class.forName0(Native Method)
    at java.lang.Class.forName(Class.java:190)
    at com.sun.beans.finder.ClassFinder.findClass(ClassFinder.java:75)
    at com.sun.beans.finder.ClassFinder.findClass(ClassFinder.java:110)
	at java.beans.Beans.instantiate(Beans.java:216)
	at java.beans.Beans.instantiate(Beans.java:80)
	at com.ibm.ws.webcontainer.webapp.WebApp.loadListener(WebApp.java:2184)
	at [internal classes]
```
with the help of git，the above Maven->Update Project will cause `.project` change from
```xml
	<buildCommand>
		<name>org.eclipse.m2e.core.maven2Builder</name>
		<arguments>
		</arguments>
	</buildCommand>
	<buildCommand>
		<name>org.eclipse.wst.validation.validationbuilder</name>
		<arguments>
		</arguments>
	</buildCommand>
```
to
```xml
	<buildCommand>
		<name>org.eclipse.wst.validation.validationbuilder</name>
		<arguments>
		</arguments>
	</buildCommand>
	<buildCommand>
		<name>org.eclipse.m2e.core.maven2Builder</name>
		<arguments>
		</arguments>
	</buildCommand>
```
and will change `.classpath` from 
```xml
    <classpathentry kind="con" path="org.eclipse.m2e.MAVEN2_CLASSPATH_CONTAINER">
		<attributes>
			<attribute name="maven.pomderived" value="true"/>
			<attribute name="org.eclipse.jst.component.dependency" value="/WEB-INF/lib"/>
		</attributes>
	</classpathentry>
```
to 
```xml
    <classpathentry kind="con" path="org.eclipse.m2e.MAVEN2_CLASSPATH_CONTAINER">
		<attributes>
			<attribute name="maven.pomderived" value="true"/>
		</attributes>
	</classpathentry>
```
After I revert the changes in .classpath, the issue is resolved.


###Auto rebind configurations
You don't need to do anything if you are using spring framework and
you already have below piece of configuration done there.
```xml
    <bean id="dataSource" class="org.apache.commons.dbcp.BasicDataSource"
		destroy-method="close">
		<property name="driverClassName" value="${jdbc.driverClassName}" />
		<property name="url" value="${jdbc.url}" />
		<property name="username" value="${jdbc.username}" />
		<property name="password" value="${jdbc.password}" />
	</bean>
```
Because spring framework has a built-in support for cloud and is smart enough to auto 
re-configure your file, it will automatically bind the environment service to this dataSource
and will ignore any your configurations here given that you only have one RDBMS service bind to
your application.

However, if you want more fine control over your application, you can do below things.

 `pom.xml` for maven.
```xml
    	<dependency>
			<groupId>org.springframework.cloud</groupId>
			<artifactId>cloudfoundry-connector</artifactId>
			<version>0.9.5</version>
		</dependency>
		<dependency>
			<groupId>org.springframework.cloud</groupId>
			<artifactId>spring-service-connector</artifactId>
			<version>0.9.5</version>
		</dependency>
```
`applicationContext.mxl` for spring framework.
```xml
<beans xmlns="http://www.springframework.org/schema/beans"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:context="http://www.springframework.org/schema/context"
	xmlns:mvc="http://www.springframework.org/schema/mvc"
	xmlns:cloud="http://www.springframework.org/schema/cloud"
	xsi:schemaLocation="http://www.springframework.org/schema/beans
    http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
    http://www.springframework.org/schema/mvc http://www.springframework.org/schema/mvc/spring-mvc-3.0.xsd
    http://www.springframework.org/schema/cloud http://www.springframework.org/schema/cloud/spring-cloud.xsd
    http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context-3.0.xsd
    ">
    <cloud:data-source id="dataSource" service-name="mysql-cyper" />
</beans>
```
Notice the new cloud declaration, 
*xmlns:cloud="http://www.springframework.org/schema/cloud"*

and
*http://www.springframework.org/schema/cloud http://www.springframework.org/schema/cloud/spring-cloud.xsd*

BTW, again, `service-name` is optional if there is only one RDBMS service bind to this app.

###Odds and ends
1. You need to bind mysql service before you start application for the first time.
* You must include jars for jdbc drivers, the bluemix won't provide jdbc drivers for you.




