#!/bin/bash

# Image Optimization Script for Portfolio
# Usage: ./scripts/optimize-images.sh /path/to/project/images

set -e

if [ -z "$1" ]; then
    echo "❌ Usage: ./scripts/optimize-images.sh /path/to/project/images"
    echo "Example: ./scripts/optimize-images.sh public/assets/projects/myproject"
    exit 1
fi

PROJECT_DIR="$1"

if [ ! -d "$PROJECT_DIR" ]; then
    echo "❌ Directory not found: $PROJECT_DIR"
    exit 1
fi

echo "🎨 Optimizing images in: $PROJECT_DIR"
echo ""

# Counter
OPTIMIZED=0
SKIPPED=0

# Function to humanize file sizes
humanize_size() {
    numfmt --to=iec-i --suffix=B "$1" 2>/dev/null || echo "$1 bytes"
}

# Process PNGs
for png in "$PROJECT_DIR"/*.png; do
    [ -e "$png" ] || continue
    
    BEFORE=$(stat -f%z "$png" 2>/dev/null || stat -c%s "$png")
    echo "📦 Processing PNG: $(basename "$png")"
    
    # Compress PNG with pngquant if available, else use ImageMagick
    if command -v pngquant &> /dev/null; then
        pngquant --force --ext .png --quality=80-95 "$png" 2>/dev/null || true
    else
        echo "   ⚠️  pngquant not found, skipping PNG compression"
        echo "   Install: brew install pngquant"
        SKIPPED=$((SKIPPED + 1))
        continue
    fi
    
    AFTER=$(stat -f%z "$png" 2>/dev/null || stat -c%s "$png")
    REDUCTION=$((100 * (BEFORE - AFTER) / BEFORE))
    
    echo "   ✅ Reduced: $(humanize_size $BEFORE) → $(humanize_size $AFTER) (-${REDUCTION}%)"
    OPTIMIZED=$((OPTIMIZED + 1))
done

# Process GIFs
for gif in "$PROJECT_DIR"/*.gif; do
    [ -e "$gif" ] || continue
    
    BEFORE=$(stat -f%z "$gif" 2>/dev/null || stat -c%s "$gif")
    echo "📦 Optimizing GIF: $(basename "$gif")"
    
    if command -v gifsicle &> /dev/null; then
        # Optimize GIF colors and frames
        gifsicle -O3 "$gif" --output="$gif.tmp" 2>/dev/null && mv "$gif.tmp" "$gif"
        AFTER=$(stat -f%z "$gif" 2>/dev/null || stat -c%s "$gif")
        REDUCTION=$((100 * (BEFORE - AFTER) / BEFORE))
        echo "   ✅ Reduced: $(humanize_size $BEFORE) → $(humanize_size $AFTER) (-${REDUCTION}%)"
    else
        echo "   ⚠️  gifsicle not found, skipping"
        echo "   Install: brew install gifsicle"
        SKIPPED=$((SKIPPED + 1))
        continue
    fi
    
    OPTIMIZED=$((OPTIMIZED + 1))
done

# Process JPGs
for jpg in "$PROJECT_DIR"/*.jpg "$PROJECT_DIR"/*.jpeg; do
    [ -e "$jpg" ] || continue
    
    BEFORE=$(stat -f%z "$jpg" 2>/dev/null || stat -c%s "$jpg")
    echo "📦 Optimizing JPG: $(basename "$jpg")"
    
    if command -v convert &> /dev/null; then
        # Use ImageMagick to compress JPG to 85% quality
        convert "$jpg" -quality 85 -strip "$jpg.tmp" && mv "$jpg.tmp" "$jpg"
        AFTER=$(stat -f%z "$jpg" 2>/dev/null || stat -c%s "$jpg")
        REDUCTION=$((100 * (BEFORE - AFTER) / BEFORE))
        echo "   ✅ Reduced: $(humanize_size $BEFORE) → $(humanize_size $AFTER) (-${REDUCTION}%)"
    else
        echo "   ⚠️  ImageMagick not found, skipping"
        echo "   Install: brew install imagemagick"
        SKIPPED=$((SKIPPED + 1))
        continue
    fi
    
    OPTIMIZED=$((OPTIMIZED + 1))
done

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ Optimization Complete!"
echo "   Optimized: $OPTIMIZED files"
echo "   Skipped: $SKIPPED files"
echo ""
echo "📌 Note: Make sure to:"
echo "   1. Test images in browser"
echo "   2. Update src/assets hero images if needed"
echo "   3. Commit optimized files"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
