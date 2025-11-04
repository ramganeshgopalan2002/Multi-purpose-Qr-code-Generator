#!/bin/bash

clear
echo "=========================================="
echo "           CONTACT INFORMATION"
echo "=========================================="
echo
echo "👤 UJWAL MAKHIJA"
echo "💼 CEO & FOUNDER"
echo "📞 +91 92277 28888"
echo "📧 ujwal@phonon.io"
echo "🌐 phonon.io"
echo
echo "=========================================="
echo "           QUICK ACTIONS"
echo "=========================================="
echo

while true; do
    echo "1 - 📧 View Email (copy manually)"
    echo "2 - 📞 View Phone (copy manually)" 
    echo "3 - 🌐 View Website URL (copy manually)"
    echo "4 - 📇 Create vCard File"
    echo "5 - 📋 Show All Info for Copying"
    echo "6 - 🚪 Exit"
    echo
    read -p "Choose action (1-6): " action

    case $action in
        1)
            echo
            echo "📧 EMAIL ADDRESS:"
            echo "=================="
            echo "ujwal@phonon.io"
            echo
            echo "📝 Instructions:"
            echo "1. Select the email address above"
            echo "2. Press Ctrl+Shift+C to copy"
            echo "3. Open your email client and paste"
            echo
            ;;
        2)
            echo
            echo "📞 PHONE NUMBER:"
            echo "================="
            echo "+91 92277 28888"
            echo
            echo "📝 Instructions:"
            echo "1. Select the phone number above"
            echo "2. Press Ctrl+Shift+C to copy" 
            echo "3. Use it in your phone dialer or WhatsApp"
            echo
            ;;
        3)
            echo
            echo "🌐 WEBSITE URL:"
            echo "================"
            echo "https://phonon.io"
            echo
            echo "📝 Instructions:"
            echo "1. Select the URL above"
            echo "2. Press Ctrl+Shift+C to copy"
            echo "3. Paste in your browser address bar"
            echo
            ;;
        4)
            cat > "Ujwal_Makhija.vcf" << VCARD
BEGIN:VCARD
VERSION:3.0
FN:Ujwal Makhija
TITLE:CEO & FOUNDER
TEL;TYPE=CELL:+919227728888
EMAIL:ujwal@phonon.io
URL:https://phonon.io
END:VCARD
VCARD
            echo
            echo "✅ vCard file created: Ujwal_Makhija.vcf"
            echo "📝 You can import this into your contacts app"
            echo
            ;;
        5)
            echo
            echo "📋 ALL CONTACT INFORMATION:"
            echo "============================"
            echo "Name: Ujwal Makhija"
            echo "Title: CEO & FOUNDER"
            echo "Phone: +91 92277 28888"
            echo "Email: ujwal@phonon.io"
            echo "Website: https://phonon.io"
            echo
            echo "📝 Select and copy the information you need"
            echo
            ;;
        6)
            echo
            echo "👋 Goodbye!"
            exit 0
            ;;
        *)
            echo
            echo "❌ Invalid choice! Please choose 1-6"
            echo
            ;;
    esac
    
    read -p "Press Enter to continue..."
    clear
    echo "=========================================="
    echo "           CONTACT INFORMATION"
    echo "=========================================="
    echo
done
