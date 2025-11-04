#!/bin/bash

# Contact Card - Fixed for Ubuntu Permission Issues
NAME="Ujwal Makhija"
TITLE="CEO & FOUNDER"
PHONE="+919227728888"
EMAIL="ujwal@phonon.io"
WEBSITE="https://www.phonon.io"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

clear
echo -e "${BLUE}"
echo "╔══════════════════════════════════════════╗"
echo "║               CONTACT CARD               ║"
echo "╚══════════════════════════════════════════╝"
echo -e "${NC}"

echo
echo -e "${GREEN}📇 Contact Information:${NC}"
echo "────────────────────"
echo -e "👤 ${NAME}"
echo -e "💼 ${TITLE}" 
echo -e "📞 ${PHONE}"
echo -e "📧 ${EMAIL}"
echo -e "🌐 ${WEBSITE}"
echo

# Function to open URL with fallback browsers
open_url() {
    local url=$1
    local description=$2
    
    echo -e "${GREEN}${description}...${NC}"
    
    # Try different browsers in order
    if command -v google-chrome &> /dev/null; then
        google-chrome "$url" 2>/dev/null &
    elif command -v chromium-browser &> /dev/null; then
        chromium-browser "$url" 2>/dev/null &
    elif command -v firefox &> /dev/null; then
        # Try to fix Firefox permission or use with temp profile
        firefox -CreateProfile "TempProfile$$" -new-tab "$url" 2>/dev/null &
    else
        # Last resort: use xdg-open but handle the error
        xdg-open "$url" 2>/dev/null &
    fi
    sleep 2
}

# Function to copy to clipboard with fallback
copy_to_clipboard() {
    local text=$1
    local description=$2
    
    if command -v xclip &> /dev/null; then
        echo "$text" | xclip -selection clipboard
        echo -e "${GREEN}✅ ${description} copied to clipboard!${NC}"
    elif command -v xsel &> /dev/null; then
        echo "$text" | xsel --clipboard --input
        echo -e "${GREEN}✅ ${description} copied to clipboard!${NC}"
    else
        echo -e "${YELLOW}📋 ${description}:${NC}"
        echo -e "${BLUE}$text${NC}"
        echo -e "${YELLOW}(Manually select and copy the above text)${NC}"
    fi
}

while true; do
    echo
    echo -e "${BLUE}�� Available Actions:${NC}"
    echo -e "1 📧  Send Email (Opens email client)"
    echo -e "2 🌐  Visit Website (Opens in browser)" 
    echo -e "3 📞  Copy Phone Number"
    echo -e "4 💬  Copy All Contact Info"
    echo -e "5 📇  Create vCard File"
    echo -e "6 🛠️  Install Missing Tools"
    echo -e "7 🚪  Exit"
    echo

    read -p "Choose option (1-7): " choice

    case $choice in
        1)
            echo -e "${GREEN}Opening email composer...${NC}"
            # Use mailto protocol - this should open default email client
            xdg-email "mailto:${EMAIL}?subject=Contact%20Request&body=Hello%20${NAME}," &
            echo -e "${GREEN}✅ Email client should open shortly...${NC}"
            sleep 2
            ;;
        2)
            open_url "$WEBSITE" "Opening website"
            echo -e "${GREEN}✅ Website should open in your browser${NC}"
            ;;
        3)
            copy_to_clipboard "$PHONE" "Phone number"
            ;;
        4)
            copy_to_clipboard "Name: $NAME\nTitle: $TITLE\nPhone: $PHONE\nEmail: $EMAIL\nWebsite: $WEBSITE" "All contact information"
            ;;
        5)
            vcard_file="Ujwal_Makhija.vcf"
            cat > "$vcard_file" << VCARD
BEGIN:VCARD
VERSION:3.0
FN:${NAME}
TITLE:${TITLE}
TEL;TYPE=CELL:${PHONE}
EMAIL:${EMAIL}
URL:${WEBSITE}
END:VCARD
VCARD
            echo -e "${GREEN}✅ vCard created: $vcard_file${NC}"
            echo -e "${YELLOW}You can import this file into your contacts app${NC}"
            ;;
        6)
            echo -e "${YELLOW}Installing necessary tools...${NC}"
            sudo apt update
            sudo apt install -y xclip xdg-utils chromium-browser
            echo -e "${GREEN}✅ Tools installed successfully!${NC}"
            ;;
        7)
            echo -e "${GREEN}👋 Thank you for using Contact Card!${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}❌ Invalid choice! Please choose 1-7${NC}"
            ;;
    esac
    
    echo
    read -p "Press Enter to continue..."
    clear
    echo -e "${BLUE}Contact Card - ${NAME}${NC}"
    echo -e "Phone: ${PHONE} | Email: ${EMAIL} | Web: ${WEBSITE}"
    echo
done
