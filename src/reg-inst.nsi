### All Windows Registry changes during installation go here

# We used to determine the language using a Registry entry.
# Although we don't want to delete the user's Lang Registry Setting
# because he might have have selected a different language than his
# default.  We delete the global Lang of the installation.
DeleteRegValue HKLM "Software\GNU\Claws Mail" "Lang"
DetailPrint "Deleted obsolete Lang entry"

# TODO: default client question should be on a separate installer page
MessageBox MB_YESNO "$(T_SetDefaultClient)" IDNO skip_default_client

WriteRegStr   HKCU "SOFTWARE\Classes\mailto" "" "URL:MailTo-Protocol"
WriteRegStr   HKCU "SOFTWARE\Classes\mailto" "URL Protocol" ""
WriteRegDword HKCU "SOFTWARE\Classes\mailto" "EditFlags" 2
WriteRegStr   HKCU "SOFTWARE\Classes\mailto" "FriendlyTypeName" "Claws-Mail URL"
WriteRegStr   HKCU "SOFTWARE\Classes\mailto\DefaultIcon" "" "$INSTDIR\claws-mail.exe,0"
WriteRegStr   HKCU "SOFTWARE\Classes\mailto\shell\open\command" "" "$INSTDIR\claws-mail.exe --compose %1"

skip_default_client:
#just register Claws in the list of available mailers
WriteRegStr   HKLM "SOFTWARE\Clients\Mail\Claws Mail" "" "Claws Mail"
WriteRegStr   HKLM "SOFTWARE\Clients\Mail\Claws Mail" "DLLPath" ""

WriteRegStr   HKLM "SOFTWARE\Clients\Mail\Claws Mail\Capabilities" "ApplicationDescription" "Fast, lightweight and user-friendly GTK+2 based email client"
WriteRegStr   HKLM "SOFTWARE\Clients\Mail\Claws Mail\Capabilities" "ApplicationIcon" "$INSTDIR\claws-mail.exe,0"
WriteRegStr   HKLM "SOFTWARE\Clients\Mail\Claws Mail\Capabilities" "ApplicationName" "Claws Mail"

WriteRegStr   HKLM "SOFTWARE\Clients\Mail\Claws Mail\Capabilities\UrlAssociations" "mailto" "Claws-Mail.URL.mailto"

WriteRegStr   HKLM "SOFTWARE\Clients\Mail\Claws Mail\Protocols\mailto" "" "URL:MailTo-Protocol"
WriteRegStr   HKLM "SOFTWARE\Clients\Mail\Claws Mail\Protocols\mailto" "URL Protocol" ""
WriteRegStr   HKLM "SOFTWARE\Clients\Mail\Claws Mail\Protocols\mailto" "FriendlyTypeName" "Claws-Mail URL"
WriteRegDword HKLM "SOFTWARE\Clients\Mail\Claws Mail\Protocols\mailto" "EditFlags" 2
WriteRegStr   HKLM "SOFTWARE\Clients\Mail\Claws Mail\Protocols\mailto\DefaultIcon" "" "$INSTDIR\claws-mail.exe,0"
WriteRegStr   HKLM "SOFTWARE\Clients\Mail\Claws Mail\Protocols\mailto\shell\open\command" "" "$INSTDIR\claws-mail.exe --compose %1"

WriteRegStr   HKLM "SOFTWARE\Clients\Mail\Claws Mail\shell\open\command" "" "$INSTDIR\claws-mail.exe"

WriteRegStr   HKLM "SOFTWARE\Classes\Claws-Mail.URL.mailto" "" "Claws-Mail URL"
WriteRegStr   HKLM "SOFTWARE\Classes\Claws-Mail.URL.mailto" "FriendlyTypeName" "Claws-Mail URL"
WriteRegStr   HKLM "SOFTWARE\Classes\Claws-Mail.URL.mailto" "URL Protocol" ""
WriteRegDword HKLM "SOFTWARE\Classes\Claws-Mail.URL.mailto" "EditFlags" 2

WriteRegStr   HKLM "SOFTWARE\Classes\Claws-Mail.URL.mailto\DefaultIcon" "" "$INSTDIR\claws-mail.exe,0"
WriteRegStr   HKLM "SOFTWARE\Classes\Claws-Mail.URL.mailto\shell\open\command" "" "$INSTDIR\claws-mail.exe --compose %1"

# Windows 8
WriteRegStr HKLM "SOFTWARE\RegisteredApplications" "Claws Mail" "Software\Clients\Mail\Claws Mail\Capabilities"
