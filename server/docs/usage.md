```
Usage: $(basename $0) [options]

Options:
  -h, --help                                   [optional] print this help message
  -v, --version                                [optional] print product version
  --uninstall                                  [optional] uninstall product
  --keep-database                              uninstallation will not remove the database
  --locale                                     [optional] locale of installed server
  --skip-license                               [optional] skip license agreement dialog
  --license-key=                               [optional] ESET license key. Can be set later.
  --server-port=                               [optional] server listening port for agent connections $([ "x$default_server_port" != "x" ] && echo "(default is \"$default_server_port\")")
  --console-port=                              [optional] listening port for console and ServerApi connections $([ "x$default_console_port" != "x" ] && echo "(default is \"$default_console_port\")")
  --server-root-password=                      [password] WebConsole password, must be at least 8 characters long
  --db-type=                                   type of database, which will be used (possible values: 'MySQL Server', 'MS SQL Server')
  --db-driver=                                 ODBC driver used for connecting to database (e.g. MySQL ODBC 5.3 Driver) $([ "x$default_db_driver" != "x" ] && echo "(default is \"$default_db_driver\")")
  --db-hostname=                               hostname of database server $([ "x$default_db_hostname" != "x" ] && echo "(default is \"$default_db_hostname\")")
  --db-port=                                   port of database server $([ "x$default_db_port" != "x" ] && echo "(default is $default_db_port)")
  --db-name=                                   [optional] name of ESMC server database $([ "x$default_db_name" != "x" ] && echo "(default is \"$default_db_name\")")
  --db-admin-username=                         database admin username used by installation for creating and modifying database $([ "x$default_db_admin_username" != "x" ] && echo "(default is \"$default_db_admin_username\")")
  --db-admin-password=                         [password] database admin password used by installation for creating and modifying database
  --db-user-username=                          database ESMC user (used by ESMC for connecting to database). Should be no longer than 16.
  --db-user-password=                          [password] database ESMC user password (used by ESMC for connecting to database)
  --cert-hostname=                             [optional] server peer certificate hostname
  --skip-cert=                                 [optional] when used, new certificates will NOT be generated
  --server-cert-path=                          [optional] path to server peer certificate (use this option if you specified --skip-cert) 
  --cert-auth-path=                            [optional] path to certificate authority (use this option if you specified --skip-cert)
  --server-cert-password=                      [optional,password] password of server peer certificate
  --peer-cert-password=                        [optional,password] password of peer certificates which will be generated during installation
  --cert-auth-password=                        [optional,password] certificate authority password
  --cert-auth-common-name=                     [optional] certification authority common name $([ "x$default_cert_auth_common_name" != "x" ] && echo "(default is \"$default_cert_auth_common_name\")")
  --cert-organizational-unit=                  [optional] certificate organizational unit $([ "x$default_cert_organizational_unit" != "x" ] && echo "(default is \"$default_cert_organizational_unit\")")
  --cert-organization=                         [optional] certificate organization $([ "x$default_cert_organization" != "x" ] && echo "(default is \"$default_cert_organization\")")
  --cert-locality=                             [optional] certificate locality $([ "x$default_cert_locality" != "x" ] && echo "(default is \"$default_cert_locality\")")
  --cert-state=                                [optional] certificate state $([ "x$default_cert_state" != "x" ] && echo "(default is \"$default_cert_state\")")
  --cert-country=                              [optional] certificate country $([ "x$default_cert_country" != "x" ] && echo "(default is \"$default_cert_country\")")
  --cert-validity=                             [optional] certificate validity in days or years (specify in argument --cert-validity-unit) $([ "x$default_cert_validity" != "x" ] && echo "(default is $default_cert_validity)")
  --cert-validity-unit=                        [optional] unit for certificate validity, possible values are 'Years' or 'Days' $([ "x$default_cert_validity_unit" != "x" ] && echo "(default is $default_cert_validity_unit)")
  --enable-imp-program                         [optional] turns on Product improvement program
  --disable-imp-program                        [optional] turns off Product improvement program
  --ad-server=                                 [optional] Active Directory server
  --ad-user-name=                              [optional] Active Directory user name
  --ad-user-password=                          [optional,password] Active Directory user password
  --ad-cdn-include=                            [optional] Active Directory included Container Distinguished Name

If you want to use Active Directory synchronization, it is needed to provide at least Server, Username and password.
  
Password type parameters (marked with "[password]") can be provided as environment variable, file, read from stdin or provided as plain text, i.e.:
    --password=env:SECRET_PASSWORD where SECRET_PASSWORD is environment variable with password
    --password=file:/opt/secret where first line of regular file /opt/secret contains password
    --password=stdin instructs installer to read password from standard input
    --password="pass:PASSWORD" is equal to --password="PASSWORD" and is mandatory in case actual password is "stdin" or string starting with "env:", "file:" or "pass:"
```