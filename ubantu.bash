#!/bin/bash

# Quick contact commands for Ubuntu

# Make these commands available by sourcing this file
# source contact_commands.sh

export CONTACT_NAME="Ujwal Makhija"
export CONTACT_PHONE="+919227728888"
export CONTACT_EMAIL="ujwal@phonon.io"
export CONTACT_WEBSITE="https://www.phonon.io"

# Call function
call_contact() {
    echo "📞 Calling $CONTACT_NAME..."
    xdg-open "tel:$CONTACT_PHONE"
}

# Message function  
message_contact() {
    echo "💬 Messaging $CONTACT_NAME..."
    xdg-open "sms:$CONTACT_PHONE"
}

# Email function
email_contact() {
    echo "📧 Emailing $CONTACT_NAME..."
    xdg-open "mailto:$CONTACT_EMAIL"
}

# Website function
visit_website() {
    echo "🌐 Opening website..."
    xdg-open "$CONTACT_WEBSITE"
}

# vCard function
create_vcard() {
    cat > "Ujwal_Makhija.vcf" << EOF
BEGIN:VCARD
VERSION:3.0
FN:Ujwal Makhija
TITLE:CEO & FOUNDER
TEL;TYPE=CELL:+919227728888
EMAIL:ujwal@phonon.io
URL:https://www.phonon.io
END:VCARD
EOF
    echo "📇 vCard created: Ujwal_Makhija.vcf"
}

echo "✅ Contact commands loaded for Ubuntu!"
echo "Available commands:"
echo "  call_contact      - 📞 Call Ujwal"
echo "  message_contact   - 💬 Message Ujwal" 
echo "  email_contact     - 📧 Email Ujwal"
echo "  visit_website     - 🌐 Visit website"
echo "  create_vcard      - 📇 Create vCard file"