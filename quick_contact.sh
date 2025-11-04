#!/bin/bash

echo "=== Quick Contact Actions ==="
echo "👤 Ujwal Makhija"
echo "💼 CEO & FOUNDER"
echo "📞 +919227728888"
echo "📧 ujwal@phonon.io"
echo "🌐 https://www.phonon.io"
echo
echo "Working Actions:"
echo "1. Email: Will open your email client"
echo "2. Website: Will open in browser"
echo "3. Phone: Copy number to use on your phone"
echo
echo "Press:"
echo "1 - Open Email"
echo "2 - Open Website" 
echo "3 - Copy Phone Number"
echo "4 - Exit"
echo

read -p "Choose (1-4): " choice

case $choice in
    1)
        xdg-open "mailto:ujwal@phonon.io?subject=Contact%20Request&body=Hello%20Ujwal,"
        echo "✅ Opening email client..."
        ;;
    2)
        xdg-open "https://www.phonon.io"
        echo "✅ Opening website..."
        ;;
    3)
        echo "+919227728888" | xclip -selection clipboard
        echo "✅ Phone number copied to clipboard!"
        echo "📞 You can now paste it in your phone dialer"
        ;;
    4)
        echo "Goodbye! 👋"
        ;;
    *)
        echo "Invalid choice!"
        ;;
esac
