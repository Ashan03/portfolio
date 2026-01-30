# DOT THREADS - Case Study for Astro Template

## FRONTMATTER / METADATA
```astro
---
title: "Dot Threads"
description: "Spatial knowledge management for researchers who think in connections, not folders"
meta:
  Role: "Product Designer"
  Duration: "2 weeks → ongoing"
  Tools: "Figma, Browser APIs"
  Status: "Live on Chrome Web Store"
  Year: "2024"
tags: ["Knowledge Management", "Canvas", "Browser Extension"]
---
```

---

## HERO IMAGE
**[Full-width image: Polished screenshot of the spatial canvas with dots connected by threads]**

---

## SECTION: Why build it? {#problem-opportunity}

### The Problem

Research doesn't happen in folders. It happens in webs of connected ideas.

During my thesis research on public spaces, I collected hundreds of links—architecture references, case studies, academic papers. Browser bookmarks forced me to choose: folders (hierarchy) or tags (flat lists). But **my thinking happened in connections between ideas**, not categories.

**[IMAGE: Before state - messy browser bookmarks in nested folders with arrows showing the chaos]**

Existing tools didn't help:
- **Bookmarks:** Linear, buried in folders
- **Are.na:** Visual collections but no associative linking  
- **Note apps:** Text-first, not spatial

**I needed a way to see my research, not just store it.**

### Validating the Problem

Before building anything, I surveyed **25+ early adopters** across 3 CMU departments (Architecture, HCI, Design).

**[IMAGE: Survey insights diagram showing categories users wanted: affordability, accessibility, variety, safety]**

**Key findings:**
- **68%** struggled with bookmark systems for research
- Users wanted **categorization beyond folders** (by themes, contexts, projects)
- Strong desire for **visual representation** of connections
- Privacy concerns about cloud-based tools

**The insight:** I wasn't alone. Knowledge workers want spatial organization, not hierarchical filing.

---

## SECTION: What's the approach? {#approach}

### Design Philosophy

**If thinking happens in webs, the interface should reflect that structure.**

I mapped Vannevar Bush's 1945 MEMEX concept (associative trails of thought) to modern browsing behaviors:

**[IMAGE: MEMEX fundamentals diagram from sprint deck - recording/storing/displaying/selecting/sharing trails]**

### Core Design Principles

**1. Frictionless Capture**  
Save any page in 4 clicks or less. If saving takes effort, people abandon the workflow.

**2. Spatial Cognition**  
Position and proximity carry meaning. The canvas should mirror how ideas naturally connect in your mind.

**3. Perspective Over Omniscience**  
Show relevant context from each node's viewpoint, not everything at once. Focus matters more than completeness.

**4. Privacy as Design**  
Local storage isn't just technical—it's a trust decision. Users own their knowledge graph completely.

### From Concept to Working Product

**[IMAGE: Early sketches from sprint deck showing the 5 components: entering/catalogue/web of info/browsing/sharing]**

Started with Figma prototypes exploring spatial organization. Key design questions:
- How do users add links without leaving their browsing flow?
- What does "spatial organization" actually mean in practice?
- How do you navigate 50+ nodes without getting overwhelmed?

**[IMAGE: Figma prototype showing the spatial agency reference graph]**

**The sprint approach:** Prove the concept in 2 weeks, then iterate based on real usage.

---

## SECTION: How does it work? {#interaction-model}

### The Core Experience

**[IMAGE: 4-step workflow diagram]**

```
1. Find page while researching
   ↓
2. Right-click → "Save to Dot Threads"
   ↓
3. Tag, note, connect to existing dots
   ↓
4. View on spatial canvas
```

### Design Decision 1: Right-Click to Save

**Decision:** Integrate with browser's context menu for frictionless capture.

**Why:** Users shouldn't need to open a new tab or panel. The context menu keeps the flow natural—right-click any page and save instantly.

**[IMAGE: Screenshot showing right-click context menu with "Save to Dot Threads" highlighted]**

**Design detail:** The save popup suggests existing dots from your graph, making it easy to build context as you browse.

**[IMAGE: Save popup showing suggested connections and tag input]**

### Design Decision 2: Hero-Centric Traversal

**Decision:** Each node becomes the "hero" of its own view. Click a node → canvas reorganizes around it.

**Why:** Showing the entire graph at once is overwhelming. Instead, I designed each dot to have its own "perspective"—showing only its immediate context (primary connections) and suggestions (secondary connections).

**[IMAGE: Before/after side-by-side - graph reorganizing when clicking a different node]**

**The interaction:**
- **Click a dot:** It becomes the hero (center of canvas)
- **Canvas reorganizes:** Shows that dot's connections
- **Click a neighbor:** It becomes the new hero
- **Result:** Natural navigation through your knowledge web

**Why this works:** Maps work because you know where you are. Graphs need the same orientation. Hero-centric views give users that anchor point.

### Design Decision 3: Visual Hierarchy by Depth

**Decision:** Not all connections are equal—depth should be visual.

**Visual system:**
- **Primary links** (your manual connections): Bold, 60% opacity
- **Secondary links** (connections of connections): Medium, 30% opacity
- **Tertiary links** (third-degree): Faint, 15% opacity

**[IMAGE: Diagram showing three link types with different visual weights]**

**Why:** This creates a natural fade from "definitely relevant" to "maybe interesting." Users can focus on core connections while peripheral ones provide context without noise.

### Navigation Patterns

**Hovering:** Highlights the node and its immediate connections

**Zooming:** Text labels fade smoothly (semantic zoom) to keep readability at any scale

**Searching:** Keyboard-driven dropdown with real-time filtering

**Why these interactions?** Each one reduces friction between thinking and capturing. The tool should feel like an extension of thought, not a separate database to manage.

---

## SECTION: How is it built? {#implementation}

### Technical Approach

**Architecture:** Browser extension + spatial canvas web app

**Data layer:** All data stored locally using browser storage APIs—no cloud, no servers, complete privacy

**Visualization:** Force-directed graph layout with physics simulation for natural spacing

**[IMAGE: Simple architecture diagram: Browser Extension ↔ Local Storage ↔ Web View]**

### Why Local-First?

This wasn't just a technical decision—it was a **design philosophy**:

1. **Trust:** Users control their knowledge completely
2. **Speed:** No network latency, works offline
3. **Privacy:** No servers to compromise, no data to sell
4. **Simplicity:** No accounts, no authentication, zero friction

**The tradeoff:** No cross-device sync. But for researchers who value privacy, this is the right choice.

**Design detail:** Users can export trails as JSON to share curated paths with collaborators, bridging private and collaborative workflows.

### Design System

**[IMAGE: Screenshot showing the visual design system in action]**

**Colors:**
- Custom types (Projects, Research, Personal) with user-defined colors
- Hierarchy uses grayscale to distinguish depth
- Hero node highlighted in accent color

**Typography:**
- Labels constant size (12px) regardless of zoom
- Bold weight for selected node
- Sentence case for natural reading

**Motion:**
- Nodes "bloom" outward when appearing (600ms cubic easing)
- Smooth camera transitions when traversing
- Fade effects (not abrupt pops)

**Why organic?** Knowledge graphs should feel like living structures, not rigid diagrams. The physics simulation creates natural spacing—nodes find their own positions through simulated forces.

### Technical Note

*Built with modern web technologies and browser APIs. Technical architecture details available upon request.*

---

## SECTION: What's the outcome? {#outcome}

### Shipped Product

**Status:** Live on Chrome Web Store, Version 1.3.3  
**Users:** 3 active users (early adopters from CMU)  
**Timeline:** Initial launch September 2024 → ongoing iteration  
**Link:** https://chromewebstore.google.com/detail/dotthreads/

**[IMAGE: Chrome Web Store listing screenshot]**

### Iteration Cycles

**September 2024 - Initial Launch**
- Right-click save functionality
- Spatial canvas with force-directed layout
- Hero-centric traversal
- Search and filtering
- Export/import

**October - December 2024 - Based on User Feedback**
- **Smart suggestions:** Show existing dots first when connecting
- **Custom types:** Users create categories with custom colors
- **Screenshot previews:** Automatic webpage screenshots
- **Visual refinements:** Glow effects, better motion, improved hierarchy
- **Better delete UX:** 2-step confirmation (learned from production issues)

**January 2026 - Latest**
- Version 1.3.3 improvements
- Custom domain support (threads.narayan.works)
- Enhanced link suggestions
- Refined visual hierarchy

### User Feedback

**"Bookmarks finally make sense"**  
Users navigate by memory of connections instead of hunting through folders. The spatial layout triggers recall.

**"I keep discovering forgotten connections"**  
Graph layout surfaces relationships between old research and new interests. Serendipitous rediscovery.

**"I wish I could use this for everything"**  
Users want to expand beyond links—add images, PDFs, notes. This confirms the core value: spatial organization resonates.

### Impact Metrics

**What shipped:**
- ✅ Working product used by real people
- ✅ 4 major update cycles based on feedback
- ✅ Validated problem through user research
- ✅ Demonstrated end-to-end product execution

**What this demonstrates:**
- Problem identification through personal pain point
- User research and validation before building
- Thoughtful interaction design (hero-centric navigation)
- Ability to ship and maintain a live product
- Iterative improvement based on real usage

---

## SECTION: What I have learned {#reflection}

### Spatial Interfaces Need Perspective, Not Omniscience

My first instinct was to show the entire graph at once. That's overwhelming.

**Hero-centric views** solve this: show context from each node's perspective. Maps work because you know where you are. Graphs need the same orientation.

### Visual Representation Amplifies Thinking

Seeing connections makes patterns visible that stay hidden in folders:
- **Clusters** reveal research themes I didn't consciously notice
- **Gaps** show unexplored areas
- **Bridges** between distant clusters surface unexpected insights

The canvas isn't just storage—it's a **thinking tool**.

### Frictionless Capture is Everything

I tested versions with 6 clicks, 8 clicks, 10 clicks. Every additional step compounds friction exponentially.

**4 clicks is the maximum** before people abandon the workflow. The right-click save was the make-or-break feature.

### Users Need Onboarding for Spatial Thinking

Early users loved the concept but struggled with "where do I start?"

Spatial organization is powerful but **unfamiliar**. Most people have spent years with folder-based thinking. Next iteration needs guided onboarding showing how to build your first knowledge web.

### Shipping Teaches What Prototyping Can't

Real issues I never saw in Figma:
- How do people organize their first 10 dots vs their 100th?
- What happens when connections overlap visually?
- How do you delete a highly-connected node?
- What's the right default zoom level?

**Lesson:** Ship earlier. Real usage reveals real problems that prototypes hide.

### What Makes a Good Tool for Thought?

This project taught me that **tools for thinking need different design principles** than productivity software:

**1. Resist Prescriptiveness**  
Don't force structure. Let users create meaning through positioning and connections.

**2. Make Thinking Visible**  
The canvas should reveal patterns, not just store information. Visualization is cognition.

**3. Reduce Friction to Zero**  
If capturing a thought takes effort, the tool fails. Frictionless input is non-negotiable.

**4. Respect Privacy**  
Knowledge is personal. Local-first isn't just technical—it's about trust.

**5. Ship and Learn**  
Prototypes can't predict how people actually think. Real usage teaches what assumptions were wrong.

### What's Next

**Immediate (Next 3 Months):**

**Better Onboarding** - Guided tour showing how to build your first web. Empty states that teach.

**Multimedia Support** - Extend beyond links to images, PDFs, rich notes. Make dots hold more than URLs.

**Smart Suggestions** - Surface patterns: "These 5 dots all relate to urban planning—want to create a collection?"

**Long Term (6-12 Months):**

**Collaborative Trails** - Let teams co-create knowledge graphs. Share research paths, not just individual links.

**Mobile Companion** - Capture on mobile, view spatial relationships on desktop.

**Integration API** - Let other tools (Notion, Obsidian, Roam) export into Dot Threads format.

**[IMAGE: Timeline showing shipped → next 3 months → 6-12 months with connecting dots]**

---

## PROJECT LINKS

**Live Extension:** https://chromewebstore.google.com/detail/dotthreads/  
**Web App:** https://threads.narayan.works  
**Portfolio:** https://narayan.works/dot-threads

---

## IMAGE CHECKLIST

### Must Have (7 critical images):
1. ✓ **Hero image** - Polished spatial canvas view
2. ✓ **Problem visual** - Messy bookmarks folder structure
3. ✓ **Survey insights** - Already have from sprint deck
4. ✓ **MEMEX diagram** - Already have from sprint deck  
5. ✓ **Before/after traversal** - Graph reorganizing around clicked node
6. ✓ **Visual hierarchy** - Three link types with different weights
7. ✓ **4-step workflow** - User flow from browse to canvas

### Nice to Have (5 supporting images):
8. ○ **Early sketches** - Hand-drawn components from sprint
9. ○ **Figma prototype** - Spatial agency graph reference
10. ○ **Save popup** - Extension UI showing suggestions
11. ○ **Timeline graphic** - Roadmap visualization
12. ○ **Chrome Web Store** - Listing screenshot

---

## POSITIONING SUMMARY

**What this case study emphasizes:**

✅ **Product thinking** - Identified problem through personal experience  
✅ **User validation** - Surveyed 25+ people before building  
✅ **Design decisions** - Each interaction has clear rationale (hero-centric, visual hierarchy)  
✅ **Iteration cycles** - Shipped → learned → improved (4 major updates)  
✅ **Shipping ability** - Live product with real users

**What this case study de-emphasizes:**

❌ Code implementation details  
❌ Technical jargon (APIs, frameworks, languages)  
❌ Development process  
❌ AI tools usage

**Key message:**  
*"I'm a product designer who can take a problem from research to shipped product, and iterate based on real usage."*

This is your differentiator. Most designers stop at Figma. You ship.
