# Asset Management Workflow

## Structure

```
src/assets/projects/
├── dot-threads/
│   └── hero-dothreads.gif          # ← ONLY hero images here
├── detur/
│   └── hero-detur.png
├── piko/
│   └── hero-piko.gif
├── santuary/
│   └── hero-santuary.png
├── tirupati/
│   └── hero-tirupati.gif
└── serendipity/
    └── vision.png

public/assets/projects/
├── dot-threads/
│   ├── hero.png
│   ├── screenshot1.png
│   ├── demo.gif
│   └── ...                          # ← ALL other assets here
├── serendipity/
│   ├── Problem.png
│   ├── approach.gif
│   ├── core-idea.gif
│   ├── user persona.gif
│   ├── vision.png
│   └── interaction.gif
└── ...
```

## Workflow for New Projects

### 1. Add Images to Public (Source of Truth)
```bash
# Place all project assets here
public/assets/projects/[project-slug]/
├── image1.png
├── video.gif
└── ...
```

### 2. Optimize Images
```bash
./scripts/optimize-images.sh public/assets/projects/[project-slug]
```

**What it does:**
- Compresses PNGs (pngquant)
- Optimizes GIFs (gifsicle)
- Compresses JPGs (ImageMagick) to 85% quality
- Reports file size reduction

**Requirements:**
```bash
brew install pngquant gifsicle imagemagick
```

### 3. Use in MDX Files
```astro
<FullWidthImage src="/assets/projects/[project-slug]/image.png" height="400px" caption="..." />
```

### 4. Hero Images for Home Page
If it's a featured project on the home page:
1. Copy/save the hero image file path: `public/assets/projects/[project-slug]/hero.png`
2. Import in home page:
   ```astro
   import heroImage from "../assets/projects/[project-slug]/hero.png";
   ```
3. Update `heroImages` mapping in `index.astro`

## Key Rules

✅ **DO:**
- Store all project assets in `public/assets/projects/` only
- Optimize before uploading
- Use string paths (`/assets/projects/...`) in MDX files
- Import hero images from `src/assets/` if featured on home page

❌ **DON'T:**
- Store project assets in `src/assets/projects/` (except hero images)
- Duplicate files between `src/` and `public/`
- Upload unoptimized images

## File Size Targets

- Static images (PNG/JPG): < 500KB
- GIFs: < 5MB (or convert to MP4)
- Max width: 1920px

## Example: Adding Serendipality

```bash
# 1. Images already in:
ls public/assets/projects/serendipity/

# 2. Optimize them:
./scripts/optimize-images.sh public/assets/projects/serendipity

# 3. Reference in MDX:
<FullWidthImage src="/assets/projects/serendipity/Problem.png" height="400px" />

# 4. Done! ✨
```
