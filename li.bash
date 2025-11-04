#!/bin/bash

# Create desktop shortcuts for contact actions

create_desktop_shortcuts() {
    local desktop_dir="$HOME/Desktop"
    local name="Ujwal Makhija"
    local phone="+919227728888"
    local email="ujwal@phonon.io"
    local website="https://www.phonon.io"
    
    # Create Call shortcut
    cat > "$desktop_dir/Call $name.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Call $name
Comment=Call $name
Exec=xdg-open tel:$phone
Icon=phone
Terminal=false
EOF
    
    # Create Message shortcut
    cat > "$desktop_dir/Message $name.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Message $name
Comment=Message $name
Exec=xdg-open sms:$phone
Icon=message
Terminal=false
EOF
    
    # Create Email shortcut
    cat > "$desktop_dir/Email $name.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Email $name
Comment=Email $name
Exec=xdg-open mailto:$email
Icon=email
Terminal=false
EOF
    
    # Create Website shortcut
    cat > "$desktop_dir/Visit $name Website.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Visit $name Website
Comment=Visit $name website
Exec=xdg-open $website
Icon=web-browser
Terminal=false
EOF
    
    # Make executable
    chmod +x "$desktop_dir/Call $name.desktop"
    chmod +x "$desktop_dir/Message $name.desktop"
    chmod +x "$desktop_dir/Email $name.desktop"
    chmod +x "$desktop_dir/Visit $name Website.desktop"
    
    echo "Desktop shortcuts created for $name!"
}

create_desktop_shortcuts