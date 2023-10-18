<!-- https://mvnrepository.com/artifact/javax.transaction/jta -->
<dependency>
    <groupId>javax.transaction</groupId>
    <artifactId>jta</artifactId>
    <version>1.0.1B</version>
</dependency>

-- EJECUTAR ----------------------------------------------------------------------------------------------------------------
mvn install:install-file -Dfile=jta-1.0.1B.jar -DgroupId=javax.transaction -DartifactId=jta -Dversion=1.0.1B -Dpackaging=jar
----------------------------------------------------------------------------------------------------------------------------

<!-- https://mvnrepository.com/artifact/javax.jms/jms -->
<dependency>
    <groupId>javax.jms</groupId>
    <artifactId>jms</artifactId>
    <version>1.1</version>
</dependency>

-- EJECUTAR ----------------------------------------------------------------------------------------------------------------
mvn install:install-file -Dfile=javax.jms-1.1.jar -DgroupId=javax.jms -DartifactId=jms -Dversion=1.1 -Dpackaging=jar
----------------------------------------------------------------------------------------------------------------------------