# Clean up old GnuPG files from before 3.13.0 release where we stopped
# distributing them with Claws Mail

DetailPrint "Removing GnuPG2 and related files"

### GnuPG2
# Try to stop a running agent.  This is only for the admin but in
# some cases that is actually useful.
ifFileExists "$INSTDIR\gpg-connect-agent.exe" 0 no_u_gpg_connect_agent
	ifFileExists "$INSTDIR\libgpg-error-0.dll" 0 no_u_gpg_connect_agent
		ifFileExists "$INSTDIR\libw32pth-0.dll" 0 no_u_gpg_connect_agent
			ExecWait '"$INSTDIR\gpg-connect-agent.exe" killagent /bye'
no_u_gpg_connect_agent:

Delete "$INSTDIR\gpg2.exe"
Delete "$INSTDIR\gpgv2.exe"
Delete "$INSTDIR\gpgsm.exe"
Delete /REBOOTOK "$INSTDIR\gpg-agent.exe"
Delete /REBOOTOK "$INSTDIR\scdaemon.exe"
Delete "$INSTDIR\gpgconf.exe"
Delete "$INSTDIR\gpg-connect-agent.exe"
Delete "$INSTDIR\gpgsplit.exe"
Delete "$INSTDIR\gpgtar.exe"

Delete "$INSTDIR\pub\gpg.exe"
Delete "$INSTDIR\pub\gpg2.exe"
Delete "$INSTDIR\pub\gpgv.exe"
Delete "$INSTDIR\pub\gpgsm.exe"
Delete "$INSTDIR\pub\gpg-connect-agent.exe"
Delete "$INSTDIR\pub\gpgconf.exe"

Delete "$INSTDIR\gpg2keys_finger.exe"
Delete "$INSTDIR\gpg2keys_hkp.exe"
Delete "$INSTDIR\gpg2keys_curl.exe"
Delete "$INSTDIR\gpg2keys_ldap.exe"
Delete "$INSTDIR\gpg2keys_kdns.exe"
Delete "$INSTDIR\gpg-protect-tool.exe"
Delete "$INSTDIR\gpg-preset-passphrase.exe"

Delete "$INSTDIR\share\gnupg\qualified.txt"
Delete "$INSTDIR\share\gnupg\com-certs.pem"
Delete "$INSTDIR\share\gnupg\gpg-conf.skel"
Delete "$INSTDIR\share\gnupg\help.*.txt"
Delete "$INSTDIR\share\gnupg\*.man"
RMDir "$INSTDIR\share\gnupg"

Delete "$INSTDIR\share\locale\be\LC_MESSAGES\gnupg2.mo"
Delete "$INSTDIR\share\locale\ca\LC_MESSAGES\gnupg2.mo"
Delete "$INSTDIR\share\locale\cs\LC_MESSAGES\gnupg2.mo"
Delete "$INSTDIR\share\locale\da\LC_MESSAGES\gnupg2.mo"
Delete "$INSTDIR\share\locale\de\LC_MESSAGES\gnupg2.mo"
Delete "$INSTDIR\share\locale\el\LC_MESSAGES\gnupg2.mo"
Delete "$INSTDIR\share\locale\eo\LC_MESSAGES\gnupg2.mo"
Delete "$INSTDIR\share\locale\es\LC_MESSAGES\gnupg2.mo"
Delete "$INSTDIR\share\locale\et\LC_MESSAGES\gnupg2.mo"
Delete "$INSTDIR\share\locale\fi\LC_MESSAGES\gnupg2.mo"
Delete "$INSTDIR\share\locale\fr\LC_MESSAGES\gnupg2.mo"
Delete "$INSTDIR\share\locale\gl\LC_MESSAGES\gnupg2.mo"
Delete "$INSTDIR\share\locale\hu\LC_MESSAGES\gnupg2.mo"
Delete "$INSTDIR\share\locale\id\LC_MESSAGES\gnupg2.mo"
Delete "$INSTDIR\share\locale\it\LC_MESSAGES\gnupg2.mo"
Delete "$INSTDIR\share\locale\ja\LC_MESSAGES\gnupg2.mo"
Delete "$INSTDIR\share\locale\nb\LC_MESSAGES\gnupg2.mo"

### GPA
Delete /REBOOTOK "$INSTDIR\gpa.exe"
Delete /REBOOTOK "$INSTDIR\pub\gpa.exe"

Delete "$INSTDIR\share\locale\de\LC_MESSAGES\gpa.mo"
Delete "$INSTDIR\share\locale\ar\LC_MESSAGES\gpa.mo"
Delete "$INSTDIR\share\locale\es\LC_MESSAGES\gpa.mo"
Delete "$INSTDIR\share\locale\fr\LC_MESSAGES\gpa.mo"
Delete "$INSTDIR\share\locale\ru\LC_MESSAGES\gpa.mo"

Delete "$INSTDIR\share\gpa\gpa_tips.en"
Delete "$INSTDIR\share\gpa\gpa_tips.de"
Delete "$INSTDIR\share\gpa\gpa-logo.ppm"
Delete "$INSTDIR\share\gpa\gpa.png"
RMDir "$INSTDIR\share\gpa"

### adns
Delete "$INSTDIR\libadns-1.dll"

### libksba
Delete "$INSTDIR\libksba-8.dll"
Delete "$INSTDIR\lib\libksba.imp"
Delete "$INSTDIR\include\ksba.h"

### dirmngr
Delete "$INSTDIR\dirmngr.exe"
Delete "$INSTDIR\dirmngr-client.exe"
Delete "$INSTDIR\dirmngr_ldap.exe"
RMDir "$INSTDIR\cache"

# The next thing is only to cleanup cruft from versions < 1.9.3.
# Newer versions install them into COMMON_APPDATA and they are not
# removed on purpose.  Remove the extra-certs directory.  Obviously
# this works only if the user has not populated it.
RMDir "$INSTDIR\lib\dirmngr\extra-certs"
RMDir "$INSTDIR\lib\dirmngr"

# Remove etc files.  This is only useful for installer < 1.9.3.
Delete "$INSTDIR\etc\dirmngr\dirmngr.conf"
Delete "$INSTDIR\etc\dirmngr\bnetza-10r-ocsp.signer"

Delete "$INSTDIR\etc\dirmngr\trusted-certs\README"
Delete "$INSTDIR\etc\dirmngr\trusted-certs\bnetza-10r-ca.crt"

RMDir "$INSTDIR\etc\dirmngr\trusted-certs"
RMDir "$INSTDIR\etc\dirmngr"
RMDir "$INSTDIR\etc"
RMDir "$INSTDIR"

### pinentry
Delete "$INSTDIR\pinentry-w32.exe"
Delete "$INSTDIR\pinentry-gtk-2.exe"
Delete "$INSTDIR\pinentry-qt4.exe"
Delete "$INSTDIR\pinentry.exe"
