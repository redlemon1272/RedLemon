#!/bin/bash
# Add white background to app icon for toolbar visibility

set -e

echo "🎨 Adding white background to app icon..."

# Create a backup of the original
if [ ! -f "Resources/AppIcon-original.png" ]; then
    cp Resources/AppIcon.png Resources/AppIcon-original.png
    echo "✅ Backed up original icon"
fi

cd Resources

# Check if ImageMagick is available
if command -v convert &> /dev/null; then
    echo "📦 Using ImageMagick to add white background..."

    # Create white background icon with padding
    convert -size 512x512 xc:white \
            \( AppIcon-original.png -resize 436x436 \) \
            -gravity center -composite \
            AppIcon.png

    echo "✅ Icon updated with white background and padding"
else
    echo "⚠️  ImageMagick not found. Installing..."
    if command -v brew &> /dev/null; then
        brew install imagemagick
        # Retry with ImageMagick now installed
        convert -size 512x512 xc:white \
                \( AppIcon-original.png -resize 436x436 \) \
                -gravity center -composite \
                AppIcon.png
        echo "✅ Icon updated with white background and padding"
    else
        echo "❌ Homebrew not found. Please install ImageMagick manually:"
        echo "   brew install imagemagick"
        exit 1
    fi
fi

cd ..

# Rebuild the iconset from the updated PNG
echo "🔄 Rebuilding icon set..."

# Remove old iconset
rm -rf Resources/AppIcon.iconset

# Create new iconset directory
mkdir Resources/AppIcon.iconset

# Generate all required sizes
for size in 16 32 64 128 256 512; do
    size2x=$((size * 2))
    sips -z $size $size Resources/AppIcon.png --out Resources/AppIcon.iconset/icon_${size}x${size}.png > /dev/null 2>&1
    sips -z $size2x $size2x Resources/AppIcon.png --out Resources/AppIcon.iconset/icon_${size}x${size}@2x.png > /dev/null 2>&1
done

# Convert iconset to icns
echo "📦 Converting to .icns format..."
iconutil -c icns Resources/AppIcon.iconset -o Resources/AppIcon.icns

echo "✅ Icon updated successfully!"
echo "   Original saved as: Resources/AppIcon-original.png"
echo "   Run ./build-app.sh to rebuild the app with the new icon"
