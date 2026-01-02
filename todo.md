### Logic: "Silent Auto-Collapse" on Scroll Down

**The Goal:**
1.  **State Switch:** When the user scrolls past the expanded "About" section into "Works," the sidebar/header must update from **ABOUT** -> **WORKS**.
2.  **Auto-Reset:** The "Read More" section must close itself automatically so that if the user scrolls back up, they see the short "Home" version.
3.  **No Visual Jump:** The collapse must happen without the page jumping or the scrollbar glitching.

---

### The Algorithm (Inside your Scroll Listener)

**Trigger:**
Check if the user has scrolled significantly past the "About" section (e.g., the top of the "Works" section is well above the bottom of the viewport).

**Action Sequence (Must happen in this exact order):**

1.  **Check State:** If `isAboutExpanded === true` AND `scrollY > worksSectionTop`:

2.  **Calculate Height Difference:**
    Measure the height of the bio *before* collapsing it.
    `let heightBefore = bioContainer.offsetHeight;`

3.  **Collapse the Bio:**
    Run your "Read Less" function (remove the expanded class).
    `isAboutExpanded = false;`

4.  **Recalculate Height:**
    Measure the height *after* collapsing.
    `let heightAfter = bioContainer.offsetHeight;`
    `let diff = heightBefore - heightAfter;`

5.  **Scroll Compensation (The "No Jump" Magic):**
    Immediately subtract that difference from the current scroll position. This keeps the user's viewport exactly where it was relative to the "Works" content.
    `window.scrollTo(0, window.scrollY - diff);`

6.  **Update Navigation State:**
    Force the Highlight/Header to **"WORKS"**.
    `setActiveState('WORKS');`

---

### Result for the User
* **Scrolling Down:** They scroll smoothly into "Works." They don't see the bio collapse above them because the scroll compensation cancels out the movement.
* **Scrolling Up:** When they go back up, they find the Bio is already collapsed (Short Version), which correctly triggers the **"HOME"** state logic you established earlier.